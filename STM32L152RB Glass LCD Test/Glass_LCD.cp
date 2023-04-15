#line 1 "J:/Transfer/Laptop to Desktop/New folder (3)/STM32L152RB Glass LCD Test/Glass_LCD.c"
#line 1 "j:/transfer/laptop to desktop/new folder (3)/stm32l152rb glass lcd test/glass_lcd.h"
#line 101 "j:/transfer/laptop to desktop/new folder (3)/stm32l152rb glass lcd test/glass_lcd.h"
bit KeyPressed;

const unsigned int CapLetterMap[26] =
 {

 0xFE00, 0x6714, 0x1D00, 0x4714, 0x9D00, 0x9C00, 0x3F00, 0xFA00, 0x0014,

 0x5300, 0x9841, 0x1900, 0x5A48, 0x5A09, 0x5F00, 0xFC00, 0x5F01, 0xFC01,

 0xAF00, 0x0414, 0x5B00, 0x18C0, 0x5A81, 0x00C9, 0x0058, 0x05C0
 };


const unsigned int NumberMap[10] =
 {

 0x5F00, 0x4200, 0xF500, 0x6700, 0xEA00, 0xAF00, 0xBF00, 0x04600, 0xFF00, 0xEF00
 };


unsigned char t_bar[2] = {0x0, 0x0};


void LCD_bar();
void LCD_GLASS_Init();
void LCD_GLASS_WriteChar(unsigned char *ch, unsigned char point, unsigned char column, unsigned char position);
void LCD_GLASS_DisplayString(unsigned char *ptr);
void LCD_GLASS_DisplayStrDeci(unsigned int *ptr);
void LCD_GLASS_ClearChar(unsigned char position);
void LCD_GLASS_Clear();
void LCD_GLASS_ScrollSentence(unsigned char *ptr, unsigned int nScroll, unsigned int ScrollSpeed);
void LCD_GLASS_WriteTime(char a, unsigned char posi, unsigned char column);
void LCD_GLASS_Configure_GPIO();
static void LCD_Conv_Char_Seg(unsigned char *c, unsigned char point, unsigned char column, unsigned char *digit);
#line 1 "j:/transfer/laptop to desktop/new folder (3)/stm32l152rb glass lcd test/gpio.h"
#line 5 "J:/Transfer/Laptop to Desktop/New folder (3)/STM32L152RB Glass LCD Test/Glass_LCD.c"
void LCD_GLASS_Init()
{
 KeyPressed =  0x0 ;
 RCC_APB1LPENRbits.PWRLPEN = 1;
 RCC_APB1LPENRbits.LCDLPEN = 1;
}


