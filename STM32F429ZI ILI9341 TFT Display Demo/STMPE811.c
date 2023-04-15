#include "STMPE811.h"


void STMPE811_peripheral_setup()
{
     GPIO_Clk_Enable(&GPIOA_BASE);
     GPIO_Clk_Enable(&GPIOC_BASE);

     GPIO_Alternate_Function_Enable(&_GPIO_MODULE_I2C3_PA8_PC9);
     
     GPIO_Config(&GPIOA_BASE,
                _GPIO_PINMASK_8,
                (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
     
     GPIO_Config(&GPIOC_BASE,
                _GPIO_PINMASK_9,
                (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
     
     delay_ms(10);
     
     I2C3_Init_Advanced(400000, &_GPIO_MODULE_I2C3_PA8_PC9);
     I2C_Set_Active(&I2C3_Start, &I2C3_Read, &I2C3_Write);
     delay_ms(10);
}


void STMPE811_init()
{
    STMPE811_peripheral_setup();
    
    STMPE811_write_byte(STMPE811_SYS_CTRL1, 0x02);
    delay_ms(6);
    STMPE811_write_byte(STMPE811_SYS_CTRL1, 0x00);
    delay_ms(4);
    STMPE811_write_byte(STMPE811_SYS_CTRL2, 0x04);
    STMPE811_write_byte(STMPE811_SPI_CFG, 0x00);
    STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
    STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);
    STMPE811_write_byte(STMPE811_ADC_CTRL1, 0x48);
    STMPE811_write_byte(STMPE811_ADC_CTRL2, 0x01);
    STMPE811_write_byte(STMPE811_GPIO_AF, 0x0F);
    STMPE811_write_byte(STMPE811_TSC_CFG, 0xD3);
    STMPE811_write_byte(STMPE811_FIFO_TH, 0x01);
    STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
    STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);
    STMPE811_write_byte(STMPE811_TSC_FRACTION_Z, 0x01);
    STMPE811_write_byte(STMPE811_TSC_I_DRIVE, 0x01);
    STMPE811_write_byte(STMPE811_TSC_CTRL, 0x03);
    STMPE811_write_byte(STMPE811_INT_STA, 0xFF);
    delay_ms(4);
}


void STMPE811_write_byte(unsigned char addr, unsigned char value)
{
    unsigned char data_values[2] = {0x00, 0x00};
    
    data_values[0] = addr;
    data_values[1] = value;
    
    I2C3_Start();
    I2C3_Write(STMPE811_device_address, data_values, 2, END_MODE_STOP);
}


unsigned char STMPE811_read_byte(unsigned char addr)
{
    unsigned char value_a[1] = {0x00};
    unsigned char value_d[1] = {0x00};

    value_a[0] = addr;

    I2C3_Start();
    I2C3_Write(STMPE811_device_address, value_a, 1, END_MODE_RESTART);
    I2C3_Read(STMPE811_device_address, value_d, 1, END_MODE_STOP);

    return (value_d[0]);
}


void STMPE811_write_word(unsigned char addr, unsigned int value)
{
    unsigned char data_values[3] = {0x00, 0x00, 0x00};

    data_values[0] = addr;
    data_values[2] = (value & 0x00FF);
    data_values[1] = (value >> 0x08);

    I2C3_Start();
    I2C3_Write(STMPE811_device_address, data_values, 3, END_MODE_STOP);
}


unsigned int STMPE811_read_word(unsigned char addr)
{
    unsigned char value_a[1] = {0x00};
    unsigned char value_d[2] = {0x00, 0x00};

    unsigned int value = 0x0000;

    value_a[0] = addr;

    I2C3_Start();
    I2C3_Write(STMPE811_device_address, value_a, 1, END_MODE_RESTART);
    I2C3_Read(STMPE811_device_address, value_d, 2, END_MODE_STOP);

    value = value_d[0];
    value <<= 0x08;
    value |= value_d[1];

    return value;
}


unsigned int STMPE811_read_x()
{
    unsigned int value = 0x0000;
    
    value = STMPE811_read_word(STMPE811_TSC_DATA_X);
    
    return value;
}


unsigned int STMPE811_read_y()
{
    unsigned int value = 0x0000;

    value = STMPE811_read_word(STMPE811_TSC_DATA_Y);

    return value;
}


void STMPE811_get_touch(unsigned int *x_pos, unsigned int *y_pos, unsigned char orientation)
{
    unsigned char temp = 0x00;
    
    signed int xp = 0x0000;
    signed int yp = 0x0000;
    signed int tp = 0x0000;
    
    
    temp = STMPE811_read_byte(STMPE811_TSC_CTRL);
    
    if((temp & 0x80) != 0x00)
    {
        xp = STMPE811_read_x();
        yp = STMPE811_read_y();
        
        STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
        STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);

        switch(orientation)
        {
            case PORTRAIT_1:
            {
                tp = map(xp, RW_min, RW_max, W_min, W_max);
                *x_pos = constrain(tp, W_min, W_max);
                tp = map(yp, RL_max, RL_min, L_min, L_max);
                *y_pos = constrain(tp, L_min, L_max);
                break;
            }
            case PORTRAIT_2:
            {
                tp = map(xp, RW_max, RW_min, W_min, W_max);
                *x_pos = constrain(tp, W_min, W_max);
                tp = map(yp, RL_min, RL_max, L_min, L_max);
                *y_pos = constrain(tp, L_min, L_max);
                break;
            }
            case LANDSCAPE_1:
            {
                tp = map(yp, RL_max, RL_min, L_min, L_max);
                *x_pos = constrain(tp, L_min, L_max);
                tp = map(xp, RW_max, RW_min, 0, W_max);
                *y_pos = constrain(tp, W_min, W_max);
                break;
            }
            case LANDSCAPE_2:
            {
                tp = map(yp, RL_min, RL_max, L_min, L_max);
                *x_pos = constrain(tp, L_min, L_max);
                tp = map(xp, RW_min, RW_max, W_min, W_max);
                *y_pos = constrain(tp, W_min, W_max);
                break;
            }
        }
    }
}


float map(float value, float x_min, float x_max, float y_min, float y_max)
{
    return (y_min + (((y_max - y_min) / ((x_max - x_min)) * (value - x_min))));
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
