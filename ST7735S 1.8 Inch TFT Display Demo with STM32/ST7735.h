#include "GPIO.h"
#include "font.c"


#define CS_pin                                                                           0
#define RST_pin                                                                          1
#define RS_pin                                                                           2
#define SDA_pin                                                                          10
#define SCK_pin                                                                          12

#define ST7735_NOP                                                                       0x00
#define ST7735_SWRESET                                                                   0x01
#define ST7735_RDDID                                                                     0x04
#define ST7735_RDDST                                                                     0x09
#define ST7735_RDDPM                                                                     0x0A
#define ST7735_RDD_MADCTL                                                                0x0B
#define STT7735_RDD_COLMOD                                                               0x0C
#define ST7735_RDDIM                                                                     0x0D
#define ST7735_RDDSM                                                                     0x0E

#define ST7735_SLPIN                                                                     0x10
#define ST7735_SLPOUT                                                                    0x11
#define ST7735_PTLON                                                                     0x12
#define ST7735_NORON                                                                     0x13

#define ST7735_INVOFF                                                                    0x20
#define ST7735_INVON                                                                     0x21
#define ST7735_GAMSET                                                                    0x26
#define ST7735_DISPOFF                                                                   0x28
#define ST7735_DISPON                                                                    0x29
#define ST7735_CASET                                                                     0x2A
#define ST7735_RASET                                                                     0x2B
#define ST7735_RAMWR                                                                     0x2C
#define ST7735_RAMRD                                                                     0x2E

#define ST7735_PTLAR                                                                     0x30
#define ST7735_TEOFF                                                                     0x34
#define ST7735_TEON                                                                      0x35
#define ST7735_MADCTL                                                                    0x36
#define ST7735_IDMOFF                                                                    0x38
#define ST7735_IDMON                                                                     0x39
#define ST7735_COLMOD                                                                    0x3A

#define ST7735_RDID1                                                                     0xDA
#define ST7735_RDID2                                                                     0xDB
#define ST7735_RDID3                                                                     0xDC
#define ST7735_RDID4                                                                     0xDD

#define ST7735_FRMCTR1                                                                   0xB1
#define ST7735_FRMCTR2                                                                   0xB2
#define ST7735_FRMCTR3                                                                   0xB3
#define ST7735_INVCTR                                                                    0xB4
#define ST7735_DISSET5                                                                   0xB6

#define ST7735_PWCTR1                                                                    0xC0
#define ST7735_PWCTR2                                                                    0xC1
#define ST7735_PWCTR3                                                                    0xC2
#define ST7735_PWCTR4                                                                    0xC3
#define ST7735_PWCTR5                                                                    0xC4
#define ST7735_VMCTR1                                                                    0xC5

#define ST7735_RDID1                                                                     0xDA
#define ST7735_RDID2                                                                     0xDB
#define ST7735_RDID3                                                                     0xDC
#define ST7735_RDID4                                                                     0xDD

#define ST7735_PWCTR6                                                                    0xFC

#define ST7735_GMCTRP1                                                                   0xE0
#define ST7735_GMCTRN1                                                                   0xE1

#define   BLACK                                                                          0x0000
#define   BLUE                                                                           0x001F
#define   RED                                                                            0xF800
#define   GREEN                                                                          0x07E0
#define   CYAN                                                                           0x07FF
#define   MAGENTA                                                                        0xF81F
#define   YELLOW                                                                         0xFFE0
#define   WHITE                                                                          0xFFFF

#define   MADCTL_MY                                                                      0x80
#define   MADCTL_MX                                                                      0x40
#define   MADCTL_MV                                                                      0x20
#define   MADCTL_ML                                                                      0x10
#define   MADCTL_RGB                                                                     0x08
#define   MADCTL_MH                                                                      0x04

#define ST7735_TFTWIDTH                                                                  128
#define ST7735_TFTLENGTH                                                                 160

#define CMD                                                                              0x0
#define DAT                                                                              0x1

#define SQUARE                                                                           0x00
#define ROUND                                                                            0x01

#define NO                                                                               0x00
#define YES                                                                              0x01


unsigned char w = ST7735_TFTWIDTH;
unsigned char l = ST7735_TFTLENGTH;


void Configure_GPIOs();
void ST7735_Write(unsigned char value, unsigned char mode);
void ST7735_Reset();
void ST7735_init();
void ST7735_Word_Write(unsigned int value);
void ST7735_Data_Write(unsigned char DataH, unsigned char DataL);
void ST7735_Data_Write_4k(unsigned char DataH, unsigned char DataM, unsigned char DataL);
void Set_Addr_Window(unsigned char xs, unsigned char ys, unsigned char xe, unsigned char ye);
void RAM_Address_Set();
void Invert_Display(unsigned char i);
unsigned int Swap_Colour(unsigned int colour);
unsigned int Color565(unsigned char r, unsigned char g, unsigned char b);
void Set_Rotation(unsigned char m);
void TFT_fill(unsigned int colour);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour);
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour);
void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour);
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour);
void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size);
void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch);
void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch);
void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points);
void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points);