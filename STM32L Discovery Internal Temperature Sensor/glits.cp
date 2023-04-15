#line 1 "C:/Users/Shawon/Desktop/STM32L Discovery Internal Temperature Sensor/glits.c"
#line 1 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/adc.h"
#line 1 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/glass_lcd.c"
#line 1 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/glass_lcd.h"
#line 1 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/glass_lcd_def.h"
#line 110 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/glass_lcd.h"
const unsigned int CapLetterMap[26] =
{

 0xFE00, 0x6714, 0x1D00, 0x4714, 0x9D00, 0x9C00, 0x3F00, 0xFA00, 0x0014,

 0x5300, 0x9841, 0x1900, 0x5A48, 0x5A09, 0x5F00, 0xFC00, 0x5F01, 0xFC01,

 0xAF00, 0x0414, 0x5B00, 0x18C0, 0x5A81, 0x00C9, 0x0058, 0x05C0
};


const unsigned int SmallLetterMap[26] =
{

 0x9118, 0x9901, 0xB100, 0x6380, 0x9180, 0x9C00, 0x6340, 0x9810, 0x0510,

 0x0700, 0x0055, 0x0114, 0xB210, 0x9010, 0xB300, 0x9808, 0x6240, 0x9000,

 0x2101, 0x9900, 0x1300, 0x0201, 0x1281, 0xA081, 0x0301, 0x8180
};


const unsigned int NumberMap[10] =
{

 0x5F00, 0x4200, 0xF500, 0x6700, 0xEA00, 0xAF00, 0xBF00, 0x04600, 0xFF00, 0xEF00
};


unsigned char t_bar[2] = {0x0, 0x0};


void LCD_GLASS_Init();
void LCD_Master_Reset();
void LCD_RAM_clear();
void LCD_GLASS_Configure_GPIO();
void LCD_bar();
void LCD_GLASS_WriteChar(unsigned char *ch, unsigned char point, unsigned char column, unsigned char position);
void LCD_GLASS_DisplayString(unsigned char *ptr);
void LCD_GLASS_DisplayStrDeci(unsigned int *ptr);
void LCD_GLASS_Clear();
void LCD_GLASS_ScrollSentence(unsigned char *ptr, unsigned int nScroll, unsigned int ScrollSpeed);
static void LCD_Conv_Char_Seg(unsigned char *c, unsigned char point, unsigned char column, unsigned char *digit);
#line 1 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/gpio.h"
#line 5 "c:/users/shawon/desktop/stm32l discovery internal temperature sensor/glass_lcd.c"
void LCD_GLASS_Init()
{
 LCD_GLASS_Configure_GPIO();
 RCC_APB1ENRbits.PWREN =  0x1 ;
 RCC_APB1ENRbits.LCDEN =  0x1 ;
 PWR_CRbits.DBP =  0x1 ;
  RCC_CSRbits.RTCRST = 0x1 ;
  RCC_CSRbits.RTCRST = 0x0 ;
  RCC_CSRbits.LSEON = 0x1 ;
 while(RCC_CSRbits.LSERDY ==  0x0 );
  do{RCC_CSR &= (~(0x3 << 0x10)); RCC_CSR |= ( 0x1  << 0x10);}while(0) ;
 LCD_Master_Reset();
  LCD_FCRbits.HD = 0x0 ;
  LCD_FCRbits.SOFIE = 0x0 ;
  LCD_FCRbits.UDDIE = 0x0 ;
  do{LCD_CR &= (~(0x3 << 0x5)); LCD_CR |= ( 0x2  << 0x5);}while(0) ;
  do{LCD_CR &= (~(0x7 << 0x2)); LCD_CR |= ( 0x3  << 0x2);}while(0) ;
  LCD_CRbits.MUX_SEG = 0x1 ;
  LCD_CRbits.VSEL = 0x0 ;
  do{LCD_FCR &= (~(0xF << 0x12)); LCD_FCR |= ( 0x1  << 0x12);}while(0) ;
  do{LCD_FCR &= (~(0xF << 0x16)); LCD_FCR |= ( 0x3  << 0x16);}while(0) ;
  do{LCD_FCR &= (~(0x3 << 0x10)); LCD_FCR |= ( 0x0  << 0x10);}while(0) ;
  do{LCD_FCR &= (~(0x7 << 0x7)); LCD_FCR |= ( 0x0  << 0x7);}while(0) ;
  do{LCD_FCR &= (~(0x7 << 0x4)); LCD_FCR |= ( 0x0  << 0x4);}while(0) ;
  do{LCD_FCR &= (~(0x3 << 0xA)); LCD_FCR |= ( 0x3  << 0xA);}while(0) ;
 while(LCD_SRbits.FCRSF ==  0x0 );
  LCD_CRbits.LCDEN = 0x1 ;
 while(LCD_SRbits.RDY ==  0x0 );
 while(LCD_SRbits.ENS ==  0x0 );
 LCD_GLASS_Clear();

}


