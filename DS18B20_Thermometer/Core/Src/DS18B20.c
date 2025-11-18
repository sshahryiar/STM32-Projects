#include "DS18B20.h"


void DS18B20_init(void)                             
{                                       
	onewire_GPIO_Init();
	onewire_reset();
	delay_ms(100);
}              


float DS18B20_get_temperature(void)
{                                               
	uint8_t msb = 0;
	uint8_t lsb = 0;
	int32_t temp_raw = 0;
	register float temp = 0.0;
	                       
	if(onewire_reset())
	{
	    return -1000.0;
	}

	onewire_write(DS18B20_skip_ROM);
	onewire_write(DS18B20_convert_T);
   	
	switch(DS18B20_resolution)
	{
		case 11:                                     
		{              
			delay_ms(375);
			break;
		}           
		case 10:                             
		{                                 
			delay_ms(188);
			break;
		}                                        
		case 9:                                   
		{                                                
			delay_ms(94);
			break;                            
		}                        
		default:
		{
			delay_ms(750);
			break;
		}
	}                  

	onewire_reset(); 
	onewire_write(DS18B20_skip_ROM);
	onewire_write(DS18B20_read_scratchpad);

	lsb = onewire_read();
	msb = onewire_read();

	temp_raw = msb;
	temp_raw <<= 8;
	temp_raw += lsb;
   	
	switch(DS18B20_resolution)
	{
		case 11: 
		{	        
			temp_raw &= ~0x01;
			break;
		}                
		case 10:
		{            
			temp_raw &= ~0x03;
			break;
		}  
		case 9:                                 
		{                                 
			temp_raw &= ~0x07;
			break;      
		}
		default:
		{
			break;
		}
	}  
	
	temp = (((float)temp_raw) * 0.0625);

	return temp;
}
