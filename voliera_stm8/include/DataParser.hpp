#ifndef DATA_PARSER_HPP
#define DATA_PARSER_HPP

#include <stdint.h>


static const uint8_t INTENSITY_BITS = 4U;

// 4*3 bits for RGB. MSB for red
void getIntensity(uint32_t rData, uint8_t* redIntensity,
        uint8_t* greenIntensity,
        uint8_t* blueIntensity)
{
        *redIntensity = 0x0F & (rData >> 2*INTENSITY_BITS);
        *greenIntensity = 0x0F & (rData >> 1*INTENSITY_BITS);
        *blueIntensity = 0x0F & rData;
}



#endif //  DATA_PARSER_HPP
