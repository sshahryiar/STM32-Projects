#include "ST7735.h"


static const unsigned char fonts[96][5] =
{
     {0x00, 0x00, 0x00, 0x00, 0x00} // 20
    ,{0x00, 0x00, 0x5f, 0x00, 0x00} // 21 !
    ,{0x00, 0x07, 0x00, 0x07, 0x00} // 22 "
    ,{0x14, 0x7f, 0x14, 0x7f, 0x14} // 23 #
    ,{0x24, 0x2a, 0x7f, 0x2a, 0x12} // 24 $
    ,{0x23, 0x13, 0x08, 0x64, 0x62} // 25 %
    ,{0x36, 0x49, 0x55, 0x22, 0x50} // 26 &
    ,{0x00, 0x05, 0x03, 0x00, 0x00} // 27 '
    ,{0x00, 0x1c, 0x22, 0x41, 0x00} // 28 (
    ,{0x00, 0x41, 0x22, 0x1c, 0x00} // 29 )
    ,{0x14, 0x08, 0x3e, 0x08, 0x14} // 2a *
    ,{0x08, 0x08, 0x3e, 0x08, 0x08} // 2b +
    ,{0x00, 0x50, 0x30, 0x00, 0x00} // 2c ,
    ,{0x08, 0x08, 0x08, 0x08, 0x08} // 2d -
    ,{0x00, 0x60, 0x60, 0x00, 0x00} // 2e .
    ,{0x20, 0x10, 0x08, 0x04, 0x02} // 2f /
    ,{0x3e, 0x51, 0x49, 0x45, 0x3e} // 30 0
    ,{0x00, 0x42, 0x7f, 0x40, 0x00} // 31 1
    ,{0x42, 0x61, 0x51, 0x49, 0x46} // 32 2
    ,{0x21, 0x41, 0x45, 0x4b, 0x31} // 33 3
    ,{0x18, 0x14, 0x12, 0x7f, 0x10} // 34 4
    ,{0x27, 0x45, 0x45, 0x45, 0x39} // 35 5
    ,{0x3c, 0x4a, 0x49, 0x49, 0x30} // 36 6
    ,{0x01, 0x71, 0x09, 0x05, 0x03} // 37 7
    ,{0x36, 0x49, 0x49, 0x49, 0x36} // 38 8
    ,{0x06, 0x49, 0x49, 0x29, 0x1e} // 39 9
    ,{0x00, 0x36, 0x36, 0x00, 0x00} // 3a :
    ,{0x00, 0x56, 0x36, 0x00, 0x00} // 3b ;
    ,{0x08, 0x14, 0x22, 0x41, 0x00} // 3c <
    ,{0x14, 0x14, 0x14, 0x14, 0x14} // 3d =
    ,{0x00, 0x41, 0x22, 0x14, 0x08} // 3e >
    ,{0x02, 0x01, 0x51, 0x09, 0x06} // 3f ?
    ,{0x32, 0x49, 0x79, 0x41, 0x3e} // 40 @
    ,{0x7e, 0x11, 0x11, 0x11, 0x7e} // 41 A
    ,{0x7f, 0x49, 0x49, 0x49, 0x36} // 42 B
    ,{0x3e, 0x41, 0x41, 0x41, 0x22} // 43 C
    ,{0x7f, 0x41, 0x41, 0x22, 0x1c} // 44 D
    ,{0x7f, 0x49, 0x49, 0x49, 0x41} // 45 E
    ,{0x7f, 0x09, 0x09, 0x09, 0x01} // 46 F
    ,{0x3e, 0x41, 0x49, 0x49, 0x7a} // 47 G
    ,{0x7f, 0x08, 0x08, 0x08, 0x7f} // 48 H
    ,{0x00, 0x41, 0x7f, 0x41, 0x00} // 49 I
    ,{0x20, 0x40, 0x41, 0x3f, 0x01} // 4a J
    ,{0x7f, 0x08, 0x14, 0x22, 0x41} // 4b K
    ,{0x7f, 0x40, 0x40, 0x40, 0x40} // 4c L
    ,{0x7f, 0x02, 0x0c, 0x02, 0x7f} // 4d M
    ,{0x7f, 0x04, 0x08, 0x10, 0x7f} // 4e N
    ,{0x3e, 0x41, 0x41, 0x41, 0x3e} // 4f O
    ,{0x7f, 0x09, 0x09, 0x09, 0x06} // 50 P
    ,{0x3e, 0x41, 0x51, 0x21, 0x5e} // 51 Q
    ,{0x7f, 0x09, 0x19, 0x29, 0x46} // 52 R
    ,{0x46, 0x49, 0x49, 0x49, 0x31} // 53 S
    ,{0x01, 0x01, 0x7f, 0x01, 0x01} // 54 T
    ,{0x3f, 0x40, 0x40, 0x40, 0x3f} // 55 U
    ,{0x1f, 0x20, 0x40, 0x20, 0x1f} // 56 V
    ,{0x3f, 0x40, 0x38, 0x40, 0x3f} // 57 W
    ,{0x63, 0x14, 0x08, 0x14, 0x63} // 58 X
    ,{0x07, 0x08, 0x70, 0x08, 0x07} // 59 Y
    ,{0x61, 0x51, 0x49, 0x45, 0x43} // 5a Z
    ,{0x00, 0x7f, 0x41, 0x41, 0x00} // 5b [
    ,{0x02, 0x04, 0x08, 0x10, 0x20} // 5c ?
    ,{0x00, 0x41, 0x41, 0x7f, 0x00} // 5d ]
    ,{0x04, 0x02, 0x01, 0x02, 0x04} // 5e ^
    ,{0x40, 0x40, 0x40, 0x40, 0x40} // 5f _
    ,{0x00, 0x01, 0x02, 0x04, 0x00} // 60 `
    ,{0x20, 0x54, 0x54, 0x54, 0x78} // 61 a
    ,{0x7f, 0x48, 0x44, 0x44, 0x38} // 62 b
    ,{0x38, 0x44, 0x44, 0x44, 0x20} // 63 c
    ,{0x38, 0x44, 0x44, 0x48, 0x7f} // 64 d
    ,{0x38, 0x54, 0x54, 0x54, 0x18} // 65 e
    ,{0x08, 0x7e, 0x09, 0x01, 0x02} // 66 f
    ,{0x0c, 0x52, 0x52, 0x52, 0x3e} // 67 g
    ,{0x7f, 0x08, 0x04, 0x04, 0x78} // 68 h
    ,{0x00, 0x44, 0x7d, 0x40, 0x00} // 69 i
    ,{0x20, 0x40, 0x44, 0x3d, 0x00} // 6a j
    ,{0x7f, 0x10, 0x28, 0x44, 0x00} // 6b k
    ,{0x00, 0x41, 0x7f, 0x40, 0x00} // 6c l
    ,{0x7c, 0x04, 0x18, 0x04, 0x78} // 6d m
    ,{0x7c, 0x08, 0x04, 0x04, 0x78} // 6e n
    ,{0x38, 0x44, 0x44, 0x44, 0x38} // 6f o
    ,{0x7c, 0x14, 0x14, 0x14, 0x08} // 70 p
    ,{0x08, 0x14, 0x14, 0x18, 0x7c} // 71 q
    ,{0x7c, 0x08, 0x04, 0x04, 0x08} // 72 r
    ,{0x48, 0x54, 0x54, 0x54, 0x20} // 73 s
    ,{0x04, 0x3f, 0x44, 0x40, 0x20} // 74 t
    ,{0x3c, 0x40, 0x40, 0x20, 0x7c} // 75 u
    ,{0x1c, 0x20, 0x40, 0x20, 0x1c} // 76 v
    ,{0x3c, 0x40, 0x30, 0x40, 0x3c} // 77 w
    ,{0x44, 0x28, 0x10, 0x28, 0x44} // 78 x
    ,{0x0c, 0x50, 0x50, 0x50, 0x3c} // 79 y
    ,{0x44, 0x64, 0x54, 0x4c, 0x44} // 7a z
    ,{0x00, 0x08, 0x36, 0x41, 0x00} // 7b {
    ,{0x00, 0x00, 0x7f, 0x00, 0x00} // 7c |
    ,{0x00, 0x41, 0x36, 0x08, 0x00} // 7d }
    ,{0x10, 0x08, 0x08, 0x10, 0x08} // 7e ?
    ,{0x78, 0x46, 0x41, 0x46, 0x78} // 7f ?
};