void LCD_Master_Reset()
{
 LCD_CR = 0x00000000;
 LCD_SR = 0x00000000;
 LCD_FCR = 0x00000000;
 LCD_CLR = 0x00000000;
 LCD_RAM_clear();
}


void LCD_RAM_clear()
{
 LCD_RAM_COM0 = 0;
 LCD_RAM_COM1 = 0;
 LCD_RAM_COM2 = 0;
 LCD_RAM_COM3 = 0;
 LCD_RAM_COM4 = 0;
 LCD_RAM_COM5 = 0;
 LCD_RAM_COM6 = 0;
 LCD_RAM_COM7 = 0;
}


void LCD_GLASS_Configure_GPIO()
{
  RCC_AHBENRbits.GPIOPAEN = 0x1 ;
  do{ do{GPIOA_MODER &= (~(0x3 << (1 << 1))); GPIOA_MODER |= (0x2 << (1 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 1)); GPIOA_OTYPER |= (0x1 << 1);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (1 << 1))); GPIOA_OSPEEDER |= (0x3 << (1 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (1 << 1))); GPIOA_PUPDR |= (0x0 << (1 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (2 << 1))); GPIOA_MODER |= (0x2 << (2 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 2)); GPIOA_OTYPER |= (0x1 << 2);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (2 << 1))); GPIOA_OSPEEDER |= (0x3 << (2 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (2 << 1))); GPIOA_PUPDR |= (0x0 << (2 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (3 << 1))); GPIOA_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 3)); GPIOA_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (3 << 1))); GPIOA_OSPEEDER |= (0x3 << (3 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (3 << 1))); GPIOA_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (8 << 1))); GPIOA_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 8)); GPIOA_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (8 << 1))); GPIOA_OSPEEDER |= (0x3 << (8 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (8 << 1))); GPIOA_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (9 << 1))); GPIOA_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 9)); GPIOA_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (9 << 1))); GPIOA_OSPEEDER |= (0x3 << (9 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (9 << 1))); GPIOA_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (10 << 1))); GPIOA_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 10)); GPIOA_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (10 << 1))); GPIOA_OSPEEDER |= (0x3 << (10 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (10 << 1))); GPIOA_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (15 << 1))); GPIOA_MODER |= (0x2 << (15 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 15)); GPIOA_OTYPER |= (0x1 << 15);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (15 << 1))); GPIOA_OSPEEDER |= (0x3 << (15 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (15 << 1))); GPIOA_PUPDR |= (0x0 << (15 << 1));}while(0) ;}while(0) ;

  do{if((1 >= 0) && (1 < 8)) { do{GPIOA_AFRL &= (~(0xF << (1 << 2))); GPIOA_AFRL |= (0xB << (1 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_AFRH |= (0xB << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)) { do{GPIOA_AFRL &= (~(0xF << (2 << 2))); GPIOA_AFRL |= (0xB << (2 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((2 - 8) << 2))); GPIOA_AFRH |= (0xB << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((3 >= 0) && (3 < 8)) { do{GPIOA_AFRL &= (~(0xF << (3 << 2))); GPIOA_AFRL |= (0xB << (3 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((3 - 8) << 2))); GPIOA_AFRH |= (0xB << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)) { do{GPIOA_AFRL &= (~(0xF << (8 << 2))); GPIOA_AFRL |= (0xB << (8 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((8 - 8) << 2))); GPIOA_AFRH |= (0xB << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)) { do{GPIOA_AFRL &= (~(0xF << (9 << 2))); GPIOA_AFRL |= (0xB << (9 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((9 - 8) << 2))); GPIOA_AFRH |= (0xB << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)) { do{GPIOA_AFRL &= (~(0xF << (10 << 2))); GPIOA_AFRL |= (0xB << (10 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((10 - 8) << 2))); GPIOA_AFRH |= (0xB << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)) { do{GPIOA_AFRL &= (~(0xF << (15 << 2))); GPIOA_AFRL |= (0xB << (15 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((15 - 8) << 2))); GPIOA_AFRH |= (0xB << ((15 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_AHBENRbits.GPIOPBEN = 0x1 ;
  do{ do{GPIOB_MODER &= (~(0x3 << (3 << 1))); GPIOB_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 3)); GPIOB_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (3 << 1))); GPIOB_OSPEEDER |= (0x3 << (3 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (3 << 1))); GPIOB_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (4 << 1))); GPIOB_MODER |= (0x2 << (4 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 4)); GPIOB_OTYPER |= (0x1 << 4);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (4 << 1))); GPIOB_OSPEEDER |= (0x3 << (4 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (4 << 1))); GPIOB_PUPDR |= (0x0 << (4 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (5 << 1))); GPIOB_MODER |= (0x2 << (5 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 5)); GPIOB_OTYPER |= (0x1 << 5);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (5 << 1))); GPIOB_OSPEEDER |= (0x3 << (5 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (5 << 1))); GPIOB_PUPDR |= (0x0 << (5 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (8 << 1))); GPIOB_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 8)); GPIOB_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (8 << 1))); GPIOB_OSPEEDER |= (0x3 << (8 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (8 << 1))); GPIOB_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (9 << 1))); GPIOB_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 9)); GPIOB_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (9 << 1))); GPIOB_OSPEEDER |= (0x3 << (9 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (9 << 1))); GPIOB_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (10 << 1))); GPIOB_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 10)); GPIOB_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (10 << 1))); GPIOB_OSPEEDER |= (0x3 << (10 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (10 << 1))); GPIOB_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (11 << 1))); GPIOB_MODER |= (0x2 << (11 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 11)); GPIOB_OTYPER |= (0x1 << 11);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (11 << 1))); GPIOB_OSPEEDER |= (0x3 << (11 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (11 << 1))); GPIOB_PUPDR |= (0x0 << (11 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (12 << 1))); GPIOB_MODER |= (0x2 << (12 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 12)); GPIOB_OTYPER |= (0x1 << 12);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (12 << 1))); GPIOB_OSPEEDER |= (0x3 << (12 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (12 << 1))); GPIOB_PUPDR |= (0x0 << (12 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (13 << 1))); GPIOB_MODER |= (0x2 << (13 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 13)); GPIOB_OTYPER |= (0x1 << 13);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (13 << 1))); GPIOB_OSPEEDER |= (0x3 << (13 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (13 << 1))); GPIOB_PUPDR |= (0x0 << (13 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (14 << 1))); GPIOB_MODER |= (0x2 << (14 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 14)); GPIOB_OTYPER |= (0x1 << 14);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (14 << 1))); GPIOB_OSPEEDER |= (0x3 << (14 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (14 << 1))); GPIOB_PUPDR |= (0x0 << (14 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (15 << 1))); GPIOB_MODER |= (0x2 << (15 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 15)); GPIOB_OTYPER |= (0x1 << 15);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (15 << 1))); GPIOB_OSPEEDER |= (0x3 << (15 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (15 << 1))); GPIOB_PUPDR |= (0x0 << (15 << 1));}while(0) ;}while(0) ;

  do{if((3 >= 0) && (3 < 8)) { do{GPIOB_AFRL &= (~(0xF << (3 << 2))); GPIOB_AFRL |= (0xB << (3 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((3 - 8) << 2))); GPIOB_AFRH |= (0xB << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((4 >= 0) && (4 < 8)) { do{GPIOB_AFRL &= (~(0xF << (4 << 2))); GPIOB_AFRL |= (0xB << (4 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((4 - 8) << 2))); GPIOB_AFRH |= (0xB << ((4 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((5 >= 0) && (5 < 8)) { do{GPIOB_AFRL &= (~(0xF << (5 << 2))); GPIOB_AFRL |= (0xB << (5 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((5 - 8) << 2))); GPIOB_AFRH |= (0xB << ((5 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)) { do{GPIOB_AFRL &= (~(0xF << (8 << 2))); GPIOB_AFRL |= (0xB << (8 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((8 - 8) << 2))); GPIOB_AFRH |= (0xB << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)) { do{GPIOB_AFRL &= (~(0xF << (9 << 2))); GPIOB_AFRL |= (0xB << (9 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((9 - 8) << 2))); GPIOB_AFRH |= (0xB << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)) { do{GPIOB_AFRL &= (~(0xF << (10 << 2))); GPIOB_AFRL |= (0xB << (10 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((10 - 8) << 2))); GPIOB_AFRH |= (0xB << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)) { do{GPIOB_AFRL &= (~(0xF << (11 << 2))); GPIOB_AFRL |= (0xB << (11 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((11 - 8) << 2))); GPIOB_AFRH |= (0xB << ((11 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((12 >= 0) && (12 < 8)) { do{GPIOB_AFRL &= (~(0xF << (12 << 2))); GPIOB_AFRL |= (0xB << (12 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((12 - 8) << 2))); GPIOB_AFRH |= (0xB << ((12 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)) { do{GPIOB_AFRL &= (~(0xF << (13 << 2))); GPIOB_AFRL |= (0xB << (13 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((13 - 8) << 2))); GPIOB_AFRH |= (0xB << ((13 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((14 >= 0) && (14 < 8)) { do{GPIOB_AFRL &= (~(0xF << (14 << 2))); GPIOB_AFRL |= (0xB << (14 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((14 - 8) << 2))); GPIOB_AFRH |= (0xB << ((14 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)) { do{GPIOB_AFRL &= (~(0xF << (15 << 2))); GPIOB_AFRL |= (0xB << (15 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((15 - 8) << 2))); GPIOB_AFRH |= (0xB << ((15 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_AHBENRbits.GPIOPCEN = 0x1 ;
  do{ do{GPIOC_MODER &= (~(0x3 << (0 << 1))); GPIOC_MODER |= (0x2 << (0 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 0)); GPIOC_OTYPER |= (0x1 << 0);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (0 << 1))); GPIOC_OSPEEDER |= (0x3 << (0 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (0 << 1))); GPIOC_PUPDR |= (0x0 << (0 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (1 << 1))); GPIOC_MODER |= (0x2 << (1 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 1)); GPIOC_OTYPER |= (0x1 << 1);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (1 << 1))); GPIOC_OSPEEDER |= (0x3 << (1 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (1 << 1))); GPIOC_PUPDR |= (0x0 << (1 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (2 << 1))); GPIOC_MODER |= (0x2 << (2 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 2)); GPIOC_OTYPER |= (0x1 << 2);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (2 << 1))); GPIOC_OSPEEDER |= (0x3 << (2 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (2 << 1))); GPIOC_PUPDR |= (0x0 << (2 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (3 << 1))); GPIOC_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 3)); GPIOC_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (3 << 1))); GPIOC_OSPEEDER |= (0x3 << (3 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (3 << 1))); GPIOC_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (6 << 1))); GPIOC_MODER |= (0x2 << (6 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 6)); GPIOC_OTYPER |= (0x1 << 6);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (6 << 1))); GPIOC_OSPEEDER |= (0x3 << (6 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (6 << 1))); GPIOC_PUPDR |= (0x0 << (6 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (7 << 1))); GPIOC_MODER |= (0x2 << (7 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 7)); GPIOC_OTYPER |= (0x1 << 7);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (7 << 1))); GPIOC_OSPEEDER |= (0x3 << (7 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (7 << 1))); GPIOC_PUPDR |= (0x0 << (7 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (8 << 1))); GPIOC_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 8)); GPIOC_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (8 << 1))); GPIOC_OSPEEDER |= (0x3 << (8 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (8 << 1))); GPIOC_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (9 << 1))); GPIOC_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 9)); GPIOC_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (9 << 1))); GPIOC_OSPEEDER |= (0x3 << (9 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (9 << 1))); GPIOC_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (10 << 1))); GPIOC_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 10)); GPIOC_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (10 << 1))); GPIOC_OSPEEDER |= (0x3 << (10 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (10 << 1))); GPIOC_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (11 << 1))); GPIOC_MODER |= (0x2 << (11 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 11)); GPIOC_OTYPER |= (0x1 << 11);}while(0) ; do{GPIOC_OSPEEDER &= (~(0x3 << (11 << 1))); GPIOC_OSPEEDER |= (0x3 << (11 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (11 << 1))); GPIOC_PUPDR |= (0x0 << (11 << 1));}while(0) ;}while(0) ;

  do{if((0 >= 0) && (0 < 8)) { do{GPIOC_AFRL &= (~(0xF << (0 << 2))); GPIOC_AFRL |= (0xB << (0 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((0 - 8) << 2))); GPIOC_AFRH |= (0xB << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((1 >= 0) && (1 < 8)) { do{GPIOC_AFRL &= (~(0xF << (1 << 2))); GPIOC_AFRL |= (0xB << (1 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((1 - 8) << 2))); GPIOC_AFRH |= (0xB << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)) { do{GPIOC_AFRL &= (~(0xF << (2 << 2))); GPIOC_AFRL |= (0xB << (2 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((2 - 8) << 2))); GPIOC_AFRH |= (0xB << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((3 >= 0) && (3 < 8)) { do{GPIOC_AFRL &= (~(0xF << (3 << 2))); GPIOC_AFRL |= (0xB << (3 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((3 - 8) << 2))); GPIOC_AFRH |= (0xB << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((6 >= 0) && (6 < 8)) { do{GPIOC_AFRL &= (~(0xF << (6 << 2))); GPIOC_AFRL |= (0xB << (6 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((6 - 8) << 2))); GPIOC_AFRH |= (0xB << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((7 >= 0) && (7 < 8)) { do{GPIOC_AFRL &= (~(0xF << (7 << 2))); GPIOC_AFRL |= (0xB << (7 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((7 - 8) << 2))); GPIOC_AFRH |= (0xB << ((7 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)) { do{GPIOC_AFRL &= (~(0xF << (8 << 2))); GPIOC_AFRL |= (0xB << (8 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((8 - 8) << 2))); GPIOC_AFRH |= (0xB << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)) { do{GPIOC_AFRL &= (~(0xF << (9 << 2))); GPIOC_AFRL |= (0xB << (9 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((9 - 8) << 2))); GPIOC_AFRH |= (0xB << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)) { do{GPIOC_AFRL &= (~(0xF << (10 << 2))); GPIOC_AFRL |= (0xB << (10 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((10 - 8) << 2))); GPIOC_AFRH |= (0xB << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)) { do{GPIOC_AFRL &= (~(0xF << (11 << 2))); GPIOC_AFRL |= (0xB << (11 << 2));}while(0) ;} else { do{GPIOC_AFRH &= (~(0xF << ((11 - 8) << 2))); GPIOC_AFRH |= (0xB << ((11 - 8) << 2));}while(0) ;}}while(0) ;
}


void LCD_bar()
{
 LCD_RAM_COM2 &= 0xFFFF5FFF;
 LCD_RAM_COM3 &= 0xFFFF5FFF;

 LCD_RAM_COM2 |= ((unsigned long)((unsigned long)t_bar[0] << 0x0C));

 LCD_RAM_COM3 |= ((unsigned long)((unsigned long)t_bar[1] << 0x0C));
}


void LCD_GLASS_WriteChar(unsigned char *ch, unsigned char point, unsigned char column, unsigned char position)
{
 unsigned char digit[0x04];


 LCD_Conv_Char_Seg(ch, point, column, digit);

 while(LCD_SRbits.UDR ==  0x1 );

 switch (position)
 {

 case 1:
 {
 LCD_RAM_COM0 &= 0xCFFFFFFC;
 LCD_RAM_COM1 &= 0xCFFFFFFC;
 LCD_RAM_COM2 &= 0xCFFFFFFC;
 LCD_RAM_COM3 &= 0xCFFFFFFC;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x00]) & 0x03));
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x01]) & 0x03));
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x02]) & 0x03));
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x03]) & 0x03));

 break;
 }


 case 2:
 {
 LCD_RAM_COM0 &= 0xF3FFFF03;
 LCD_RAM_COM1 &= 0xF3FFFF03;
 LCD_RAM_COM2 &= 0xF3FFFF03;
 LCD_RAM_COM3 &= 0xF3FFFF03;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x00]) & 0x02) << 0x06) | ((((unsigned long)digit[0x00]) & 0x01) << 0x02));
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x01]) & 0x02) << 0x06) | ((((unsigned long)digit[0x01]) & 0x01) << 0x02));
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x02]) & 0x02) << 0x06) | ((((unsigned long)digit[0x02]) & 0x01) << 0x02));
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x03]) & 0x02) << 0x06) | ((((unsigned long)digit[0x03]) & 0x01) << 0x02));

 break;
 }


 case 3:
 {
 LCD_RAM_COM0 &= 0xFCFFFCFF;
 LCD_RAM_COM1 &= 0xFCFFFCFF;
 LCD_RAM_COM2 &= 0xFCFFFCFF;
 LCD_RAM_COM3 &= 0xFCFFFCFF;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x00]) & 0x03) << 0x08));
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x01]) & 0x03) << 0x08));
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x02]) & 0x03) << 0x08));
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x03]) & 0x03) << 0x08));

 break;
 }


 case 4:
 {
 LCD_RAM_COM0 &= 0xFFCFF3FF;
 LCD_RAM_COM1 &= 0xFFCFF3FF;
 LCD_RAM_COM2 &= 0xFFCFF3FF;
 LCD_RAM_COM3 &= 0xFFCFF3FF;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0A));
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0A));
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x02]) & 0x03) << 0x0A));
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x03]) & 0x03) << 0x0A));

 break;
 }


 case 5:
 {
 LCD_RAM_COM0 &= 0xFFF3CFFF;
 LCD_RAM_COM1 &= 0xFFF3CFFF;
 LCD_RAM_COM2 &= 0xFFF3CFFF;
 LCD_RAM_COM3 &= 0xFFF3CFFF;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0C));
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0C));
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0C));
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0C));

 break;
 }


 case 6:
 {
 LCD_RAM_COM0 &= 0xFFFC3FFF;
 LCD_RAM_COM1 &= 0xFFFC3FFF;
 LCD_RAM_COM2 &= 0xFFFC3FFF;
 LCD_RAM_COM3 &= 0xFFFC3FFF;

 LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x00]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0E)) ;
 LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x01]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0E)) ;
 LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x02]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0E)) ;
 LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x03]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0E)) ;

 break;
 }

 default:
 {
 break;
 }
 }


 LCD_bar();
  LCD_SRbits.UDR = 0x1 ;
}


