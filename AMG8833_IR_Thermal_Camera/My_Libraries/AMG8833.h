#include "main.h"


#define AMG8833_I2C_ADDR                          0xD0

#define AMG8833_PIXEL_COUNT                       0x40

#define AMG8833_POWER_CONTROL_REG                 0x00
#define AMG8833_RESET_REG                         0x01
#define AMG8833_FRAME_RATE_REG                    0x02
#define AMG8833_INTERRUPT_CONTROL_REG             0x03
#define AMG8833_STATUS_REG                        0x04
#define AMG8833_STATUS_CLEAR_REG                  0x05
#define AMG8833_AVERAGE_REG                       0x07
#define AMG8833_INT_LEVEL_REG_HL                  0x08
#define AMG8833_INT_LEVEL_REG_HH                  0x09
#define AMG8833_INT_LEVEL_REG_LL                  0x0A
#define AMG8833_INT_LEVEL_REG_LH                  0x0B
#define AMG8833_INT_LEVEL_REG_YSL                 0x0C
#define AMG8833_INT_LEVEL_REG_YSH                 0x0D
#define AMG8833_THERMISTOR_REG_L                  0x0E
#define AMG8833_THERMISTOR_REG_H                  0x0F
#define AMG8833_INTERRUPT_TABLE_1_8_REG           0x10
#define AMG8833_INTERRUPT_TABLE_9_16_REG          0x11
#define AMG8833_INTERRUPT_TABLE_17_24_REG         0x12
#define AMG8833_INTERRUPT_TABLE_25_32_REG         0x13
#define AMG8833_INTERRUPT_TABLE_33_40_REG         0x14
#define AMG8833_INTERRUPT_TABLE_41_48_REG         0x15
#define AMG8833_INTERRUPT_TABLE_49_56_REG         0x16
#define AMG8833_INTERRUPT_TABLE_57_64_REG         0x17

#define AMG8833_TEMPERATURE_REG_L                 0x80
#define AMG8833_TEMPERATURE_REG_H                 0x81


#define AMG8833_INT_ACTIVE                        0x01
#define AMG8833_INT_ABS_VALUE_INT_MODE            0x02

#define AMG8833_NORMAL_MODE                       0x00
#define AMG8833_SLEEP_MODE                        0x10
#define AMG8833_STAND_BY_MODE_60S_INTERMITTENCE   0x20
#define AMG8833_STAND_BY_MODE_10S_INTERMITTENCE   0x21


#define AMG8833_CLEAR_ALL_STATUS                  0x0E
#define AMG8833_CLEAR_INTERRUPT_STATUS            0x02

#define AMG8833_INIT_RESET_VALUE                  0x3F
#define AMG8833_FLAG_RESET_VALUE                  0x30


I2C_HandleTypeDef hi2c2;


void AMG8833_init(void);
void AMG8833_write_byte(uint8_t address, uint8_t value);
void AMG8833_write_word(uint8_t address, uint16_t value);
uint8_t AMG8833_read_byte(uint8_t address);
uint16_t AMG8833_read_word(uint8_t address);
void AMG8833_set_upper_interrupt_limit(uint16_t value);
void AMG8833_set_lower_interrupt_limit(uint16_t value);
void AMG8833_set_interrupt_hystersis_level(uint16_t value);
uint8_t AMG8833_get_interrupt_status(void);
void AMG8833_get_pixel_interrupt_status(uint8_t *value);
float AMG8833_get_temperature(void);
void AMG8833_read_pixel_temperature_register_value(int16_t *value);
void AMG8833_read_pixel_temperature(float *value);
