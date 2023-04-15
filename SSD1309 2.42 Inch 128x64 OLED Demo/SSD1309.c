#include "SSD1309.h"
#include "fonts.c"


void setup_GPIOs()
{
    GPIO_Clk_Enable(&GPIOA_BASE);
    
    GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_10),
            (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    GPIO_Config(&GPIOA_BASE,
                (_GPIO_PINMASK_5 | _GPIO_PINMASK_7),
                (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));

    GPIO_Config(&GPIOA_BASE,
                _GPIO_PINMASK_6,
                (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));

    GPIO_Clk_Enable(&GPIOB_BASE);
    
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7,
            (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SPI1_PA567);

    RCC_APB2ENRbits.SPI1EN = HIGH;
    
    SPI1_Init_Advanced(_SPI_FPCLK_DIV8, (_SPI_8_BIT | _SPI_MASTER | _SPI_CLK_IDLE_LOW
                       | _SPI_FIRST_CLK_EDGE_TRANSITION | _SPI_MSB_FIRST
                       | _SPI_SS_ENABLE | _SPI_SSM_ENABLE | _SPI_SSI_0),
                        &_GPIO_MODULE_SPI1_PA567);
    delay_ms(100);
}


void swap(signed int *a, signed int *b)
{
    signed int temp = 0x0000;

    temp = *b;
    *b = *a;
    *a = temp;
}


void OLED_init()
{
    setup_GPIOs();
    
    OLED_reset_sequence();
    
    OLED_write((Set_Display_ON_or_OFF_CMD + Display_OFF) , CMD);;
    
    OLED_write(Set_Display_Clock_CMD, CMD);
    OLED_write(0x80, CMD);
    
    OLED_write(Set_Multiplex_Ratio_CMD, CMD);
    OLED_write(0x3F, CMD);
    
    OLED_write(Set_Display_Offset_CMD, CMD);
    OLED_write(0x00, CMD);
    
    OLED_write((Set_Display_Start_Line_CMD | 0x00), CMD);
    
    OLED_write(Set_Charge_Pump_CMD, CMD);
    OLED_write((Set_Higher_Column_Start_Address_CMD | Enable_Charge_Pump), CMD);

    OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
    OLED_write(Page_Addressing_Mode, CMD);
    
    OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
    
    OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
    
    OLED_write(Set_Common_HW_Config_CMD, CMD);
    OLED_write(0x12, CMD);

    OLED_write(Set_Contrast_Control_CMD, CMD);
    OLED_write(0xCF, CMD);
    
    OLED_write(Set_Pre_charge_Period_CMD, CMD);
    OLED_write(0xF1, CMD);
    
    OLED_write(Set_VCOMH_Level_CMD, CMD);
    OLED_write(0x40, CMD);

    OLED_write((Set_Entire_Display_ON_CMD | Normal_Display), CMD);

    OLED_write((Set_Normal_or_Inverse_Display_CMD | Non_Inverted_Display), CMD);
    
    OLED_write((Set_Display_ON_or_OFF_CMD + Display_ON) , CMD);
    
    OLED_gotoxy(0, 0);
    
    OLED_clear_buffer();
    OLED_clear_screen();
}


void OLED_reset_sequence()
{
    delay_ms(40);
    RST = LOW;
    delay_ms(40);
    RST = HIGH;
}


void OLED_write(unsigned char value, unsigned char type)
{
    DC = (type & 0x01);
    CS = LOW;
    SPI1_Write(value);
    CS = HIGH;
}  


void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
{                                    
    OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
    OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
    OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
}


void OLED_fill(unsigned char bmp_data) 
{                                                     
    unsigned char x_pos = 0x00;
    unsigned char page = 0x00;

    for(page = y_min; page < y_max; page++)
    {
        OLED_write((Set_Page_Start_Address_CMD + page), CMD);
        OLED_write(Set_Lower_Column_Start_Address_CMD, CMD);
        OLED_write(Set_Higher_Column_Start_Address_CMD, CMD);

        for(x_pos = x_min; x_pos < x_max; x_pos++)
        {
            OLED_write(bmp_data, DAT);
        }
    }
} 


