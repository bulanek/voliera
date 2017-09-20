
#include <SmingCore/SmingCore.h>

#include "Definitions.hpp"

#define DEBUG
#define RODATA_ATTR  __attribute__((section(".irom.text"))) __attribute__((aligned(4)))


// BUG in SPI: mode reverse (meaning of SPI_MODE2)
SPISettings f_spiSetting(20000U, MSBFIRST, SPI_MODE1);
SPIClass f_spi;

Timer f_TimerSPI;
volatile time_t f_UpdateTimeNTP = 0;

// TODO ROM access
uint32_t SUNSET_MONTHS_IN_MIN[12] = {
        16 * 60 + 49,
        17 * 60 + 31,
        18 * 60 + 16,
        20 * 60 + 7,
        20 * 60 * 58,
        21 * 60 + 46,
        21 * 60 + 59,
        21 * 60 + 23,
        20 * 60 + 19,
        19 * 60 + 12,
        17 * 60 + 12,
        16 * 60 + 40
};
// TODO implement
uint32_t SUNRISE_MONTHS_IN_MIN[12] = {
        8 * 60 + 01,
        7 * 60 + 35,
        6 * 60 + 45,
        6 * 60 + 38,
        5 * 60 * 38,
        4 * 60 + 57,
        4 * 60 + 56,
        5 * 60 + 31,
        6 * 60 + 17,
        7 * 60 + 02,
        6 * 60 + 52,
        7 * 60 + 39
};

// PRIVATE FUNCTIONS

// Get time of sunset or sunrise in seconds
static uint32_t getSunsetRiseInSec(const uint32_t month,
        const uint32_t day, const uint32_t* const pSunsetRiseInMin);

// Timer callback to stm8 every minute for SPI transfer
static void timerSPICallback(void);

// Update NTP time in case of fulfill conditions and establish connection to WiFi.
static void requestForNTPTime(DateTime& rDateTime);

// Get intensity of light (0 - 0xFFFFFFFF)/LIGHT_INTENSITY_DIVIDE
static uint32_t getIntensity(const DateTime& rDateTime);

// Get intensity from sunset computation
static uint32_t getIntensitySunset(const DateTime& rDateTime);
// Get intensity from sunrise computation
static uint32_t getIntensitySunrise(const DateTime& rDateTime);

/*  compute intensity defined as _startTimeSec/(middle endTimeSec:startTimeSec)\endTimeSec_ */
static uint32_t computeTriangleRatioU32(const uint32_t timeSec,const  uint32_t startTimeSec,
       const  uint32_t endTimeSec);

////////////////////////////////////////////////////////////////////////////////
static void onTimeReceivedCb(NtpClient& client, time_t ntpTime)
{
#ifdef DEBUG
    Serial.println("In onTimeReceivedCb");
    DateTime date(ntpTime + TIME_OFFSET_SEC);
    debugf("Hour, minutes: %i, %i\n", date.Hour, date.Minute);
#endif

    SystemClock.setTime(ntpTime, eTZ_UTC);
    WifiStation.disconnect();

    // First time
    if (f_UpdateTimeNTP == 0U)
    {
#ifdef DEBUG
        debugf("First time, calling timerSPICallback\n");
#endif
        f_UpdateTimeNTP = ntpTime;
    }
    else
    {
        f_UpdateTimeNTP = ntpTime;
    }
    timerSPICallback();
}

NtpClient f_ntpClient(NTP_SERVER, TIMER_SPI_TIMEOUT_MS, onTimeReceivedCb);

////////////////////////////////////////////////////////////////////////////////
void timerSPICallback(void)
{
    DateTime dateTime = SystemClock.now();

    requestForNTPTime(dateTime);
    // First time run, dateTime invalid
    if (f_UpdateTimeNTP == 0)
    {
        return;
    }

    uint32_t intensity = getIntensity(dateTime);

    // NOTE: BUG in SPI.cpp of SmingCore ignoring alternate function for SS.
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDO_U, 2); // SS

    f_spi.beginTransaction(f_spiSetting);
#ifdef DEBUG
    debugf("Data: %u\n", intensity);
#endif
    // TODO 4 -> constant common with stm8 as well
    f_spi.transfer((uint8_t*) &intensity, 4);
    f_spi.endTransaction();
}

void requestForNTPTime(DateTime& rDateTime)
{
    // Check if needed
    if ((rDateTime.toUnixTime() > f_UpdateTimeNTP)
            && ((rDateTime.toUnixTime() - f_UpdateTimeNTP)
                    < TIME_UPDATE_INTERVAL_SEC)
            // Not needed as in init first update (timing..)
            && (f_UpdateTimeNTP != 0))
    {
        return;
    }

    // check connection
    if (WifiStation.isConnected() == false)
    {
        time_t currentTimeSec = SystemClock.now().toUnixTime();
        time_t endTimeSec = currentTimeSec + CONNECTION_TIMEOUT_SEC;
        while ((WifiStation.connect() == false) && (currentTimeSec < endTimeSec))
        {
            currentTimeSec = SystemClock.now().toUnixTime();
        }

        currentTimeSec = SystemClock.now().toUnixTime();
        endTimeSec = currentTimeSec + CONNECTION_TIMEOUT_SEC;
        while ((WifiStation.isConnected() == false)
                && (currentTimeSec < endTimeSec))
        {
            currentTimeSec = SystemClock.now().toUnixTime();
        }
    }
    if (WifiStation.isConnected())
    {
        f_ntpClient.requestTime();
    }
}

