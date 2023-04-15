#include "Glass_LCD.h"
#include "GPIO.h"


void LCD_GLASS_Init()
{
     LCD_GLASS_Configure_GPIO();
     RCC_APB1ENRbits.PWREN = true;
     RCC_APB1ENRbits.LCDEN = true;
     PWR_CRbits.DBP = true;
     RTC_software_reset_state(true);
     RTC_software_reset_state(false);
     LSE_on_state(true);
     while(RCC_CSRbits.LSERDY == false);
     RTC_and_LCD_clock_source_selection(LSE_oscillator);
     LCD_Master_Reset();
     high_drive_enable(false);
     start_of_frame_interrupt_enable(false);
     update_display_done_interrupt_enable(false);
     set_bias(_1_3_bias);
     select_duty(_1_4_duty);
     mux_segment_enable(true);
     voltage_source_selection(internal);
     DIV_clock_divider(ck_ps_div_17);
     PS_16_bit_prescaler(LCDCLK_div_8);
     blink_mode_selection(blink_disabled);
     dead_time_duration(no_dead_time);
     pulse_ON_duration(_0_4_ck_ps);
     contrast_control(VLCD3_111_VLCD7);
     while(LCD_SRbits.FCRSF == false);
     LCD_controller_enable(true);
     while(LCD_SRbits.RDY == false);
     while(LCD_SRbits.ENS == false);
     LCD_GLASS_Clear();
      
}


void LCD_Master_Reset()
{
     LCD_CR = 0x00000000;
     LCD_SR = 0x00000000;
     LCD_FCR = 0x00000000;
     LCD_CLR = 0x00000000;
     LCD_RAM_clear();
}


void LCD_RAM_clear()
{
    LCD_RAM_COM0 = 0;
    LCD_RAM_COM1 = 0;
    LCD_RAM_COM2 = 0;
    LCD_RAM_COM3 = 0;
    LCD_RAM_COM4 = 0;
    LCD_RAM_COM5 = 0;
    LCD_RAM_COM6 = 0;
    LCD_RAM_COM7 = 0;
}


