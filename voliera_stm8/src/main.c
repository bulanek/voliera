#define _EXTI 1
#define _GPIO 1

// sdcc includes
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <stm8s.h>
#include <stm8s_gpio.h>
#include <stm8s_tim2.h>
#include <stm8s_flash.h>

#include <Definitions.hpp>
/// For debugging of controller
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
#define SPI_BUFFER_ARRAY_LENGTH 4

/* Private variables ---------------------------------------------------------*/
/// Number of PWM outputs for light control. Now only 1 or 3
uint8_t g_NumLights = 1U;

/* Private function prototypes -----------------------------------------------*/
static void Initialize(void);
static void InitializeClock(void);
static void InitializeGPIO(void);
static void InitializeUART(void);
static void InitializeSPI(void);
static void InitializeTimer(void);
static void InitializeFlash(void);


static inline void CheckConfig(void);
static inline void StartRunSPILed(void);
static inline void StopRunSPILed(void);
static inline void EnableTimer(void);
static inline void DisableTimer(void);

/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

extern void SPI_IRQHandler(void) __interrupt(10);
void assert_failed(uint8_t* file, uint32_t line);
/// Print to stdio overload (extern declaration in stdio.h)
void putchar(char aChar);
char getchar(void);

volatile uint8_t f_SPIBuffer[SPI_BUFFER_ARRAY_LENGTH] = { 0 };
volatile uint8_t f_Counter = 0U;
uint8_t f_Intensity[SPI_BUFFER_ARRAY_LENGTH] = {0U};

void main(void) {
    int i = 0;
    disableInterrupts();
    // HSI, TIM2, SPI, UART1 enable
    Initialize();
    enableInterrupts();
    CheckConfig();
    g_NumLights = FLASH_ReadByte(EEPROM_DATA_MEMORY_START);
    if ((g_NumLights < 1) || (g_NumLights > 3)) {
        FLASH_EraseByte(EEPROM_DATA_MEMORY_START);
        FLASH_ProgramBlock(0, FLASH_MEMTYPE_DATA, FLASH_PROGRAMMODE_STANDARD, &g_NumLights);
    }
    while (1) {
        wfi();
        StartRunSPILed();
        disableInterrupts();
        if (f_Counter == SPI_BUFFER_ARRAY_LENGTH) {
            f_Counter = 0;
            memcpy((void*) f_Intensity, (void*) f_SPIBuffer, SPI_BUFFER_ARRAY_LENGTH);
            enableInterrupts();
            if (f_Intensity[3] != 0U) {
                EnableTimer();
                TIM2->CCR1L = f_Intensity[3];
//               if (g_NumLights > 2) {
//                    TIM2->CCR2L = f_Intensity[1];
//                    TIM2->CCR3L = f_Intensity[2];
//               }
            } else {
                DisableTimer();
            }
        }else {
            enableInterrupts();
        }
        StopRunSPILed();
    }
}

void Initialize(void) {
    InitializeClock();
    InitializeGPIO();
    InitializeUART();
    InitializeSPI();
    InitializeTimer();
    InitializeFlash();
}

void InitializeClock(void) {
    while ((CLK->ICKR & CLK_ICKR_HSIRDY) == 0); // wait until HSI ready
    CLK->CKDIVR = 0; // clock divider.
    CLK->PCKENR1 &= CLK_PCKENR1_TIM2 | CLK_PCKENR1_SPI;
}

void InitializeGPIO(void) {
    // SPI SCK
    GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
    // SPI MOSI
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
    // SPI NSS AF1
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);

    // Timer2 (channel 1)
    GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
    // Timer2 (channel 2) AF1
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
    // Timer2 (channel 3) AF1
    GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_HIGH_FAST);
    // Config pin
    GPIO_Init(GPIOD, CONFIG_PIN, GPIO_MODE_IN_FL_NO_IT);
    // PWM led pin
    GPIO_Init(GPIOC, PWM_PIN, GPIO_MODE_OUT_OD_HIZ_SLOW);

    // LED Run SPI
    GPIO_Init(RUN_SPI_LED_PORT, RUN_SPI_LED_PIN, GPIO_MODE_OUT_OD_HIZ_SLOW);
}

void InitializeSPI(void) {
    // Disable while configuration
    SPI->CR1 &= ~SPI_CR1_SPE;
    //Clock polarity
    SPI->CR1 |= SPI_CR1_CPOL;
    // Clock phase
    SPI->CR1 &= ~SPI_CR1_CPHA;
    // MSB first
    SPI->CR1 &= ~SPI_CR1_LSBFIRST;
    // Slave mode
    SPI->CR1 &= ~SPI_CR1_MSTR;
    // Receive only, one wire
    SPI->CR2 &= ~SPI_CR2_BDM;
    SPI->CR2 |= SPI_CR2_RXONLY;
    // Hardware SS
    SPI->CR2 &= ~SPI_CR2_SSM;
    // Enable Rx interrupt
    SPI->ICR |= SPI_ICR_RXEI;
//    SPI->ICR |= SPI_ICR_WKIE;
    // Enable SPI
    SPI->CR1 |= SPI_CR1_SPE;
}

