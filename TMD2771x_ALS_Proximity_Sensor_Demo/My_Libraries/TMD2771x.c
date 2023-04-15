#include "TMD2771x.h"


uint8_t TMD2771x_init(void)
{
	uint8_t retval = 0x00;

	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_ENABLE_REG), 0x0F);
	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_ATIME_REG), 0xDB);
	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_PTIME_REG), 0xFF);
	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_WTIME_REG), 0xFF);
	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_PPULSE_REG), 0x04);
	TMD2771x_write_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_CONTROL_REG), 0x20);

	HAL_Delay(900);

	retval = TMD2771x_read_byte((TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_ID_REG));

	if(retval == TMD27711_device_ID)
	{
		return 1;
	}

	else if(retval == TMD27713_device_ID)
	{
		return 2;
	}

	else
	{
		return 0;
	}
}


uint16_t make_word(uint8_t HB, uint8_t LB)
{
	uint16_t retval = 0x0000;

	retval = (uint16_t)HB;
	retval <<= 8;
	retval |= (uint8_t)LB;

	return retval;
}


void TMD2771x_write_byte(uint8_t address, uint8_t value)
{
	uint8_t wr_buffer[2] = {0x00, 0x00};

    wr_buffer[0] = address;
	wr_buffer[1] = value;

	HAL_I2C_Master_Transmit(&hi2c1, TMD2771x_I2C_ADDR, wr_buffer, 2, 1000);
}


uint8_t TMD2771x_read_byte(uint8_t address)
{
	uint8_t data_buffer[1] = {0x00};
    uint8_t retval = 0x00;

    data_buffer[0] = address;


	HAL_I2C_Master_Transmit(&hi2c1, TMD2771x_I2C_ADDR, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, TMD2771x_I2C_ADDR, data_buffer, 1, 1000);

	retval = data_buffer[0];

	return retval;
}


void TMD2771x_get_readings(uint16_t *als_value, uint16_t *prox_value)
{
	uint8_t data_buffer[6];
	uint16_t lum = 0x0000;
	uint16_t C0_value = 0x0000;
	uint16_t C1_value = 0x0000;
	uint16_t prx_value = 0x0000;
	float lum1 = 0.0;
	float lum2 = 0.0;

	data_buffer[0] = (TMD2771x_command_mode | TMD2771x_auto_increment_protocol | TMD2771x_C0DATA_REG);


	HAL_I2C_Master_Transmit(&hi2c1, TMD2771x_I2C_ADDR, data_buffer, 1, 1000);
	HAL_I2C_Master_Receive(&hi2c1, TMD2771x_I2C_ADDR, data_buffer, 6, 1000);

	C0_value = make_word(data_buffer[1], data_buffer[0]);
	C1_value = make_word(data_buffer[3], data_buffer[2]);

	lum1 = ((((float)C0_value * 1.0) - ((float)C1_value * 2.0)) / TMD2771x_CPL);
	lum2 = ((((float)C0_value * 0.6)  - ((float)C1_value * 1.0)) / TMD2771x_CPL);

	if((lum1 > 0) && (lum1 > lum2))
	{
		lum = (uint16_t)lum1;
	}

	else if((lum2 > 0) && (lum2 > lum1))
	{
		lum = (uint16_t)lum2;
	}

	*als_value = lum;

	prx_value = make_word(data_buffer[5], data_buffer[4]);

	*prox_value = prx_value;
}

