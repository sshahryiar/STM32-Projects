#pragma once

#include "main.h"
#include "timer_delay.h"


#define SDA_HIGH()      HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10, SET)
#define SDA_LOW()       HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10, RESET)

#define SCL_HIGH()      HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, SET)
#define SCL_LOW()       HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, RESET)

#define SDA_IN()        HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_10)

#define I2C_ACK         0xFF
#define I2C_NACK        0x00

#define I2C_timeout     20000


void SW_I2C_GPIO_init(void);
void SW_I2C_SDA_OUT_init(void);
void SW_I2C_SDA_IN_init(void);
void SW_I2C_init(void);
void SW_I2C_start(void);
void SW_I2C_stop(void);
uint8_t SW_I2C_read(uint8_t ack);
void SW_I2C_write(uint8_t value);
void SW_I2C_ACK_NACK(uint8_t mode);
uint8_t SW_I2C_wait_ACK(void);