void LCD_GLASS_Configure_GPIO()
{
  RCC_AHBENRbits.GPIOAEN = 0x1 ;
  do{ do{GPIOA_MODER &= (~(0x3 << (1 << 1))); GPIOA_MODER |= (0x2 << (1 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 1)); GPIOA_OTYPER |= (0x1 << 1);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (1 << 1))); GPIOA_OSPEEDR |= (0x3 << (1 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (1 << 1))); GPIOA_PUPDR |= (0x0 << (1 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (2 << 1))); GPIOA_MODER |= (0x2 << (2 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 2)); GPIOA_OTYPER |= (0x1 << 2);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (2 << 1))); GPIOA_OSPEEDR |= (0x3 << (2 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (2 << 1))); GPIOA_PUPDR |= (0x0 << (2 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (3 << 1))); GPIOA_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 3)); GPIOA_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (3 << 1))); GPIOA_OSPEEDR |= (0x3 << (3 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (3 << 1))); GPIOA_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (8 << 1))); GPIOA_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 8)); GPIOA_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (8 << 1))); GPIOA_OSPEEDR |= (0x3 << (8 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (8 << 1))); GPIOA_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (9 << 1))); GPIOA_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 9)); GPIOA_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (9 << 1))); GPIOA_OSPEEDR |= (0x3 << (9 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (9 << 1))); GPIOA_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (10 << 1))); GPIOA_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 10)); GPIOA_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (10 << 1))); GPIOA_OSPEEDR |= (0x3 << (10 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (10 << 1))); GPIOA_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOA_MODER &= (~(0x3 << (15 << 1))); GPIOA_MODER |= (0x2 << (15 << 1));}while(0) ; do{GPIOA_OTYPER &= (~(0x1 << 15)); GPIOA_OTYPER |= (0x1 << 15);}while(0) ; do{GPIOA_OSPEEDR &= (~(0x3 << (15 << 1))); GPIOA_OSPEEDR |= (0x3 << (15 << 1));}while(0) ; do{GPIOA_PUPDR &= (~(0x3 << (15 << 1))); GPIOA_PUPDR |= (0x0 << (15 << 1));}while(0) ;}while(0) ;

  do{if((1 >= 0) && (1 < 8)) { do{GPIOA_AFRL &= (~(0xF << (1 << 2))); GPIOA_AFRL |= (0xB << (1 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_AFRH |= (0xB << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)) { do{GPIOA_AFRL &= (~(0xF << (2 << 2))); GPIOA_AFRL |= (0xB << (2 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((2 - 8) << 2))); GPIOA_AFRH |= (0xB << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((3 >= 0) && (3 < 8)) { do{GPIOA_AFRL &= (~(0xF << (3 << 2))); GPIOA_AFRL |= (0xB << (3 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((3 - 8) << 2))); GPIOA_AFRH |= (0xB << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)) { do{GPIOA_AFRL &= (~(0xF << (8 << 2))); GPIOA_AFRL |= (0xB << (8 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((8 - 8) << 2))); GPIOA_AFRH |= (0xB << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)) { do{GPIOA_AFRL &= (~(0xF << (9 << 2))); GPIOA_AFRL |= (0xB << (9 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((9 - 8) << 2))); GPIOA_AFRH |= (0xB << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)) { do{GPIOA_AFRL &= (~(0xF << (10 << 2))); GPIOA_AFRL |= (0xB << (10 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((10 - 8) << 2))); GPIOA_AFRH |= (0xB << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)) { do{GPIOA_AFRL &= (~(0xF << (15 << 2))); GPIOA_AFRL |= (0xB << (15 << 2));}while(0) ;} else { do{GPIOA_AFRH &= (~(0xF << ((15 - 8) << 2))); GPIOA_AFRH |= (0xB << ((15 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_AHBENRbits.GPIOBEN = 0x1 ;
  do{ do{GPIOB_MODER &= (~(0x3 << (3 << 1))); GPIOB_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 3)); GPIOB_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (3 << 1))); GPIOB_OSPEEDR |= (0x3 << (3 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (3 << 1))); GPIOB_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (4 << 1))); GPIOB_MODER |= (0x2 << (4 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 4)); GPIOB_OTYPER |= (0x1 << 4);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (4 << 1))); GPIOB_OSPEEDR |= (0x3 << (4 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (4 << 1))); GPIOB_PUPDR |= (0x0 << (4 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (5 << 1))); GPIOB_MODER |= (0x2 << (5 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 5)); GPIOB_OTYPER |= (0x1 << 5);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (5 << 1))); GPIOB_OSPEEDR |= (0x3 << (5 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (5 << 1))); GPIOB_PUPDR |= (0x0 << (5 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (8 << 1))); GPIOB_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 8)); GPIOB_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (8 << 1))); GPIOB_OSPEEDR |= (0x3 << (8 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (8 << 1))); GPIOB_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (9 << 1))); GPIOB_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 9)); GPIOB_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (9 << 1))); GPIOB_OSPEEDR |= (0x3 << (9 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (9 << 1))); GPIOB_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (10 << 1))); GPIOB_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 10)); GPIOB_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (10 << 1))); GPIOB_OSPEEDR |= (0x3 << (10 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (10 << 1))); GPIOB_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (11 << 1))); GPIOB_MODER |= (0x2 << (11 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 11)); GPIOB_OTYPER |= (0x1 << 11);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (11 << 1))); GPIOB_OSPEEDR |= (0x3 << (11 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (11 << 1))); GPIOB_PUPDR |= (0x0 << (11 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (12 << 1))); GPIOB_MODER |= (0x2 << (12 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 12)); GPIOB_OTYPER |= (0x1 << 12);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (12 << 1))); GPIOB_OSPEEDR |= (0x3 << (12 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (12 << 1))); GPIOB_PUPDR |= (0x0 << (12 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (13 << 1))); GPIOB_MODER |= (0x2 << (13 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 13)); GPIOB_OTYPER |= (0x1 << 13);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (13 << 1))); GPIOB_OSPEEDR |= (0x3 << (13 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (13 << 1))); GPIOB_PUPDR |= (0x0 << (13 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (14 << 1))); GPIOB_MODER |= (0x2 << (14 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 14)); GPIOB_OTYPER |= (0x1 << 14);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (14 << 1))); GPIOB_OSPEEDR |= (0x3 << (14 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (14 << 1))); GPIOB_PUPDR |= (0x0 << (14 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOB_MODER &= (~(0x3 << (15 << 1))); GPIOB_MODER |= (0x2 << (15 << 1));}while(0) ; do{GPIOB_OTYPER &= (~(0x1 << 15)); GPIOB_OTYPER |= (0x1 << 15);}while(0) ; do{GPIOB_OSPEEDR &= (~(0x3 << (15 << 1))); GPIOB_OSPEEDR |= (0x3 << (15 << 1));}while(0) ; do{GPIOB_PUPDR &= (~(0x3 << (15 << 1))); GPIOB_PUPDR |= (0x0 << (15 << 1));}while(0) ;}while(0) ;

  do{if((1 >= 0) && (1 < 8)) { do{GPIOB_AFRL &= (~(0xF << (1 << 2))); GPIOB_AFRL |= (0xB << (1 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((1 - 8) << 2))); GPIOB_AFRH |= (0xB << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((2 >= 0) && (2 < 8)) { do{GPIOB_AFRL &= (~(0xF << (2 << 2))); GPIOB_AFRL |= (0xB << (2 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((2 - 8) << 2))); GPIOB_AFRH |= (0xB << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((3 >= 0) && (3 < 8)) { do{GPIOB_AFRL &= (~(0xF << (3 << 2))); GPIOB_AFRL |= (0xB << (3 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((3 - 8) << 2))); GPIOB_AFRH |= (0xB << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((8 >= 0) && (8 < 8)) { do{GPIOB_AFRL &= (~(0xF << (8 << 2))); GPIOB_AFRL |= (0xB << (8 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((8 - 8) << 2))); GPIOB_AFRH |= (0xB << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((9 >= 0) && (9 < 8)) { do{GPIOB_AFRL &= (~(0xF << (9 << 2))); GPIOB_AFRL |= (0xB << (9 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((9 - 8) << 2))); GPIOB_AFRH |= (0xB << ((9 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((10 >= 0) && (10 < 8)) { do{GPIOB_AFRL &= (~(0xF << (10 << 2))); GPIOB_AFRL |= (0xB << (10 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((10 - 8) << 2))); GPIOB_AFRH |= (0xB << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)) { do{GPIOB_AFRL &= (~(0xF << (11 << 2))); GPIOB_AFRL |= (0xB << (11 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((11 - 8) << 2))); GPIOB_AFRH |= (0xB << ((11 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((12 >= 0) && (12 < 8)) { do{GPIOB_AFRL &= (~(0xF << (12 << 2))); GPIOB_AFRL |= (0xB << (12 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((12 - 8) << 2))); GPIOB_AFRH |= (0xB << ((12 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)) { do{GPIOB_AFRL &= (~(0xF << (13 << 2))); GPIOB_AFRL |= (0xB << (13 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((13 - 8) << 2))); GPIOB_AFRH |= (0xB << ((13 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((14 >= 0) && (14 < 8)) { do{GPIOB_AFRL &= (~(0xF << (14 << 2))); GPIOB_AFRL |= (0xB << (14 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((14 - 8) << 2))); GPIOB_AFRH |= (0xB << ((14 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)) { do{GPIOB_AFRL &= (~(0xF << (15 << 2))); GPIOB_AFRL |= (0xB << (15 << 2));}while(0) ;} else { do{GPIOB_AFRH &= (~(0xF << ((15 - 8) << 2))); GPIOB_AFRH |= (0xB << ((15 - 8) << 2));}while(0) ;}}while(0) ;

  RCC_AHBENRbits.GPIOCEN = 0x1 ;
  do{ do{GPIOC_MODER &= (~(0x3 << (0 << 1))); GPIOC_MODER |= (0x2 << (0 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 0)); GPIOC_OTYPER |= (0x1 << 0);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (0 << 1))); GPIOC_OSPEEDR |= (0x3 << (0 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (0 << 1))); GPIOC_PUPDR |= (0x0 << (0 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (1 << 1))); GPIOC_MODER |= (0x2 << (1 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 1)); GPIOC_OTYPER |= (0x1 << 1);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (1 << 1))); GPIOC_OSPEEDR |= (0x3 << (1 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (1 << 1))); GPIOC_PUPDR |= (0x0 << (1 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (2 << 1))); GPIOC_MODER |= (0x2 << (2 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 2)); GPIOC_OTYPER |= (0x1 << 2);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (2 << 1))); GPIOC_OSPEEDR |= (0x3 << (2 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (2 << 1))); GPIOC_PUPDR |= (0x0 << (2 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (3 << 1))); GPIOC_MODER |= (0x2 << (3 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 3)); GPIOC_OTYPER |= (0x1 << 3);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (3 << 1))); GPIOC_OSPEEDR |= (0x3 << (3 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (3 << 1))); GPIOC_PUPDR |= (0x0 << (3 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (6 << 1))); GPIOC_MODER |= (0x2 << (6 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 6)); GPIOC_OTYPER |= (0x1 << 6);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (6 << 1))); GPIOC_OSPEEDR |= (0x3 << (6 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (6 << 1))); GPIOC_PUPDR |= (0x0 << (6 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (7 << 1))); GPIOC_MODER |= (0x2 << (7 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 7)); GPIOC_OTYPER |= (0x1 << 7);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (7 << 1))); GPIOC_OSPEEDR |= (0x3 << (7 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (7 << 1))); GPIOC_PUPDR |= (0x0 << (7 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (8 << 1))); GPIOC_MODER |= (0x2 << (8 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 8)); GPIOC_OTYPER |= (0x1 << 8);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (8 << 1))); GPIOC_OSPEEDR |= (0x3 << (8 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (8 << 1))); GPIOC_PUPDR |= (0x0 << (8 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (9 << 1))); GPIOC_MODER |= (0x2 << (9 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 9)); GPIOC_OTYPER |= (0x1 << 9);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (9 << 1))); GPIOC_OSPEEDR |= (0x3 << (9 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (9 << 1))); GPIOC_PUPDR |= (0x0 << (9 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (10 << 1))); GPIOC_MODER |= (0x2 << (10 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 10)); GPIOC_OTYPER |= (0x1 << 10);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (10 << 1))); GPIOC_OSPEEDR |= (0x3 << (10 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (10 << 1))); GPIOC_PUPDR |= (0x0 << (10 << 1));}while(0) ;}while(0) ;
  do{ do{GPIOC_MODER &= (~(0x3 << (11 << 1))); GPIOC_MODER |= (0x2 << (11 << 1));}while(0) ; do{GPIOC_OTYPER &= (~(0x1 << 11)); GPIOC_OTYPER |= (0x1 << 11);}while(0) ; do{GPIOC_OSPEEDR &= (~(0x3 << (11 << 1))); GPIOC_OSPEEDR |= (0x3 << (11 << 1));}while(0) ; do{GPIOC_PUPDR &= (~(0x3 << (11 << 1))); GPIOC_PUPDR |= (0x0 << (11 << 1));}while(0) ;}while(0) ;

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
