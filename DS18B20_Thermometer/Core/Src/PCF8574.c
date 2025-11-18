#include "PCF8574.h"


uint8_t PCF8574_read(uint8_t reg)
{
    uint8_t value = 0x00;
    uint8_t data_buffer[1] = {0x00};
	data_buffer[0] = reg;

#if(I2C_peripheral == use_SW_I2C)
    SW_I2C_start();
    SW_I2C_write(PCF8574_I2C_address);
    SW_I2C_wait_ACK();
    SW_I2C_write(reg);
    SW_I2C_wait_ACK();

    SW_I2C_start();
    SW_I2C_write(PCF8574_I2C_address | 1);
    SW_I2C_wait_ACK();
    value = SW_I2C_read(I2C_NACK);
    SW_I2C_stop();

#elif(I2C_peripheral == use_HW_I2C)
    HAL_I2C_Master_Transmit(&hi2c1, PCF8574_I2C_address, data_buffer, 1, 1000);
    HAL_I2C_Master_Receive(&hi2c1, PCF8574_I2C_address, data_buffer, 1, 1000);
    value = data_buffer[0];

#endif

    return value;
}


void PCF8574_write(uint8_t value)
{
	uint8_t data_buffer[1] = {0x00};

	data_buffer[0] = value;

#if(I2C_peripheral == use_SW_I2C)
    SW_I2C_start();
    SW_I2C_write(PCF8574_I2C_address);
    SW_I2C_wait_ACK();
    SW_I2C_write(value);
    SW_I2C_wait_ACK();
    SW_I2C_stop();

#elif(I2C_peripheral == use_HW_I2C)
    HAL_I2C_Master_Transmit(&hi2c1, PCF8574_I2C_address, data_buffer, 1, 1000);

#endif
}
