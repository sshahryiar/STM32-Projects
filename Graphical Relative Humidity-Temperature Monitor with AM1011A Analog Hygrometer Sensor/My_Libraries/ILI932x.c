#include "ILI932x.h"


void TFT_init(void)
{
     static uint16_t device_code = 0x0000;

     __HAL_RCC_AFIO_CLK_ENABLE();
     __HAL_AFIO_REMAP_SWJ_NOJTAG();
     TFT_reset_sequence();

     TFT_write_reg(0x0000, 0x0001);
     delay_ms(50);

     device_code = TFT_read(0x0000, REG);


     if((device_code == 0x9325) || (device_code == 0x9328))
     {
          TFT_write_reg(0x00E5, 0x78F0);
          TFT_write_reg(0x0001, 0x0100);
          TFT_write_reg(0x0002, 0x0700);
          TFT_write_reg(0x0003, 0x1030);
          TFT_write_reg(0x0004, 0x0000);
          TFT_write_reg(0x0008, 0x0202);
          TFT_write_reg(0x0009, 0x0000);
          TFT_write_reg(0x000A, 0x0000);
          TFT_write_reg(0x000C, 0x0000); //0x0001
          TFT_write_reg(0x000D, 0x0000);
          TFT_write_reg(0x000F, 0x0000);
          
          TFT_write_reg(0x0010, 0x0000);
          TFT_write_reg(0x0011, 0x0007);
          TFT_write_reg(0x0012, 0x0000);
          TFT_write_reg(0x0013, 0x0000);
          TFT_write_reg(0x0007, 0x0001);
          delay_ms(50);
          
          TFT_write_reg(0x0010, 0x1090); //0x1690
          TFT_write_reg(0x0011, 0x0227);
          delay_ms(50);
          
          TFT_write_reg(0x0012, 0x001F); //0x009D
          delay_ms(50);
          
          TFT_write_reg(0x0013, 0x1500); //0x1900
          TFT_write_reg(0x0029, 0x0027); //0x0025
          TFT_write_reg(0x002B, 0x000D);
          delay_ms(50);
          
          TFT_write_reg(0x0020, 0x0000);
          TFT_write_reg(0x0021, 0x0000);
          delay_ms(50);
          
          TFT_write_reg(0x0030, 0x0000); //0x0007
          TFT_write_reg(0x0031, 0x0707); //0x0303
          TFT_write_reg(0x0032, 0x0307); //0x0003
          TFT_write_reg(0x0035, 0x0200); //0x0206
          TFT_write_reg(0x0036, 0x0008);
          TFT_write_reg(0x0037, 0x0004); //0x0406
          TFT_write_reg(0x0038, 0x0000); //0x0304
          TFT_write_reg(0x0039, 0x0707); //0x0007
          TFT_write_reg(0x003C, 0x0002); //0x0602
          TFT_write_reg(0x003D, 0x1D04); //0x0008
          delay_ms(50);
          
          TFT_write_reg(0x0050, 0x0000);
          TFT_write_reg(0x0051, 0x00EF);
          TFT_write_reg(0x0052, 0x0000);
          TFT_write_reg(0x0053, 0x013F);
          TFT_write_reg(0x0060, 0xA700);
          TFT_write_reg(0x0061, 0x0001);
          TFT_write_reg(0x006A, 0x0000);
          
          TFT_write_reg(0x0080, 0x0000);
          TFT_write_reg(0x0081, 0x0000);
          TFT_write_reg(0x0082, 0x0000);
          TFT_write_reg(0x0083, 0x0000);
          TFT_write_reg(0x0084, 0x0000);
          TFT_write_reg(0x0085, 0x0000);
          
          TFT_write_reg(0x0090, 0x0010);
          TFT_write_reg(0x0092, 0x0600);
          TFT_write_reg(0x0007, 0x0133);
     }

     if((device_code == 0x9320) || (device_code == 0x9300))
     {
          TFT_write_reg(0x0000, 0x0000);
          TFT_write_reg(0x0001, 0x0100);
          TFT_write_reg(0x0002, 0x0700);
          TFT_write_reg(0x0003, 0x1030);
          TFT_write_reg(0x0004, 0x0000);
          TFT_write_reg(0x0008, 0x0202);
          TFT_write_reg(0x0009, 0x0000);
          TFT_write_reg(0x000A, 0x0000);
          TFT_write_reg(0x000C, (1 << 0));
          TFT_write_reg(0x000D, 0x0000);
          TFT_write_reg(0x000F, 0x0000);
          delay_ms(10);
          TFT_write_reg(0x0007, 0x0101);
          delay_ms(10);
          TFT_write_reg(0x0010, ((1 << 12) | (0 << 8) | (1 << 7) | (1 << 6) | (0 << 4)));
          TFT_write_reg(0x0011, 0x0007);
          TFT_write_reg(0x0012, (1 << 8) | (1 << 4)| (0 << 0));
          TFT_write_reg(0x0013, 0x0B00);
          TFT_write_reg(0x0029, 0x0000);
          TFT_write_reg(0x002B, ((1 << 14) | (1 << 4)));
          TFT_write_reg(0x0050, 0x0000);
          TFT_write_reg(0x0051, 0x00EF);
          TFT_write_reg(0x0052, 0x0000);
          TFT_write_reg(0x0053, 0x013F);
          TFT_write_reg(0x0060, 0x2700);
          TFT_write_reg(0x0061, 0x0001);
          TFT_write_reg(0x006A, 0x0000);
          TFT_write_reg(0x0080, 0x0000);
          TFT_write_reg(0x0081, 0x0000);
          TFT_write_reg(0x0082, 0x0000);
          TFT_write_reg(0x0083, 0x0000);
          TFT_write_reg(0x0084, 0x0000);
          TFT_write_reg(0x0085, 0x0000);
          TFT_write_reg(0x0090, ((0 << 7) | (16 << 0)));
          TFT_write_reg(0x0092, 0x0000);
          TFT_write_reg(0x0093, 0x0001);
          TFT_write_reg(0x0095, 0x0110);
          TFT_write_reg(0x0097, (0 << 8));
          TFT_write_reg(0x0098, 0x0000);
          TFT_write_reg(0x0007, 0x0173);
     }

     delay_ms(100);
     TFT_fill(BLACK);
     TFT_backlight_state(ON);
}


