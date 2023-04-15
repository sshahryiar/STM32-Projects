#include "S6D02A1.h"


void TFT_init()
{
    configure_GPIO_pins();
    
    TFT_reset();

    TFT_write(S6D02A1_EXCOMMAND1, CMD);
    TFT_write(0x5A, DAT);
    TFT_write(0x5A, DAT);

    TFT_write(S6D02A1_EXCOMMAND3, CMD);
    TFT_write(0x5A, DAT);
    TFT_write(0x5A, DAT);

    TFT_write(S6D02A1_GAMSET, CMD);
    TFT_write(0x01, DAT);

    TFT_write(S6D02A1_PGAMMACTL, CMD);
    TFT_write(0x02, DAT);
    TFT_write(0x1F, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x10, DAT);
    TFT_write(0x22, DAT);
    TFT_write(0x30, DAT);
    TFT_write(0x38, DAT);
    TFT_write(0x3A, DAT);
    TFT_write(0x3A, DAT);
    TFT_write(0x3A, DAT);
    TFT_write(0x3A, DAT);
    TFT_write(0x3A, DAT);
    TFT_write(0x3D, DAT);
    TFT_write(0x02, DAT);
    TFT_write(0x01, DAT);

    TFT_write(S6D02A1_NGAMMACTL, CMD);
    TFT_write(0x21, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x02, DAT);
    TFT_write(0x04, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x0A, DAT);
    TFT_write(0x0B, DAT);
    TFT_write(0x0C, DAT);
    TFT_write(0x0C, DAT);
    TFT_write(0x16, DAT);
    TFT_write(0x1E, DAT);
    TFT_write(0x30, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x02, DAT);

    TFT_write(S6D02A1_ANALOGTST, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x17, DAT);
    TFT_write(0x10, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x1F, DAT);
    TFT_write(0x1F, DAT);

    TFT_write(S6D02A1_PWRCTL, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);

    TFT_write(S6D02A1_VCMCTL, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x70, DAT);
    TFT_write(0x66, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x6D, DAT);
    TFT_write(0x66, DAT);
    TFT_write(0x06, DAT);

    TFT_write(S6D02A1_SRCCTL, CMD);
    TFT_write(0x02, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x02, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x06, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x00, DAT);

    TFT_write(S6D02A1_DISCTL, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x03, DAT);
    TFT_write(0x08, DAT);
    TFT_write(0x08, DAT);
    TFT_write(0x04, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x04, DAT);
    TFT_write(0x08, DAT);
    TFT_write(0x08, DAT);

    TFT_write(S6D02A1_PANELCTL, CMD);
    TFT_write(0x11, DAT);

    TFT_write(S6D02A1_IFCTL, CMD);
    TFT_write(0xC8, DAT);
    TFT_write(0x20, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    delay_ms(40);

    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);

    TFT_write(S6D02A1_SLPOUT, CMD);
    delay_ms(40);

    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    delay_ms(40);
    
    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x03, DAT);
    delay_ms(40);
    
    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x07, DAT);
    delay_ms(40);
    
    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x0F, DAT);
    delay_ms(40);

    TFT_write(S6D02A1_PWRCTL, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x04, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);
    delay_ms(40);

    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x1F, DAT);
    delay_ms(40);
    
    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x7F, DAT);
    delay_ms(40);

    TFT_write(S6D02A1_MAMPWRSEQ, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0xFF, DAT);
    delay_ms(40);

    TFT_write(S6D02A1_ANALOGTST, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x17, DAT);
    TFT_write(0x10, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x01, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x16, DAT);
    TFT_write(0x16, DAT);

    TFT_write(S6D02A1_PWRCTL, CMD);
    TFT_write(0x00, DAT);
    TFT_write(0x09, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x3F, DAT);
    TFT_write(0x07, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);
    TFT_write(0x3C, DAT);
    TFT_write(0x36, DAT);
    TFT_write(0x00, DAT);

    TFT_write(S6D02A1_MADCTL, CMD);
    TFT_write(0x08, DAT);

    TFT_write(S6D02A1_TEON, CMD);
    TFT_write(0x00, DAT);
    TFT_write(S6D02A1_COLMOD, CMD);
    TFT_write(0x05, DAT);
    delay_ms(160);

    TFT_write(S6D02A1_DISPON, CMD);
    TFT_write(S6D02A1_RAMWR, CMD);
}


void TFT_reset()
{
    GPIOB_pin_low(RST_pin);
    delay_ms(60);
    GPIOB_pin_high(RST_pin);
    delay_ms(60);
}


