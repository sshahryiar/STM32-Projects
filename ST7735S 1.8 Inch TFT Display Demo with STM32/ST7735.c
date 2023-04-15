#include "ST7735.h"


void Configure_GPIOs()
{
     enable_GPIOB(true);
     
     setup_GPIOB(CS_pin, (output_mode_high_speed | GPIO_PP_output));
     setup_GPIOB(RST_pin, (output_mode_high_speed | GPIO_PP_output));
     setup_GPIOB(RS_pin, (output_mode_high_speed | GPIO_PP_output));
     setup_GPIOB(SDA_pin, (output_mode_high_speed | GPIO_PP_output));
     setup_GPIOB(SCK_pin, (output_mode_high_speed | GPIO_PP_output));
     
     GPIOB_pin_low(CS_pin);
     GPIOB_pin_low(RST_pin);
     GPIOB_pin_low(RS_pin);
     GPIOB_pin_low(SDA_pin);
     GPIOB_pin_low(SCK_pin);
     
     delay_ms(100);
}


void ST7735_Write(unsigned char value, unsigned char mode)
{
    unsigned char i = 0x08;
    
    GPIOB_pin_low(CS_pin);
    
    if(mode)
    {
        GPIOB_pin_high(RS_pin);
    }
    else
    {
        GPIOB_pin_low(RS_pin);
    }
    
    while(i > 0)
    {
        GPIOB_pin_low(SCK_pin);
        
        if((value & 0x80) != 0)
        {
            GPIOB_pin_high(SDA_pin);
        }
        else
        {
            GPIOB_pin_low(SDA_pin);
        }

        GPIOB_pin_high(SCK_pin);

        value <<= 1;
        i--;
    };
    
    GPIOB_pin_high(CS_pin);
}


void ST7735_Reset()
{
    GPIOB_pin_low(RST_pin);
    delay_ms(2);
    GPIOB_pin_high(RST_pin);
    delay_ms(2);
}


void ST7735_init()
{
    Configure_GPIOs();
    
    ST7735_Reset();

    ST7735_Write(ST7735_SWRESET, CMD);
    delay_us(150);
    ST7735_Write(ST7735_SLPOUT, CMD);
    delay_us(150);

    ST7735_Write(ST7735_FRMCTR1, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);

    ST7735_Write(ST7735_FRMCTR2, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);

    ST7735_Write(ST7735_FRMCTR3, CMD);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x2D, DAT);

    ST7735_Write(ST7735_INVCTR, CMD);
    ST7735_Write(0x07, DAT);

    ST7735_Write(ST7735_PWCTR1, CMD);
    ST7735_Write(0xA2, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x84, DAT);

    ST7735_Write(ST7735_PWCTR1, CMD);
    ST7735_Write(0xC5, DAT);

    ST7735_Write(ST7735_PWCTR2, CMD);
    ST7735_Write(0x0A, DAT);
    ST7735_Write(0x00, DAT);

    ST7735_Write(ST7735_PWCTR3, CMD);
    ST7735_Write(0x8A, DAT);
    ST7735_Write(0x2A, DAT);

    ST7735_Write(ST7735_PWCTR4, CMD);
    ST7735_Write(0x8A, DAT);
    ST7735_Write(0xEE, DAT);

    ST7735_Write(ST7735_PWCTR5, CMD);
    ST7735_Write(0x0E, DAT);

    ST7735_Write(ST7735_VMCTR1, CMD);
    ST7735_Write(0x00, DAT);

    ST7735_Write(ST7735_COLMOD, CMD);
    ST7735_Write(0x05, DAT);

    ST7735_Write(ST7735_MADCTL, CMD);
    ST7735_Write(0xC8, DAT);

    RAM_Address_Set();

    ST7735_Write(ST7735_GMCTRP1, CMD);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x1C, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x12, DAT);
    ST7735_Write(0x37, DAT);
    ST7735_Write(0x32, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x25, DAT);
    ST7735_Write(0x2B, DAT);
    ST7735_Write(0x39, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x01, DAT);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x10, DAT);

    ST7735_Write(ST7735_GMCTRN1, CMD);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x1D, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x06, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x2C, DAT);
    ST7735_Write(0x29, DAT);
    ST7735_Write(0x2D, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x2E, DAT);
    ST7735_Write(0x37, DAT);
    ST7735_Write(0x3F, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x10, DAT);

    ST7735_Write(ST7735_NORON, CMD);
    delay_ms(10);

    ST7735_Write(ST7735_DISPON, CMD);
    delay_ms(100);

    ST7735_Write(ST7735_RAMWR, CMD);
    delay_ms(100);
}


void ST7735_Word_Write(unsigned int value)
{
    ST7735_Write(((value & 0xFF00) >> 0x08), DAT);
    ST7735_Write((value & 0x00FF), DAT);
}


void ST7735_Data_Write(unsigned char DataH, unsigned char DataL)
{
    ST7735_Write(DataH, DAT);
    ST7735_Write(DataL, DAT);
}


void ST7735_Data_Write_4k(unsigned char DataH, unsigned char DataM, unsigned char DataL)
{
    ST7735_Write(DataH, DAT);
    ST7735_Write(DataM, DAT);
    ST7735_Write(DataL, DAT);
}


