#include "font.c"
#include "GPIO.h"


#define CS_pin                                                                           10
#define SCK_pin                                                                          11
#define SDA_pin                                                                          12
#define RS_pin                                                                           13
#define RST_pin                                                                          14
#define BL_pin                                                                           15

#define SQUARE                                                                           0x00
#define ROUND                                                                            0x01

#define NO                                                                               0x00
#define YES                                                                              0x01

#define CMD                                                                              0x00
#define DAT                                                                              0x01

#define S6D02A1_TFT_WIDTH                                                                0x80
#define S6D02A1_TFT_LENGTH                                                               0xA0

#define S6D02A1_NOP                                                                      0x00
#define S6D02A1_SWRESET                                                                  0x01
#define S6D02A1_RDDIDIF                                                                  0x04
#define S6D02A1_RDDST                                                                    0x09
#define S6D02A1_RDDPM                                                                    0x0A
#define S6D02A1_RDDMADCTL                                                                0x0B
#define S6D02A1_RDDCOLMOD                                                                0x0C
#define S6D02A1_RDDIM                                                                    0x0D
#define S6D02A1_RDDSM                                                                    0x0E
#define S6D02A1_RDDSDR                                                                   0x0F

#define S6D02A1_SLPIN                                                                    0x10
#define S6D02A1_SLPOUT                                                                   0x11
#define S6D02A1_PTLON                                                                    0x12
#define S6D02A1_NORON                                                                    0x13

#define S6D02A1_INVOFF                                                                   0x20
#define S6D02A1_INVON                                                                    0x21
#define S6D02A1_GAMSET                                                                   0x26
#define S6D02A1_DISPOFF                                                                  0x28
#define S6D02A1_DISPON                                                                   0x29
#define S6D02A1_CASET                                                                    0x2A
#define S6D02A1_RASET                                                                    0x2B
#define S6D02A1_RAMWR                                                                    0x2C
#define S6D02A1_RGBSET                                                                   0x2D
#define S6D02A1_RAMRD                                                                    0x2E

#define S6D02A1_PLTAR                                                                    0x30
#define S6D02A1_VSCRDEF                                                                  0x33
#define S6D02A1_TEOFF                                                                    0x34
#define S6D02A1_TEON                                                                     0x35
#define S6D02A1_MADCTL                                                                   0x36
#define S6D02A1_VSCRSADD                                                                 0x37
#define S6D02A1_IDMOFF                                                                   0x38
#define S6D02A1_IDMON                                                                    0x39
#define S6D02A1_COLMOD                                                                   0x3A

#define S6D02A1_MTPCTL                                                                   0xD0
#define S6D02A1_MTPREG                                                                   0xD3
#define S6D02A1_RDID1                                                                    0xDA
#define S6D02A1_RDID2                                                                    0xDB
#define S6D02A1_RDID3                                                                    0xDC

#define S6D02A1_EXCOMMAND1                                                               0xF0
#define S6D02A1_EXCOMMAND2                                                               0xF1
#define S6D02A1_DISCTL                                                                   0xF2
#define S6D02A1_MAMPWRSEQ                                                                0xF3
#define S6D02A1_PWRCTL                                                                   0xF4
#define S6D02A1_VCMCTL                                                                   0xF5
#define S6D02A1_SRCCTL                                                                   0xF6
#define S6D02A1_IFCTL                                                                    0xF7
#define S6D02A1_PANELCTL                                                                 0xF8
#define S6D02A1_PGAMMACTL                                                                0xFA
#define S6D02A1_NGAMMACTL                                                                0xFB
#define S6D02A1_EXCOMMAND3                                                               0xFC
#define S6D02A1_ANALOGTST                                                                0xFD

#define MADCTL_MY                                                                        0x80
#define MADCTL_MX                                                                        0x40
#define MADCTL_MV                                                                        0x20
#define MADCTL_ML                                                                        0x10
#define MADCTL_RGB                                                                       0x00
#define MADCTL_BGR                                                                       0x08
#define MADCTL_MH                                                                        0x04

#define RED                                                                              0x6160
#define L_RED                                                                            0xAAAA
#define PINK                                                                             0x0000
#define SEA_GREEN                                                                        0xD7FE
#define YELLOW_GREEN                                                                     0x8A88
#define GREEN                                                                            0xA7F8
#define D_GREEN                                                                          0x5555
#define L_GREEN                                                                          0xE678
#define BLUE                                                                             0xF81F
#define D_BLUE                                                                           0x001F
#define L_BLUE                                                                           0xFDE8
#define WHITE                                                                            0x0320
#define YELLOW                                                                           0xE290
#define L_YELLOW                                                                         0x7DEF
#define ORANGE                                                                           0x9088
#define BROWN                                                                            0xF618
#define L_BROWN                                                                          0xE0FD
#define CYAN                                                                             0xFFFF
#define D_CYAN                                                                           0x07FF
#define L_CYAN                                                                           0x0EFF
#define VIOLET                                                                           0x0007
#define PURPLE                                                                           0xF800
#define GRAY                                                                             0xFBE0
#define L_GRAY                                                                           0xF9E0
#define D_GRAY                                                                           0x00F8


unsigned int w = S6D02A1_TFT_WIDTH;
unsigned int l = S6D02A1_TFT_LENGTH;


void TFT_init();
void TFT_reset();
void configure_GPIO_pins();
void TFT_write_word_data(unsigned int value);
void TFT_write(unsigned char value, unsigned char DC);
void TFT_set_rotation(unsigned char rot);
void TFT_set_addr_window(unsigned int xs, unsigned int ys, unsigned int xe, unsigned int ye);
void TFT_fill(unsigned int colour);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour);
void Draw_Line(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned int colour);
void Draw_Rectangle(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour);
void Draw_Circle(unsigned char xc, unsigned char yc, unsigned char radius, unsigned char fill, unsigned int colour);
void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size);
void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch);
void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch);
void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value);
void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points);
void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points);