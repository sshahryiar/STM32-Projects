#include "AHT10.h"


void AHT10_init(void)
{
	AHT10_soft_reset();
	AHT10_calibrate();
}


void AHT10_calibrate(void)
{
	unsigned char value[3] = {AHT10_INIT_CMD,
							  AHT10_INIT_CAL_ENABLE,
							  AHT10_DATA_NOP};

	HAL_I2C_Master_Transmit(&hi2c1, AHT10_I2C_Address, value, 3, 1000);
	HAL_Delay(500);
}



unsigned char AHT10_read_status(void)
{
	unsigned char data_buf[1] = {0x00};

	HAL_I2C_Master_Receive(&hi2c1, AHT10_I2C_Address, data_buf, 1, 1000);

	return (data_buf[0]);
}



unsigned long AHT10_read_sensor(unsigned char command)
{
	unsigned long retval = 0;

	unsigned char data_buffer[6] = {0, 0, 0, 0, 0, 0};

	unsigned char value[3] = {AHT10_START_MEASURMENT_CMD,
					  		  AHT10_DATA_MEASURMENT_CMD,
							  AHT10_DATA_NOP};

	HAL_I2C_Master_Transmit(&hi2c1, AHT10_I2C_Address, value, 3, 1000);
	HAL_I2C_Master_Receive(&hi2c1, AHT10_I2C_Address, data_buffer, 6, 1000);

	switch(command)
	{
		case AHT10_GET_RH_CMD:
		{
		    retval = (unsigned long)((((unsigned long)data_buffer[1] << 16) | ((unsigned long)data_buffer[2] << 8) | ((unsigned long)data_buffer[3])) >> 4);
		    break;
		}

		default:
		{
			retval = (unsigned long)((((unsigned long)data_buffer[3] & 0x0F) << 16) | ((unsigned long)data_buffer[4] << 8) | ((unsigned long)data_buffer[5]));
		    break;
		}
	}

	return retval;
}


void AHT10_set_normal_mode(void)
{
	unsigned char value[3] = {AHT10_NORMAL_CMD,
							  AHT10_DATA_NOP,
							  AHT10_DATA_NOP};

	HAL_I2C_Master_Transmit(&hi2c1, AHT10_I2C_Address, value, 3, 1000);
	HAL_Delay(100);
}


void AHT10_set_cyclic_mode(void)
{
	unsigned char value[3] = {AHT10_INIT_CMD,
							  (AHT10_INIT_CYCLE_MODE | AHT10_INIT_CAL_ENABLE),
							  AHT10_DATA_NOP};

	HAL_I2C_Master_Transmit(&hi2c1, AHT10_I2C_Address, value, 3, 1000);
	HAL_Delay(100);
}


void AHT10_soft_reset(void)
{
	unsigned char value[1] = {AHT10_SOFT_RESET_CMD};

	HAL_I2C_Master_Transmit(&hi2c1, AHT10_I2C_Address, value, 1, 1000);
	HAL_Delay(100);
}


float AHT10_read_temperature(void)
{
	float retval = 0.0;

	retval = ((float)AHT10_read_sensor(AHT10_GET_T_CMD));
	retval = (((retval * 200.0) / 1048576.0) - 50.0);

	return retval;
}


float AHT10_read_relative_humidity(void)
{
    float retval = 0.0;

    retval = ((float)AHT10_read_sensor(AHT10_GET_RH_CMD));
    retval = ((retval / 1048576.0) * 100.0);

    return retval;
}
