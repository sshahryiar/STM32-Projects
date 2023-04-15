#include "TM1637.h"



const unsigned char seg_data[10] =
{
	0x3F, // 0
	0x06, // 1
	0x5B, // 2
	0x4F, // 3
	0x66, // 4
	0x6D, // 5
	0x7D, // 6
	0x07, // 7
	0x7F, // 8
	0x6F  // 9
};


void TM1637_init(void)
{
	TM1637_send_command(TM1637_CMD_SET_DSIPLAY | TM1637_BRIGHTNESS_MAX | TM1637_SET_DISPLAY_ON);
	TM1637_clear();
}


void TM1637_start(void)
{

	HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_SET);
	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_SET);
	HAL_Delay(TM1637_DELAY_US);
	HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_RESET);
}


void TM1637_stop(void)
{

	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_RESET);
	HAL_Delay(TM1637_DELAY_US);

	HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_RESET);
	HAL_Delay(TM1637_DELAY_US);

	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_SET);
	HAL_Delay(TM1637_DELAY_US);

	HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_SET);
}


unsigned char TM1637_write_byte(unsigned char value)
{
	unsigned char i = 0x08;
	unsigned char ack = 0;

	GPIO_InitTypeDef GPIO_InitStruct;

	while(i)
	{
		HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_RESET);
		HAL_Delay(TM1637_DELAY_US);

		if(value & 0x01)
		{
			HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_SET);
		} 

		else 
		{
			HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_RESET);
		}

		HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_SET);
		HAL_Delay(TM1637_DELAY_US);

		value >>= 1;
		i--;
	}

	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_RESET);

	GPIO_InitStruct.Pin = TM1637_DAT_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(TM1637_DAT_GPIO_Port, &GPIO_InitStruct);

	HAL_Delay(TM1637_DELAY_US);

	ack = HAL_GPIO_ReadPin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin);
	
	GPIO_InitStruct.Pin = TM1637_DAT_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(TM1637_DAT_GPIO_Port, &GPIO_InitStruct);

	if(ack)
	{
		HAL_GPIO_WritePin(TM1637_DAT_GPIO_Port, TM1637_DAT_Pin, GPIO_PIN_RESET);
	}

	HAL_Delay(TM1637_DELAY_US);

	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_SET);
	HAL_Delay(TM1637_DELAY_US);

	HAL_GPIO_WritePin(TM1637_CLK_GPIO_Port, TM1637_CLK_Pin, GPIO_PIN_RESET);
	HAL_Delay(TM1637_DELAY_US);


	return (ack);
}


void TM1637_send_command(unsigned char value)
{

	TM1637_start();
	TM1637_write_byte(value);
	TM1637_stop();
}


void TM1637_clear(void)
{
	signed char i = (TM1637_POSITION_MAX - 1);

	while(i > -1)
	{
		TM1637_display_segments(i, 0x00, 0x00);
		i--;
	};
}



void TM1637_display_segments(unsigned char position, unsigned char segment_value, unsigned char colon_state)
{
	if(position == 1)
	{
		switch(colon_state)
		{
			case 1:
			{
				segment_value |= 0x80;
				break;
			}

			default:
			{
				segment_value &= 0x7F;
				break;
			}
		}
	}

	TM1637_send_command(TM1637_CMD_SET_DATA | TM1637_SET_DATA_F_ADDR);
	TM1637_start();
	TM1637_write_byte(TM1637_CMD_SET_ADDR | (position & (TM1637_POSITION_MAX - 1)));
	TM1637_write_byte(segment_value);
	TM1637_stop();
}
