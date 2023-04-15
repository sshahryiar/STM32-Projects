#include "main.h"


SPI_HandleTypeDef hspi1;


#define MOSI_port                               ST7735_MOSI_GPIO_Port
#define CLK_port                                ST7735_CLK_GPIO_Port
#define RST_port                                ST7735_RST_GPIO_Port
#define RS_port                                 ST7735_RS_GPIO_Port
#define CS_port                                 ST7735_CS_GPIO_Port

#define MOSI_pin                                ST7735_MOSI_Pin
#define CLK_pin                                 ST7735_CLK_Pin
#define RST_pin                                 ST7735_RST_Pin
#define RS_pin                                  ST7735_RS_Pin
#define CS_pin                                  ST7735_CS_Pin



#define MOSI_pin_high()                         HAL_GPIO_WritePin(ST7735_MOSI_GPIO_Port, ST7735_MOSI_Pin, GPIO_PIN_SET)
#define MOSI_pin_low()                          HAL_GPIO_WritePin(ST7735_MOSI_GPIO_Port, ST7735_MOSI_Pin, GPIO_PIN_RESET)

#define CLK_pin_high()                          HAL_GPIO_WritePin(ST7735_CLK_GPIO_Port, ST7735_CLK_Pin, GPIO_PIN_SET)
#define CLK_pin_low()                           HAL_GPIO_WritePin(ST7735_CLK_GPIO_Port, ST7735_CLK_Pin, GPIO_PIN_RESET)

#define RST_pin_high()                          HAL_GPIO_WritePin(ST7735_RST_GPIO_Port, ST7735_RST_Pin, GPIO_PIN_SET)
#define RST_pin_low()                           HAL_GPIO_WritePin(ST7735_RST_GPIO_Port, ST7735_RST_Pin, GPIO_PIN_RESET)

#define RS_pin_high()                           HAL_GPIO_WritePin(ST7735_RS_GPIO_Port, ST7735_RS_Pin, GPIO_PIN_SET)
#define RS_pin_low()                            HAL_GPIO_WritePin(ST7735_RS_GPIO_Port, ST7735_RS_Pin, GPIO_PIN_RESET)

#define CS_pin_high()                           HAL_GPIO_WritePin(CS_port, CS_pin, GPIO_PIN_SET)
#define CS_pin_low()                            HAL_GPIO_WritePin(CS_port, CS_pin, GPIO_PIN_RESET)


#define ST7735_NOP                              0x00
#define ST7735_SWRESET                          0x01
#define ST7735_RDDID                            0x04
#define ST7735_RDDST                            0x09
#define ST7735_RDDPM                            0x0A
#define ST7735_RDD_MADCTL                       0x0B
#define STT7735_RDD_COLMOD                      0x0C
#define ST7735_RDDIM                            0x0D
#define ST7735_RDDSM                            0x0E

#define ST7735_SLPIN                            0x10
#define ST7735_SLPOUT                           0x11
#define ST7735_PTLON                            0x12
#define ST7735_NORON                            0x13

#define ST7735_INVOFF                           0x20
#define ST7735_INVON                            0x21
#define ST7735_GAMSET                           0x26
#define ST7735_DISPOFF                          0x28
#define ST7735_DISPON                           0x29
#define ST7735_CASET                            0x2A
#define ST7735_RASET                            0x2B
#define ST7735_RAMWR                            0x2C
#define ST7735_RAMRD                            0x2E

#define ST7735_PTLAR                            0x30
#define ST7735_TEOFF                            0x34
#define ST7735_TEON                             0x35
#define ST7735_MADCTL                           0x36
#define ST7735_IDMOFF                           0x38
#define ST7735_IDMON                            0x39
#define ST7735_COLMOD                           0x3A

#define ST7735_RDID1                            0xDA
#define ST7735_RDID2                            0xDB
#define ST7735_RDID3                            0xDC
#define ST7735_RDID4                            0xDD

#define ST7735_FRMCTR1                          0xB1
#define ST7735_FRMCTR2                          0xB2
#define ST7735_FRMCTR3                          0xB3
#define ST7735_INVCTR                           0xB4
#define ST7735_DISSET5                          0xB6

#define ST7735_PWCTR1                           0xC0
#define ST7735_PWCTR2                           0xC1
#define ST7735_PWCTR3                           0xC2
#define ST7735_PWCTR4                           0xC3
#define ST7735_PWCTR5                           0xC4
#define ST7735_VMCTR1                           0xC5

#define ST7735_RDID1                            0xDA
#define ST7735_RDID2                            0xDB
#define ST7735_RDID3                            0xDC
#define ST7735_RDID4                            0xDD

#define ST7735_PWCTR6                           0xFC

#define ST7735_GMCTRP1                          0xE0
#define ST7735_GMCTRN1                          0xE1

#define BLACK                                   0x0000
#define BLUE                                    0xF800
#define RED                                     0x001F
#define GREEN                                   0x07E0
#define CYAN                                    0xFFE0
#define MAGENTA                                 0xF81F
#define YELLOW                                  0x07FF
#define WHITE                                   0xFFFF

#define MADCTL_MY                               0x80
#define MADCTL_MX                               0x40
#define MADCTL_MV                               0x20
#define MADCTL_ML                               0x10
#define MADCTL_RGB                              0x08
#define MADCTL_MH                               0x04

#define ST7735_TFTWIDTH                         160
#define ST7735_TFTLENGTH                        128

#define CMD                                     0
#define DAT                                     1

#define SQUARE                                  0
#define ROUND                                   1

#define NO                                      0
#define YES                                     1


void ST7735_init(void);
void ST7735_Write(unsigned char value, unsigned char mode);
void ST7735_Reset(void);
void ST7735_Word_Write(unsigned int value);
void ST7735_Data_Write(unsigned char DataH, unsigned char DataL);
void ST7735_Data_Write_4k(unsigned char DataH, unsigned char DataM, unsigned char DataL);
void ST7735_Set_Addr_Window(unsigned char xs, unsigned char ys, unsigned char xe, unsigned char ye);
void ST7735_RAM_Address_Set(void);
void ST7735_Invert_Display(unsigned char i);
unsigned int ST7735_Swap_Colour(unsigned int colour);
unsigned int ST7735_Color565(unsigned char r, unsigned char g, unsigned char b);
void ST7735_Set_Rotation(unsigned char m);
void TFT_fill(unsigned int colour);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour);
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour);
void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour);
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour);
void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size);
void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned char ch);
void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned char *ch);
void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points);
void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points);
