
#ifndef DATA_PARSER_HPP
#define DATA_PARSER_HPP

namespace Voliera{

// 4*3 bits for RGB. MSB for red
class DataParser{
public:
    DataParser()
    {
    }
    ~DataParser(){};
    DataParser(const DataParser& dataParser){};
    inline void SetData(const uint32_t&  pData)
    {
        m_Data = pData;
    }
    inline const uint32_t& GetData(void) const
    {
        return m_Data;
    }

    inline void SetIntensity(const uint8_t redIntensity,
            const uint8_t greenIntensity,
            const uint8_t blueIntensity)
    {
        m_Data &= (m_Data & 0xFFFFF000) | (redIntensity << (INTENSITY_BITS * 2))
                | (greenIntensity << (INTENSITY_BITS * 1)) | blueIntensity;
    }
    inline void GetIntensity(uint8_t& redIntensity,
            uint8_t& greenIntensity,
            uint8_t& blueIntensity) const
    {
            redIntensity = 0x0F & (m_Data >> 2*INTENSITY_BITS);
            greenIntensity = 0x0F & (m_Data >> 1*INTENSITY_BITS);
            blueIntensity = 0x0F & m_Data;
    }


    static const uint8_t INTENSITY_BITS = 4U;
    uint32_t m_Data;


private:

};
}




#endif //  DATA_PARSER_HPP
