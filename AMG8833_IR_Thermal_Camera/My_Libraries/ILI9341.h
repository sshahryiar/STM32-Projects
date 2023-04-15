#include "main.h"
#include "font.c"

#define White                                                                            0xFFFF
#define Black                                                                            0x0000
#define Grey                                                                             0xF7DE
#define Light_Grey                                                                       0xC618
#define Dark_Grey                                                                        0x8410
#define Purple                                                                           0xF81F
#define Grey_Blue                                                                        0x5458
#define Blue                                                                             0x001F
#define Dark_Blue                                                                        0x01CF
#define Light_Blue                                                                       0x051F
#define Red                                                                              0xF800
#define Green                                                                            0x07E0
#define Cyan                                                                             0x7FFF
#define Yellow                                                                           0xFFE0
#define Orange                                                                           0xFC08
#define Magenta                                                                          0xF81F

#define TRUE                                                                             1
#define FALSE                                                                            0

#define YES                                                                              1
#define NO                                                                               0

#define ON                                                                               1
#define OFF                                                                              0

#define HIGH                                                                             1
#define LOW                                                                              0

#define DAT                                                                              1
#define CMD                                                                              0

#define SQUARE                                                                           0
#define ROUND                                                                            1

#define ILI9341_NOP                                                                      0x00
#define ILI9341_RESET                                                                    0x01
#define ILI9341_READ_DISPLAY_IDENTIFICATION_INFORMATION                                  0x04
#define ILI9341_READ_DISPLAY_STATUS                                                      0x09
#define ILI9341_READ_DISPLAY_POWER_MODE                                                  0x0A
#define ILI9341_READ_DISPLAY_MADCTL                                                      0x0B
#define ILI9341_READ_DISPLAY_PIXEL_FORMAT                                                0x0C
#define ILI9341_READ_DISPLAY_IMAGE_FORMAT                                                0x0D
#define ILI9341_READ_DISPLAY_SIGNAL_MODE                                                 0x0E
#define ILI9341_READ_DISPLAY_SELF_DIAGNOSTIC_RESULT                                      0x0F
#define ILI9341_ENTER_SLEEP_MODE                                                         0x10
#define ILI9341_SLEEP_OUT                                                                0x11
#define ILI9341_PARTIAL_MODE_ON                                                          0x12
#define ILI9341_NORMAL_DISPLAY_MODE_ON                                                   0x13
#define ILI9341_DISPLAY_INVERSION_OFF                                                    0x20
#define ILI9341_DISPLAY_INVERSION_ON                                                     0x21
#define ILI9341_GAMMA                                                                    0x26
#define ILI9341_DISPLAY_OFF                                                              0x28
#define ILI9341_DISPLAY_ON                                                               0x29
#define ILI9341_COLUMN_ADDR                                                              0x2A
#define ILI9341_PAGE_ADDR                                                                0x2B
#define ILI9341_GRAM                                                                     0x2C
#define ILI9341_COLOR_SET                                                                0x2D
#define ILI9341_MEMORY_READ                                                              0x2E
#define ILI9341_PARTIAL_AREA                                                             0x30
#define ILI9341_VERTICAL_SCROLLING_DEFINITION                                            0x33
#define ILI9341_TEARING_EFFECT_LINE_OFF                                                  0x34
#define ILI9341_TEARING_EFFECT_LINE_ON                                                   0x35
#define ILI9341_MAC                                                                      0x36
#define ILI9341_VERTICAL_SCROLLING_START_ADDRESS                                         0x37
#define ILI9341_IDLE_MODE_OFF                                                            0x38
#define ILI9341_IDLE_MODE_ON                                                             0x39
#define ILI9341_PIXEL_FORMAT                                                             0x3A
#define ILI9341_WMC                                                                      0x3C
#define ILI9341_RMC                                                                      0x3E
#define ILI9341_SET_TEAR_SCANLINE                                                        0x44
#define ILI9341_WDB                                                                      0x51
#define ILI9341_READ_DISPLAY_BRIGHTNESS                                                  0x52
#define ILI9341_WCD                                                                      0x53
#define ILI9341_READ_CTRL_DISPLAY                                                        0x54
#define ILI9341_WCABC                                                                    0x55
#define ILI9341_RCABC                                                                    0x56
#define ILI9341_WCABCMB                                                                  0x5E
#define ILI9341_RCABCMB                                                                  0x5F
#define ILI9341_RGB_INTERFACE                                                            0xB0
#define ILI9341_FRC                                                                      0xB1
#define ILI9341_FRAME_CTRL_NM                                                            0xB2
#define ILI9341_FRAME_CTRL_IM                                                            0xB3
#define ILI9341_FRAME_CTRL_PM                                                            0xB4
#define ILI9341_BPC                                                                      0xB5
#define ILI9341_DFC                                                                      0xB6
#define ILI9341_ENTRY_MODE_SET                                                           0xB7
#define ILI9341_BACKLIGHT_CONTROL_1                                                      0xB8
#define ILI9341_BACKLIGHT_CONTROL_2                                                      0xB9
#define ILI9341_BACKLIGHT_CONTROL_3                                                      0xBA
#define ILI9341_BACKLIGHT_CONTROL_4                                                      0xBB
#define ILI9341_BACKLIGHT_CONTROL_5                                                      0xBC
#define ILI9341_BACKLIGHT_CONTROL_6                                                      0xBD
#define ILI9341_BACKLIGHT_CONTROL_7                                                      0xBE
#define ILI9341_BACKLIGHT_CONTROL_8                                                      0xBF
#define ILI9341_POWER1                                                                   0xC0
#define ILI9341_POWER2                                                                   0xC1
#define ILI9341_VCOM1                                                                    0xC5
#define ILI9341_VCOM2                                                                    0xC7
#define ILI9341_POWERA                                                                   0xCB
#define ILI9341_POWERB                                                                   0xCF
#define ILI9341_READ_ID1                                                                 0xDA
#define ILI9341_READ_ID2                                                                 0xDB
#define ILI9341_READ_ID3                                                                 0xDC
#define ILI9341_PGAMMA                                                                   0xE0
#define ILI9341_NGAMMA                                                                   0xE1
#define ILI9341_DTCA                                                                     0xE8
#define ILI9341_DTCB                                                                     0xEA
#define ILI9341_POWER_SEQ                                                                0xED
#define ILI9341_3GAMMA_EN                                                                0xF2
#define ILI9341_INTERFACE                                                                0xF6
#define ILI9341_PRC                                                                      0xF7

