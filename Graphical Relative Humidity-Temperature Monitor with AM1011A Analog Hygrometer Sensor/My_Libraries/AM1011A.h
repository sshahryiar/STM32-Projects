#include "main.h"


#define T_step        	10.0
#define T_min        	-40.0
#define R_fixed      	1000.0
#define ADC_max_count   4095.0
#define ADC_max_voltage	3.3
#define Source_Voltage	4.56
#define array_size	 	17


unsigned char binary_search(uint32_t value);
float map_value(float value, float x_min, float x_max, float y_min, float y_max);
float AM1101A_get_T_range(unsigned char value);
float AM1101A_get_T(uint32_t adc_value);
float AM1101A_get_RH(uint32_t adc_value);
