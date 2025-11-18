#pragma once


#include "main.h"
#include "timer_delay.h"


#define ONEWIRE_PORT    		GPIOA
#define ONEWIRE_PIN     		0

#define DS18B20_OUT_LOW()   	(ONEWIRE_PORT->BSRR = (1U << (ONEWIRE_PIN + 16)))
#define DS18B20_OUT_HIGH()  	(ONEWIRE_PORT->BSRR = (1U << ONEWIRE_PIN))
#define DS18B20_IN()        	((ONEWIRE_PORT->IDR >> ONEWIRE_PIN) & 0x1)


void onewire_GPIO_Init(void);
void onewire_set_pin_in(void);
void onewire_set_pin_out(void);
uint8_t onewire_reset(void);
void onewire_write_bit(uint8_t bit_value);
uint8_t onewire_read_bit(void);
void onewire_write(uint8_t value);
uint8_t onewire_read(void);
