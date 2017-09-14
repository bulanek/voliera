
#include <SmingCore/SmingCore.h>

#include "Definitions.hpp"
#include <SunSet.h>

#define DEBUG

// BUG in SPI: mode reverse (meaning of SPI_MODE2)
SPISettings f_spiSetting(20000U, MSBFIRST, SPI_MODE1);
SPIClass f_spi;
SunSet f_SunSet;


Timer f_TimerSPI;
volatile time_t f_UpdateTimeNTP = 0;


void timerSPICallback(void);

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
	if (f_UpdateTimeNTP == 0U) {
#ifdef DEBUG
		debugf("First time, calling timerSPICallback\n");
#endif
		f_UpdateTimeNTP = ntpTime;
	} else {
		f_UpdateTimeNTP = ntpTime;
	}
	timerSPICallback();
}

NtpClient f_ntpClient(NTP_SERVER, TIMER_SPI_TIMEOUT_MS, onTimeReceivedCb);

////////////////////////////////////////////////////////////////////////////////
void timerSPICallback(void)
{
	DateTime dateTime = SystemClock.now();

    if ((dateTime.toUnixTime() < f_UpdateTimeNTP)
            || ((dateTime.toUnixTime() - f_UpdateTimeNTP)
                    > TIME_UPDATE_INTERVAL_SEC)
                    // Not needed as in init first update (timing..)
                    || (f_UpdateTimeNTP == 0))
    {
#ifdef DEBUG
    	debugf("timerSPICallback, force requestTime\n");
#endif
		if (WifiStation.isConnected() == false) {
			time_t currentTimeSec = SystemClock.now().toUnixTime();
			time_t endTimeSec = currentTimeSec + CONNECTION_TIMEOUT_SEC;
			while ((WifiStation.connect() == false)
					&& (currentTimeSec < endTimeSec)) {
				currentTimeSec = SystemClock.now().toUnixTime();
			}

			currentTimeSec = SystemClock.now().toUnixTime();
			endTimeSec = currentTimeSec + CONNECTION_TIMEOUT_SEC;
			while ((WifiStation.isConnected() == false)
					&& (currentTimeSec < endTimeSec)) {
				currentTimeSec = SystemClock.now().toUnixTime();
			}
		}

		if (WifiStation.isConnected())
		{
			f_ntpClient.requestTime();
		}
		return;
    }

	time_t timeSec = dateTime.Hour * 3600U + dateTime.Minute * 60U
			+ dateTime.Second;

	f_SunSet.setCurrentDate(dateTime.Year, dateTime.Month, dateTime.Day);
	uint32_t sunset = f_SunSet.calcSunset();
#ifdef DEBUG
		debugf("now: %i\n", timeSec);
		debugf("sunset: %i:%i\n", sunset/3600U,(sunset/60)%60);
		debugf("Current time: %i:%i\n", dateTime.Hour, dateTime.Minute);
#endif

	uint8_t sunSethour = sunset / 3600U;
	uint8_t sunSetMinutes = (sunset / 60U) % 60U;

	uint32_t sunrise = f_SunSet.calcSunrise();
	uint8_t sunRisehour = sunrise / 3600U;
	uint8_t sunRiseMinutes = (sunrise / 60U) % 60U;

	uint32_t startTimeSec = sunset - LIGHT_START_BEFORE_SUNSET_SEC;
	uint32_t endTimeSec = LIGHT_STOP_SEC;

	uint32_t middleTimeSec = (endTimeSec + startTimeSec) / 2U;

    uint32_t intensity = 0U;
	if ((timeSec > startTimeSec) && (timeSec < middleTimeSec)) {

		// note may be uint32_t, pay attention on order of arg. eval.
		intensity = (timeSec - startTimeSec)
				* (0xFFFFFFFF / (middleTimeSec - startTimeSec));
#ifdef DEBUG
		debugf("Before middle");
		debugf("startTimeSec: %u\n", startTimeSec);
		debugf("middleTimeSec: %u\n", middleTimeSec);
		debugf("timeSec: %u\n", timeSec);
		debugf("intensity: %u\n", intensity);
#endif


	} else if ((timeSec > middleTimeSec) && (timeSec < endTimeSec)) {
		intensity = (endTimeSec - timeSec)
				* (0xFFFFFFFF / (middleTimeSec - startTimeSec));
#ifdef DEBUG
		debugf("after middle");
		debugf("startTimeSec: %u\n", startTimeSec);
		debugf("middleTimeSec: %u\n", middleTimeSec);
		debugf("timeSec: %u\n", timeSec);
		debugf("intensity: %u\n", intensity);
#endif

	}
//	else if (timeSec < startTimeSec - 2 * TIMER_SPI_TIMEOUT_MS / 1000U) {
//		f_TimerSPI.setIntervalMs(
//				startTimeSec - timeSec - 2 * TIMER_SPI_TIMEOUT_MS / 1000U);
//		f_TimerSPI.restart();
//		return;
//
//	} else {
//		f_TimerSPI.setIntervalMs(TIME_UPDATE_INTERVAL_SEC * 1000U);
//		f_TimerSPI.restart();
//#ifdef DEBUG
//		debugf("Timeout ms (after time) : %u\n", f_TimerSPI.getIntervalMs());
//#endif
//
//		return;
//	}
	else
	{
//		f_TimerSPI.setIntervalMs(TIMER_SPI_TIMEOUT_MS / 1000U);
//		f_TimerSPI.restart();
	}
#ifdef DEBUG
	debugf("Timeout ms : %u\n", f_TimerSPI.getIntervalMs());
#endif

	intensity = ((intensity / LIGHT_INTENSITY_DIVIDE) >> 24) & 0xFF;

    // NOTE: BUG in SPI.cpp of SmingCore ignoring alternate function for SS.
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDO_U, 2); // SS

    f_spi.beginTransaction(f_spiSetting);

#ifdef DEBUG
    debugf("Data: %u\n", intensity);
#endif
    f_spi.transfer((uint8_t*) &intensity, 4);
    f_spi.endTransaction();
}


////////////////////////////////////////////////////////////////////////////////
// Will be called when WiFi station was connected to AP
void connectOk()
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
void init()
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


    f_SunSet.setPosition(50.08804, 14.42076, 0);
	f_SunSet.setTZOffset(1);

	WifiStation.waitConnection(connectOk, CONNECTION_TIMEOUT_SEC, connectFail);

	f_TimerSPI.initializeMs(TIMER_SPI_TIMEOUT_MS, timerSPICallback);
	f_TimerSPI.start(true);

	// Run our method when station was connected to AP (or not connected)
}
