#pragma once


#include "main.h"
#include "HW_I2C.h"
#include "SW_I2C.h"


#define use_SW_I2C      0
#define use_HW_I2C      1

#define I2C_peripheral  use_HW_I2C


#if(I2C_peripheral == use_SW_I2C)
#include "SW_I2C.h"

#elif(I2C_peripheral == use_SW_I2C)
#include "HW_I2C.h"

#endif


#define PCF8574_I2C_address  0x4E


uint8_t PCF8574_read(uint8_t reg);
void PCF8574_write(uint8_t value);