void InitializeTimer(void) {
//    TIM2_PWMIConfig(TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING,
//            TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV2, 2);
    // Auto preload
    TIM2->CR1 |= TIM2_CR1_ARPE;
    /// Frequency 16 MHz -> 62.5 kHz
    TIM2->ARRH = 0;
    TIM2->ARRL = 0xFF;
    // Prescaler 2^x; x=1 -> 31 kHz
    TIM2->PSCR = 1U;
    // Duty
    TIM2->CCR1H = 0U;
    TIM2->CCR1L = f_Intensity[3];
//    if (g_NumLights > 2) {
//        TIM2->CCR2H = 0U;
//        TIM2->CCR2L = f_Intensity[1];
//        TIM2->CCR3H = 0U;
//        TIM2->CCR3L = f_Intensity[2];
//    }

    TIM2->CCMR2 |= TIM2_OCMODE_PWM2;
    TIM2->CCMR1 |= TIM2_OCMODE_PWM2;
    TIM2->CCMR3 |= TIM2_OCMODE_PWM2;

    // Compare enable
    TIM2->CCER1 |= TIM2_CCER1_CC2E | TIM2_CCER1_CC1E;
    TIM2->CCER2 |= TIM2_CCER2_CC3E;
    // Correct polarity;
    TIM2->CCER1 |= TIM2_CCER1_CC2P | TIM2_CCER1_CC1P;
    TIM2->CCER2 |= TIM2_CCER2_CC3P;
}

//  Setup the UART to run at 115200 baud, no parity, one stop bit, 8 data bits.
//
//  Important: This relies upon the system clock being set to run at 16 MHz.
void InitializeUART(void) {
    uint8_t tmp = UART1->SR;
    tmp = UART1->DR;
    //  Reset the UART registers to the reset values.
    //  8 Data bits.
    UART1->CR1 &= (uint8_t) (~UART1_CR1_M);
    /* Clear the Parity Control bit */
    UART1->CR1 &= (uint8_t) (~( UART1_CR1_PCEN | UART1_CR1_PS));
    UART1->CR3 &= (uint8_t) (~UART1_CR3_STOP); // 1 stop bit
    UART1->BRR2 = 0x0b;      //  Set the baud rate registers to 115200 baud
    UART1->BRR1 = 0x08;      //  based upon a 16 MHz system clock.
    // Disable Rx Tx while changing CPOL, CPHA,  LBCL
    UART1->CR2 &= (uint8_t) (~(UART1_CR2_TEN | UART1_CR2_REN));
    // set timing and clock output
    UART1->CR3 |= (uint8_t) (UART1_CR3_CPHA | UART1_CR3_CPOL | UART1_CR3_LBCL);
    //  Turn on the UART transmit, receive and the UART clock.
    UART1->CR2 |= (uint8_t) (UART1_CR2_TEN | UART1_CR2_REN);
    UART1->CR3 |= (uint8_t) (UART1_CR3_CKEN);
}

static void InitializeFlash(void) {
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
    while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
}

static void CheckConfig(void) {
    uint8_t numLights;
    if ((GPIOD->IDR & CONFIG_PIN) == 0U) return;
    printf("Select number of light output [1-3] (Default: 1):\n ");
    numLights = (uint8_t) getchar();
    if ((numLights < 1) || (numLights > 3)) {
        printf("Incorrect number of lights selected: %i\n", numLights);
        CheckConfig();
    }
    g_NumLights = numLights;
    FLASH_EraseByte(EEPROM_DATA_MEMORY_START);
    FLASH_ProgramBlock(0, FLASH_MEMTYPE_DATA, FLASH_PROGRAMMODE_STANDARD, &g_NumLights);
}

void StartRunSPILed(void) {
    RUN_SPI_LED_PORT->ODR &= ~RUN_SPI_LED_PIN;
}

void StopRunSPILed(void) {
    RUN_SPI_LED_PORT->ODR |= RUN_SPI_LED_PIN;
}

void DisableTimer(void) {
    if (((CLK->PCKENR1 & CLK_PCKENR1_TIM2) == 0) && ((TIM2->CR1 & TIM2_CR1_CEN) == 0)) return;
    TIM2->CR1 &= ~TIM2_CR1_CEN;
    CLK->PCKENR1 &= ~CLK_PCKENR1_TIM2;
    GPIOC->ODR |= PWM_PIN;
}

void EnableTimer(void) {
    if (((CLK->PCKENR1 & CLK_PCKENR1_TIM2) != 0) && ((TIM2->CR1 & TIM2_CR1_CEN) != 0)) return;
    CLK->PCKENR1 |= CLK_PCKENR1_TIM2;
    if ((TIM2->CR1 & TIM2_CR1_CEN) == 0U) {
        TIM2->CR1 |= TIM2_CR1_CEN;
    }
    GPIOC->ODR &= ~PWM_PIN;
}

void putchar(char aChar) {
    UART1->DR = (uint8_t) aChar;
    while ((UART1->SR & UART1_SR_TXE) == 0);
    if (aChar == '\n') {
        UART1->DR = (uint8_t) '\r';
        while ((UART1->SR & UART1_SR_TXE) == 0);
    }
}

char getchar(void) {
    char output = '\0';
    while ((UART1->SR & UART1_SR_RXNE) == 0);
    output = (char) UART1->DR;
    return output;
}

void SPI_IRQHandler(void) __interrupt(10) {
    disableInterrupts();
    f_SPIBuffer[SPI_BUFFER_ARRAY_LENGTH - 1 - f_Counter] = SPI->DR;
    f_Counter = (f_Counter + 1) % SPI_BUFFER_ARRAY_LENGTH;
    enableInterrupts();
}

void assert_failed(uint8_t* file, uint32_t line) {
    printf("Assertion occured in %s (%i)\n", (char*) file, line);
    while (1);
}