uint32_t getIntensity(const DateTime& rDateTime)
{
    uint32_t intensity = 0U;

    intensity = getIntensitySunset(rDateTime);
    if (intensity == 0U)
    {
        intensity = getIntensitySunrise(rDateTime);
    }

	intensity = ((intensity / LIGHT_INTENSITY_DIVIDE) >> 24) & 0xFF;
	return intensity;
}

uint32_t getIntensitySunset(const DateTime& rDateTime)
{
    time_t timeSec = rDateTime.Hour * 3600U + rDateTime.Minute * 60U
            + rDateTime.Second;

    uint32_t sunsetInSec = getSunsetRiseInSec(rDateTime.Month, rDateTime.Day,
            SUNSET_MONTHS_IN_MIN);

    uint8_t sunSethour = sunsetInSec / 3600U;
    uint8_t sunSetMinutes = (sunsetInSec / 60U) % 60U;

    uint32_t startTimeSec = sunsetInSec - LIGHT_START_BEFORE_SUNSET_SEC;
    uint32_t endTimeSec = LIGHT_STOP_SEC;

    uint32_t intensity = 0U;
    if (endTimeSec > startTimeSec)
    {
    intensity = computeTriangleRatioU32(timeSec, startTimeSec,
            endTimeSec);
    }
    return intensity;
}

uint32_t getIntensitySunrise(const DateTime& rDateTime)
{
    time_t timeSec = rDateTime.Hour * 3600U + rDateTime.Minute * 60U
            + rDateTime.Second;

    uint32_t sunRiseInSec = getSunsetRiseInSec(rDateTime.Month, rDateTime.Day, SUNRISE_MONTHS_IN_MIN);

    uint8_t sunRiseHour = sunRiseInSec / 3600U;
    uint8_t sunRiseMinutes = (sunRiseInSec / 60U) % 60U;

    uint32_t startTimeSec = LIGHT_START_SEC;
    uint32_t endTimeSec = LIGHT_STOP_AFTER_SUNRISE + sunRiseInSec;

    uint32_t intensity = 0U;
    if (endTimeSec > startTimeSec)
    {
        intensity = computeTriangleRatioU32(timeSec, startTimeSec, endTimeSec);
    }
    return intensity;
}

static uint32_t computeTriangleRatioU32(const uint32_t timeSec, const uint32_t startTimeSec,
       const uint32_t endTimeSec)
{
    uint32_t middleTimeSec = (endTimeSec >> 1) + (startTimeSec >> 1);
    uint32_t intensity = 0U;
    if ((timeSec > startTimeSec) && (timeSec < middleTimeSec))
    {
        // note may be uint32_t, pay attention on order of arg. eval.
        intensity = (timeSec - startTimeSec)
                * (0xFFFFFFFF / (middleTimeSec - startTimeSec));
    }
    else if ((timeSec > middleTimeSec) && (timeSec < endTimeSec))
    {
        intensity = (endTimeSec - timeSec)
                * (0xFFFFFFFF / (middleTimeSec - startTimeSec));
    }
    else
    {
    }
    return intensity;
}

////////////////////////////////////////////////////////////////////////////////
// Will be called when WiFi station was connected to AP
void connectOk(void)
{
	Serial.println("I'm CONNECTED");
}

////////////////////////////////////////////////////////////////////////////////
// Will be called when WiFi station timeout was reached
void connectFail()
{
	Serial.println("I'm NOT CONNECTED. Need help :(");
}

////////////////////////////////////////////////////////////////////////////////
void init(void)
{
    f_UpdateTimeNTP = 0;

#ifdef DEBUG
    Serial.begin(SERIAL_BAUD_RATE); // 115200 by default
    Serial.systemDebugOutput(true); // Disable debug output to serial
#endif
    System.setCpuFrequency(eCF_80MHz);

    WifiStation.config(WIFI_SSID, WIFI_PWD);
    WifiStation.enable(true);

    SystemClock.setTimeZone(TIME_OFFSET_SEC / 3600U);

    pinMode(PIN_SPI_MOSI, OUTPUT);
    pinMode(PIN_SPI_CLK, OUTPUT);
    pinMode(PIN_SPI_SS, OUTPUT);

    f_spi.begin();

    WifiStation.waitConnection(connectOk, CONNECTION_TIMEOUT_SEC, connectFail);

    f_TimerSPI.initializeMs(TIMER_SPI_TIMEOUT_MS, timerSPICallback);
    f_TimerSPI.start(true);

    // Run our method when station was connected to AP (or not connected)
}

static uint32_t getSunsetRiseInSec(const uint32_t month, const uint32_t day,
        const uint32_t* const pSunsetRiseInMin)
{
    if ((day > 31U) || (month > 12) || (month == 0U))
    {
        return 0;
    }
    if ((pSunsetRiseInMin != SUNSET_MONTHS_IN_MIN) && (pSunsetRiseInMin != SUNRISE_MONTHS_IN_MIN))
    {
        return 0;
    }

    uint32_t sunsetRiseInSec = pSunsetRiseInMin[month - 1];
    sunsetRiseInSec += day * pSunsetRiseInMin[month % 12] * 60 / 30;
    sunsetRiseInSec -= day * pSunsetRiseInMin[month - 1] * 60 / 30;

    return sunsetRiseInSec;
}

