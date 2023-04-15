#include "BME280.h"


static int32_t t_fine;


void BME280_init(void)
{
	MX_GPIO_Init();

    BME280_write_byte(BME280_REGISTER_SOFTRESET, 0xB6);
    HAL_Delay(300);

    while(BME280_reading_calibration())
    {
		HAL_Delay(100);
    }

    BME280_read_coefficients();

    BME280_write_byte(BME280_REGISTER_CONTROLHUMID, 0x01);
    BME280_write_byte(BME280_REGISTER_CONTROL, 0x3F);

}


uint8_t BME280_xfer(uint8_t tx_data)
{
	int8_t s = 0;
	uint8_t rx_data = 0;

	for(s = 7; s >= 0; s--)
	{
		rx_data <<= 1;

		HAL_GPIO_WritePin(BME280_SCK_GPIO_Port, BME280_SCK_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(BME280_MOSI_GPIO_Port, BME280_MOSI_Pin, (tx_data & (1 << s)));
		HAL_Delay(1);
		HAL_GPIO_WritePin(BME280_SCK_GPIO_Port, BME280_SCK_Pin, GPIO_PIN_SET);
		rx_data |= HAL_GPIO_ReadPin(BME280_MISO_GPIO_Port, BME280_MISO_Pin);
		HAL_Delay(1);
	}

	return rx_data;
}


void BME280_write_byte(uint8_t reg, uint8_t value)
{
    HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_RESET);
    BME280_xfer(reg & ~0x80);
    BME280_xfer(value);
    HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_SET);
}


uint8_t BME280_read_byte(uint8_t reg)
{
	uint8_t rx_value = 0;

	HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_RESET);
	BME280_xfer(reg | 0x80);
	rx_value = BME280_xfer(0);
	HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_SET);

   return rx_value;
}


uint16_t BME280_read_word(uint8_t reg)
{
   uint8_t hb = 0;
   uint8_t lb = 0;
   uint16_t value = 0;

   HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_RESET);
   BME280_xfer(reg | 0x80);
   hb = BME280_xfer(0);
   lb = BME280_xfer(0);
   HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_SET);

   value = ((unsigned int)hb);
   value <<= 8;
   value |= ((unsigned int)lb);
   
   return value;
}


uint16_t BME280_read_word_little_endian(uint8_t reg)
{    
	uint16_t temp = 0;

    temp = BME280_read_word(reg);
    
    return ((temp >> 8) | (temp << 8));
}


int16_t BME280_read_signed_word(uint8_t reg)
{
    return (int16_t)BME280_read_word(reg);
}


int16_t BME280_read_signed_word_little_endian(uint8_t reg)
{
    return (int16_t)BME280_read_word_little_endian(reg);
}



uint32_t BME280_read_long(uint8_t reg)
{
   uint8_t rx_data[3] = {0, 0, 0};
   uint32_t value = 0;


   HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_RESET);
   BME280_xfer(reg | 0x80);
   rx_data[0] = BME280_xfer(0);
   rx_data[1] = BME280_xfer(0);
   rx_data[2] = BME280_xfer(0);
   HAL_GPIO_WritePin(BME280_CS_GPIO_Port, BME280_CS_Pin, GPIO_PIN_SET);

   value = ((uint32_t)rx_data[0]);
   value <<= 8;

   value |= ((uint32_t)rx_data[1]);
   value <<= 8;
   
   value |= ((uint32_t)rx_data[2]);
   
   return value;
}


uint8_t BME280_reading_calibration(void)
{
  uint8_t read_status = 0;

  read_status = BME280_read_byte(BME280_REGISTER_STATUS);

  return (read_status & (1 << 0)) != 0;
}


void BME280_read_coefficients(void)
{
    calibration.dig_T1 = BME280_read_word_little_endian(BME280_DIG_T1_REG);
    calibration.dig_T2 = BME280_read_signed_word_little_endian(BME280_DIG_T2_REG);
    calibration.dig_T3 = BME280_read_signed_word_little_endian(BME280_DIG_T3_REG);
    
    calibration.dig_P1 = BME280_read_word_little_endian(BME280_DIG_P1_REG);
    calibration.dig_P2 = BME280_read_signed_word_little_endian(BME280_DIG_P2_REG);
    calibration.dig_P3 = BME280_read_signed_word_little_endian(BME280_DIG_P3_REG);
    calibration.dig_P4 = BME280_read_signed_word_little_endian(BME280_DIG_P4_REG);
    calibration.dig_P5 = BME280_read_signed_word_little_endian(BME280_DIG_P5_REG);
    calibration.dig_P6 = BME280_read_signed_word_little_endian(BME280_DIG_P6_REG);
    calibration.dig_P7 = BME280_read_signed_word_little_endian(BME280_DIG_P7_REG);
    calibration.dig_P8 = BME280_read_signed_word_little_endian(BME280_DIG_P8_REG);
    calibration.dig_P9 = BME280_read_signed_word_little_endian(BME280_DIG_P9_REG);
    
    calibration.dig_H1 = BME280_read_byte(BME280_DIG_H1_REG);
    calibration.dig_H2 = BME280_read_signed_word_little_endian(BME280_DIG_H2_REG);
    calibration.dig_H3 = BME280_read_byte(BME280_DIG_H3_REG);
    calibration.dig_H4 = (BME280_read_byte(BME280_DIG_H4_REG) << 4) + (BME280_read_byte(1 + BME280_DIG_H4_REG) & 0x0F);
    calibration.dig_H5 = (BME280_read_byte(1 + BME280_DIG_H5_REG) << 4) + (BME280_read_byte(BME280_DIG_H5_REG) >> 4);
    calibration.dig_H6 = (signed char)BME280_read_byte(BME280_DIG_H6_REG);
}


