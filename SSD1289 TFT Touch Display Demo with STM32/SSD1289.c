#include "SSD1289.h"


void TFT_init()
{
    TFT_GPIO_init();
    TFT_reset_sequence();
    TFT_CS_pin = low;
    TFT_write_reg(0x0000, 0x0001);
    TFT_write_reg(0x0003, 0xA8A4);
    TFT_write_reg(0x000C, 0x0000);
    TFT_write_reg(0x000D, 0x080C);
    TFT_write_reg(0x000E, 0x2B00);
    TFT_write_reg(0x001E, 0x00B7);
    TFT_write_reg(0x0001, 0x2B3F);
    TFT_write_reg(0x0002, 0x0600);
    TFT_write_reg(0x0010, 0x0000);
    TFT_write_reg(0x0011, 0x6070);
    TFT_write_reg(0x0005, 0x0000);
    TFT_write_reg(0x0006, 0x0000);
    TFT_write_reg(0x0016, 0xEF1C);
    TFT_write_reg(0x0017, 0x0003);
    TFT_write_reg(0x0007, 0x0233);
    TFT_write_reg(0x000B, 0x0000);
    TFT_write_reg(0x000F, 0x0000);
    TFT_write_reg(0x0041, 0x0000);
    TFT_write_reg(0x0042, 0x0000);
    TFT_write_reg(0x0048, 0x0000);
    TFT_write_reg(0x0049, 0x013F);
    TFT_write_reg(0x004A, 0x0000);
    TFT_write_reg(0x004B, 0x0000);
    TFT_write_reg(0x0044, 0xEF95);
    TFT_write_reg(0x0045, 0x0000);
    TFT_write_reg(0x0046, 0x013F);
    TFT_write_reg(0x0030, 0x0707);
    TFT_write_reg(0x0031, 0x0204);
    TFT_write_reg(0x0032, 0x0204);
    TFT_write_reg(0x0033, 0x0502);
    TFT_write_reg(0x0034, 0x0507);
    TFT_write_reg(0x0035, 0x0204);
    TFT_write_reg(0x0036, 0x0204);
    TFT_write_reg(0x0037, 0x0502);
    TFT_write_reg(0x003A, 0x0302);
    TFT_write_reg(0x003B, 0x0302);
    TFT_write_reg(0x0023, 0x0000);
    TFT_write_reg(0x0024, 0x0000);
    TFT_write_reg(0x0025, 0x8000);
    TFT_write_reg(0x004F, 0x0000);
    TFT_write_reg(0x004E, 0x0000);
    TFT_write(0x0022, CMD);
    TFT_CS_pin = high;
    TFT_fill(Black);
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

    TFT_RD_pin = high;
    TFT_BL_pin = high;

    delay_ms(100);
}


void TFT_reset_sequence()
{
    TFT_RST_pin = high;
    delay_ms(5);
    TFT_RST_pin = low;
    delay_ms(100);
    TFT_RST_pin = high;
    delay_ms(15);
}


void TFT_write(unsigned int value, unsigned char mode)
{
    TFT_RS_pin = (mode & 0x01);
    TFT_data_out_port = value;
    TFT_WR_pin = low;
    TFT_WR_pin = high;
}


void TFT_write_reg(unsigned int cmd_value, unsigned int data_value)
{
    TFT_write(cmd_value, CMD);
    TFT_write(data_value, DAT);
}


void TFT_set_display_address_window(signed int xs, signed int ys, signed int xe, signed int ye)
{
    TFT_write_reg(0x0044, (xs + (xe << 8)));
    TFT_write_reg(0x0045, ys);
    TFT_write_reg(0x0046, ye);
    TFT_set_cursor(xs, ys);
}


void TFT_set_cursor(signed int x_pos, signed int y_pos)
{
    swap(&x_pos, &y_pos);
    y_pos = (MAX_X - 1 - y_pos);
        
    TFT_write_reg(0x004E, x_pos);
    TFT_write_reg(0x004F, y_pos);
    TFT_write(0x0022, CMD);
}


void TFT_fill(unsigned int colour)
{
    unsigned long index = (MAX_X * MAX_Y);

    TFT_CS_pin = low;
    TFT_set_display_address_window(0, 0, 239, 319);
    TFT_write(colour, DAT);

    while(index)
    {
       TFT_WR_pin = low;
       TFT_WR_pin = high;
       index--;
    };
    
    TFT_CS_pin = high;
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

     rgb_colour = ((b << 11) + (g << 5) + r);

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


void Draw_Pixel(signed int x_pos, signed int y_pos, unsigned int colour)
{
    if((x_pos >= MAX_X) || (y_pos >= MAX_Y) || (x_pos < 0) || (y_pos < 0))
    {
        return;
    }
    
    TFT_CS_pin = low;
    TFT_set_cursor(x_pos, y_pos);
    TFT_write(colour, DAT);
    TFT_CS_pin = high;
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

     TFT_CS_pin = low;
     TFT_set_cursor(x_pos, y_pos);
     for(i = 0x0000; i < (pixel_size * pixel_size); i++)
     {
         TFT_write(colour, DAT);
     }
     
     TFT_CS_pin = high;
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
     
     if((x_pos >= MAX_X) || (y_pos > MAX_Y))
     {

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


void print_str(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += 0x06;
     }while((*ch >= 0x20) && (*ch <= 0x7F));
}


void print_C(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
     unsigned char ch[4] = {0x20, 0x20, 0x20, 0x20};

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


void print_I(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed long value)
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


void print_D(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value, unsigned char points)
{
    char ch[5] = {0x2E, 0x20, 0x20, 0x20, 0x20};

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


void print_F(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
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


void Draw_BMP(unsigned int x_pos, unsigned int y_pos, signed int W, signed int H, const unsigned int *bitmap)
{
     signed int xp = 0;
     signed int yp = (y_pos + H);
     unsigned long index = 0;

     TFT_CS_pin = low;

     while(yp > 0)
     {
         for(xp = x_pos; xp < (x_pos + W); xp++)
         {
            Draw_Pixel(xp, yp, bitmap[index++]);
         }
         yp--;
     }
    
     TFT_CS_pin = high;
}