void LCD_GLASS_DisplayString(unsigned char *ptr)
{
 unsigned char i = 0x01;


 while((*ptr != 0) & (i < 0x08))
 {

 LCD_GLASS_WriteChar(ptr,  0x0 ,  0x0 , i);


 ptr++;

 i++;
 }
}


void LCD_GLASS_DisplayStrDeci(unsigned int *ptr)
{
 unsigned char i = 0x01;
 unsigned char char_tmp = 0x00;



 while((*ptr != 0) & (i < 0x08))
 {
 char_tmp = ((*ptr) & 0x00FF);

 switch((*ptr) & 0xF000)
 {
 case  0x8000 :
 {

 LCD_GLASS_WriteChar(&char_tmp,  0x1 ,  0x0 , i);
 break;
 }
 case  0x4000 :
 {

 LCD_GLASS_WriteChar(&char_tmp,  0x0 ,  0x1 , i);
 break;
 }
 default:
 {
 LCD_GLASS_WriteChar(&char_tmp,  0x0 ,  0x0 , i);
 break;
 }
 }
 ptr++;

 i++;
 }
}


void LCD_GLASS_Clear()
{

 while(LCD_SRbits.UDR ==  0x1 );
 LCD_RAM_Clear();

  LCD_SRbits.UDR = 0x1 ;
}


