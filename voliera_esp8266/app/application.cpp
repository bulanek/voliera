
#include <SmingCore/SmingCore.h>
#include "Definitions.hpp"
#include "sscanf_impl.h"

//#include <Services/ArduinoJson/ArduinoJson.h>
#include <Services/ArduinoJson/ArduinoJson.h>

#define RODATA_ATTR  __attribute__((section(".irom.text"))) __attribute__((aligned(4)))

#define DATA_ADDRESS 0x4f000
#define DATA_SECTOR 0x4f

typedef struct {
    uint32_t m_SunsetInSec;
    uint32_t m_SunriseInSec;
    uint8_t m_LocalTimeOffsetInHour;
} Config;

static Config g_Config = {0};


ICACHE_FLASH_ATTR void flash_erase_all() {
    char settings[sizeof(Config)];
    for (int n = 0; n < sizeof(Config); n++) settings[n] = 0;
    spi_flash_erase_sector(DATA_SECTOR);
}

ICACHE_FLASH_ATTR void flash_write( const Config& rConfig) {
    SpiFlashOpResult result = spi_flash_erase_sector(DATA_SECTOR);
    if (result != SPI_FLASH_RESULT_OK) Serial.printf("Erase failed: %i\n\r", result);
    spi_flash_write(DATA_ADDRESS, (uint32_t*)&rConfig, sizeof(Config));
}


// BUG in SPI: mode reverse (meaning of SPI_MODE2)
SPISettings f_spiSetting(20000U, MSBFIRST, SPI_MODE1);
SPIClass f_spi;

HttpClient g_HttpClient;

Timer f_TimerSPI;
volatile time_t f_UpdateTimeNTP = 0;



// TODO ROM access
// Sunset in UTC time
uint32_t SUNSET_MONTHS_IN_MIN[12] = {
        15 * 60 + 49,
        16 * 60 + 31,
        17 * 60 + 16,
        18 * 60 + 7,
        18 * 60 * 58,
        19 * 60 + 46,
        19 * 60 + 59,
        19 * 60 + 23,
        18 * 60 + 19,
        17 * 60 + 12,
        16 * 60 + 12,
        15 * 60 + 40
};

// Sunrise in UTC time
uint32_t SUNRISE_MONTHS_IN_MIN[12] = {
        7 * 60 + 01,
        6 * 60 + 35,
        5 * 60 + 45,
        4 * 60 + 38,
        3 * 60 * 38,
        2 * 60 + 57,
        2 * 60 + 56,
        3 * 60 + 31,
        4 * 60 + 17,
        5 * 60 + 02,
        5 * 60 + 52,
        6 * 60 + 39
};

// PRIVATE FUNCTIONS

/// Get time of sunset or sunrise in seconds
static uint32_t getSunsetRiseInSec(const uint32_t month,
        const uint32_t day, const uint32_t* const pSunsetRiseInMin);

/// Timer callback to stm8 every minute for SPI transfer
static void timerSPICallback(void);
/// Update NTP time in case of fulfill conditions and establish connection to WiFi.
static bool requestForNTPTime(DateTime& rDateTime);
/// Request for update sunset (sunrise) time.
static bool requestForSunsetTime(void);
static void parseTimeFromSunAPI(const char* pSunSetRise, int* pHour, int* pMinute, int* pSecond);
int httpRequestDelegate(HttpConnection& client, bool successful);
int onBody(HttpConnection& client, const char *at, size_t length);

/// Get intensity of light (0 - 0xFFFFFFFF)/LIGHT_INTENSITY_DIVIDE
static uint32_t getIntensity(const DateTime& rDateTime);
/// Get intensity from sunset computation
static uint32_t getIntensitySunset(const DateTime& rDateTime);
/// Get intensity from sunrise computation
static uint32_t getIntensitySunrise(const DateTime& rDateTime);

///  compute intensity defined as _startTimeSec/(middle endTimeSec:startTimeSec)\endTimeSec_
static uint32_t computeTriangleRatioU32(const uint32_t timeSec,const  uint32_t startTimeSec,
       const  uint32_t endTimeSec);

/// Compute if is summer time
bool isSummerTime(const time_t pTime);
bool isSummerTimeMarch(const uint8_t day, const uint8_t dayOfWeek);
bool isSummerTimeOctober(const uint8_t day, const uint8_t dayOfWeek);

