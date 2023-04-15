#include "ILI9341.h"


void TFT_init()
{
	MAX_X = X_max;
	MAX_Y = Y_max;

	TFT_reset();

    TFT_write(ILI9341_RESET, CMD);
    HAL_Delay(60);

    TFT_write(ILI9341_POWERA, CMD);
    TFT_write(0x39, DAT);
    TFT_write(0x2C, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x34, DAT);
    TFT_write(0x02, DAT);
    
    TFT_write(ILI9341_POWERB, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0xC1, DAT);
    TFT_write(0x30, DAT);

    TFT_write(ILI9341_DTCA, CMD);
    TFT_write(0x85, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x78, DAT);

    TFT_write(ILI9341_DTCB, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);

    TFT_write(ILI9341_POWER_SEQ, CMD);
    TFT_write(0x64, DAT);
    TFT_write(0x03, DAT);
    TFT_write(0x12, DAT);
    TFT_write(0x81, DAT);

    TFT_write(ILI9341_PRC, CMD);
    TFT_write(0x20, DAT);

    TFT_write(ILI9341_POWER1, CMD);
    TFT_write(0x23, DAT);

    TFT_write(ILI9341_POWER2, CMD);
    TFT_write(0x10, DAT);

    TFT_write(ILI9341_VCOM1, CMD);
    TFT_write(0x3E, DAT);
    TFT_write(0x28, DAT);

    TFT_write(ILI9341_VCOM2, CMD);
    TFT_write(0x86, DAT);

    TFT_write(ILI9341_MAC, CMD);
    TFT_write(0x48, DAT);

    TFT_write(ILI9341_PIXEL_FORMAT, CMD);
    TFT_write(0x55, DAT);

    TFT_write(ILI9341_FRC, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x18, DAT);

    TFT_write(ILI9341_DFC, CMD);
    TFT_write(0x08, DAT);
    TFT_write(0x82, DAT);
    TFT_write(0x27, DAT);

    TFT_write(ILI9341_3GAMMA_EN, CMD);
    TFT_write(0x00, DAT);

    TFT_write(ILI9341_COLUMN_ADDR, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0xEF, DAT);

    TFT_write(ILI9341_PAGE_ADDR, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x3F, DAT);

    TFT_write(ILI9341_GAMMA, CMD);
    TFT_write(0x01, DAT);

    TFT_write(ILI9341_PGAMMA, CMD);
    TFT_write(0x0F, DAT);
    TFT_write(0x31, DAT);
    TFT_write(0x2B, DAT);
    TFT_write(0x0C, DAT);
    TFT_write(0x0E, DAT);
    TFT_write(0x08, DAT);
    TFT_write(0x4E, DAT);
    TFT_write(0xF1, DAT);
    TFT_write(0x37, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x10, DAT);
    TFT_write(0x03, DAT);
    TFT_write(0x0E, DAT);
    TFT_write(0x09, DAT);
    TFT_write(0x00, DAT);

    TFT_write(ILI9341_NGAMMA, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x0E, DAT);
    TFT_write(0x14, DAT);
    TFT_write(0x03, DAT);
    TFT_write(0x11, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x31, DAT);
    TFT_write(0xC1, DAT);
    TFT_write(0x48, DAT);
    TFT_write(0x08, DAT);
    TFT_write(0x0F, DAT);
    TFT_write(0x0C, DAT);
    TFT_write(0x31, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x0F, DAT);

    TFT_write(ILI9341_SLEEP_OUT, CMD);
    HAL_Delay(100);

    TFT_on_off(ON);
    TFT_write(ILI9341_GRAM, CMD);
    
    TFT_set_rotation(LANDSCAPE_1);
}


void TFT_reset()
{
    HAL_GPIO_WritePin(TFT_RST_GPIO_Port, TFT_RST_Pin, RESET);
    HAL_Delay(20);
    HAL_GPIO_WritePin(TFT_RST_GPIO_Port, TFT_RST_Pin, SET);
}


void TFT_write(uint8_t value, uint8_t mode)
{
    uint8_t val[1];

    val[0] = value;

	HAL_GPIO_WritePin(TFT_DC_GPIO_Port, TFT_DC_Pin, mode);
    HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, RESET);
    HAL_SPI_Transmit(&hspi5, val, 1, 100);
    HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, SET);
}


void TFT_write_word(uint16_t value, uint8_t mode)
{
    uint8_t tmp[2];

    tmp[1] = (value & 0x00FF);
    tmp[0] = (value >> 0x08);

    HAL_GPIO_WritePin(TFT_DC_GPIO_Port, TFT_DC_Pin, mode);
    HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, RESET);
    
    HAL_SPI_Transmit(&hspi5, tmp, 2, 100);
    
    HAL_GPIO_WritePin(TFT_CS_GPIO_Port, TFT_CS_Pin, SET);
}