void LCD_GLASS_ScrollSentence(unsigned char *ptr, unsigned int nScroll, unsigned int ScrollSpeed)
{
 unsigned char Repetition = 0x00;
 unsigned char Char_Nb = 0x00;
 unsigned char *ptr1;
 unsigned char str[7] = "";
 unsigned char Str_size = 0x00;

 if(ptr == 0)
 {
 return;
 }


 for(ptr1 = ptr, Str_size = 0x00 ; *ptr1 != 0x00; Str_size++, ptr1++)
 {
 };

 ptr1 = ptr;
 LCD_GLASS_DisplayString(ptr);
 Vdelay_ms(ScrollSpeed);


 for(Repetition = 0x00; Repetition < nScroll; Repetition++)
 {
 for(Char_Nb = 0x00; Char_Nb < Str_size; Char_Nb++)
 {
 *(str) = *(ptr1 + ((Char_Nb + 0x01) % Str_size));
 *(str + 0x01) = *(ptr1 + ((Char_Nb + 0x02) % Str_size));
 *(str + 0x02) = *(ptr1 + ((Char_Nb + 0x03) % Str_size));
 *(str + 0x03) = *(ptr1 + ((Char_Nb + 0x04) % Str_size));
 *(str + 0x04) = *(ptr1 + ((Char_Nb + 0x05) % Str_size));
 *(str + 0x05) = *(ptr1 + ((Char_Nb + 0x06) % Str_size));
 LCD_GLASS_Clear();
 LCD_GLASS_DisplayString(str);

 Vdelay_ms(ScrollSpeed);
 }
 }
}