////////////////////////////////////////////////////////////////////////////////
static void onTimeReceivedCb(NtpClient& client, time_t ntpTime) {
    if (isSummerTime(ntpTime)) {
        g_Config.m_LocalTimeOffsetInHour = TIME_OFFSET_HOUR + 1;
    }
    else {
        g_Config.m_LocalTimeOffsetInHour = TIME_OFFSET_HOUR;
    }

    SystemClock.setTimeZone(g_Config.m_LocalTimeOffsetInHour);
    SystemClock.setTime(ntpTime, eTZ_UTC);
//    WifiStation.disconnect();

    // First time
    if (f_UpdateTimeNTP == 0U) {
        f_UpdateTimeNTP = ntpTime;
    }
    else {
        f_UpdateTimeNTP = ntpTime;
    }
    if (!requestForSunsetTime()) debugf("Failed to request for sunset (rise) time\n");

}

NtpClient f_ntpClient(onTimeReceivedCb);


////////////////////////////////////////////////////////////////////////////////
void timerSPICallback(void) {
    DateTime dateTime = SystemClock.now();

    if (!requestForNTPTime(dateTime)) debugf("Failed to request for NTP time!\n");

    // First time run, dateTime invalid
    if (f_UpdateTimeNTP == 0) return;
    uint32_t intensity = getIntensity(dateTime);

    // NOTE: BUG in SPI.cpp of SmingCore ignoring alternate function for SS.
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDO_U, 2); // SS

    f_spi.beginTransaction(f_spiSetting);
    // TODO BB: 4 -> constant common with stm8 as well
    f_spi.transfer((uint8_t*) &intensity, 4);
    f_spi.endTransaction();
}

bool requestForNTPTime(DateTime& rDateTime) {
    // Check if needed
    if ((rDateTime.toUnixTime() > f_UpdateTimeNTP)
            && ((rDateTime.toUnixTime() - f_UpdateTimeNTP) < TIME_UPDATE_INTERVAL_SEC) && (f_UpdateTimeNTP != 0)) return true;

    // check connection
    if (WifiStation.isConnected() == false) {
        time_t endTimeSec = SystemClock.now().toUnixTime() + CONNECTION_TIMEOUT_SEC;
        while ((WifiStation.connect() == false) && (SystemClock.now().toUnixTime()  < endTimeSec)) delay(1);
        endTimeSec = SystemClock.now().toUnixTime() + CONNECTION_TIMEOUT_SEC;
        while ((WifiStation.isConnected() == false) && (SystemClock.now().toUnixTime() < endTimeSec)) delay(1);
    }

    if (WifiStation.isConnected()) {
        f_ntpClient.requestTime();
        return true;
    }
    return false;
}

bool requestForSunsetTime(void) {
    String url(SUNSET_SERVER);
    url += String("json?lat=") + String(PRAGUE_LTG) + String("&lng=") + String(PRAGUE_LONG)+ String("&formatted=0");
    debugf("Sunset Request url: %s\n", url.c_str());
    HttpRequest* pHttpRequest = new HttpRequest(URL(url));
    pHttpRequest->onRequestComplete(httpRequestDelegate);
    return g_HttpClient.send(pHttpRequest);
}

static void parseTimeFromSunAPI(const char* pSunSetRise, int* pHour, int* pMinute, int* pSecond)
{
    char buffer[3];
    memcpy(buffer,pSunSetRise + 11,2);
    buffer[2]='\0';
    *pHour= atoi(buffer);
    memcpy(buffer,pSunSetRise + 14,2);
    *pMinute = atoi(buffer);
    memcpy(buffer,pSunSetRise + 17,2);
    *pSecond = atoi(buffer);
}