void configure_GPIO_pins()
{
     enable_GPIOB(true);

     setup_GPIOB(CS_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_low(CS_pin);

     setup_GPIOB(SCK_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_low(SCK_pin);

     setup_GPIOB(SDA_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_low(SDA_pin);

     setup_GPIOB(RS_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_low(RS_pin);

     setup_GPIOB(RST_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_low(RST_pin);

     setup_GPIOB(BL_pin, (output_mode_medium_speed | GPIO_PP_output));
     GPIOB_pin_high(BL_pin);
}


void TFT_write_word_data(unsigned int value)
{
    TFT_write(((value & 0xFF00) >> 0x08), DAT);
    TFT_write((value & 0x00FF), DAT);
}


void TFT_write(unsigned char value, unsigned char DC)
{
    unsigned char i = 0x08;

    GPIOB_pin_low(CS_pin);

    if(DC != 0)
    {
        GPIOB_pin_high(RS_pin);
    }
    else
    {
        GPIOB_pin_low(RS_pin);
    }

    while(i > 0x00)
    {
        if(value & 0x80)
        {
            GPIOB_pin_high(SDA_pin);
        }
        else
        {
            GPIOB_pin_low(SDA_pin);
        }

        GPIOB_pin_low(SCK_pin);
        GPIOB_pin_high(SCK_pin);

        value <<= 0x01;
        i--;
    }

    GPIOB_pin_high(CS_pin);
}


void TFT_set_rotation(unsigned char rot)
{
    unsigned char rotation = 0x00;

    TFT_write(S6D02A1_MADCTL, CMD);
    rotation = (rot % 0x04);

    switch (rotation)
    {
        case 0x01:
        {
            TFT_write((MADCTL_MY | MADCTL_MV | MADCTL_BGR), DAT);
            w = S6D02A1_TFT_LENGTH;
            l = S6D02A1_TFT_WIDTH;
            break;
        }
        case 0x02:
        {
            TFT_write(MADCTL_BGR, DAT);
            w = S6D02A1_TFT_WIDTH;
            l = S6D02A1_TFT_LENGTH;
            break;
        }
        case 0x03:
        {
            TFT_write((MADCTL_MX | MADCTL_MV | MADCTL_BGR), DAT);
            w = S6D02A1_TFT_LENGTH;
            l = S6D02A1_TFT_WIDTH;
            break;
        }
        default:
        {
            TFT_write((MADCTL_MX | MADCTL_MY | MADCTL_BGR), DAT);
            w = S6D02A1_TFT_WIDTH;
            l = S6D02A1_TFT_LENGTH;
            break;
        }
    }
}


void TFT_set_addr_window(unsigned int xs, unsigned int ys, unsigned int xe, unsigned int ye)
{
     TFT_write(S6D02A1_CASET, CMD);
     TFT_write_word_data(xs);
     TFT_write_word_data(xe);

     TFT_write(S6D02A1_RASET, CMD);
     TFT_write_word_data(ys);
     TFT_write_word_data(ye);

     TFT_write(S6D02A1_RAMWR, CMD);
}


void TFT_fill(unsigned int colour)
{
    unsigned char i = 0x00;
    unsigned char j = 0x00;

    TFT_set_addr_window(0, 0, (w - 1), (l - 1));

    for (i = l; i > 0x00; i--)
    {
        for (j = w; j > 0x00; j--)
        {
            TFT_write_word_data(colour);
        }
    }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour)
{
     if((x_pos < 0x00) || (x_pos >= w) || (y_pos < 0x00) || (y_pos >= l))
     {
          return;
     }
     else
     {
          TFT_set_addr_window(x_pos, y_pos, (x_pos + 0x01), (y_pos + 0x01));
          TFT_write_word_data(colour);
     }
}


void Draw_Line(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned int colour)
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


void Draw_Rectangle(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
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


void Draw_Circle(unsigned char xc, unsigned char yc, unsigned char radius, unsigned char fill, unsigned int colour)
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
            p += (3 + (2 * a++));
        }
        else
        {
            p += (5 + (2 * ((a++) - (b--))));
        }
    }while(a <= b);
}


void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size)
{
     unsigned char i = 0;
     
     TFT_set_addr_window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));
     
     for(i = 0; i < (pixel_size * pixel_size); i++)
     {
         TFT_write_word_data(colour);
     }
}


void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
{
     unsigned char i = 0;
     unsigned char j = 0;
     
     unsigned char value = 0;
     
     if(font_size < 0)
     {
         font_size = 1;
     }
     
     if(x_pos < font_size)  
     {
         x_pos = font_size;
     }

     for (i = 0; i < 5; i++)
     {
         for (j = 0; j < 8; j++)
         {
             value = 0;
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
          y_pos -= (font_size << 3);
          x_pos += font_size;

      }
      x_pos += font_size;

      if(x_pos > w)
      {
          x_pos = (font_size + 1);
          y_pos += (font_size << 3);
      }
}


void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
{
     while(*ch)
     {
         print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
         x_pos += (font_size * 0x06);
     }
}


void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
{
    char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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
    char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};

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
    char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, 0x20};

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