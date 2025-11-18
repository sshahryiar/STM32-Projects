#include "timer_delay.h"


void MX_TIM14_Init(void)
{
	__HAL_RCC_TIM14_CLK_ENABLE();

	htim14.Instance = TIM14;
	htim14.Init.Prescaler = (HAL_RCC_GetPCLK1Freq() / 2000000) - 1;
	htim14.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim14.Init.Period = 65535;
	htim14.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim14.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	HAL_TIM_Base_Init(&htim14);
	HAL_TIM_Base_Start(&htim14);
}


void delay_us(uint16_t us)
{
    uint16_t start = __HAL_TIM_GET_COUNTER(&htim14);
    while ((uint16_t)(__HAL_TIM_GET_COUNTER(&htim14) - start) < us);
}


void delay_ms(uint16_t ms)
{
	while(ms--)
	{
		delay_us(1000);
	}
}