int httpRequestDelegate(HttpConnection& client, bool successful) {
    if (successful == false) return 0;
    String response = client.getResponseString();

    char data[BUFFER_SIZE] = {'\0'};
    memset(data,'\0',BUFFER_SIZE);
    memcpy(data, client.getResponseString().c_str(),
                    client.getResponse()->stream->length());

    StaticJsonBuffer<BUFFER_SIZE> jsonBuffer;
    JsonObject& jsonObject = jsonBuffer.parseObject(data);
    if (!jsonObject.success()) {
        debugf("%s\n","parseObject() failed");
        return 0;
    }
    const char* pSunrise = jsonObject["results"]["sunrise"];
    const char* pSunset = jsonObject["results"]["sunset"];

    int hour, min, sec = 0;
    parseTimeFromSunAPI((const char*)jsonObject["results"]["sunset"], &hour, &min, &sec);
    g_Config.m_SunsetInSec = hour * 3600 +  + min * 60 + sec;
    g_Config.m_SunsetInSec += g_Config.m_LocalTimeOffsetInHour*3600;
    debugf("Sunset in %i:%i:%i\n", hour + g_Config.m_LocalTimeOffsetInHour, min, sec);
    parseTimeFromSunAPI((const char*)jsonObject["results"]["sunrise"], &hour, &min, &sec);
    g_Config.m_SunriseInSec = hour * 3600 +  + min * 60 + sec;
    g_Config.m_SunriseInSec += g_Config.m_LocalTimeOffsetInHour*3600;
    debugf("Sunrise in %i:%i:%i\n", hour + g_Config.m_LocalTimeOffsetInHour, min, sec);

    flash_erase_all();
    flash_write(g_Config);
    timerSPICallback();
    return successful;
}

int onBody(HttpConnection& client, const char *at, size_t length)
{
    debugf("%s\n","On Body");
    debugf(" Length: %i\n", length);
    return true;
}

uint32_t getIntensity(const DateTime& rDateTime) {
    uint32_t intensity = 0U;
    intensity = getIntensitySunset(rDateTime);
    debugf("Intensity sunset: %u\n",intensity);
    if (intensity == 0U)
    {
        intensity = getIntensitySunrise(rDateTime);
    }
	intensity = ((intensity / LIGHT_INTENSITY_DIVIDE) >> 24) & 0xFF;
	return intensity;
}

uint32_t getIntensitySunset(const DateTime& rDateTime)
{
    time_t timeSec = rDateTime.Hour * 3600U + rDateTime.Minute * 60U + rDateTime.Second;
    uint32_t sunsetInSec = g_Config.m_SunsetInSec;
    debugf ("Sunset in %i:%i \n",sunsetInSec/3600, sunsetInSec/ 60 % 60);

    uint32_t startTimeSec = sunsetInSec - LIGHT_START_BEFORE_SUNSET_SEC;
    uint32_t endTimeSec = LIGHT_STOP_SEC;

    return endTimeSec > startTimeSec ? computeTriangleRatioU32(timeSec, startTimeSec, endTimeSec) : 0U;
}

uint32_t getIntensitySunrise(const DateTime& rDateTime) {
    time_t timeSec = rDateTime.Hour * 3600U + rDateTime.Minute * 60U + rDateTime.Second;

    uint32_t sunRiseInSec = g_Config.m_SunriseInSec;
    debugf ("Sunrise in %i:%i \n",sunRiseInSec/3600, sunRiseInSec / 60 % 60);

    uint32_t startTimeSec = LIGHT_START_SEC;
    uint32_t endTimeSec = LIGHT_STOP_AFTER_SUNRISE + sunRiseInSec;
    debugf ("startTime, endTime, time: %i, %i, %i\n", startTimeSec, endTimeSec, timeSec);

    return endTimeSec > startTimeSec ? computeTriangleRatioU32(timeSec, startTimeSec, endTimeSec) : 0U;
}

static uint32_t getSunsetRiseInSec(const uint32_t month, const uint32_t day,
        const uint32_t* const pSunsetRiseInMin)
{
    if ((day > 31U) || (month > 12) || (month == 0U)) return 0;

    if ((pSunsetRiseInMin != SUNSET_MONTHS_IN_MIN) && (pSunsetRiseInMin != SUNRISE_MONTHS_IN_MIN)) return 0;

    debugf("getSunsetRiseInSec: month: %u, day: %u\n", month, day);

    uint32_t sunsetRiseInSec = pSunsetRiseInMin[month - 1] * 60;
    // / 30 due to ~ 30 day on average (day/30)
    sunsetRiseInSec += day * pSunsetRiseInMin[month % 12] * 60U / 30U;
    sunsetRiseInSec -= day * pSunsetRiseInMin[month - 1] * 60U / 30U;

    // local time offset .. NOTE as parameter?
    sunsetRiseInSec += g_Config.m_LocalTimeOffsetInHour * 3600;

    return sunsetRiseInSec;
}