#define PORTRAIT_1                                                                       1
#define PORTRAIT_2                                                                       2
#define LANDSCAPE_1                                                                      3
#define LANDSCAPE_2                                                                      4

#define X_max                                                                            240
#define Y_max                                                                            320

#define pixels                                                                           (X_max * Y_max)


SPI_HandleTypeDef hspi5;

uint16_t MAX_X;
uint16_t MAX_Y;


void TFT_init();
void TFT_reset();
void TFT_write(uint8_t value, uint8_t mode);
void TFT_write_word(uint16_t value, uint8_t mode);
void TFT_on_off(uint8_t mode);
void TFT_set_rotation(uint8_t value);
void TFT_set_display_window(uint16_t x_pos1, uint16_t y_pos1, uint16_t x_pos2, uint16_t y_pos2);
void TFT_fill(uint16_t colour);
void TFT_fill_area(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour);
uint16_t TFT_BGR2RGB(uint16_t colour);
uint16_t RGB565_converter(uint8_t r, uint8_t g, uint8_t b);
void swap(int16_t *a, int16_t *b);
void Draw_Pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour);
void Draw_Point(uint16_t x_pos, uint16_t y_pos, uint8_t pen_width, uint16_t colour);
void Draw_Line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour);
void Draw_V_Line(int16_t x1, int16_t y1, int16_t y2, uint16_t colour);
void Draw_H_Line(int16_t x1, int16_t x2, int16_t y1, uint16_t colour);
void Draw_Triangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint8_t fill, uint16_t colour);
void Draw_Rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t fill, uint8_t type, uint16_t colour, uint16_t back_colour);
void Draw_H_Bar(int16_t x1, int16_t x2, int16_t y1, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, uint8_t border);
void Draw_V_Bar(int16_t x1, int16_t y1, int16_t y2, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, uint8_t border);
void Draw_Circle(int16_t xc, int16_t yc, int16_t radius, uint8_t fill, uint16_t colour);
void Draw_Font_Pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour, uint8_t pixel_size);
void print_char(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, char ch);
void print_str(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, char *ch);
void print_C(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, int16_t value);
void print_I(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, int16_t value);
void print_D(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, uint16_t value, uint8_t points);
void print_F(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, float value, uint8_t points);
void Draw_BMP(int16_t x_pos1, int16_t y_pos1, int16_t x_pos2, int16_t y_pos2, char *bitmap);