static void LCD_Conv_Char_Seg(unsigned char *c, unsigned char point, unsigned char column, unsigned char *digit)
{
 unsigned char i = 0x00;
 unsigned char j = 0x00;

 unsigned int ch = 0x0000;

 switch(*c)
 {
 case ' ':
 {
 ch = 0x00;
 break;
 }
 case '*':
 {
 ch =  0xA0DD ;
 break;
 }
 case 'µ':
 {
 ch =  0x6084 ;
 break;
 }
 case 'm':
 {
 ch =  0xB210 ;
 break;
 }
 case 'n':
 {
 ch =  0x2210 ;
 break;
 }
 case '-':
 {
 ch =  0xA000 ;
 break;
 }
 case '/':
 {
 ch =  0x00C0 ;
 break;
 }
 case '°':
 {
 ch =  0xEC00 ;
 break;
 }
 case '%':
 {
 ch =  0xB300 ;
 break;
 }
 case '[':
 {
 ch =  0x1D00 ;
 break;
 }
 case ']':
 {
 ch =  0x4700 ;
 break;
 }
 case 0xFF:
 {
 ch =  0xFFDD ;
 break;
 }
 case '0':
 case '1':
 case '2':
 case '3':
 case '4':
 case '5':
 case '6':
 case '7':
 case '8':
 case '9':
 {
 ch = NumberMap[(*c - 0x30)];
 break;
 }
 default:
 {

 if((*c < 0x5B) && (*c > 0x40))
 {
 ch = CapLetterMap[(*c - 'A')];
 }

 if((*c <0x7B) && (*c > 0x60))
 {
 ch = SmallLetterMap[(*c - 'a')];
 }
 break;
 }
 }


 if(point != 0)
 {
 ch |= 0x0002;
 }


 if(column != 0)
 {
 ch |= 0x0020;
 }

 for(i = 0x0C, j = 0x00 ; j < 0x04; i -= 0x04, j++)
 {
 digit[j] = ((ch >> i) & 0x0F);
 }
}
#line 11 "C:/Users/Shawon/Desktop/STM32L Discovery Internal Temperature Sensor/glits.c"
unsigned char samples = 0;

