#include "SSD1306.h"
#include "fonts.h"


void setup_HW(void)
{
    MX_GPIO_Init();
    MX_SPI1_Init();
    HAL_Delay(100);
}


void swap(int16_t *a, int16_t *b)
{
	int16_t temp = 0;

    temp = *b;
    *b = *a;
    *a = temp;
}


void OLED_init(void)
{
    setup_HW();
    
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


void OLED_reset_sequence(void)
{
    HAL_Delay(40);
    HAL_GPIO_WritePin(SSD1306_RST_GPIO_Port, SSD1306_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(40);
    HAL_GPIO_WritePin(SSD1306_RST_GPIO_Port, SSD1306_RST_Pin, GPIO_PIN_SET);
}


void OLED_write(uint8_t value, uint8_t type)
{
    uint8_t data_value[1] = {0};

    data_value[0] = value;

    HAL_GPIO_WritePin(SSD1306_DC_GPIO_Port, SSD1306_DC_Pin, type);
    HAL_GPIO_WritePin(SSD1306_CS_GPIO_Port, SSD1306_CS_Pin, GPIO_PIN_RESET);
    HAL_SPI_Transmit(&hspi1, data_value, 1, 1000);
    HAL_GPIO_WritePin(SSD1306_CS_GPIO_Port, SSD1306_CS_Pin, GPIO_PIN_SET);
}  


void OLED_gotoxy(uint8_t x_pos, uint8_t y_pos)
{                                    
    OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
    OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
    OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
}


void OLED_fill(uint8_t bmp_data)
{                                                     
    uint8_t x_pos = 0;
    uint8_t page = 0;

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


void OLED_clear_screen(void)
{ 
    OLED_fill(0x00);
}


void OLED_clear_buffer(void)
{
	 uint16_t s = 0;

     for(s = 0; s < buffer_size; s++)
     {
          buffer[s] = 0x00;
     }
}


void OLED_cursor(uint8_t x_pos, uint8_t y_pos)
{         
    uint8_t s = 0;

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

        for(s = 0; s < 6; s++)
        {
            OLED_write(0xFF, DAT);
        }
    }
}


void OLED_draw_bitmap(uint8_t xb, uint8_t yb, uint8_t xe, uint8_t ye, uint8_t *bmp_img)
{
	uint16_t s = 0;

    uint8_t x_pos = 0;
    uint8_t y_pos = 0;

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
       
                    
void OLED_print_char(uint8_t x_pos, uint8_t y_pos, char ch)
{
  uint8_t s = 0;
  uint8_t chr = 0;
    
  chr = (ch - 0x20);

  if(x_pos > (x_max - 0x06))
  {
    x_pos = 0x00;
    y_pos++;
  }

  OLED_gotoxy(x_pos, y_pos);

  for(s = 0x00; s < 0x06; s++)
  {
    OLED_write(font_regular[chr][s], DAT);
  }
}


void OLED_print_string(uint8_t x_pos, uint8_t y_pos, char *ch)
{
  do
  {
    OLED_print_char(x_pos, y_pos, *ch++);
    x_pos += 0x06;
  }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\n'));
}


void OLED_print_chr(uint8_t x_pos, uint8_t y_pos, int16_t value)
{
  char ch[5] = {0x20, 0x20, 0x20, 0x20, '\n'};

  if(value < 0)
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
     ch[1] = ((value / 10) + 0x30);
     ch[2] = ((value % 10) + 0x30);
     ch[3] = 0x20;
  }
  else if((value >= 0) && (value <= 9))
  {
     ch[1] = ((value % 10) + 0x30);
     ch[2] = 0x20;
     ch[3] = 0x20;
  }

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_int(uint8_t x_pos, uint8_t y_pos, int32_t value)
{
  char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, '\n'};

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
    ch[2] = (((value % 10000) / 1000) + 0x30);
    ch[3] = (((value % 1000) / 100) + 0x30);
    ch[4] = (((value % 100) / 10) + 0x30);
    ch[5] = ((value % 10) + 0x30);
  }

  else if((value > 999) && (value <= 9999))
  {
    ch[1] = ((value / 1000) + 0x30);
    ch[2] = (((value % 1000) / 100) + 0x30);
    ch[3] = (((value % 100) / 10) + 0x30);
    ch[4] = ((value % 10) + 0x30);
    ch[5] = 0x20;
  }
  else if((value > 99) && (value <= 999))
  {
    ch[1] = ((value / 100) + 0x30);
    ch[2] = (((value % 100) / 10) + 0x30);
    ch[3] = ((value % 10) + 0x30);
    ch[4] = 0x20;
    ch[5] = 0x20;
  }
  else if((value > 9) && (value <= 99))
  {
    ch[1] = ((value / 10) + 0x30);
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

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_decimal(uint8_t x_pos, uint8_t y_pos, int16_t value, uint8_t points)
{
  char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, '\n'};
    
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

  OLED_print_string(x_pos, y_pos, ch);
}


void OLED_print_float(uint8_t x_pos, uint8_t y_pos, float value, uint8_t points)
{
  int32_t tmp = 0;

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

    if(value < 0)
    {
        OLED_print_char(x_pos, y_pos, 0x2D);
    }
    else
    {
        OLED_print_char(x_pos, y_pos, 0x20);
    }
  }
}


void Draw_Pixel(uint8_t x_pos, uint8_t y_pos, uint8_t colour)
{
    uint8_t value = 0x00;
    uint8_t page = 0x00;
    uint8_t bit_pos = 0x00;
    
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


void Draw_Line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t colour)
{
	int16_t dx = 0x0000;
    int16_t dy = 0x0000;
    int16_t stepx = 0x0000;
    int16_t stepy = 0x0000;
    int16_t fraction = 0x0000;

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


void Draw_V_Line(int16_t x1, int16_t y1, int16_t y2, uint8_t colour)
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


void Draw_H_Line(int16_t x1, int16_t x2, int16_t y1, uint8_t colour)
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


void Draw_Triangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint8_t fill, uint8_t colour)
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


void Draw_Rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t fill, uint8_t colour, uint8_t type)
{
     uint8_t i = 0;
     uint8_t xmin = 0;
     uint8_t xmax = 0;
     uint8_t ymin = 0;
     uint8_t ymax = 0;

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


void Draw_Circle(int16_t xc, int16_t yc, int16_t radius, uint8_t fill, uint8_t colour)
{
   int16_t a = 0;
   int16_t b = 0;
   int16_t P = 0;

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