void OLED_clear_screen()
{ 
    OLED_fill(0x00);
}


void OLED_clear_buffer()
{
     unsigned int s = 0x00;

     for(s = 0; s < buffer_size; s++)
     {
          buffer[s] = 0x00;
     }
}


void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
{         
    unsigned char i = 0x00;

    if(y_pos != 0x00)
    {
        if(x_pos == 1)
        {
            OLED_gotoxy(0x00, (y_pos + 0x02));
        }
        else
        {
            OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
        }

        for(i = 0; i < 6; i++)
        {
            OLED_write(0xFF, DAT);
        }
    }
}


void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
{
    unsigned char x_pos = 0x00;
    unsigned char page = 0x00;

    if(pixel != OFF)
    {
        pixel = 0xFF;
    }
    else
    {
        pixel = 0x00;
    }

    for(page = 0; page < y_max; page++)
    {
         OLED_gotoxy(x_min, page);
         for(x_pos = x_min; x_pos < x_max; x_pos++)
         {
            OLED_write((*bmp++ ^ pixel), DAT);
         }
     }
}


void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
{
    unsigned int s = 0x0000;
    unsigned char x_pos = 0x00;
    unsigned char y_pos = 0x00;

    for(y_pos = yb; y_pos <= ye; y_pos++)
    {
        OLED_gotoxy(xb, y_pos);
        for(x_pos = xb; x_pos < xe; x_pos++)
        {
            OLED_write(bmp_img[s], DAT);
            s++;
        }
    }
}
       
                    
void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
{
    unsigned char chr = 0x00;
    unsigned char s = 0x00;

    chr = (ch - 32);

    if(x_pos > (x_max - 6))
    {
        x_pos = 0;
        y_pos++;
    }
    
    OLED_gotoxy(x_pos, y_pos);

    for(s = 0x00; s < 0x06; s++)
    {
        OLED_write(font_regular[chr][s], DAT);
    }
}
  

void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
{
    unsigned char chr = 0x00;
    unsigned char i = 0x00;
    unsigned char j = 0x00;

    while(ch[j] != '\0')
    {
        chr = (ch[j] - 32);

        if(x_pos > (x_max - 0x06))
        {
            x_pos = 0x00;
            y_pos++;
        }
        OLED_gotoxy(x_pos, y_pos);

        for(i = 0x00; i < 0x06; i++)
        {
            OLED_write(font_regular[chr][i], DAT);
        }

        j++;
        x_pos += 6;
     }
}    
                                             
                      
void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
{                                             
    unsigned char ch = 0x00;

    if(value < 0x00)
    {
        OLED_print_char(x_pos, y_pos, '-');
        value = -value;
    }
    else
    {
        OLED_print_char(x_pos, y_pos,' ');
    }

     if((value > 99) && (value <= 999))
     {
         ch = (value / 100);
         OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
         ch = ((value % 100) / 10);
         OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
         ch = (value % 10);
         OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
     }
     else if((value > 9) && (value <= 99))
     {
         ch = ((value % 100) / 10);
         OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
         ch = (value % 10);
         OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
         OLED_print_char((x_pos + 18), y_pos , 0x20);
     }
     else if((value >= 0) && (value <= 9))
     {
         ch = (value % 10);
         OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
         OLED_print_char((x_pos + 12), y_pos , 0x20);
         OLED_print_char((x_pos + 18), y_pos , 0x20);
     }
}