unsigned int avg = 0;

signed long adc_accum = 0;


void setup_LCD();
void setup_ADC();
void setup_GPIOs();
void show_value(signed int value, unsigned char type);
void show_const_msgs(unsigned char pos, unsigned char type);
void show_degree_C(unsigned char pos);
void clear_disp(unsigned char pos);


void ADC_ISR()
iv IVT_INT_ADC1
ics ICS_AUTO
{
 if( (ADC_SR & (1 << 0))  != 0)
 {
  GPIOB_BSRR |= (1 << 6) ;
  ADC_SRbits.AWD = 0 ;
 }

 if( (ADC_SR & (1 << 1))  != 0)
 {
 adc_accum += (ADC_DR & 0x0FFF);;
 samples++;
 if(samples >= 16)
 {
 avg = (adc_accum >> 4);
 adc_accum = 0;
 samples = 0;
 }
 }
}


void main()
{
 bit disp;
 float t = 0;

 setup_LCD();
 setup_ADC();
 setup_GPIOs();

 while(1)
 {
 if( (GPIOA_IDR & (1 << 0))  == 1)
 {
 while( (GPIOA_IDR & (1 << 0))  == 1);
 disp = ~disp;
 }

 switch(disp)
 {
 case 1:
 {
 show_value(avg, 0);
 break;
 }
 default:
 {
 t = ((110.0 - 30.0) / ( 0x355  -  0x2A4 ));
 t *= (avg -  0x2A4 );
 t += 30.0;
 t *= 10;
 t -=  100 ;

 show_value(t, 1);
 break;
 }
 }

 delay_ms(200);
  GPIOB_BSRR |= (1 << (6 + 16)) ;
  ADC_CR2bits.SWSTART = 0x1 ;

 };
}