void TFT_on_off(uint8_t mode)
{
    switch(mode)
    {
        case ON:
        {
            TFT_write(ILI9341_DISPLAY_ON, CMD);
            break;
        }
        case OFF:
        {
            TFT_write(ILI9341_DISPLAY_OFF, CMD);
            break;
        }
    }
}


void TFT_set_rotation(uint8_t value)
{
    TFT_write(ILI9341_MAC, CMD);

    switch(value)
    {
        case PORTRAIT_1:
        {
            TFT_write(0x58, DAT);
            break;
        }
        case PORTRAIT_2:
        {
            TFT_write(0x88, DAT);
            break;
        }
        case LANDSCAPE_1:
        {
            TFT_write(0x28, DAT);
            break;
        }
        case LANDSCAPE_2:
        {
            TFT_write(0xE8, DAT);
            break;
        }
    }

    if((value == PORTRAIT_1) || (value == PORTRAIT_2))
    {
        MAX_X = X_max;
        MAX_Y = Y_max;
    }

    if((value == LANDSCAPE_1) || (value == LANDSCAPE_2))
    {
        MAX_X = Y_max;
        MAX_Y = X_max;
    }
}


void TFT_set_display_window(uint16_t x_pos1, uint16_t y_pos1, uint16_t x_pos2, uint16_t y_pos2)
{
    TFT_write(ILI9341_COLUMN_ADDR, CMD);
    TFT_write_word(x_pos1, DAT);
    TFT_write_word(x_pos2, DAT);

    TFT_write(ILI9341_PAGE_ADDR, CMD);
    TFT_write_word(y_pos1, DAT);
    TFT_write_word(y_pos2, DAT);
    
    TFT_write(ILI9341_GRAM, CMD);
}


void TFT_fill(uint16_t colour)
{
    unsigned long index = pixels;
    
    TFT_set_display_window(0, 0, (MAX_X - 1), (MAX_Y - 1));

    while(index)
    {
       TFT_write_word(colour, DAT);
       index--;
    };
}


void TFT_fill_area(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour)
{
    unsigned long index = 0x00000000;
    
    if(x1 > x2)
    {
        swap(&x1, &x2);
    }
    if(y1 > y2)
    {
        swap(&y1, &y2);
    }
    
    index = (x2 - x1);
    index *= (y2 - y1);

    TFT_set_display_window(x1, y1, (x2 - 1), (y2 - 1));

    while(index)
    {
       TFT_write_word(colour, DAT);
       index--;
    };
}


uint16_t TFT_BGR2RGB(uint16_t colour)
{
     uint16_t r = 0x0000;
     uint16_t g = 0x0000;
     uint16_t b = 0x0000;
     uint16_t rgb_colour = 0x0000;

     b = ((colour >> 0)  & 0x1F);
     g = ((colour >> 5)  & 0x3F);
     r = ((colour >> 11) & 0x1F);

     rgb_colour = ((b << 11) + (g << 5) + (r << 0));

     return rgb_colour;
}


uint16_t RGB565_converter(uint8_t r, uint8_t g, uint8_t b)
{
    return (((((uint16_t)r) >> 3) << 11) | ((((uint16_t)g) >> 2) << 5) | (((uint16_t)b) >> 3));
}


void swap(int16_t *a, int16_t *b)
{
    int16_t temp = 0x0000;

    temp = *b;
    *b = *a;
    *a = temp;
}


void Draw_Pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour)
{
    TFT_set_display_window(x_pos, y_pos, x_pos, y_pos);
    TFT_write_word(colour, DAT);
}


void Draw_Point(uint16_t x_pos, uint16_t y_pos, uint8_t pen_width, uint16_t colour)
{
    Draw_Circle(x_pos, y_pos, pen_width, YES, colour);
}


void Draw_Line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour)
{
    int16_t dx = 0x0000;
    int16_t dy = 0x0000;
    int16_t stepx = 0x0000;
    int16_t stepy = 0x0000;
    int16_t fraction = 0x0000;

    dy = (y2 - y1);
    dx = (x2 - x1);

    if(dy < 0)
    {
        dy = -dy;
        stepy = -1;
    }
    else
    {
        stepy = 1;
    }

    if(dx < 0)
    {
        dx = -dx;
        stepx = -1;
    }
    else
    {
        stepx = 1;
    }

    dx <<= 0x01;
    dy <<= 0x01;

    Draw_Pixel(x1, y1, colour);

    if(dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while(x1 != x2)
        {
            if(fraction >= 0)
            {
                y1 += stepy;
                fraction -= dx;
            }
            x1 += stepx;
            fraction += dy;

            Draw_Pixel(x1, y1, colour);
        }
    }
    else
    {
        fraction = (dx - (dy >> 1));

        while(y1 != y2)
        {
            if (fraction >= 0)
            {
                x1 += stepx;
                fraction -= dy;
            }
            y1 += stepy;
            fraction += dx;
            Draw_Pixel(x1, y1, colour);
        }
    }
}