static unsigned char width = ST7735_TFTWIDTH;
static unsigned char length = ST7735_TFTLENGTH;


void ST7735_init(void)
{
    ST7735_Reset();
    
    ST7735_Write(ST7735_SWRESET, CMD);

    HAL_Delay(1);
    ST7735_Write(ST7735_SLPOUT, CMD);
    HAL_Delay(120);

    ST7735_Write(ST7735_FRMCTR1, CMD);
    ST7735_Write(0x05, DAT);
    ST7735_Write(0x3A, DAT);
    ST7735_Write(0x3A, DAT);
    
    ST7735_Write(ST7735_FRMCTR2, CMD);
    ST7735_Write(0x05, DAT);
    ST7735_Write(0x3A, DAT);
    ST7735_Write(0x3A, DAT);
    
    ST7735_Write(ST7735_FRMCTR3, CMD);
    ST7735_Write(0x05, DAT);
    ST7735_Write(0x3A, DAT);
	ST7735_Write(0x3A, DAT);
	ST7735_Write(0x05, DAT);
	ST7735_Write(0x3A, DAT);
	ST7735_Write(0x3A, DAT);

    ST7735_Write(ST7735_INVCTR, CMD);
    ST7735_Write(0x03, DAT);

    ST7735_Write(ST7735_PWCTR1, CMD);
    ST7735_Write(0x62, DAT);
    ST7735_Write(0x02, DAT); 
    ST7735_Write(0x04, DAT);

    ST7735_Write(ST7735_PWCTR2, CMD);
    ST7735_Write(0xC0, DAT);

    ST7735_Write(ST7735_PWCTR3, CMD);
    ST7735_Write(0x0D, DAT);
    ST7735_Write(0x00, DAT);

    ST7735_Write(ST7735_PWCTR4, CMD);
    ST7735_Write(0x8D, DAT);
    ST7735_Write(0x6A, DAT);

    ST7735_Write(ST7735_PWCTR5, CMD);
    ST7735_Write(0x8D, DAT);
    ST7735_Write(0xEE, DAT);

    ST7735_Write(ST7735_VMCTR1, CMD);
    ST7735_Write(0x0E, DAT);

    ST7735_Write(ST7735_GMCTRP1, CMD);
    ST7735_Write(0x10, DAT);
    ST7735_Write(0x0E, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x0E, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x07, DAT);
    ST7735_Write(0x0A, DAT);
    ST7735_Write(0x12, DAT);
    ST7735_Write(0x27, DAT);
    ST7735_Write(0x37, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x0D, DAT);
    ST7735_Write(0x0E, DAT);
    ST7735_Write(0x10, DAT);
    
    ST7735_Write(ST7735_GMCTRN1, CMD);
    ST7735_Write(0x10, DAT);
    ST7735_Write(0x0E, DAT);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x03, DAT);
    ST7735_Write(0x0F, DAT);
    ST7735_Write(0x06, DAT);
    ST7735_Write(0x02, DAT);
    ST7735_Write(0x08, DAT);
    ST7735_Write(0x0A, DAT);
    ST7735_Write(0x13, DAT);
    ST7735_Write(0x26, DAT);
    ST7735_Write(0x36, DAT);
    ST7735_Write(0x00, DAT);
    ST7735_Write(0x0D, DAT);
    ST7735_Write(0x0E, DAT);
    ST7735_Write(0x10, DAT);

    ST7735_Write(ST7735_COLMOD, CMD);
    ST7735_Write(0x05, DAT);

    ST7735_Set_Rotation(3);

    ST7735_Write(ST7735_NORON, CMD);
    HAL_Delay(10);

    ST7735_Write(ST7735_DISPON, CMD);
    HAL_Delay(100);
}


