
#include <SmingCore/SmingCore.h>

#include "Definitions.hpp"

#define DEBUG
#define RODATA_ATTR  __attribute__((section(".irom.text"))) __attribute__((aligned(4)))


// BUG in SPI: mode reverse (meaning of SPI_MODE2)
SPISettings f_spiSetting(20000U, MSBFIRST, SPI_MODE1);
SPIClass f_spi;

Timer f_TimerSPI;
volatile time_t f_UpdateTimeNTP = 0;

// Local time in hour (inc. summer time)
uint8_t f_LocalTimeOffsetInHour = 1;

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
static void requestForNTPTime(DateTime& rDateTime);
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
static void onTimeReceivedCb(NtpClient& client, time_t ntpTime)
{
    if (isSummerTime(ntpTime))
    {
        f_LocalTimeOffsetInHour = TIME_OFFSET_HOUR + 1;
    }
    else
    {
        f_LocalTimeOffsetInHour = TIME_OFFSET_HOUR;
    }
    SystemClock.setTimeZone(f_LocalTimeOffsetInHour);

#ifdef DEBUG
    DateTime date = SystemClock.now();
    debugf("Hour, minutes: %i, %i\n\r", date.Hour, date.Minute);
#endif

    SystemClock.setTime(ntpTime, eTZ_UTC);
    WifiStation.disconnect();

    // First time
    if (f_UpdateTimeNTP == 0U)
    {
#ifdef DEBUG
        debugf("First time, calling timerSPICallback\n\r");
#endif
        f_UpdateTimeNTP = ntpTime;
    }
    else
    {
        f_UpdateTimeNTP = ntpTime;
    }
    timerSPICallback();
}

NtpClient f_ntpClient(onTimeReceivedCb);


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
//    debugf("hour, minute: %i, %i\n", dateTime.Hour, dateTime.Minute);
//    debugf("offset: %i\n", f_LocalTimeOffsetInHour);

    uint32_t intensity = getIntensity(dateTime);

    // NOTE: BUG in SPI.cpp of SmingCore ignoring alternate function for SS.
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDO_U, 2); // SS

    f_spi.beginTransaction(f_spiSetting);
#ifdef DEBUG
    debugf("Data: %u\n\r", intensity);
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
//    debugf("Intensity sunset: %i\n",intensity);
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
//    debugf ("Sunset in %i:%i \n",sunsetInSec/3600, sunsetInSec/ 60 % 60);

    uint8_t sunSethour = sunsetInSec / 3600U;
    uint8_t sunSetMinutes = (sunsetInSec / 60U) % 60U;

    uint32_t startTimeSec = sunsetInSec - LIGHT_START_BEFORE_SUNSET_SEC;
    uint32_t endTimeSec = LIGHT_STOP_SEC;

    uint32_t intensity = 0U;
//    debugf ("startTime, endTime, time: %i, %i, %i\n", startTimeSec, endTimeSec, timeSec);

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
//    debugf ("Sunrise in %i:%i \n",sunRiseInSec/3600, sunRiseInSec / 60 % 60);

    uint8_t sunRiseHour = sunRiseInSec / 3600U;
    uint8_t sunRiseMinutes = (sunRiseInSec / 60U) % 60U;

    uint32_t startTimeSec = LIGHT_START_SEC;
    uint32_t endTimeSec = LIGHT_STOP_AFTER_SUNRISE + sunRiseInSec;

//    debugf ("startTime, endTime, time: %i, %i, %i\n", startTimeSec, endTimeSec, timeSec);

    uint32_t intensity = 0U;
    if (endTimeSec > startTimeSec)
    {
        intensity = computeTriangleRatioU32(timeSec, startTimeSec, endTimeSec);
    }
    return intensity;
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
//    debugf("getSunsetRiseInSec: month: %u, day: %u\n", month, day);

    uint32_t sunsetRiseInSec = pSunsetRiseInMin[month - 1] * 60;
    // / 30 due to ~ 30 day on average (day/30)
    sunsetRiseInSec += day * pSunsetRiseInMin[month % 12] * 60U / 30U;
    sunsetRiseInSec -= day * pSunsetRiseInMin[month - 1] * 60U / 30U;

    // local time offset .. NOTE as parameter?
    sunsetRiseInSec += f_LocalTimeOffsetInHour * 3600;

    return sunsetRiseInSec;
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
void gotIP(IPAddress, IPAddress, IPAddress)
{
	Serial.println("I'm CONNECTED");
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

#ifdef DEBUG
    Serial.begin(SERIAL_BAUD_RATE); // 115200 by default
    Serial.systemDebugOutput(true); // Disable debug output to serial
#endif
    System.setCpuFrequency(eCF_80MHz);

    WifiStation.config(WIFI_SSID, WIFI_PWD);
    WifiStation.enable(true);

    SystemClock.setTimeZone(f_LocalTimeOffsetInHour);

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
    if (((uint8_t)date.Month < 3) || (date.Month > 10))
    {
        return false;
    }
    if ((date.Month > 3) && (date.Month < 10))
    {
        return true;
    }

    if (date.Month == 3)
    {
        return isSummerTimeMarch(date.Day, date.DayofWeek);
    }
    else
    {
        return isSummerTimeOctober(date.Day, date.DayofWeek);
    }
    return false;
}

bool isSummerTimeMarch(const uint8_t day, const uint8_t dayOfWeek)
{
    // week with april
    if (((7 - dayOfWeek) + day) > 31)
    {
        return true;
    }

    // week without april
    if (dayOfWeek < 7)
    {
        return false;
    }

    // sunday
    if ((day + 7) > 31 )
    {
        return true;
    }
    return false;
}

bool isSummerTimeOctober(const uint8_t day, const uint8_t dayOfWeek)
{
    // week with november
    if (((7 - dayOfWeek) + day) > 31)
    {
        return false;
    }

    // week without november
    if (dayOfWeek < 7)
    {
        return true;
    }

    // sunday
    if ((day + 7) > 31 )
    {
        return false;
    }
    return true;
}