void LCD_GLASS_Configure_GPIO()
{
     enable_GPIOA(true);
     setup_GPIOA(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOA(15, AFIO, output_open_drain, high_speed, no_pull_resistor);

     setup_GPIOA_AF(1, AF11_LCD);
     setup_GPIOA_AF(2, AF11_LCD);
     setup_GPIOA_AF(3, AF11_LCD);
     setup_GPIOA_AF(8, AF11_LCD);
     setup_GPIOA_AF(9, AF11_LCD);
     setup_GPIOA_AF(10, AF11_LCD);
     setup_GPIOA_AF(15, AF11_LCD);

     enable_GPIOB(true);
     setup_GPIOB(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(4, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(5, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(11, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(12, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(13, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(14, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOB(15, AFIO, output_open_drain, high_speed, no_pull_resistor);

     setup_GPIOB_AF(3, AF11_LCD);
     setup_GPIOB_AF(4, AF11_LCD);
     setup_GPIOB_AF(5, AF11_LCD);
     setup_GPIOB_AF(8, AF11_LCD);
     setup_GPIOB_AF(9, AF11_LCD);
     setup_GPIOB_AF(10, AF11_LCD);
     setup_GPIOB_AF(11, AF11_LCD);
     setup_GPIOB_AF(12, AF11_LCD);
     setup_GPIOB_AF(13, AF11_LCD);
     setup_GPIOB_AF(14, AF11_LCD);
     setup_GPIOB_AF(15, AF11_LCD);

     enable_GPIOC(true);
     setup_GPIOC(0, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(6, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(7, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
     setup_GPIOC(11, AFIO, output_open_drain, high_speed, no_pull_resistor);

     setup_GPIOC_AF(0, AF11_LCD);
     setup_GPIOC_AF(1, AF11_LCD);
     setup_GPIOC_AF(2, AF11_LCD);
     setup_GPIOC_AF(3, AF11_LCD);
     setup_GPIOC_AF(6, AF11_LCD);
     setup_GPIOC_AF(7, AF11_LCD);
     setup_GPIOC_AF(8, AF11_LCD);
     setup_GPIOC_AF(9, AF11_LCD);
     setup_GPIOC_AF(10, AF11_LCD);
     setup_GPIOC_AF(11, AF11_LCD);
}


void LCD_bar()
{
    LCD_RAM_COM2 &= 0xFFFF5FFF;
    LCD_RAM_COM3 &= 0xFFFF5FFF;
    /* bar1 bar3 */
    LCD_RAM_COM2 |= ((unsigned long)((unsigned long)t_bar[0] << 0x0C));
    /*bar0 bar2 */
    LCD_RAM_COM3 |= ((unsigned long)((unsigned long)t_bar[1] << 0x0C));
}


void LCD_GLASS_WriteChar(unsigned char *ch, unsigned char point, unsigned char column, unsigned char position)
{
    unsigned char digit[0x04];     /* Digit frame buffer */

    /* To convert displayed character in segment in array digit */
    LCD_Conv_Char_Seg(ch, point, column, digit);
    /* TO wait LCD Ready */
    while(LCD_SRbits.UDR == true);

    switch (position)
    {
        /* Position 1 on LCD (Digit1)*/
        case 1:
        {
            LCD_RAM_COM0 &= 0xCFFFFFFC;
            LCD_RAM_COM1 &= 0xCFFFFFFC;
            LCD_RAM_COM2 &= 0xCFFFFFFC;
            LCD_RAM_COM3 &= 0xCFFFFFFC;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x00]) & 0x03)); // 1G 1B 1M 1E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x01]) & 0x03)); // 1F 1A 1C 1D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x02]) & 0x03)); // 1Q 1K 1Col 1P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x03]) & 0x03)); // 1H 1J 1DP 1N

            break;
         }

        /* Position 2 on LCD (Digit2)*/
        case 2:
        {
            LCD_RAM_COM0 &= 0xF3FFFF03;
            LCD_RAM_COM1 &= 0xF3FFFF03;
            LCD_RAM_COM2 &= 0xF3FFFF03;
            LCD_RAM_COM3 &= 0xF3FFFF03;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x00]) & 0x02) << 0x06) | ((((unsigned long)digit[0x00]) & 0x01) << 0x02)); // 2G 2B 2M 2E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x01]) & 0x02) << 0x06) | ((((unsigned long)digit[0x01]) & 0x01) << 0x02)); // 2F 2A 2C 2D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x02]) & 0x02) << 0x06) | ((((unsigned long)digit[0x02]) & 0x01) << 0x02)); // 2Q 2K 2Col 2P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x03]) & 0x02) << 0x06) | ((((unsigned long)digit[0x03]) & 0x01) << 0x02)); // 2H 2J 2DP 2N

            break;
         }

        /* Position 3 on LCD (Digit3)*/
        case 3:
        {
            LCD_RAM_COM0 &= 0xFCFFFCFF;
            LCD_RAM_COM1 &= 0xFCFFFCFF;
            LCD_RAM_COM2 &= 0xFCFFFCFF;
            LCD_RAM_COM3 &= 0xFCFFFCFF;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x00]) & 0x03) << 0x08)); // 3G 3B 3M 3E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x01]) & 0x03) << 0x08)); // 3F 3A 3C 3D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x02]) & 0x03) << 0x08)); // 3Q 3K 3Col 3P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x03]) & 0x03) << 0x08)); // 3H 3J 3DP 3N

            break;
         }

        /* Position 4 on LCD (Digit4)*/
        case 4:
        {
            LCD_RAM_COM0 &= 0xFFCFF3FF;
            LCD_RAM_COM1 &= 0xFFCFF3FF;
            LCD_RAM_COM2 &= 0xFFCFF3FF;
            LCD_RAM_COM3 &= 0xFFCFF3FF;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0A)); // 4G 4B 4M 4E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0A)); // 4F 4A 4C 4D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x02]) & 0x03) << 0x0A)); // 4Q 4K 4Col 4P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x03]) & 0x03) << 0x0A)); // 4H 4J 4DP 4N

            break;
         }

        /* Position 5 on LCD (Digit5)*/
        case 5:
        {
            LCD_RAM_COM0 &= 0xFFF3CFFF;
            LCD_RAM_COM1 &= 0xFFF3CFFF;
            LCD_RAM_COM2 &= 0xFFF3CFFF;
            LCD_RAM_COM3 &= 0xFFF3CFFF;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0C)); // 5G 5B 5M 5E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0C)); // 5F 5A 5C 5D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0C)); // 5Q 5K   5P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0C)); // 5H 5J   5N

            break;
         }

        /* Position 6 on LCD (Digit6)*/
        case 6:
        {
            LCD_RAM_COM0 &= 0xFFFC3FFF;
            LCD_RAM_COM1 &= 0xFFFC3FFF;
            LCD_RAM_COM2 &= 0xFFFC3FFF;
            LCD_RAM_COM3 &= 0xFFFC3FFF;

            LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x00]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0E)) ; // 6B 6G 6M 6E
            LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x01]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0E)) ; // 6A 6F 6C 6D
            LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x02]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0E)) ; // 6K 6Q    6P
            LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x03]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0E)) ; // 6J 6H   6N

            break;
         }

         default:
         {
            break;
         }
    }

    /* Refresh LCD  bar */
    LCD_bar();
    update_display_request();
}


void LCD_GLASS_DisplayString(unsigned char *ptr)
{
    unsigned char i = 0x01;

    /* Send the string character by character on lCD */
    while((*ptr != 0) & (i < 0x08))
    {
        /* Display one character on LCD */
        LCD_GLASS_WriteChar(ptr, false, false, i);

        /* Point on the next character */
        ptr++;
        /* Increment the character counter */
        i++;
    }
}


