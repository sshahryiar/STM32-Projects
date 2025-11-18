#include "I2C_LCD.h"


static uint8_t bl_state;
static uint8_t data_value;


void LCD_init(void)
{
  bl_state = BL_ON;
  data_value = 0x04;

#if(I2C_peripheral == use_SW_I2C)
  SW_I2C_GPIO_init();

#elif(I2C_peripheral == use_HW_I2C)
  TWI_init();

#endif

  PCF8574_write(data_value);

  HAL_Delay(10);

  LCD_send(0x33, CMD);
  LCD_send(0x32, CMD);

  LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
  LCD_send((display_on | cursor_off | blink_off), CMD);
  LCD_send((clear_display), CMD);
  LCD_send((cursor_direction_inc | display_no_shift), CMD);
}


void LCD_toggle_EN(void)
{
  data_value |= 0x04;
  PCF8574_write(data_value);
  HAL_Delay(1);
  data_value &= 0xF9;
  PCF8574_write(data_value);
  HAL_Delay(1);
}


void LCD_send(uint8_t value, uint8_t mode)
{
  switch(mode)
  {
     case CMD:
     {
        data_value &= 0xF4;
        break;
     }
     case DAT:
     {
        data_value |= 0x01;
        break;
     }
  }

  switch(bl_state)
  {
     case BL_ON:
     {
        data_value |= 0x08;
        break;
     }
     case BL_OFF:
     {
        data_value &= 0xF7;
        break;
     }
  }

  PCF8574_write(data_value);
  LCD_4bit_send(value);
  HAL_Delay(1);
}


void LCD_4bit_send(uint8_t lcd_data)
{
  uint8_t temp = 0x00;

  temp = (lcd_data & 0xF0);
  data_value &= 0x0F;
  data_value |= temp;
  PCF8574_write(data_value);
  LCD_toggle_EN();

  temp = (lcd_data & 0x0F);
  temp <<= 0x04;
  data_value &= 0x0F;
  data_value |= temp;
  PCF8574_write(data_value);
  LCD_toggle_EN();
}


void LCD_putchar(char char_data)
{
  LCD_send(char_data, DAT);
}


void LCD_clear_home(void)
{
  LCD_send(clear_display, CMD);
  LCD_send(goto_home, CMD);
}


void LCD_goto(uint8_t x_pos, uint8_t y_pos)
{
    switch(y_pos)
    {
        case 1:
        {
            LCD_send((0x80 | (line_2_y_pos + x_pos)), CMD);
            break;
        }

        case 2:
        {
            LCD_send((0x80 | (line_3_y_pos + x_pos)), CMD);
            break;
        }

        case 3:
        {
            LCD_send((0x80 | (line_4_y_pos + x_pos)), CMD);
            break;
        }

        default:
        {
            LCD_send((0x80 | (line_1_y_pos + x_pos)), CMD);
            break;
        }
    }
}


void LCD_putstr(uint8_t x_pos, uint8_t y_pos, const char *lcd_string)
{
    LCD_goto(x_pos, y_pos);
    while(*lcd_string != '\0')
    {
        LCD_putchar(*lcd_string++);
    };
}
