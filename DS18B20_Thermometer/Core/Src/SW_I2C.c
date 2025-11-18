#include "SW_I2C.h"


void SW_I2C_GPIO_init(void)
{
	__HAL_RCC_GPIOA_CLK_ENABLE();
    SW_I2C_SDA_OUT_init();
}


void SW_I2C_SDA_OUT_init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    GPIO_InitStruct.Pin = (GPIO_PIN_9 | GPIO_PIN_10);
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}



void SW_I2C_SDA_IN_init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    GPIO_InitStruct.Pin = GPIO_PIN_10;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = GPIO_PIN_9;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}


void SW_I2C_init(void)
{
    SW_I2C_GPIO_init();
    SW_I2C_SDA_OUT_init();
    HAL_Delay(10);
    SDA_HIGH();
    SCL_HIGH();
}


void SW_I2C_start(void)
{
    SW_I2C_SDA_OUT_init();
    SDA_HIGH();
    SCL_HIGH();
    //Delay_Us(40);
    SDA_LOW();
    //Delay_Us(40);
    SCL_LOW();
}


void SW_I2C_stop(void)
{
    SW_I2C_SDA_OUT_init();
    SDA_LOW();
    SCL_HIGH();
    //Delay_Us(40);
    SDA_HIGH();
    SCL_HIGH();
    //Delay_Us(40);
}


uint8_t SW_I2C_read(uint8_t ack)
{
    uint8_t i = 8;
    uint8_t j = 0;

   SW_I2C_SDA_IN_init();

    while(i > 0)
    {
        SCL_LOW();
        //Delay_Us(20);
        SCL_HIGH();
        //Delay_Us(20);
        j <<= 1;

        if(SDA_IN())
        {
            j++;
        }

        //Delay_Us(10);
        i--;
    };

    switch(ack)
    {
        case I2C_ACK:
        {
            SW_I2C_ACK_NACK(I2C_ACK);
            break;
        }
        default:
        {
            SW_I2C_ACK_NACK(I2C_NACK);
            break;
        }
    }

    return j;
}


void SW_I2C_write(uint8_t value)
{
    uint8_t i = 8;

    SW_I2C_SDA_OUT_init();
    SCL_LOW();

    while(i > 0)
    {
        if(((value & 0x80) >> 7))
        {
            SDA_HIGH();
        }
        else
        {
            SDA_LOW();
        }

        value <<= 1;
        //Delay_Us(20);
        SCL_HIGH();
        //Delay_Us(20);
        SCL_LOW();
        //Delay_Us(20);
        i--;
    };
}


void SW_I2C_ACK_NACK(uint8_t mode)
{
    SW_I2C_SDA_OUT_init();
    SCL_LOW();

    switch(mode)
    {
        case I2C_ACK:
        {
            SDA_LOW();
            break;
        }
        default:
        {
            SDA_HIGH();
            break;
        }
    }

    //Delay_Us(20);
    SCL_HIGH();
    //Delay_Us(20);
    SCL_LOW();
}


uint8_t SW_I2C_wait_ACK(void)
{
    uint16_t timeout = 0;

    SW_I2C_SDA_OUT_init();

    SDA_HIGH();
    //Delay_Us(10);
    SCL_HIGH();
    //Delay_Us(10);

    SW_I2C_SDA_IN_init();

    while(SDA_IN())
    {
        timeout++;

        if(timeout > I2C_timeout)
        {
            SW_I2C_stop();
            return 1;
        }
    };

    SCL_LOW();
    return 0;
}

