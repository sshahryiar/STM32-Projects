#include "main.h"
#include "font.c"
#include <stdio.h>


#define TFT_data_port		GPIOB

#define TFT_RST_LOW			(TFT_RST_GPIO_Port->BRR = TFT_RST_Pin)
#define TFT_RST_HIGH		(TFT_RST_GPIO_Port->BSRR = TFT_RST_Pin)

#define TFT_CS_LOW			(TFT_CS_GPIO_Port->BRR = TFT_CS_Pin)
#define TFT_CS_HIGH			(TFT_CS_GPIO_Port->BSRR = TFT_CS_Pin)

#define TFT_WR_LOW			(TFT_WR_GPIO_Port->BRR = TFT_WR_Pin)
#define TFT_WR_HIGH			(TFT_WR_GPIO_Port->BSRR = TFT_WR_Pin)

#define TFT_RS_LOW			(TFT_RS_GPIO_Port->BRR = TFT_RS_Pin)
#define TFT_RS_HIGH			(TFT_RS_GPIO_Port->BSRR = TFT_RS_Pin)

#define TFT_RD_LOW			(TFT_RD_GPIO_Port->BRR = TFT_RD_Pin)
#define TFT_RD_HIGH			(TFT_RD_GPIO_Port->BSRR = TFT_RD_Pin)

#define TFT_BL_LOW			(TFT_BL_GPIO_Port->BRR = TFT_BL_Pin)
#define TFT_BL_HIGH			(TFT_BL_GPIO_Port->BSRR = TFT_BL_Pin)

#define high				SET
#define low					RESET

#define WHITE          		0xFFFF
#define BLACK          		0x0000
#define GREY           		0xF7DE
#define BLUE           		0x001F
#define RED            		0xF800
#define MAGENTA        		0xF81F
#define GREEN          		0x07E0
#define CYAN           		0x7FFF
#define YELLOW         		0xFFE0

#define DAT					SET
#define CMD					RESET
#define REG					RESET

#define SQUARE				RESET
#define ROUND				SET

#define NO					RESET
#define YES					SET

#define ON					SET
#define OFF					RESET

//#define DISP_ORIENTATION	0
#define DISP_ORIENTATION	90
//#define DISP_ORIENTATION	180
//#define DISP_ORIENTATION	270


#if (DISP_ORIENTATION == 90) || (DISP_ORIENTATION == 270)

#define  MAX_X				320
#define  MAX_Y				240

#elif (DISP_ORIENTATION == 0) || (DISP_ORIENTATION == 180)

#define  MAX_X				240
#define  MAX_Y				320

#endif

#define delay_ms			HAL_Delay


void TFT_init(void);
void TFT_reset_sequence(void);
void TFT_backlight_state(unsigned char value);
void TFT_write(uint16_t value, unsigned char mode);
uint16_t TFT_read(uint16_t value, unsigned char mode);
void TFT_write_reg(uint16_t reg_val, uint16_t data_val);
void TFT_write_RAM_prepare();
void TFT_fill(uint16_t colour);
uint16_t TFT_BGR2RGB(uint16_t colour);
uint16_t RGB565_converter(unsigned char r, unsigned char g, unsigned char b);
void swap(int16_t *a, int16_t *b);
void TFT_set_cursor(uint16_t x_pos, uint16_t y_pos);
void TFT_set_display_window(uint16_t x_pos, uint16_t y_pos, uint16_t w, uint16_t h);
uint16_t TFT_get_Pixel(uint16_t x_pos, uint16_t y_pos);
void TFT_draw_pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour);
void TFT_draw_line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour);
void TFT_draw_V_line(int16_t x1, int16_t y1, int16_t y2, uint16_t colour);
void TFT_draw_H_line(int16_t x1, int16_t x2, int16_t y1, uint16_t colour);
void TFT_draw_triangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, unsigned char fill, uint16_t colour);
void TFT_draw_rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, unsigned char fill, unsigned char type, uint16_t colour, uint16_t back_colour);
void TFT_draw_H_bar(int16_t x1, int16_t x2, int16_t y1, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, unsigned char border);
void TFT_draw_V_bar(int16_t x1, int16_t y1, int16_t y2, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, unsigned char border);
void TFT_draw_circle(int16_t xc, int16_t yc, int16_t radius, unsigned char fill, uint16_t colour);
void TFT_draw_font_pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour, unsigned char pixel_size);
void TFT_print_char(uint16_t x_pos, uint16_t y_pos, unsigned char font_size, uint16_t colour, uint16_t back_colour, char ch);
void TFT_print_str(uint16_t x_pos, uint16_t y_pos, unsigned char font_size, uint16_t colour, uint16_t back_colour, char *ch);
void TFT_draw_BMP(uint16_t x_pos, uint16_t y_pos, uint16_t W, uint16_t H, unsigned char *bitmap);
