#include "LM75.h"


void LM75_init()
{
    I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB89);
    delay_ms(10);
    I2C_Set_Active(&I2C1_Start, &I2C1_Read, &I2C1_Write);
    
    LM75_write_byte(pointer_conf_reg, (queue_value_1 | OS_POL_LOW | OS_Comp | normal));
}


void LM75_write_byte(unsigned char pointer, unsigned char value)
{
    unsigned char values[0x02] = {0x00, 0x00};
    
    values[0] = pointer;
    values[1] = value;
    
    I2C1_Start();
    I2C1_Write(LM75_I2C_Address, values, 2, END_MODE_STOP);
}


void LM75_write_bytes(unsigned char pointer, signed int value)
{
    unsigned char values[0x03] = {0x00, 0x00, 0x00};
    
    values[0] = pointer;
    values[1] = ((value & 0xFF00) >> 8);
    values[2] = (value & 0x00FF);
    
    I2C1_Start();
    I2C1_Write(LM75_I2C_Address, values, 3, END_MODE_STOP);
}


signed int LM75_read_byte(unsigned char pointer)
{
   unsigned char value_p[0x01] = {0x00};
   unsigned char value_d[0x01] = {0x00};
   
   value_p[0] = pointer;
   
   I2C1_Start();
   I2C1_Write(LM75_I2C_Address, value_p, 1, END_MODE_RESTART);
   I2C1_Read(LM75_I2C_Address, value_d, 1, END_MODE_STOP);
   
   return (value_d[0x00]);
}


signed int LM75_read_bytes(unsigned char pointer)
{
   unsigned char value_p[0x01] = {0x00};
   unsigned char value_d[0x02] = {0x00, 0x00};
   
   signed int value = 0x0000;

   value_p[0] = pointer;

   I2C1_Start();
   I2C1_Write(LM75_I2C_Address, value_p, 1, END_MODE_RESTART);
   I2C1_Read(LM75_I2C_Address, value_d, 2, END_MODE_STOP);

   value = ((signed int)value_d[0x00]);
   value <<= 0x08;
   value |= ((signed int)value_d[0x01]);
   
   return value;
}


float get_temp()
{
    float temp = 0.0;
    
    temp = (LM75_read_bytes(pointer_temp_reg) >> 5);
    temp *= 0.125;
    
    return temp;
}