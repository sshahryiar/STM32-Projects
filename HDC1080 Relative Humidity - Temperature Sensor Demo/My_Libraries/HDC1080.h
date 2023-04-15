#include "main.h"


I2C_HandleTypeDef hi2c1;


#define HDC1080_I2C_Address				0x80

#define HDC1080_Temperature_REG			0x00
#define HDC1080_Humidity_REG			0x01
#define HDC1080_Configuration_REG		0x02
#define HDC1080_ID1_REG					0xFB
#define HDC1080_ID2_REG					0xFC
#define HDC1080_ID3_REG					0xFD
#define HDC1080_Manufacturer_ID_REG		0xFE
#define HDC1080_Device_ID_REG			0xFF

#define HDC1080_NORMAL_CMD				0x00
#define HDC1080_SW_RST_CMD				0x80

#define HDC1080_HEATER_OFF_CMD			0x00
#define HDC1080_HEATER_ON_CMD			0x20

#define HDC1080_INDEPENDENT_MODE		0x00
#define HDC1080_SEQUENCE_MODE			0x10

#define HDC1080_BATT_HIGH				0x00
#define HDC1080_BATT_LOW				0x08

#define HDC1080_TEMP_RES_14_BIT			0x00
#define HDC1080_TEMP_RES_11_BIT			0x04

#define HDC1080_HUM_RES_14_BIT			0x00
#define HDC1080_HUM_RES_11_BIT			0x01
#define HDC1080_HUM_RES_8_BIT			0x02

#define T_Coff							0.0025177 // 165 / 2^16
#define RH_Coff							0.0015259 // 100 / 2^16

#define HDC1080_conversion_delay		10


void HDC1080_init(void);
void HDC1080_write_configutaion_register(uint8_t value);
uint16_t HDC1080_read_configutaion_register(void);
uint16_t HDC1080_read_manufacturer_ID(void);
uint16_t HDC1080_read_device_ID(void);
uint16_t HDC1080_read_serial_ID_H(void);
uint16_t HDC1080_read_serial_ID_M(void);
uint8_t HDC1080_read_serial_ID_L(void);
float HDC1080_read_temperature(void);
float HDC1080_read_humidity(void);