void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
{ 
    unsigned char ch = 0x00;

    if(value < 0)
    {
        OLED_print_char(x_pos, y_pos, '-');
        value = -value;
    }
    else
    {
        OLED_print_char(x_pos, y_pos,' ');
    }

    if(value > 9999)
    {
        ch = (value / 10000);
        OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

        ch = ((value % 10000)/ 1000);
        OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

        ch = ((value % 1000) / 100);
        OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

        ch = ((value % 100) / 10);
        OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));

        ch = (value % 10);
        OLED_print_char((x_pos + 30), y_pos , (0x30 + ch));
    }

    else if((value > 999) && (value <= 9999))
    {
        ch = ((value % 10000)/ 1000);
        OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

        ch = ((value % 1000) / 100);
        OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

        ch = ((value % 100) / 10);
        OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

        ch = (value % 10);
        OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
        OLED_print_char((x_pos + 30), y_pos , 0x20);
    }
    else if((value > 99) && (value <= 999))
    {
        ch = ((value % 1000) / 100);
        OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

        ch = ((value % 100) / 10);
        OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

        ch = (value % 10);
        OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
        OLED_print_char((x_pos + 24), y_pos , 0x20);
        OLED_print_char((x_pos + 30), y_pos , 0x20);
    }
    else if((value > 9) && (value <= 99))
    {
        ch = ((value % 100) / 10);
        OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

        ch = (value % 10);
        OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
        
        OLED_print_char((x_pos + 18), y_pos , 0x20);
        OLED_print_char((x_pos + 24), y_pos , 0x20);
        OLED_print_char((x_pos + 30), y_pos , 0x20);
    }
    else
    {
        ch = (value % 10);
        OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
        OLED_print_char((x_pos + 12), y_pos , 0x20);
        OLED_print_char((x_pos + 18), y_pos , 0x20);
        OLED_print_char((x_pos + 24), y_pos , 0x20);
        OLED_print_char((x_pos + 30), y_pos , 0x20);
    }
}                                                      


void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
{
    unsigned char ch = 0x00;

    OLED_print_char(x_pos, y_pos, '.');

    ch = (value / 1000);
    OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

    if(points > 1)
    {
        ch = ((value % 1000) / 100);
        OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));


        if(points > 2)
        {
            ch = ((value % 100) / 10);
            OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

            if(points > 3)
            {
                ch = (value % 10);
                OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
            }
        }
    }
}
 
                             
void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points) 
{
    signed long tmp = 0x00;

    tmp = value;
    OLED_print_int(x_pos, y_pos, tmp);
    tmp = ((value - tmp) * 10000);
    
    if(tmp < 0)
    {
       tmp = -tmp;
    }

    if((value >= 10000) && (value < 100000))
    {
        OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
    }
    else if((value >= 1000) && (value < 10000))
    {
        OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
    }
    else if((value >= 100) && (value < 1000))
    {
        OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
    }
    else if((value >= 10) && (value < 100))
    {
        OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
    }
    else if(value < 10)
    {
        OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
        if((value) < 0)
        {
            OLED_print_char(x_pos, y_pos, '-');
        }
        else
        {
            OLED_print_char(x_pos, y_pos, ' ');
        }
    }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
    unsigned char value = 0x00;
    unsigned char page = 0x00;
    unsigned char bit_pos = 0x00;
    
    page = (y_pos / y_max);
    bit_pos = (y_pos - (page * y_max));
    value = buffer[((page * x_max) + x_pos)];
    
    if((colour & 0x01) != 0)
    {
        value |= (1 << bit_pos);
    }
    else
    {
        value &= (~(1 << bit_pos));
    }
    
    buffer[((page * x_max) + x_pos)] = value;
    OLED_gotoxy(x_pos, page);
    OLED_write(value, DAT);
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
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

    dx <<= 1;
    dy <<= 1;

    Draw_Pixel(x1, y1, colour);

    if(dx > dy)
    {
        fraction = (dy - (dx >> 1));
        while (x1 != x2)
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


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
{
     unsigned short i = 0x00;
     unsigned short xmin = 0x00;
     unsigned short xmax = 0x00;
     unsigned short ymin = 0x00;
     unsigned short ymax = 0x00;

     if(fill != 0)
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
         Draw_Pixel(x1, y1, ~colour);
         Draw_Pixel(x1, y2, ~colour);
         Draw_Pixel(x2, y1, ~colour);
         Draw_Pixel(x2, y2, ~colour);
     }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
{
   signed int a = 0x0000;
   signed int b = 0x0000;
   signed int P = 0x0000;

   b = radius;
   P = (1 - b);

   do
   {
        if(fill != 0)
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

        if(P < 0)
        {
           P += (3 + (2 * a++));
        }
        else
        {
           P += (5 + (2 * ((a++) - (b--))));
        }
    }while(a <= b);
}