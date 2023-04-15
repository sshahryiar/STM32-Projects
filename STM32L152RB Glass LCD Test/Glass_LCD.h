/*                Definitons for the Glass LCD on STM32L Discovery Board                */


#include "Glass_LCD_def.h"


//Miscellaneous

#define enable                                                                           0x1
#define disable                                                                          0x0

#define true                                                                             0x1
#define false                                                                            0x0

#define high                                                                             0x1
#define low                                                                              0x0


/* Define for scrolling sentences*/
#define SCROLL_SPEED                                                                     200
#define SCROLL_SPEED_L                                                                   400
#define SCROLL_NUM                                                                       1

/* Define for character '.' */
#define  POINT_OFF                                                                       false
#define  POINT_ON                                                                        true

/* Define for caracter ":" */
#define  COLUMN_OFF                                                                      false
#define  COLUMN_ON                                                                       true

#define DOT                                                                              0x8000 /* for add decimal point in string */
#define DOUBLE_DOT                                                                       0x4000 /* for add decimal point in string */


/*  =========================================================================
                                 LCD MAPPING
    =========================================================================
            A
     _  ----------
COL |_| |\   |J  /|
       F| H  |  K |B
     _  |  \ | /  |
COL |_| --G-- --M--
        |   /| \  |
       E|  Q |  N |C
     _  | /  |P  \|
DP  |_| -----------
            D

 An LCD character coding is based on the following matrix:
      { E , D , P , N   }
      { M , C , COL , DP}
      { B , A , K , J   }
      { G , F , Q , H   }

 The character 'A' for example is:
  -------------------------------
LSB   { 1 , 0 , 0 , 0   }
      { 1 , 1 , 0 , 0   }
      { 1 , 1 , 0 , 0   }
MSB   { 1 , 1 , 0 , 0   }
      -------------------
  'A' =  F    E   0   0 hexa

*/
/* Macros used for set/reset bar LCD bar */
#define BAR0_ON                                                                          t_bar[0x1] |= 0x8
#define BAR0_OFF                                                                         t_bar[0x1] &= ~0x8
#define BAR1_ON                                                                          t_bar[0x0] |= 0x8
#define BAR1_OFF                                                                         t_bar[0x0] &= ~0x8
#define BAR2_ON                                                                          t_bar[0x1] |= 0x2
#define BAR2_OFF                                                                         t_bar[0x1] &= ~0x2
#define BAR3_ON                                                                          t_bar[0x0] |= 0x2
#define BAR3_OFF                                                                         t_bar[0x0] &= ~0x2

/* code for 'µ' character */
#define C_UMAP                                                                           0x6084

/* code for 'm' character */
#define C_mMap                                                                           0xB210

/* code for 'n' character */
#define C_nMap                                                                           0x2210

/* constant code for '*' character */
#define star                                                                             0xA0DD

/* constant code for '-' character */
#define C_minus                                                                          0xA000

/* constant code for '/' */
#define C_slatch                                                                         0x00C0

/* constant code for ° */
#define C_percent_1                                                                      0xEC00

/* constant code for small o */
#define C_percent_2                                                                      0xB300

/*constant for [ */
#define bracket_open                                                                     0x1D00

/*constant for ] */
#define bracket_close                                                                    0x4700

#define C_full                                                                           0xFFDD


const unsigned int CapLetterMap[26] =
{
    /* A       B       C       D       E       F       G       H       I  */
    0xFE00, 0x6714, 0x1D00, 0x4714, 0x9D00, 0x9C00, 0x3F00, 0xFA00, 0x0014,
    /* J       K       L       M       N       O       P       Q       R  */
    0x5300, 0x9841, 0x1900, 0x5A48, 0x5A09, 0x5F00, 0xFC00, 0x5F01, 0xFC01,
    /* S       T       U       V       W       X       Y       Z  */
    0xAF00, 0x0414, 0x5B00, 0x18C0, 0x5A81, 0x00C9, 0x0058, 0x05C0
};


const unsigned int SmallLetterMap[26] =
{
    /* a       b       c       d       e       f       g       h       i  */
    0x9118, 0x9901, 0xB100, 0x6380, 0x9180, 0x9C00, 0x6340, 0x9810, 0x0510,
    /* j       k       l       m       n       o       p       q       r  */
    0x0700, 0x0055, 0x0114, 0xB210, 0x9010, 0xB300, 0x9808, 0x6240, 0x9000,
    /* s       t       u       v       w       x       y       z  */
    0x2101, 0x9900, 0x1300, 0x0201, 0x1281, 0xA081, 0x0301, 0x8180
};

/* Constant table for number '0' --> '9' */
const unsigned int NumberMap[10] =
{
    /* 0       1       2       3       4       5       6       7       8       9  */
    0x5F00, 0x4200, 0xF500, 0x6700, 0xEA00, 0xAF00, 0xBF00, 0x04600, 0xFF00, 0xEF00
};

/* LCD BAR status: We don't write directly in LCD RAM for save the bar setting */
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