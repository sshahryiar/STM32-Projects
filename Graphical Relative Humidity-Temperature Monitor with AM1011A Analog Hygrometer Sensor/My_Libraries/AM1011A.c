#include "AM1011A.h"


const uint32_t R_table[array_size] =
{
	218997,  // -40  // 0
	123029,  // -30  // 1
	72148,   // -20  // 2
    43950,   // -10  // 3
    27695,   // 0    // 4
    17988,   // 10   // 5
    12006,   // 20   // 6
    8180,	 // 30	 // 7
    5679,	 // 40	 // 8
    4024,	 // 50	 // 9
    2905,	 // 60	 // 10
    2133,	 // 70	 // 11
    1591,	 //	80   // 12
    1204,	 // 90	 // 13
    923,	 // 100	 // 14
    716,	 // 110	 // 15
    562 	 // 120	 // 16
};


unsigned char binary_search(uint32_t value)
{
    signed char h = (array_size - 1);
    signed char l = 0;
    signed char m = (array_size >> 1);
    
    while ((l <= h) && (l < array_size) && (h > 0))
    {                                    
        if(value > (R_table[m]))
        {
            h = (m - 1);
        }

        else
        {
            l = (m + 1);
        }

        m = (h + l); 
        m >>= 1;
    }
    
    return ((unsigned char)m);
}


float map_value(float value, float x_min, float x_max, float y_min, float y_max)
{
	return (y_min + (((y_max - y_min) / (x_max - x_min)) * (value - x_min)));
}   


float AM1101A_get_T_range(unsigned char value)
{
    return ((value * T_step) + T_min);
}


float AM1101A_get_T(uint32_t adc_value)
{
    float t = 0;
    float RT = 0;   
    float T1 = 0;
    float T2 = 0; 
    unsigned char tmp = 0;  
    
    t = (((float)adc_value * ADC_max_voltage) / Source_Voltage);
    RT = ((ADC_max_count / t) - 1.0);
    RT *= R_fixed;   

    tmp = binary_search(RT);

    T1 = AM1101A_get_T_range((tmp + 1));
    T2 = AM1101A_get_T_range(tmp);

    t = map_value(RT, (float)R_table[tmp + 1], (float)R_table[tmp], T1, T2);

    return t;
}


float AM1101A_get_RH(uint32_t adc_value)
{
	return map_value(adc_value, 0.0, 3722.0, 0.0, 100.0);
}
