#include "main.h"


#define TMD2771x_I2C_ADDR				0x72


#define TMD2771x_ENABLE_REG					0x00
#define TMD2771x_ATIME_REG					0x01
#define TMD2771x_PTIME_REG					0x02
#define TMD2771x_WTIME_REG					0x03
#define TMD2771x_AILTL_REG					0x04
#define TMD2771x_AILTH_REG					0x05
#define TMD2771x_AIHTL_REG					0x06
#define TMD2771x_AIHTH_REG					0x07
#define TMD2771x_PILTL_REG					0x08
#define TMD2771x_PILTH_REG					0x09
#define TMD2771x_PIHTL_REG					0x0A
#define TMD2771x_PIHTH_REG					0x0B
#define TMD2771x_PERS_REG					0x0C
#define TMD2771x_CONFIG_REG					0x0D
#define TMD2771x_PPULSE_REG					0x0E
#define TMD2771x_CONTROL_REG				0x0F
#define TMD2771x_ID_REG						0x12
#define TMD2771x_STATUS_REG					0x13
#define TMD2771x_C0DATA_REG					0x14
#define TMD2771x_C0DATAH_REG				0x15
#define TMD2771x_C1DATA_REG					0x16
#define TMD2771x_C1DATAH_REG				0x17
#define TMD2771x_PDATAL_REG					0x18
#define TMD2771x_PDATAH_REG					0x19


#define TMD2771x_command_mode				0x80
#define TMD2771x_data_mode					0x00

#define TMD2771x_repeat_byte_protocol		0x00
#define TMD2771x_auto_increment_protocol	0x20
#define TMD2771x_special_function			0x60


#define TMD2771x_CPL						(101.0F / 24.0F)

#define TMD27711_device_ID					0x20
#define TMD27713_device_ID					0x29


I2C_HandleTypeDef hi2c1;


uint8_t TMD2771x_init(void);
uint16_t make_word(uint8_t HB, uint8_t LB);
void TMD2771x_write_byte(uint8_t address, uint8_t value);
uint8_t TMD2771x_read_byte(uint8_t address);
void TMD2771x_get_readings(uint16_t *als_value, uint16_t *prox_value);
