#include "AMG8833.h"


void AMG8833_init(void)
{
	AMG8833_write_byte(AMG8833_POWER_CONTROL_REG, AMG8833_NORMAL_MODE);
	HAL_Delay(60);

	AMG8833_set_upper_interrupt_limit(0x0080);
	AMG8833_set_lower_interrupt_limit(0x0010);
	AMG8833_set_interrupt_hystersis_level(0x0080);

	AMG8833_write_byte(AMG8833_FRAME_RATE_REG, 10);

	AMG8833_write_byte(AMG8833_INTERRUPT_CONTROL_REG, (AMG8833_INT_ACTIVE | AMG8833_INT_ABS_VALUE_INT_MODE));
	HAL_Delay(30);

	AMG8833_write_byte(AMG8833_STATUS_CLEAR_REG, AMG8833_CLEAR_ALL_STATUS);
	AMG8833_write_byte(AMG8833_RESET_REG, AMG8833_INIT_RESET_VALUE);
	HAL_Delay(100);
}


void AMG8833_write_byte(uint8_t address, uint8_t value)
{
	uint8_t wr_buffer[2] = {0x00, 0x00};

    wr_buffer[0] = address;
	wr_buffer[1] = value;

	HAL_I2C_Master_Transmit(&hi2c2, AMG8833_I2C_ADDR, wr_buffer, 2, 1000);
}


void AMG8833_write_word(uint8_t address, uint16_t value)
{
	uint8_t wr_buffer[3] = {0x00, 0x00, 0x00};

    wr_buffer[0] = address;
	wr_buffer[1] = (uint8_t)((value & 0xFF00) >> 8);
    wr_buffer[2] = (uint8_t)(value & 0x00FF);

	HAL_I2C_Master_Transmit(&hi2c2, AMG8833_I2C_ADDR, wr_buffer, 3, 1000);
}


uint8_t AMG8833_read_byte(uint8_t address)
{
	uint8_t data_buffer[1] = {0x00};
    uint8_t retval = 0x00;

    data_buffer[0] = address;


	HAL_I2C_Master_Transmit(&hi2c2, AMG8833_I2C_ADDR, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c2, AMG8833_I2C_ADDR, data_buffer, 1, 1000);

	retval = data_buffer[0];

	return retval;
}


uint16_t AMG8833_read_word(uint8_t address)
{
	uint8_t data_buffer[2] = {0x00, 0x00};
    uint16_t retval = 0x0000;

    data_buffer[0] = address;


	HAL_I2C_Master_Transmit(&hi2c2, AMG8833_I2C_ADDR, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c2, AMG8833_I2C_ADDR, data_buffer, 2, 1000);

	retval = ((uint16_t)data_buffer[0]);
	retval <<= 0x08;
	retval |= ((uint16_t)data_buffer[1]);

	return retval;
}


void AMG8833_set_upper_interrupt_limit(uint16_t value)
{
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_HL, ((uint8_t)(value & 0x00FF)));
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_HH, ((uint8_t)(value >> 8)));
}


void AMG8833_set_lower_interrupt_limit(uint16_t value)
{
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_LL, ((uint8_t)(value & 0x00FF)));
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_LH, ((uint8_t)(value >> 8)));
}


void AMG8833_set_interrupt_hystersis_level(uint16_t value)
{
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_YSL, ((uint8_t)(value & 0x00FF)));
	AMG8833_write_byte(AMG8833_INT_LEVEL_REG_YSH, ((uint8_t)(value >> 8)));
}


uint8_t AMG8833_get_interrupt_status(void)
{
	uint8_t value = 0;

	value = AMG8833_read_byte(AMG8833_STATUS_REG);

	if(value & 0x20)
	{
		return 1;
	}

	else
	{
		return 0;
	}
}


void AMG8833_get_pixel_interrupt_status(uint8_t *value)
{
	uint8_t i = 0;

	for(i = 0; i < 8 ; i++)
	{
		value[i] = AMG8833_read_byte((i + AMG8833_INTERRUPT_TABLE_1_8_REG));
	}
}


float AMG8833_get_temperature(void)
{
	uint8_t LB = 0;
	uint8_t HB = 0;
	int16_t value = 0;
	float retval = 0;

	LB = AMG8833_read_byte(AMG8833_THERMISTOR_REG_L);
	HB = AMG8833_read_byte(AMG8833_THERMISTOR_REG_H);

	value = HB;
	value <<= 8;
	value |= LB;

	value = (value & 0x07FF);

	if(value & 0x0800)
	{
		value = -value;
	}

	retval = value;
	retval *= 0.0625;

	return retval;
}


void AMG8833_read_pixel_temperature_register_value(int16_t *value)
{
	uint8_t i = 0;
	uint8_t LB = 0;
	uint8_t HB = 0;
	uint16_t retval = 0;

	for(i = 0; i < AMG8833_PIXEL_COUNT; i++)
	{
		LB = AMG8833_read_byte((i * 2) + AMG8833_TEMPERATURE_REG_L);
		HB = AMG8833_read_byte((i * 2) + AMG8833_TEMPERATURE_REG_H);

		retval = HB;
		retval <<= 8;
		retval |= LB;

		value[i] = retval >> 2;
	}
}

void AMG8833_read_pixel_temperature(float *value)
{
	uint8_t i = 0;
	uint8_t LB = 0;
	uint8_t HB = 0;
	int16_t temp = 0;
	float retval = 0;

	for(i = 0; i < AMG8833_PIXEL_COUNT; i++)
	{
		LB = AMG8833_read_byte((i * 2) + AMG8833_TEMPERATURE_REG_L);
		HB = AMG8833_read_byte((i * 2) + AMG8833_TEMPERATURE_REG_H);

		temp = HB;
		temp <<= 8;
		temp |= LB;

		retval = (float)(float)((float)(temp >> 2) + ((float)(temp & 0x03) * 0.25));

		value[i] = retval;
	};
}