void TFT_reset_sequence(void)
{
	TFT_RST_LOW;
    delay_ms(100);
    TFT_RST_HIGH;
    delay_ms(50);
}


void TFT_backlight_state(unsigned char value)
{
    switch(value)
    {
    	case ON:
    	{
    		TFT_BL_HIGH;
    		break;
    	}
    	default:
    	{
    		TFT_BL_LOW;
    		break;
    	}
    }
}


void TFT_write(uint16_t value, unsigned char mode)
{
	 TFT_CS_LOW;

	 switch(mode)
	 {
		case DAT:
		{
			TFT_RS_HIGH;
			break;
		}
		default:
		{
			TFT_RS_LOW;
			break;
		}
	 }

	 TFT_data_port->ODR = value;
	 TFT_WR_LOW;
	 TFT_WR_HIGH;
     TFT_CS_HIGH;
}


uint16_t TFT_read(uint16_t value, unsigned char mode)
{
    uint16_t retval = 0x0000;

    switch(mode)
    {
        case REG:
        {
            TFT_write(value, CMD);
            break;
        }
        case DAT:
        {
            break;
        }
    }

    TFT_data_port->CRH = 0x88888888;
    TFT_data_port->CRL = 0x88888888;

    TFT_CS_LOW;
    TFT_RS_HIGH;
    TFT_RD_LOW;

    retval = TFT_data_port->IDR;

    TFT_RD_HIGH;
    TFT_CS_HIGH;

    TFT_data_port->CRH = 0x33333333;
    TFT_data_port->CRL = 0x33333333;

    return retval;
}


void TFT_write_reg(uint16_t reg_val, uint16_t data_val)
{
    TFT_write(reg_val, CMD);
    TFT_write(data_val, DAT);
}


void TFT_write_RAM_prepare()
{
    TFT_write(0x0022, CMD);
}