void Draw_V_Line(int16_t x1, int16_t y1, int16_t y2, uint16_t colour)
{
    if(y1 > y2)
    {
       swap(&y1, &y2);
    }

    while(y2 > (y1 - 1))
    {
        Draw_Pixel(x1, y2, colour);
        y2--;
    }
}


void Draw_H_Line(int16_t x1, int16_t x2, int16_t y1, uint16_t colour)
{
    if(x1 > x2)
    {
       swap(&x1, &x2);
    }

    while(x2 > (x1 - 1))
    {
        Draw_Pixel(x2, y1, colour);
        x2--;
    }
}


void Draw_Triangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint8_t fill, uint16_t colour)
{
    int16_t a = 0;
    int16_t b = 0;
    int16_t sa = 0;
    int16_t sb = 0;
    int16_t yp = 0;
    int16_t last = 0;
    int16_t dx12 = 0;
    int16_t dx23 = 0;
    int16_t dx13 = 0;
    int16_t dy12 = 0;
    int16_t dy23 = 0;
    int16_t dy13 = 0;

    switch(fill)
    {
        case YES:
        {
            if(y1 > y2)
            {
                swap(&y1, &y2);
                swap(&x1, &x2);
            }
            if(y2 > y3)
            {
                swap(&y3, &y2);
                swap(&x3, &x2);
            }
            if(y1 > y2)
            {
                swap(&y1, &y2);
                swap(&x1, &x2);
            }

            if(y1 == y3)
            {
                a = b = x1;

                if(x2 < a)
                {
                    a = x2;
                }
                else if(x2 > b)
                {
                    b = x2;
                }
                if(x2 < a)
                {
                    a = x3;
                }
                else if(x3 > b)
                {
                    b = x3;
                }

                Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
                return;
            }

            dx12 = (x2 - x1);
            dy12 = (y2 - y1);
            dx13 = (x3 - x1);
            dy13 = (y3 - y1);
            dx23 = (x3 - x2);
            dy23 = (y3 - y2);
            sa = 0,
            sb = 0;

            if(y2 == y3)
            {
                last = y2;
            }
            else
            {
                last = (y2 - 1);
            }

            for(yp = y1; yp <= last; yp++)
            {
                a = (x1 + (sa / dy12));
                b = (x1 + (sb / dy13));
                sa += dx12;
                sb += dx13;
                if(a > b)
                {
                    swap(&a, &b);
                }
                Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
            }

            sa = (dx23 * (yp - y2));
            sb = (dx13 * (yp - y1));
            for(; yp <= y3; yp++)
            {
                a = (x2 + (sa / dy23));
                b = (x1 + (sb / dy13));
                sa += dx23;
                sb += dx13;

                if(a > b)
                {
                    swap(&a, &b);
                }
                Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
            }


            break;
        }
        default:
        {
            Draw_Line(x1, y1, x2, y2, colour);
            Draw_Line(x2, y2, x3, y3, colour);
            Draw_Line(x3, y3, x1, y1, colour);
            break;
        }
    }
}


void Draw_Rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t fill, uint8_t type, uint16_t colour, uint16_t back_colour)
{
     int16_t i = 0x0000;
     int16_t j = 0x0000;
     int16_t xmin = 0x0000;
     int16_t xmax = 0x0000;
     int16_t ymin = 0x0000;
     int16_t ymax = 0x0000;

     switch(fill)
     {
         case YES:
         {
             if(x1 < x2)
             {
                xmin = x1;
                xmax = x2;
             }
             else
             {
                xmin = x2;
                xmax = x1;
             }

             if(y1 < y2)
             {
                ymin = y1;
                ymax = y2;
             }
             else
             {
                ymin = y2;
                ymax = y1;
             }

             i = xmax;

             while(i > xmin)
             {
            	 j = ymax;

            	 while(j > ymin)
            	 {
            		 Draw_Pixel(i, j, colour);
            		 j--;
            	 }
            	 i--;
             }

             break;
         }
         default:
         {
             Draw_V_Line(x1, y1, y2, colour);
             Draw_V_Line(x2, y1, y2, colour);
             Draw_H_Line(x1, x2, y1, colour);
             Draw_H_Line(x1, x2, y2, colour);
             break;
         }
     }

     if(type != SQUARE)
     {
         Draw_Pixel(x1, y1, back_colour);
         Draw_Pixel(x1, y2, back_colour);
         Draw_Pixel(x2, y1, back_colour);
         Draw_Pixel(x2, y2, back_colour);
     }
}