void ST7735_Write(unsigned char value, unsigned char mode)
{
	uint8_t data_value[1] = {0};

	data_value[0] = value;

	CS_pin_low();
    
    if(mode != 0)
    {
        RS_pin_high();
    }
    else
    {
        RS_pin_low();
    }
    
    HAL_SPI_Transmit(&hspi1, data_value, 1, 1000);

    CS_pin_high();
}


void ST7735_Reset(void)
{
    RST_pin_low();
    HAL_Delay(2);
    RST_pin_high();
    HAL_Delay(2);
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


void ST7735_Set_Addr_Window(unsigned char xs, unsigned char ys, unsigned char xe, unsigned char ye)
{
	xs = xs ;
	xe = xe;
	ys = ys + 16;
	ye = ye + 16;

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


void ST7735_RAM_Address_Set(void)
{
    ST7735_Set_Addr_Window(0x00, 0x00, (width - 1), (length - 1));
}


void ST7735_Invert_Display(unsigned char i)
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


unsigned int ST7735_Swap_Colour(unsigned int colour)
{
    return ((colour << 0x000B) | (colour & 0x07E0) | (colour >> 0x000B));
}


unsigned int ST7735_Color565(unsigned char r, unsigned char g, unsigned char b)
{
    return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
}


void ST7735_Set_Rotation(unsigned char m)
{
    ST7735_Write(ST7735_MADCTL, CMD);

    switch(m)
    {
        case 0:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
            width = ST7735_TFTWIDTH;
            length = ST7735_TFTLENGTH;
            break;
        }
        case 1:
        {
            ST7735_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
            width = ST7735_TFTLENGTH;
            length = ST7735_TFTWIDTH;
            break;
        }
        case 2:
        {
            ST7735_Write((MADCTL_RGB), DAT);
            width = ST7735_TFTWIDTH;
            length = ST7735_TFTLENGTH;
            break;
        }
        case 3:
        {
            ST7735_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
            width = ST7735_TFTLENGTH;
            length = ST7735_TFTWIDTH;
            break;
        }
    }
}


void TFT_fill(unsigned int colour)
{
    unsigned char i = 0x00;
    unsigned char j = 0x00;

    ST7735_Set_Addr_Window(0, 0, (width - 1), (length - 1));

    for(j = length; j > 0; j--)
    {
        for(i = width; i > 0; i--)
        {
            ST7735_Word_Write(colour);
        }
    }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour)
{
    ST7735_Set_Addr_Window(x_pos, y_pos, (1 + x_pos), (1 + y_pos));
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

     ST7735_Set_Addr_Window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));

     for(i = 0x00; i < (pixel_size * pixel_size); i++)
     {
         ST7735_Word_Write(colour);
     }
}


void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned char ch)
{
     unsigned char i = 0x00;
     unsigned char j = 0x00;

     unsigned char value = 0x00;

     if(font_size < 1)
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
             value = ((fonts[ch - 0x20][i]));

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

      if(x_pos > width)
      {
          x_pos = (font_size + 0x01);
          y_pos += (font_size << 0x03);
      }
}


void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned char *ch)
{
     do
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += (font_size * 0x06);
     }while((*ch >= 0x20) && (*ch <= 0x7F));
}


void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
    unsigned char ch[5] = {0x20, 0x20, 0x20, 0x20, 0x20};

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
    unsigned char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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

    tmp = (signed long)value;
    print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
    tmp = ((signed long)((value - (float)tmp) * 10000));

    if(tmp < 0)
    {
       tmp = -tmp;
    }

    if((value >= 10000) && (value < 100000))
    {
        print_D((x_pos + (0x24 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 1000) && (value < 10000))
    {
        print_D((x_pos + (0x1E * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 100) && (value < 1000))
    {
        print_D((x_pos + (0x18 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if((value >= 10) && (value < 100))
    {
        print_D((x_pos + (0x12 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
    }
    else if(value < 10)
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