void TFT_fill(uint16_t colour)
{
    uint64_t index = (MAX_X * MAX_Y);

    TFT_set_cursor(0, 0);
    TFT_write_RAM_prepare();

    while(index)
    {
       TFT_write(colour, DAT);
       index--;
    }
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


uint16_t RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
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


void TFT_set_cursor(uint16_t x_pos, uint16_t y_pos)
{
    uint16_t temp = 0x0000;
    
    #if (DISP_ORIENTATION == 0)

    #elif (DISP_ORIENTATION == 90)
    {
        temp = x_pos;
        x_pos = y_pos;
        y_pos = (MAX_X - temp - 1);
    }
    #elif (DISP_ORIENTATION == 180)
    {
        x_pos = (MAX_X - x_pos - 1);
        y_pos = (MAX_Y - y_pos - 1);
    }
    #elif (DISP_ORIENTATION == 270)
    {
        temp = y_pos;
        y_pos = x_pos;
        x_pos = (MAX_Y - temp - 1);
    }
    #endif

    TFT_write_reg(0x0020, x_pos);
    TFT_write_reg(0x0021, y_pos);
}


void TFT_set_display_window(uint16_t x_pos, uint16_t y_pos, uint16_t w, uint16_t h)
{
    TFT_write_reg(0x0050, x_pos);
    TFT_write_reg(0x0051, (w + x_pos));
    TFT_write_reg(0x0052, y_pos);
    TFT_write_reg(0x0053, (h + y_pos));
}


uint16_t TFT_get_pixel(uint16_t x_pos, uint16_t y_pos)
{
    uint16_t value = 0x0000;

    TFT_set_cursor(x_pos, y_pos);
    TFT_write_RAM_prepare();
    value = TFT_read(0x0000, DAT);
    value = TFT_read(0x0000, DAT);
    value = TFT_BGR2RGB(value);

    return value;
}


void TFT_draw_pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour)
{
    TFT_set_cursor(x_pos, y_pos);
    TFT_write_RAM_prepare();
    TFT_write(colour, DAT);
}


void TFT_draw_line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t colour)
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

    TFT_draw_pixel(x1, y1, colour);

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

            TFT_draw_pixel(x1, y1, colour);
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
            TFT_draw_pixel(x1, y1, colour);
        }
    }
}


void TFT_draw_V_line(int16_t x1, int16_t y1, int16_t y2, uint16_t colour)
{
    if(y1 > y2)
    {
       swap(&y1, &y2);
    }

    while(y2 > (y1 - 1))
    {
        TFT_draw_pixel(x1, y2, colour);
        y2--;
    }
}


void TFT_draw_H_line(int16_t x1, int16_t x2, int16_t y1, uint16_t colour)
{
    if(x1 > x2)
    {
       swap(&x1, &x2);
    }

    while(x2 > (x1 - 1))
    {
        TFT_draw_pixel(x2, y1, colour);
        x2--;
    }
}


void TFT_draw_triangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, unsigned char fill, uint16_t colour)
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

                TFT_draw_H_line(a, (a + (b - (a + 1))), y1, colour);
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
                TFT_draw_H_line(a, (a + (b - (a + 1))), yp, colour);
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
                TFT_draw_H_line(a, (a + (b - (a + 1))), yp, colour);
            }


            break;
        }
        default:
        {
            TFT_draw_line(x1, y1, x2, y2, colour);
            TFT_draw_line(x2, y2, x3, y3, colour);
            TFT_draw_line(x3, y3, x1, y1, colour);
            break;
        }
    }
}


void TFT_draw_rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, unsigned char fill, unsigned char type, uint16_t colour, uint16_t back_colour)
{
     int16_t i = 0x0000;
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

             for(; xmin <= xmax; ++xmin)
             {
                 for(i = ymin; i <= ymax; ++i)
                 {
                     TFT_draw_pixel(xmin, i, colour);
                 }
             }

             break;
         }
         default:
         {
             TFT_draw_V_line(x1, y1, y2, colour);
             TFT_draw_V_line(x2, y1, y2, colour);
             TFT_draw_H_line(x1, x2, y1, colour);
             TFT_draw_H_line(x1, x2, y2, colour);
             break;
         }
     }

     if(type != SQUARE)
     {
         TFT_draw_pixel(x1, y1, back_colour);
         TFT_draw_pixel(x1, y2, back_colour);
         TFT_draw_pixel(x2, y1, back_colour);
         TFT_draw_pixel(x2, y2, back_colour);
     }
}


void TFT_draw_H_bar(int16_t x1, int16_t x2, int16_t y1, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, unsigned char border)
{
    switch(border)
    {
        case YES:
        {
            TFT_draw_rectangle((x1 + 1), (y1 + 1), (x1 + bar_value), (y1 + bar_width - 1), YES, SQUARE, bar_colour, back_colour);
            TFT_draw_rectangle((x2 - 1), (y1 + 1), (x1 + bar_value + 1), (y1 + bar_width - 1), YES, SQUARE, back_colour, back_colour);
            TFT_draw_rectangle(x1, y1, x2, (y1 + bar_width), NO, SQUARE, border_colour, back_colour);
            break;
        }
        default:
        {
            TFT_draw_rectangle(x1, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, bar_colour, back_colour);
            TFT_draw_rectangle(x2, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, back_colour, back_colour);
            break;
        }
    }
}


