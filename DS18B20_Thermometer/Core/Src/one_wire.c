#include "one_wire.h"
    

void onewire_GPIO_Init(void)
{
    __HAL_RCC_GPIOA_CLK_ENABLE();

    // PA0 -> Output Open-Drain, No Pull
    ONEWIRE_PORT->MODER &= ~(3U << (ONEWIRE_PIN * 2));
    ONEWIRE_PORT->MODER |=  (1U << (ONEWIRE_PIN * 2));   // Output
    ONEWIRE_PORT->OTYPER |= (1U << ONEWIRE_PIN);         // Open-drain
    ONEWIRE_PORT->PUPDR  &= ~(3U << (ONEWIRE_PIN * 2));  // No pull-up/pull-down
}

void onewire_set_pin_in(void)
{
    ONEWIRE_PORT->MODER &= ~(3U << (ONEWIRE_PIN * 2));   // Input
}

void onewire_set_pin_out(void)
{
    ONEWIRE_PORT->MODER &= ~(3U << (ONEWIRE_PIN * 2));
    ONEWIRE_PORT->MODER |=  (1U << (ONEWIRE_PIN * 2));   // Output
}


uint8_t onewire_reset(void)
{
    uint8_t presence;

    onewire_set_pin_out();
    DS18B20_OUT_LOW();
    delay_us(480);
    DS18B20_OUT_HIGH();

    onewire_set_pin_in();
    delay_us(70);
    presence = DS18B20_IN();
    delay_us(410);

    return presence; // 0 = device present
}


void onewire_write_bit(uint8_t bit_value)
{
    onewire_set_pin_out();
    DS18B20_OUT_LOW();

    if(bit_value)
    {
        delay_us(5);
        DS18B20_OUT_HIGH();
        delay_us(55);
    }
    else
    {
        delay_us(60);
        DS18B20_OUT_HIGH();
        delay_us(5);
    }
}


uint8_t onewire_read_bit(void)
{
    uint8_t bit;

    onewire_set_pin_out();
    DS18B20_OUT_LOW();
    delay_us(3);
    DS18B20_OUT_HIGH();

    onewire_set_pin_in();
    delay_us(10);
    bit = DS18B20_IN();
    delay_us(50);

    return bit;
}


void onewire_write(uint8_t value)
{
	uint8_t i = 0;

	for(i = 0; i < 8; i++)
    {
        onewire_write_bit(value & 0x01);
        value >>= 1;
    }
}


uint8_t onewire_read(void)
{
	int8_t i = 0;
    uint8_t value = 0;

    for(i = 0; i < 8; i++)
    {
        if (onewire_read_bit())
        {
            value |= (1 << i);
        }
    }
    return value;
}