void LCD_GLASS_DisplayStrDeci(unsigned int *ptr)
{
    unsigned char i = 0x01;
    unsigned char char_tmp = 0x00;

    //  LCD_GLASS_Clear();
    /* Send the string character by character on lCD */
    while((*ptr != 0) & (i < 0x08))
    {
        char_tmp = ((*ptr) & 0x00FF);

        switch((*ptr) & 0xF000)
        {
            case DOT:
            {
                /* Display one character on LCD with decimal point */
                LCD_GLASS_WriteChar(&char_tmp, POINT_ON, COLUMN_OFF, i);
                break;
            }
            case DOUBLE_DOT:
            {
                /* Display one character on LCD with decimal point */
                LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_ON, i);
                break;
            }
            default:
            {
                LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_OFF, i);
                break;
            }
        }/* Point on the next character */
        ptr++;
        /* Increment the character counter */
        i++;
    }
}


void LCD_GLASS_Clear()
{
    /* TO wait LCD Ready */
    while(LCD_SRbits.UDR == true);
    LCD_RAM_Clear();
    /* Update the LCD display */
    update_display_request();
}


void LCD_GLASS_ScrollSentence(unsigned char *ptr, unsigned int nScroll, unsigned int ScrollSpeed)
{
    unsigned char Repetition = 0x00;
    unsigned char Char_Nb = 0x00;
    unsigned char *ptr1;
    unsigned char str[7] = "";
    unsigned char Str_size = 0x00;

    if(ptr == 0) 
    {
        return;
    }

    /* To calculate end of string */
    for(ptr1 = ptr, Str_size = 0x00 ; *ptr1 != 0x00; Str_size++, ptr1++)
    {
    };

    ptr1 = ptr;
    LCD_GLASS_DisplayString(ptr);
    Vdelay_ms(ScrollSpeed);

    /* To shift the string for scrolling display*/
    for(Repetition = 0x00; Repetition < nScroll; Repetition++)
    {
        for(Char_Nb = 0x00; Char_Nb < Str_size; Char_Nb++)
        {
              *(str) = *(ptr1 + ((Char_Nb + 0x01) % Str_size));
              *(str + 0x01) = *(ptr1 + ((Char_Nb + 0x02) % Str_size));
              *(str + 0x02) = *(ptr1 + ((Char_Nb + 0x03) % Str_size));
              *(str + 0x03) = *(ptr1 + ((Char_Nb + 0x04) % Str_size));
              *(str + 0x04) = *(ptr1 + ((Char_Nb + 0x05) % Str_size));
              *(str + 0x05) = *(ptr1 + ((Char_Nb + 0x06) % Str_size));
              LCD_GLASS_Clear();
              LCD_GLASS_DisplayString(str);

              Vdelay_ms(ScrollSpeed);
        }
    }
}


static void LCD_Conv_Char_Seg(unsigned char *c, unsigned char point, unsigned char column, unsigned char *digit)
{
    unsigned char i = 0x00;
    unsigned char j = 0x00;
    
    unsigned int ch = 0x0000;

    switch(*c)
    {
        case ' ':
        {
            ch = 0x00;
            break;
        }
        case '*':
        {
            ch = star;
            break;
        }
        case 'µ':
        {
            ch = C_UMAP;
            break;
        }
        case 'm':
        {
            ch = C_mMap;
            break;
        }
        case 'n':
        {
            ch = C_nMap;
            break;
        }
        case '-':
        {
            ch = C_minus;
            break;
        }
        case '/':
        {
            ch = C_slatch;
            break;
        }
        case '°':
        {
            ch = C_percent_1;
            break;
        }
        case '%':
        {
            ch = C_percent_2;
            break;
        }
        case '[':
        {
            ch = bracket_open;
            break;
        }
        case ']':
        {
            ch = bracket_close;
            break;
        }
        case 0xFF:
        {
            ch = C_full;
            break;
        }
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        {
            ch = NumberMap[(*c - 0x30)];
            break;
        }
        default:
        {
            /* The character c is one letter in upper case*/
            if((*c < 0x5B) && (*c > 0x40))
            {
                ch = CapLetterMap[(*c - 'A')];
            }
            /* The character c is one letter in lower case*/
            if((*c <0x7B) && (*c > 0x60))
            {
                ch = SmallLetterMap[(*c - 'a')];
            }
            break;
        }
    }

    /* Set the digital point can be displayed if the point is on */
    if(point != 0)
    {
        ch |= 0x0002;
    }

    /* Set the "COL" segment in the character that can be displayed if the column is on */
    if(column != 0)
    {
        ch |= 0x0020;
    }

    for(i = 0x0C, j = 0x00 ; j < 0x04; i -= 0x04, j++)
    {
        digit[j] = ((ch >> i) & 0x0F); //To isolate the less signifiant bit
    }
}