void Set_Addr_Window(unsigned char xs, unsigned char ys, unsigned char xe, unsigned char ye)
{
    ST7735_Write(ST7735_CASET, CMD);
    ST7735_Write(0x00, DAT);
    ST7735_Write(xs, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(xe, DAT);

    ST7735_Write(ST7735_RASET, CMD);
    ST7735_Write(0x00, DAT);
    ST7735_Write(ys, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(ye, DAT);

    ST7735_Write(ST7735_RAMWR, CMD);
}


void RAM_Address_Set()
{
     Set_Addr_Window(0x00, 0x00, 0x7F, 0x9F);
}


void Invert_Display(unsigned char i)
{
     if(i == ST7735_INVON)
     {
         ST7735_Write(ST7735_INVON, CMD);
     }
     else
     {
         ST7735_Write(ST7735_INVOFF, CMD);
     }
}


unsigned int Swap_Colour(unsigned int colour)
{
    return ((colour << 0x000B) | (colour & 0x07E0) | (colour >> 0x000B));
}


unsigned int Color565(unsigned char r, unsigned char g, unsigned char b)
{
    return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
}


void Set_Rotation(unsigned char m)
{
    unsigned char rotation = 0x00;

    ST7735_Write(ST7735_MADCTL, CMD);
    rotation = (m % 4);

    switch(rotation)
    {
        case 0:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
            w = ST7735_TFTWIDTH;
            l = ST7735_TFTLENGTH;
            break;
        }
        case 1:
        {
            ST7735_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
            w = ST7735_TFTLENGTH;
            l = ST7735_TFTWIDTH;
            break;
        }
        case 2:
        {
            ST7735_Write((MADCTL_RGB), DAT);
            w = ST7735_TFTWIDTH;
            l = ST7735_TFTLENGTH;
            break;
        }
        case 3:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
            w = ST7735_TFTLENGTH;
            l = ST7735_TFTWIDTH;
            break;
        }
    }
}


void TFT_fill(unsigned int colour)
{
    unsigned char i = 0x00;
    unsigned char j = 0x00;

    Set_Addr_Window(0, 0, (w - 1), (l - 1));

    for(j = l; j > 0; j--)
    {
        for(i = w; i > 0; i--)
        {
            ST7735_Word_Write(colour);
        }
    }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour)
{
     Set_Addr_Window(x_pos, y_pos, (1 + x_pos), (1 + y_pos));
     ST7735_Word_Write(colour);
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

    if (dy < 0)
    {
        dy = -dy;
        stepy = -1;
    }
    else
    {
        stepy = 1;
    }

    if (dx < 0)
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

    if (dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while (x1 != x2)
        {
            if (fraction >= 0)
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

        while (y1 != y2)
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


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
{
     unsigned char i = 0x00;
     unsigned char xmin = 0x00;
     unsigned char xmax = 0x00;
     unsigned char ymin = 0x00;
     unsigned char ymax = 0x00;

     if(fill != NO)
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
     }

     else
     {
        Draw_Line(x1, y1, x2, y1, colour);
        Draw_Line(x1, y2, x2, y2, colour);
        Draw_Line(x1, y1, x1, y2, colour);
        Draw_Line(x2, y1, x2, y2, colour);
     }

     if(type != SQUARE)
     {
         Draw_Pixel(x1, y1, back_colour);
         Draw_Pixel(x1, y2, back_colour);
         Draw_Pixel(x2, y1, back_colour);
         Draw_Pixel(x2, y2, back_colour);
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
        if(fill != NO)
        {
            Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
            Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
            Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
            Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
        }
        else
        {
            Draw_Pixel((xc + a), (yc + b), colour);
            Draw_Pixel((xc + b), (yc + a), colour);
            Draw_Pixel((xc - a), (yc + b), colour);
            Draw_Pixel((xc - b), (yc + a), colour);
            Draw_Pixel((xc + b), (yc - a), colour);
            Draw_Pixel((xc + a), (yc - b), colour);
            Draw_Pixel((xc - a), (yc - b), colour);
            Draw_Pixel((xc - b), (yc - a), colour);
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


void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size)
{
     unsigned char i = 0x00;

     Set_Addr_Window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));

     for(i = 0x00; i < (pixel_size * pixel_size); i++)
     {
         ST7735_Word_Write(colour);
     }
}


void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
{
     unsigned char i = 0x00;
     unsigned char j = 0x00;

     unsigned char value = 0x00;

     if(font_size < 0)
     {
         font_size = 1;
     }

     if(x_pos < font_size)
     {
         x_pos = font_size;
     }

     for (i = 0x00; i < 0x05; i++)
     {
         for (j = 0x00; j < 0x08; j++)
         {
             value = 0x00;
             value = ((font[((unsigned char)ch) - 0x20][i]));

             if((value >> j)  & 0x01)
             {
                 Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
             }
             else
             {
                 Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
             }

             y_pos = y_pos + font_size;
          }
          y_pos -= (font_size << 0x03);
          x_pos += font_size;

      }
      x_pos += font_size;

      if(x_pos > w)
      {
          x_pos = (font_size + 0x01);
          y_pos += (font_size << 0x03);
      }
}


void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += (font_size * 0x06);
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

    if((value >= 9999) && (value < 99999))
    {
        print_D((x_pos + (0x24 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 999) && (value < 9999))
    {
        print_D((x_pos + (0x1E * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 99) && (value < 999))
    {
        print_D((x_pos + (0x18 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 9) && (value < 99))
    {
        print_D((x_pos + (0x12 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if(value < 9)
    {
        print_D((x_pos + (0x0C * font_size)), y_pos, font_size, colour, back_colour, tmp, points);

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