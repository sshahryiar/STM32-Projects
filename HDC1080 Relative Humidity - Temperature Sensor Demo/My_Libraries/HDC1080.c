#include "HDC1080.h"


void HDC1080_init(void)
{
	HDC1080_write_configutaion_register(HDC1080_SW_RST_CMD);
	HAL_Delay(10);
	HDC1080_write_configutaion_register(HDC1080_NORMAL_CMD);
	HAL_Delay(10);
	HDC1080_write_configutaion_register(HDC1080_HEATER_ON_CMD);
	HAL_Delay(100);
	HDC1080_write_configutaion_register(HDC1080_HEATER_OFF_CMD \
										| HDC1080_INDEPENDENT_MODE \
										| HDC1080_TEMP_RES_14_BIT \
										| HDC1080_HUM_RES_14_BIT);
	HAL_Delay(10);
}


void HDC1080_write_configutaion_register(uint8_t value)
{
	uint8_t wr_buffer[3] = {HDC1080_Configuration_REG, 0x00, 0x00};

	wr_buffer[1] = ((value & 0xFF00) >> 8);

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, wr_buffer, 3, 1000);
}


uint16_t HDC1080_read_configutaion_register(void)
{
	uint8_t data_buffer[2] = {HDC1080_Configuration_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


uint16_t HDC1080_read_manufacturer_ID(void)
{
	uint8_t data_buffer[2] = {HDC1080_Manufacturer_ID_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


uint16_t HDC1080_read_device_ID(void)
{
	uint8_t data_buffer[2] = {HDC1080_Device_ID_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


uint16_t HDC1080_read_serial_ID_H(void)
{
	uint8_t data_buffer[2] = {HDC1080_ID1_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


uint16_t HDC1080_read_serial_ID_M(void)
{
	uint8_t data_buffer[2] = {HDC1080_ID2_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


uint8_t HDC1080_read_serial_ID_L(void)
{
	uint8_t data_buffer[2] = {HDC1080_ID3_REG, 0x00};
	uint16_t retval = 0x0000;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 8;
	retval |= ((uint16_t)data_buffer[1]);

	return ((uint8_t)(retval >> 8));
}


float HDC1080_read_temperature(void)
{
	uint8_t data_buffer[2] = {HDC1080_Temperature_REG, 0x00};
	uint16_t temp = 0x0000;
	float retval = 0.0;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_Delay(HDC1080_conversion_delay);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	temp = ((uint16_t)data_buffer[0]);
	temp <<= 8;
	temp |= ((uint16_t)data_buffer[1]);

	retval = ((((float)temp) * T_Coff) - 40.0);

	return retval;
}


float HDC1080_read_humidity(void)
{
	uint8_t data_buffer[2] = {HDC1080_Humidity_REG, 0x00};
	uint16_t temp = 0x0000;
	float retval = 0.0;

	HAL_I2C_Master_Transmit(&hi2c1, HDC1080_I2C_Address, data_buffer, 1, 1000);
	HAL_Delay(HDC1080_conversion_delay);
	HAL_I2C_Master_Receive(&hi2c1, HDC1080_I2C_Address, data_buffer, 2, 1000);

	temp = ((uint16_t)data_buffer[0]);
	temp <<= 8;
	temp |= ((uint16_t)data_buffer[1]);

	retval = (((float)temp) * RH_Coff);

	return retval;
}
