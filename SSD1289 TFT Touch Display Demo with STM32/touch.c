#include "touch.h"


void tp_init()
{
    tp_IO_init();
    
    TP_CS_pin = high;
    MOSI_pin = high;
    SCK_pin = high;
}


void tp_IO_init()
{
    GPIO_Clk_Enable(&GPIOA_BASE);
    GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_6), (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
    GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_2 | _GPIO_PINMASK_5 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
}


unsigned int TP_read()
{
    unsigned char i = 0x0C;
    unsigned int value = 0x0000;

    while(i > 0x00)
    {
        value <<= 1;

        SCK_pin = high;
        SCK_pin = low;

        if(MISO_pin == high)
        {
            value++;
        }

        i--;
    };

    return value;
}


void tp_write(unsigned char value)
{
    unsigned char i = 0x08;

    SCK_pin = low;

    while(i > 0)
    {
        if((value & 0x80) != 0x00)
        {
            MOSI_pin = high;
        }
        else
        {
            MOSI_pin = low;
        }

        value <<= 1;

        SCK_pin = low;
        SCK_pin = high;
        
        i--;
    };
}


void TP_read_coordinates(unsigned int *x_pos, unsigned int *y_pos)
{
    unsigned int temp = 0x0000;
    unsigned int avg_x = 0x0000;
    unsigned int avg_y = 0x0000;

    unsigned char samples = 0x10;
    
    TP_CS_pin = low;
    while(samples > 0)
    {
        tp_write(CMD_RDY);
        SCK_pin = high;
        SCK_pin = low;
        avg_x += TP_read();

        tp_write(CMD_RDX);
        SCK_pin = high;
        SCK_pin = low;
        avg_y += TP_read();
        
        samples--;
    };
    TP_CS_pin = high;
    
    temp = (avg_x >> 4);
    temp = filter_data(temp, 1);
    *x_pos = temp;
    
    temp = (avg_y >> 4);
    temp = filter_data(temp, 0);
    *y_pos = temp;
}


unsigned int filter_data(unsigned int value, unsigned char axis)
{
    float temp[3];
    
    float sum = 0.0;
    float min_R = 0.0;
    float max_R = 0.0;
    float axis_max = 0.0;
    
    unsigned int res = 0x0000;
    
    unsigned char i = 0x00;
    
    switch(axis)
    {
        case 1:
        {
            min_R = RL_min;
            max_R = RL_max;
            axis_max = res_l;
            break;
        }
        default:
        {
            min_R = RW_min;
            max_R = RW_max;
            axis_max = res_w;
            break;
        }
    }
    
    temp[0] = map((((float)value) - error), min_R, max_R, 0.0, axis_max);
    temp[1] = map((((float)value) + error), min_R, max_R, 0.0, axis_max);
    temp[2] = map(((float)value), min_R, max_R, 0.0, axis_max);
    
    for(i = 0; i < 3; i++)
    {
        sum += temp[i];
    }
    
    sum /= 3.0;
    res = constrain(sum, 0.0, axis_max);
    
    return res;
}


float map(float value, float x_min, float x_max, float y_min, float y_max)
{
    return (y_min + (((y_max - y_min) / (x_max - x_min)) * (value - x_min)));
}


float constrain(float value, float value_min, float value_max)
{
      if(value >= value_max)
      {
           return value_max;
      }
      else if(value <= value_min)
      {
           return value_min;
      }
      else
      {
           return value;
      }
}