void TFT_draw_V_bar(int16_t x1, int16_t y1, int16_t y2, int16_t bar_width, int16_t bar_value, uint16_t border_colour, uint16_t bar_colour, uint16_t back_colour, unsigned char border)
{
    switch(border)
    {
        case YES:
        {
            TFT_draw_rectangle((x1 + 1), (y2 - 1), (x1 + bar_width - 1), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
            TFT_draw_rectangle((x1 + 1), (y2 - bar_value - 1), (x1 + bar_width - 1), (y1 + 1), YES, SQUARE, back_colour, back_colour);
            TFT_draw_rectangle(x1, y1, (x1 + bar_width), y2, NO, SQUARE, border_colour, back_colour);
            break;
        }
        default:
        {
            TFT_draw_rectangle(x1, y2, (x1 + bar_width), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
            TFT_draw_rectangle(x1, (y2 - bar_value), (x1 + bar_width), y1, YES, SQUARE, back_colour, back_colour);
            break;
        }
    }
}


void TFT_draw_circle(int16_t xc, int16_t yc, int16_t radius, unsigned char fill, uint16_t colour)
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
            	  TFT_draw_line((xc - a), (yc + b), (xc + a), (yc + b), colour);
            	  TFT_draw_line((xc - a), (yc - b), (xc + a), (yc - b), colour);
            	  TFT_draw_line((xc - b), (yc + a), (xc + b), (yc + a), colour);
            	  TFT_draw_line((xc - b), (yc - a), (xc + b), (yc - a), colour);
                  break;
              }
              default:
              {
                  TFT_draw_pixel((xc + a), (yc + b), colour);
                  TFT_draw_pixel((xc + b), (yc + a), colour);
                  TFT_draw_pixel((xc - a), (yc + b), colour);
                  TFT_draw_pixel((xc - b), (yc + a), colour);
                  TFT_draw_pixel((xc + b), (yc - a), colour);
                  TFT_draw_pixel((xc + a), (yc - b), colour);
                  TFT_draw_pixel((xc - a), (yc - b), colour);
                  TFT_draw_pixel((xc - b), (yc - a), colour);
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



void TFT_draw_Font_Pixel(uint16_t x_pos, uint16_t y_pos, uint16_t colour, unsigned char pixel_size)
{
     uint16_t i = 0x0000;

     TFT_set_cursor(x_pos, y_pos);
     TFT_write_RAM_prepare();

     for(i = 0x0000; i < (pixel_size * pixel_size); i++)
     {
         TFT_write(colour, DAT);
     }
}


void TFT_print_char(uint16_t x_pos, uint16_t y_pos, unsigned char font_size, uint16_t colour, uint16_t back_colour, char ch)
{
     unsigned char i = 0x00;
     unsigned char j = 0x00;

     uint16_t value = 0x0000;

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
             value = ((font[ch - 0x20][i]));

             if(((value >> j) & 0x01) != 0x00)
             {
            	 TFT_draw_Font_Pixel(x_pos, y_pos, colour, font_size);
             }
             else
             {
            	 TFT_draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
             }

             y_pos += font_size;
          }
          y_pos -= (font_size << 0x03);
          x_pos++;
      }
}


void TFT_print_str(uint16_t x_pos, uint16_t y_pos, unsigned char font_size, uint16_t colour, uint16_t back_colour, char *ch)
{
     do
     {
    	 TFT_print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += 0x06;
     }while((*ch >= 0x20) && (*ch <= 0x7F));
}


void TFT_draw_BMP(uint16_t x_pos, uint16_t y_pos, uint16_t W, uint16_t H, unsigned char *bitmap)
{
     uint64_t index = 0;
     uint64_t size = (W * H);
     uint16_t *bitmap_ptr = (uint16_t*)bitmap;

     TFT_set_display_window(x_pos, y_pos, (H - 1), (W - 1));
     TFT_set_cursor(x_pos, y_pos);
     TFT_write_RAM_prepare();

     for(index = 0; index < size; index++)
     {
         TFT_write(*bitmap_ptr++, DAT);
     }

     TFT_set_display_window(0, 0, (H - 1), (W - 1));

}