void setup_LCD()
{
 LCD_GLASS_Init();
 LCD_GLASS_Clear();
}


void setup_ADC()
{
  RCC_APB2LPENRbits.ADC1LPEN = 0x1 ;
  RCC_APB2ENRbits.ADC1EN = 0x1 ;
  ADC_CR2bits.ADON = 0x0 ;
  do{ADC_CR2 &= (~(0x1 << 2)); ADC_CR2 |= ( 0  << 2);}while(0) ;
  do{ADC_CR1 &= (~(0x3 << 24)); ADC_CR1 |= ( 0x0  << 24);}while(0) ;
  ADC_CR2bits.ALIGN = 0 ;
  ADC_CR1bits.PDD = 1 ;
  ADC_CR1bits.PDI = 1 ;
  ADC_CR2bits.EOCS = 1 ;
  do{ADC_CR2 &= (~(0x7 << 4)); ADC_CR2 |= ( 0x1  << 4);}while(0) ;
  ADC_CCRbits.TSVREFE = 0x1 ;
  ADC_CR1bits.AWDEN = 0x1 ;
  ADC_CR1bits.AWDSGL = 1 ;
  do{ADC_CR1 &= 0xFFFFFFE0; ADC_CR1 |= (0x0000001F & 16);}while(0) ;
  ADC_HTR = (700 & 0xFFF) ;
  ADC_LTR = (600 & 0xFFF) ;
  ADC_CR2bits.CONT = 0x0 ;
  do{if((16 >= 0) && (16 <= 9)){ADC_SMPR3 &= (~(0x7 << (16 * 3))); ADC_SMPR3 |= ( 0x5  << (16 * 3));} else if((16 >= 10) && (16 <= 19)){ADC_SMPR2 &= (~(0x7 << ((16 - 10) * 3))); ADC_SMPR2 |= ( 0x5  << ((16 - 10) * 3));} else if((16 >= 20) && (16 <= 29)){ADC_SMPR1 &= (~(0x7 << ((16 - 20) * 3))); ADC_SMPR1 |= ( 0x5  << ((16 - 20) * 3));}}while(0) ;
  do{ADC_SQR1 &= (~(0x1F << 20)); ADC_SQR1 |= ((1 - 1) << 20);}while(0) ;
  do{if((1 >= 1) && (1 <= 6)){ADC_SQR5 &= (~(0x1F << ((1 - 1) * 5))); ADC_SQR5 |= (16 << ((1 - 1) * 5));} else if((1 >= 7) && (1 <= 12)){ADC_SQR4 &= (~(0x1F << ((1 - 7) * 5))); ADC_SQR4 |= (16 << ((1 - 7) * 5));} else if((1 >= 13) && (1 <= 18)){ADC_SQR4 &= (~(0x1F << ((1 - 13) * 5))); ADC_SQR4 |= (16 << ((1 - 13) * 5));} else if((1 >= 19) && (1 <= 24)){ADC_SQR4 &= (~(0x1F << ((1 - 19) * 5))); ADC_SQR4 |= (16 << ((1 - 19) * 5));} else if((1 >= 25) && (1 <= 28)){ADC_SQR4 &= (~(0x1F << ((1 - 20) * 5))); ADC_SQR4 |= (16 << ((1 - 20) * 5));}}while(0) ;
  do{ADC_CCR &= (~(0x3 << 16)); ADC_CCR |= ( 2  << 16);}while(0) ;
  ADC_CR1bits.AWDIE = 0x1 ;
  ADC_CR1bits.EOCIE = 0x1 ;
 NVIC_IntEnable(IVT_INT_ADC1);
 NVIC_SetIntPriority(IVT_INT_ADC1, _NVIC_INT_PRIORITY_LVL1);
 delay_ms(1);
 ADC_SR = 0x0000;
 ADC_CSR = 0x0000;
  ADC_CR2bits.ADON = 0x1 ;
 delay_ms(20);
}


