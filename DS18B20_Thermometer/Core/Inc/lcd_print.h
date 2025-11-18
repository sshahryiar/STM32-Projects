#pragma once

#include "main.h"
#include "I2C_LCD.h"


#define no_of_custom_symbol     1
#define array_size_per_symbol   8
#define array_size              (array_size_per_symbol * no_of_custom_symbol)


void load_custom_symbol(void);
void print_symbol(uint8_t x_pos, uint8_t y_pos, uint8_t symbol_index);
void print_C(uint8_t x_pos, uint8_t y_pos, int16_t value);
void print_I(uint8_t x_pos, uint8_t y_pos, int32_t value);
void print_D(uint8_t x_pos, uint8_t y_pos, int16_t value, uint8_t points);
void print_F(uint8_t x_pos, uint8_t y_pos, float value, uint8_t points);