float BME280_get_temperature(void)
{
    float BME280_t = 0;

    int32_t temp1 = 0;
    int32_t temp2 = 0;
    int32_t adc_T = 0;

    adc_T = BME280_read_long(BME280_REGISTER_TEMPDATA);
    adc_T >>= 4;
    
    temp1 = (((((adc_T >> 3) - ((int32_t)calibration.dig_T1 << 1)))
	     * ((int32_t)calibration.dig_T2)) >> 11);

    temp2 = ((((((adc_T >> 4) - ((int32_t)calibration.dig_T1))
	     * ((adc_T >> 4) - ((int32_t)calibration.dig_T1))) >> 12)
	     * ((int32_t)calibration.dig_T3)) >> 14);
    
    t_fine = (temp2 + temp1);
        
    temp1 = (((t_fine * 5) + 128) >> 8);
    BME280_t = (temp1 / 100.0);

    BME280_t += t_offset;

    return BME280_t;
}


float BME280_get_pressure(void) 
{
    float BME280_p = 0;
    
    int64_t p = 0;
    int64_t temp1 = 0;
    int64_t temp2 = 0;

    int32_t adc_P = 0;

    adc_P = BME280_read_long(BME280_REGISTER_PRESSUREDATA);     
    adc_P >>= 4;

    temp1 = (((int64_t)t_fine) - 128000);

    temp2 = (temp1 * temp1 * (int64_t)calibration.dig_P6);

    temp2 = (temp2 + ((temp1 * (int64_t)calibration.dig_P5) << 17));

    temp2 = (temp2 + (((int64_t)calibration.dig_P4) << 35));

    temp1 = ((((temp1 * temp1) * (int64_t)calibration.dig_P3) >> 8)
	      + ((temp1 * (int64_t)calibration.dig_P2) << 12));

    temp1 = ((((((int64_t)1) << 47) + temp1))
	      * ((int64_t)calibration.dig_P1) >> 33);
    
    if(temp1 == 0)
    {
        BME280_p = 0;
    }
    
    p = (1048576 - adc_P);
    p = ((((p << 31) - temp2) * 3125) / temp1);
    
    temp1 = ((((int64_t)calibration.dig_P9)
	      * (p >> 13)
	      * (p >> 13)) >> 25);
    temp2 = ((((int64_t)calibration.dig_P8) * p) >> 19);
        
    p = (((p + temp1 + temp2) >> 8)
	  + (((int64_t)calibration.dig_P7) << 4));

    BME280_p = ((float)p / 256);

    BME280_p /= 100.0;

    return BME280_p;
}


float BME280_get_relative_humidity(void)
{
    float BME280_rh = 0;
    
    int32_t adc_H = 0;
    int32_t v_x1_u32r = 0;
    
    adc_H = BME280_read_word(BME280_REGISTER_HUMIDDATA);

    v_x1_u32r = (t_fine - ((int32_t)76800));
    
    v_x1_u32r = (((((adc_H << 14)
	         - (((int32_t)calibration.dig_H4) << 20) -
                 (((int32_t)calibration.dig_H5) * v_x1_u32r))
	         + ((int32_t)16384)) >> 15)
	         * (((((((v_x1_u32r * ((signed long)calibration.dig_H6)) >> 10)
	         * (((v_x1_u32r * ((signed long)calibration.dig_H3)) >> 11)
	         + ((int32_t)32768))) >> 10)
	         + ((int32_t)2097152))
	         * ((int32_t)calibration.dig_H2) + 8192) >> 14));
    
    v_x1_u32r = (v_x1_u32r
	         - (((((v_x1_u32r >> 15)
	         * (v_x1_u32r >> 15)) >> 7)
	         * ((int32_t)calibration.dig_H1)) >> 4));
    
    v_x1_u32r = (v_x1_u32r < 0) ? 0 : v_x1_u32r;
    v_x1_u32r = (v_x1_u32r > 419430400) ? 419430400 : v_x1_u32r;
    
    adc_H = (v_x1_u32r >> 12);
    BME280_rh = (adc_H / 1024.0);

    return BME280_rh;
}