static uint32_t computeTriangleRatioU32(const uint32_t timeSec, const uint32_t startTimeSec,
       const uint32_t endTimeSec)
{
    debugf("computeintensity: time: %u, startTime: %u, endTime: %u\n", timeSec, startTimeSec, endTimeSec);
    uint32_t middleTimeSec = (endTimeSec >> 1) + (startTimeSec >> 1);
    uint32_t intensity = 0U;
    if ((timeSec > startTimeSec) && (timeSec < middleTimeSec)) {
        // note may be uint32_t, pay attention on order of arg. eval.
        intensity = (timeSec - startTimeSec) * (0xFFFFFFFF / (middleTimeSec - startTimeSec));
    } else if ((timeSec > middleTimeSec) && (timeSec < endTimeSec)) {
        intensity = (endTimeSec - timeSec)
                * (0xFFFFFFFF / (middleTimeSec - startTimeSec));
    }
    else {
    }
    return intensity;
}

////////////////////////////////////////////////////////////////////////////////
// Will be called when WiFi station was connected to AP
void gotIP(IPAddress, IPAddress, IPAddress) {
	Serial.println("I'm CONNECTED");
    debugf("Read flash: \n\tSunset: %i\n\tSunrise: %i\n\tTimeOffset: %i\n",
                        g_Config.m_SunsetInSec, g_Config.m_SunriseInSec, g_Config.m_LocalTimeOffsetInHour );
}

////////////////////////////////////////////////////////////////////////////////
// Will be called when WiFi station timeout was reached
void connectFail(String, uint8_t, uint8_t[6], uint8_t)
{
	Serial.println("I'm NOT CONNECTED. Need help :(");
}

////////////////////////////////////////////////////////////////////////////////
void init(void)
{
    f_UpdateTimeNTP = 0;
    g_Config.m_LocalTimeOffsetInHour = 1;
    SpiFlashOpResult readResult = spi_flash_read(DATA_ADDRESS, (uint32_t*) &g_Config, sizeof(g_Config));
    if (readResult != SPI_FLASH_RESULT_OK) {
        debugf("Read flash failed, %i\r\n", readResult);
    } else {
        debugf("Read flash: \n\tSunset: %i\n\tSunrise: %i\n\tTimeOffset: %i\n",
                        g_Config.m_SunsetInSec, g_Config.m_SunriseInSec, g_Config.m_LocalTimeOffsetInHour );
    }
    if ((g_Config.m_LocalTimeOffsetInHour != 1) && (g_Config.m_LocalTimeOffsetInHour != 2) ) {
        g_Config.m_LocalTimeOffsetInHour = 1;
    }

    System.setCpuFrequency(eCF_80MHz);

    WifiStation.config(WIFI_SSID, WIFI_PWD);
    WifiStation.enable(true);
	Serial.systemDebugOutput(true); // Debug output to serial
    SystemClock.setTimeZone(g_Config.m_LocalTimeOffsetInHour);


    f_ntpClient.setNtpServer(NTP_SERVER);

    pinMode(PIN_SPI_MOSI, OUTPUT);
    pinMode(PIN_SPI_CLK, OUTPUT);
    pinMode(PIN_SPI_SS, OUTPUT);

    WifiEvents.onStationGotIP(gotIP);
    WifiEvents.onStationDisconnect(connectFail);

    f_TimerSPI.initializeMs(TIMER_SPI_TIMEOUT_MS, timerSPICallback);
    f_TimerSPI.start(true);

    f_spi.begin();

    // Run our method when station was connected to AP (or not connected)
}


bool isSummerTime(const time_t pTime)
{
    DateTime date(pTime);
    if (((uint8_t)date.Month < 3) || (date.Month > 10)) return false;

    if ((date.Month > 3) && (date.Month < 10)) return true;

    if (date.Month == 3) {
        return isSummerTimeMarch(date.Day, date.DayofWeek);
    } else {
        return isSummerTimeOctober(date.Day, date.DayofWeek);
    }
    return false;
}

bool isSummerTimeMarch(const uint8_t day, const uint8_t dayOfWeek)
{
    // week with april
    if (((7 - dayOfWeek) + day) > 31) return true;
    // week without april
    if (dayOfWeek < 7) return false;
    // sunday
    if ((day + 7) > 31 ) return true;
    return false;
}

bool isSummerTimeOctober(const uint8_t day, const uint8_t dayOfWeek)
{
    // week with november
    if (((7 - dayOfWeek) + day) > 31) return false;
    // week without november
    if (dayOfWeek < 7) return true;
    // sunday
    if ((day + 7) > 31 ) return false;
    return true;
}
