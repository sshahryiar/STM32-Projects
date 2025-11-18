#pragma once


#include "main.h"


extern TIM_HandleTypeDef htim14;


void MX_TIM14_Init(void);
void delay_us(uint16_t us);
void delay_ms(uint16_t ms);