void Draw_H_Bar(int16_t x1, int16_t x2, int16_t y1, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, uint8_t border)
{
    switch(border)
    {
        case YES:
        {
            Draw_Rectangle((x1 + 1), (y1 + 1), (x1 + bar_value), (y1 + bar_width - 1), YES, SQUARE, bar_colour, back_colour);
            Draw_Rectangle((x2 - 1), (y1 + 1), (x1 + bar_value + 1), (y1 + bar_width - 1), YES, SQUARE, back_colour, back_colour);
            Draw_Rectangle(x1, y1, x2, (y1 + bar_width), NO, SQUARE, border_colour, back_colour);
            break;
        }
        default:
        {
            Draw_Rectangle(x1, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, bar_colour, back_colour);
            Draw_Rectangle(x2, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, back_colour, back_colour);
            break;
        }
    }
}


void Draw_V_Bar(int16_t x1, int16_t y1, int16_t y2, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, uint8_t border)
{
    switch(border)
    {
        case YES:
        {
            Draw_Rectangle((x1 + 1), (y2 - 1), (x1 + bar_width - 1), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
            Draw_Rectangle((x1 + 1), (y2 - bar_value - 1), (x1 + bar_width - 1), (y1 + 1), YES, SQUARE, back_colour, back_colour);
            Draw_Rectangle(x1, y1, (x1 + bar_width), y2, NO, SQUARE, border_colour, back_colour);
            break;
        }
        default:
        {
            Draw_Rectangle(x1, y2, (x1 + bar_width), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
            Draw_Rectangle(x1, (y2 - bar_value), (x1 + bar_width), y1, YES, SQUARE, back_colour, back_colour);
            break;
        }
    }
}


void Draw_Circle(int16_t xc, int16_t yc, int16_t radius, uint8_t fill, uint16_t colour)
{
     int16_t a = 0x0000;
     int16_t b = 0x0000;
     int16_t p = 0x0000;

     b = radius;
     p = (1 - b);

     do
     {
          switch(fill)
          {
              case YES:
              {
                  Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
                  Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
                  Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
                  Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
                  break;
              }
              default:
              {
                  Draw_Pixel((xc + a), (yc + b), colour);
                  Draw_Pixel((xc + b), (yc + a), colour);
                  Draw_Pixel((xc - a), (yc + b), colour);
                  Draw_Pixel((xc - b), (yc + a), colour);
                  Draw_Pixel((xc + b), (yc - a), colour);
                  Draw_Pixel((xc + a), (yc - b), colour);
                  Draw_Pixel((xc - a), (yc - b), colour);
                  Draw_Pixel((xc - b), (yc - a), colour);
                  break;
              }
          }

          if(p < 0)
          {
              p += (0x03 + (0x02 * a++));
          }
          else
          {
              p += (0x05 + (0x02 * ((a++) - (b--))));
          }
    }while(a <= b);
}



void Draw_Font_Pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour, uint8_t pixel_size)
{
     uint8_t i = (pixel_size * pixel_size);

     TFT_set_display_window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));

     while(i > 0)
     {
         TFT_write_word(colour, DAT);
         i--;
     }
}


void print_char(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, char ch)
{
     uint8_t i = 0x00;
     uint8_t j = 0x00;
     uint8_t value = 0x00;

     if(font_size <= 0)
     {
         font_size = 1;
     }

     if(x_pos < font_size)
     {
         x_pos = font_size;
     }

     for(i = 0x00; i < 0x05; i++)
     {
         for(j = 0x00; j < 0x08; j++)
         {
             value = 0x0000;
             value = ((font[((uint8_t)ch) - 0x20][i]));

             if(((value >> j) & 0x01) != 0x00)
             {
                 Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
             }
             else
             {
                 Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
             }

             y_pos += font_size;
          }
          
          y_pos -= (font_size << 0x03);
          x_pos += font_size;
      }
}


void print_str(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += (font_size * 0x06);
     }while((*ch >= 0x20) && (*ch <= 0x7F));
     
     print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
}