void setup_GPIOs()
{
  RCC_AHBENRbits.GPIOPAEN = 0x1 ;
  do{ do{GPIOA_MODER &= (~(0x3 << (0 << 1))); GPIOA_MODER |= (0x0 << (0 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 0)); GPIOA_OTYPER |= (0x0 << 0);}while(0) ; do{GPIOA_OSPEEDER &= (~(0x3 << (0 << 1))); GPIOA_OSPEEDER |= (0x2 << (0 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (0 << 1))); GPIOA_PUPDR |= (0x0 << (0 << 1));}while(0) ;}while(0) ;

  RCC_AHBENRbits.GPIOPBEN = 0x1 ;
  do{ do{GPIOB_MODER &= (~(0x3 << (6 << 1))); GPIOB_MODER |= (0x1 << (6 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 6)); GPIOB_OTYPER |= (0x0 << 6);}while(0) ; do{GPIOB_OSPEEDER &= (~(0x3 << (6 << 1))); GPIOB_OSPEEDER |= (0x2 << (6 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (6 << 1))); GPIOB_PUPDR |= (0x0 << (6 << 1));}while(0) ;}while(0) ;
}


void show_value(signed int value, unsigned char type)
{
 unsigned char ch[1] = {0x20};


 if(value > 0)
 {
 ch[0] = 0x20;
 }
 else
 {
 ch[0] = 0x2D;
 value = -value;
 }
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 1);

 if((value > 999) && (value <= 9999))
 {

 ch[0] = ((value / 1000) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 2);
 ch[0] = (((value / 100) % 10) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 3);
 ch[0] = (((value / 10) % 10) + 0x30);
 LCD_GLASS_WriteChar(ch, type, 0, 4);
 ch[0] = ((value % 10) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 5);

 show_const_msgs(6, type);
 }
 else if((value > 99) && (value <= 999))
 {
 ch[0] = (((value / 100) % 10) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 2);
 ch[0] = (((value / 10) % 10) + 0x30);
 LCD_GLASS_WriteChar(ch, type, 0, 3);
 ch[0] = ((value % 10) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 4);

 show_const_msgs(5, type);

 ch[0] = 0x20;
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 7);

 }
 else if((value >= 0) && (value <= 99))
 {
 ch[0] = (((value / 10) % 10) + 0x30);
 LCD_GLASS_WriteChar(ch, type, 0, 2);
 ch[0] = ((value % 10) + 0x30);
 LCD_GLASS_WriteChar(ch,  0x0 , 0, 3);

 show_const_msgs(4, type);
 clear_disp(6);
 }
}


void show_const_msgs(unsigned char pos, unsigned char type)
{
 switch(type)
 {
 case 1:
 {
 show_degree_C(pos);
 break;
 }
 default:
 {
 clear_disp(pos);
 break;
 }
 }
}


void show_degree_C(unsigned char pos)
{
 unsigned char ch[1] = {0x20};

 ch[0] = '°';
 LCD_GLASS_WriteChar(ch,  0x0 , 0, pos);
 ch[0] = 'C';
 LCD_GLASS_WriteChar(ch,  0x0 , 0, (1 + pos));
}


void clear_disp(unsigned char pos)
{
 unsigned char ch[1] = {0x20};

 ch[0] = 0x20;
 LCD_GLASS_WriteChar(ch,  0x0 , 0, pos);
 ch[0] = 0x20;
 LCD_GLASS_WriteChar(ch,  0x0 , 0, (1 + pos));
}
