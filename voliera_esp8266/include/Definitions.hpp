#ifndef DEFINITIONS_HPP
#define DEFINITIONS_HPP


#define WIFI_SSID "Tenda_5EE5C0" // Put you SSID and Password here
#define WIFI_PWD "pandapanda"

#define TEMPERATURE_URL "http://pocasi.seznam.cz/praha"
#define NTP_SERVER "0.cz.pool.ntp.org"
#define NTP_TIMEOUT_SEC 3600

#define PIN_MISO
#define PIN_GREEN 12
#define PIN_BLUE 4


#define PIN_SPI_MOSI 13
#define PIN_SPI_CLK 14
#define PIN_SPI_SS 15

///
#define TIME_OFFSET_SEC 7200

/// Update time from NTP server every 10 hours
#define TIME_UPDATE_INTERVAL_SEC 36000U


#define LIGHT_START_BEFORE_SUNSET_SEC 3600U

// Light stop, time in seconds after midnight; (23:00)
#define LIGHT_STOP_SEC 82800U

#define TIMER_SPI_TIMEOUT_MS 60000U

#define LIGHT_INTENSITY_DIVIDE 2

#define CONNECTION_TIMEOUT_SEC 20

#endif //  DEFINITIONS_HPP
