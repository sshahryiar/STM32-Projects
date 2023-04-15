#include "ILI932x.h"


void TFT_init()
{
     static unsigned int device_code = 0x0000;
     
     TFT_GPIO_init();
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
     
     TFT_fill(Black);
     TFT_backlight_state(ON);
}


void TFT_GPIO_init()
{
    GPIO_Clk_Enable(&GPIOA_BASE);
    GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_3, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    GPIO_Clk_Enable(&GPIOB_BASE);
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    GPIO_Clk_Enable(&GPIOC_BASE);
    GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
    delay_ms(100);
}


void TFT_reset_sequence()
{
    TFT_RST_pin = 0;
    delay_ms(100);
    TFT_RST_pin = 1;
    delay_ms(50);
}


void TFT_backlight_state(unsigned char value)
{
    TFT_BL_pin = (value & 0x01);
}


void TFT_write(unsigned int value, unsigned char mode)
{
     TFT_CS_pin = 0;
     TFT_RS_pin = mode;
     TFT_data_out_port = value;
     TFT_WR_pin = 0;
     TFT_WR_pin = 1;
     TFT_CS_pin = 1;
}


unsigned int TFT_read(unsigned int value, unsigned char mode)
{
    unsigned int temp = 0x0000;

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

    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));

    TFT_CS_pin = 0;
    TFT_RS_pin = 1;
    TFT_RD_pin = 0;

    temp = GPIOB_IDR;

    TFT_RD_pin = 1;
    TFT_CS_pin = 1;

    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    return temp;
}


void TFT_write_reg(unsigned int reg_val, unsigned int data_val)
{
    TFT_write(reg_val, CMD);
    TFT_write(data_val, DAT);
}


void TFT_write_RAM_prepare()
{
    TFT_write(0x0022, CMD);
}


void TFT_fill(unsigned int colour)
{
    unsigned long index = (MAX_X * MAX_Y);

    TFT_set_cursor(0, 0);
    TFT_CS_pin = 0;
    TFT_write_RAM_prepare();

    while(index)
    {
       TFT_write(colour, DAT);
       index--;
    }
    TFT_CS_pin = 1;
}


unsigned int TFT_BGR2RGB(unsigned int colour)
{
     unsigned int r = 0x0000;
     unsigned int g = 0x0000;
     unsigned int b = 0x0000;
     unsigned int rgb_colour = 0x0000;

     b = ((colour >> 0)  & 0x1F);
     g = ((colour >> 5)  & 0x3F);
     r = ((colour >> 11) & 0x1F);

     rgb_colour = ((b << 11) + (g << 5) + (r << 0));

     return rgb_colour;
}


unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
{
    return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
}


void swap(signed int *a, signed int *b)
{
    signed int temp = 0x0000;

    temp = *b;
    *b = *a;
    *a = temp;
}


void TFT_set_cursor(unsigned int x_pos, unsigned int y_pos)
{
    unsigned int temp = 0x0000;
    
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


void TFT_set_display_window(unsigned int x_pos, unsigned int y_pos, unsigned int w, unsigned int h)
{
    TFT_write_reg(0x0050, x_pos);
    TFT_write_reg(0x0051, (w + x_pos));
    TFT_write_reg(0x0052, y_pos);
    TFT_write_reg(0x0053, (h + y_pos));
    TFT_set_cursor(x_pos, y_pos);
}


unsigned int Get_Pixel(unsigned int x_pos, unsigned int y_pos)
{
    unsigned int value = 0x0000;

    TFT_set_cursor(x_pos, y_pos);
    TFT_CS_pin = 0;
    TFT_write_RAM_prepare();
    value = TFT_read(0x0000, DAT);
    value = TFT_read(0x0000, DAT);
    TFT_CS_pin = 1;
    value = TFT_BGR2RGB(value);

    return value;
}


void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour)
{
    TFT_set_cursor(x_pos, y_pos);
    TFT_write_RAM_prepare();
    TFT_write(colour, DAT);
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
{
    signed int dx = 0x0000;
    signed int dy = 0x0000;
    signed int stepx = 0x0000;
    signed int stepy = 0x0000;
    signed int fraction = 0x0000;

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


void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
{
    signed int pos = 0;
    signed int temp = 0;

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


void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
{
    signed int pos = 0;
    signed int temp = 0;

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


void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
{
    signed int a = 0;
    signed int b = 0;
    signed int sa = 0;
    signed int sb = 0;
    signed int yp = 0;
    signed int last = 0;
    signed int dx12 = 0;
    signed int dx23 = 0;
    signed int dx13 = 0;
    signed int dy12 = 0;
    signed int dy23 = 0;
    signed int dy13 = 0;

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


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
{
     signed int i = 0x0000;
     signed int xmin = 0x0000;
     signed int xmax = 0x0000;
     signed int ymin = 0x0000;
     signed int ymax = 0x0000;

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
                     Draw_Pixel(xmin, i, colour);
                 }
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


void Draw_H_Bar(signed int x1, signed int x2, signed int y1, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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


void Draw_V_Bar(signed int x1, signed int y1, signed int y2, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
{
     signed int a = 0x0000;
     signed int b = 0x0000;
     signed int p = 0x0000;

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



void Draw_Font_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour, unsigned char pixel_size)
{
     unsigned int i = 0x0000;

     TFT_set_cursor(x_pos, y_pos);
     TFT_write_RAM_prepare();

     for(i = 0x0000; i < (pixel_size * pixel_size); i++)
     {
         TFT_write(colour, DAT);
     }
}


void print_char(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
{
     unsigned char i = 0x00;
     unsigned char j = 0x00;

     unsigned int value = 0x0000;

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
             value = ((font[((unsigned char)ch) - 0x20][i]));

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
          x_pos++;
      }
}


void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += 0x06;
     }while((*ch >= 0x20) && (*ch <= 0x7F));
}


void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
     unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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


void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
    unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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


void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
{
    unsigned char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, 0x20};

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


void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
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
        print_D((x_pos + 36), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 1000) && (value < 10000))
    {
        print_D((x_pos + 30), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 100) && (value < 1000))
    {
        print_D((x_pos + 24), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 10) && (value < 100))
    {
        print_D((x_pos + 18), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if(value < 10)
    {
        print_D((x_pos + 12), y_pos, font_size, colour, back_colour, tmp, points);

        if((value) < 0)
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
        }
        else
        {
            print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
        }
    }
}

void Draw_BMP(unsigned int x_pos, unsigned int y_pos, unsigned int H, unsigned int W, unsigned char *bitmap)
{
     unsigned long index = 0;
     unsigned long size = (W * H);
     unsigned int *bitmap_ptr = (unsigned int*)bitmap;

     TFT_set_display_window(x_pos, y_pos, (W - 1), (H - 1));
     TFT_write_RAM_prepare();

     for(index = 0; index < size; index++)
     {
         TFT_write(*bitmap_ptr++, DAT);
     }

     TFT_write_reg(0x0050, 0x0000);
     TFT_write_reg(0x0051, 0x00EF);
     TFT_write_reg(0x0052, 0x0000);
     TFT_write_reg(0x0053, 0x013F);
}