void print_C(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, int16_t value)
{
     char ch[5] = {0x20, 0x20, 0x20, 0x20,'\r'};

     if(value < 0x00)
     {
        ch[0] = 0x2D;
        value = -value;
     }
     else
     {
        ch[0] = 0x20;
     }

     if((value > 99) && (value <= 999))
     {
         ch[1] = ((value / 100) + 0x30);
         ch[2] = (((value % 100) / 10) + 0x30);
         ch[3] = ((value % 10) + 0x30);
     }
     else if((value > 9) && (value <= 99))
     {
         ch[1] = (((value % 100) / 10) + 0x30);
         ch[2] = ((value % 10) + 0x30);
         ch[3] = 0x20;
     }
     else if((value >= 0) && (value <= 9))
     {
         ch[1] = ((value % 10) + 0x30);
         ch[2] = 0x20;
         ch[3] = 0x20;
     }

     print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_I(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, int16_t value)
{
    char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, '\r'};

    if(value < 0)
    {
        ch[0] = 0x2D;
        value = -value;
    }
    else
    {
        ch[0] = 0x20;
    }

    if(value > 9999)
    {
        ch[1] = ((value / 10000) + 0x30);
        ch[2] = (((value % 10000)/ 1000) + 0x30);
        ch[3] = (((value % 1000) / 100) + 0x30);
        ch[4] = (((value % 100) / 10) + 0x30);
        ch[5] = ((value % 10) + 0x30);
    }

    else if((value > 999) && (value <= 9999))
    {
        ch[1] = (((value % 10000)/ 1000) + 0x30);
        ch[2] = (((value % 1000) / 100) + 0x30);
        ch[3] = (((value % 100) / 10) + 0x30);
        ch[4] = ((value % 10) + 0x30);
        ch[5] = 0x20;
    }
    else if((value > 99) && (value <= 999))
    {
        ch[1] = (((value % 1000) / 100) + 0x30);
        ch[2] = (((value % 100) / 10) + 0x30);
        ch[3] = ((value % 10) + 0x30);
        ch[4] = 0x20;
        ch[5] = 0x20;
    }
    else if((value > 9) && (value <= 99))
    {
        ch[1] = (((value % 100) / 10) + 0x30);
        ch[2] = ((value % 10) + 0x30);
        ch[3] = 0x20;
        ch[4] = 0x20;
        ch[5] = 0x20;
    }
    else
    {
        ch[1] = ((value % 10) + 0x30);
        ch[2] = 0x20;
        ch[3] = 0x20;
        ch[4] = 0x20;
        ch[5] = 0x20;
    }

    print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_D(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, uint16_t value, uint8_t points)
{
    char ch[5] = {0x2E, 0x20, 0x20, 0x20, '\r'};

    ch[1] = ((value / 1000) + 0x30);

    if(points > 1)
    {
        ch[2] = (((value % 1000) / 100) + 0x30);

        if(points > 2)
        {
            ch[3] = (((value % 100) / 10) + 0x30);

            if(points > 3)
            {
                ch[4] = ((value % 10) + 0x30);
            }
        }
    }

    print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
}


void print_F(uint16_t x_pos, uint16_t y_pos, uint8_t font_size, uint16_t colour, uint16_t back_colour, float value, uint8_t points)
{
    signed long tmp = 0x0000;

    tmp = value;
    print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
    tmp = ((value - tmp) * 10000);

    if(tmp < 0)
    {
       tmp = -tmp;
    }

    if((value >= 10000) && (value < 100000))
    {
        print_D((x_pos + (font_size * 36)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 1000) && (value < 10000))
    {
        print_D((x_pos + (font_size * 30)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 100) && (value < 1000))
    {
        print_D((x_pos + (font_size * 24)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 10) && (value < 100))
    {
        print_D((x_pos + (font_size * 18)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if(value < 10)
    {
        print_D((x_pos + (font_size * 12)), y_pos, font_size, colour, back_colour, tmp, points);

        if(value < 0)
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
        }
        else
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
        }
    }
}


void Draw_BMP(int16_t x_pos1, int16_t y_pos1, int16_t x_pos2, int16_t y_pos2, char *bitmap)
{
     unsigned long size = 0x00000000;
     unsigned long index = 0x00000000;
     
     if(x_pos1 > x_pos2)
     {
         swap(&x_pos1, &x_pos2);
     }
     
     if(y_pos1 > y_pos2)
     {
         swap(&y_pos1, &y_pos2);
     }
     
     size = (y_pos2 - y_pos1);
     size *= (x_pos2 - x_pos1);
     size <<= 1;

     TFT_set_display_window(x_pos1, y_pos1, (x_pos2 - 1), (y_pos2 - 1));

     for(index = 0; index < size; index++)
     {
         TFT_write(*bitmap++, DAT);
     }
}
