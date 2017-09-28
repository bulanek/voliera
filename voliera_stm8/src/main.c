#define _EXTI 1
#define _GPIO 1

// sdcc includes
#include <stdint.h>
#include <stdio.h>

#include <stm8s.h>
#include <stm8s_gpio.h>
#include <stm8s_tim2.h>

#include <Definitions.hpp>
/// For debugging of controller
//#define DEBUG
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
#define SPI_BUFFER_ARRAY_LENGTH 4
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void InitializeClock(void);
static void InitializeGPIO(void);
static void InitializeSPI(void);
static void InitializeTimer(void);
static void InitializeUART(void);
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

extern void SPI_IRQHandler(void) __interrupt(10);

/// Print to stdio overload (extern declaration in stdio.h)
void putchar(char aChar);

#define DEBUG

volatile uint8_t f_SPIBuffer[SPI_BUFFER_ARRAY_LENGTH] = { 0 };
volatile uint8_t f_Counter = 0U;
uint8_t f_Intensity = 0U;

void main()
{
    disableInterrupts();

    // HSI, TIM2, SPI, UART1 enable
    InitializeClock();
    InitializeGPIO();
    InitializeUART();
    InitializeSPI();
    InitializeTimer();
    enableInterrupts();

    while (1)
    {
        wfi();
        disableInterrupts();
        if (f_Counter == SPI_BUFFER_ARRAY_LENGTH)
        {
            f_Counter = 0;
            f_Intensity = f_SPIBuffer[0];

            if (f_Intensity != 0U)
            {
                CLK->PCKENR1 |= CLK_PCKENR1_TIM2;
                if ((TIM2->CR1 & TIM2_CR1_CEN) == 0U)
                {
                    TIM2->CR1 |= TIM2_CR1_CEN;
                }
                TIM2->CCR2L = f_Intensity;
            }
            else
            {
                // Disable timer
                TIM2->CR1 &= ~TIM2_CR1_CEN;
                CLK->PCKENR1 &= ~CLK_PCKENR1_TIM2;
            }
        }
        enableInterrupts();
    }
}

void InitializeClock(void)
{
    while ((CLK->ICKR & CLK_ICKR_HSIRDY) == 0); // wait until HSI ready
    CLK->CKDIVR = 0; // clock divider.
    CLK->PCKENR1 &= CLK_PCKENR1_TIM2 | CLK_PCKENR1_SPI;
#ifdef DEBUG
    CLK->PCKENR1 |= CLK_PCKENR1_UART2;
#endif
}

void InitializeGPIO(void)
{
    // SPI SCK
    GPIO_Init(GPIOC, 5, GPIO_MODE_IN_FL_NO_IT);
    // SPI MOSI
    GPIO_Init(GPIOC, 6, GPIO_MODE_IN_FL_NO_IT);
    // SPI NSS AF1
    GPIO_Init(GPIOA, 3, GPIO_MODE_IN_FL_NO_IT);
    // Timer2 (channel 3) AF1
    GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_HIGH_FAST);
    // Timer2 (channel 2) AF1
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void InitializeSPI(void)
{
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

void InitializeTimer(void)
{
    // Auto preload
    TIM2->CR1 |= TIM2_CR1_ARPE;

    /// Frequency 16 MHz -> 62.5 kHz
    TIM2->ARRH = 0;
    TIM2->ARRL = 0xFF;

    // Prescaler 2^x; x=1 -> 31 kHz
    TIM2->PSCR = 1U;

    // Duty
    TIM2->CCR2H = 0U;
    TIM2->CCR2L = f_Intensity;

    TIM2->CCMR2 |= TIM2_OCMODE_PWM2;

    // Compare enable
    TIM2->CCER1 |= TIM2_CCER1_CC2E;

    // Correct polarity;
    TIM2->CCER1 |= TIM2_CCER1_CC2P;
}

//
//  Setup the UART to run at 115200 baud, no parity, one stop bit, 8 data bits.
//
//  Important: This relies upon the system clock being set to run at 16 MHz.
//
void InitializeUART(void)
{
    //
    //  Clear the Idle Line Detected bit in the status register by a read
    //  to the UART1_SR register followed by a Read to the UART1_DR register.
    //
    unsigned char tmp = UART1->SR;
    tmp = UART1->DR;
    //
    //  Reset the UART registers to the reset values.
    //
    UART1->CR1 = 0;
    UART1->CR2 = 0;
    UART1->CR4 = 0;
    UART1->CR3 = 0;
    UART1->CR5 = 0;
    UART1->GTR = 0;
    UART1->PSCR = 0;
    //
    //  Now setup the port to 115200,n,8,1.
    //
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

void putchar(char aChar)
{
    UART1->DR = (uint8_t) aChar;
    while ((UART1->SR & UART1_SR_TXE) == 0);
    if (aChar == '\n')
    {
        UART1->DR = (uint8_t) '\r';
        while ((UART1->SR & UART1_SR_TXE) == 0);
    }
}

void SPI_IRQHandler(void) __interrupt(10)
{
    // f_Counter < SPI_BUFFER_ARRAY_LENGTH always
    if (f_Counter >= SPI_BUFFER_ARRAY_LENGTH)
    {
        return;
    }
    f_SPIBuffer[SPI_BUFFER_ARRAY_LENGTH - 1 - f_Counter] = SPI->DR;
    ++f_Counter;
}
