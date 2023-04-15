#include "ADC.h"
#include "Glass_LCD.c"


#define TS_CAL1       0x2A4
#define TS_CAL2       0x355

#define offset        100


unsigned char samples = 0;

unsigned int avg = 0;

signed long adc_accum = 0;


void setup_LCD();
void setup_ADC();
void setup_GPIOs();
void show_value(signed int value, unsigned char type);
void show_const_msgs(unsigned char pos, unsigned char type);
void show_degree_C(unsigned char pos);
void clear_disp(unsigned char pos);


void ADC_ISR() 
iv IVT_INT_ADC1
ics ICS_AUTO 
{
    if(get_ADC_AWD_flag() != 0)
    {
        GPIOB_pin_high(6);
        clear_ADC_AWD_flag();
    }
    
    if(get_ADC_regular_channel_EOC_state() != 0)
    {
        adc_accum += (ADC_DR & 0x0FFF);;
        samples++;
        if(samples >= 16)
        {
            avg = (adc_accum >> 4);
            adc_accum = 0;
            samples = 0;
        }
    }
}


void main() 
{
     bit disp;
     float t = 0;
     
     setup_LCD();
     setup_ADC();
     setup_GPIOs();
     
     while(1)
     {
             if(get_GPIOA_pin_state(0) == 1)
             {
                 while(get_GPIOA_pin_state(0) == 1);
                 disp = ~disp;
             }

             switch(disp)
             {
                 case 1:
                 {
                     show_value(avg, 0);
                     break;
                 }
                 default:
                 {
                     t = ((110.0 - 30.0) / (TS_CAL2 - TS_CAL1));
                     t *= (avg - TS_CAL1);
                     t += 30.0;
                     t *= 10;
                     t -= offset;

                     show_value(t, 1);
                     break;
                 }
             }

             delay_ms(200);
             GPIOB_pin_low(6);
             set_ADC_regular_conversions(true);

     };
}


void setup_LCD()
{
     LCD_GLASS_Init();
     LCD_GLASS_Clear();
}


void setup_ADC()
{
     enable_ADC_low_power(true);
     enable_ADC(true);
     enable_ADC_block(false);
     set_ADC_configuration(Bank_A);
     set_ADC_resolution(ADC_12_bits);
     set_ADC_data_alignment(right_align);
     set_ADC_power_down_during_delay_phase(ADC_powered_down_during_delay);
     set_ADC_power_down_during_idle_phase(ADC_powered_down_when_waiting_for_start_event);
     set_ADC_end_of_conversion_selection(EOC_at_each_conversion);
     set_ADC_EOC_delay(until_read);
     set_ADC_reference_and_temperature_sensor(true);
     set_ADC_AWD_for_regular_channels(true);
     set_ADC_AWD_on_single_channel_in_scan_mode(AWD_enabled_on_single_channel);
     set_ADC_AWD_channel(16);
     set_ADC_AWD_high_threshold(700);
     set_ADC_AWD_low_threshold(600);
     enable_ADC_continuous_conversion(false);
     set_ADC_sample_time(sample_time_96_cycles, 16);
     set_ADC_regular_number_of_conversions(1);
     set_ADC_regular_sequence(1, 16);
     set_ADC_prescaler(HSI_div_4);
     set_ADC_AWD_interrupt(true);
     set_ADC_end_of_conversion_interrupt(true);
     NVIC_IntEnable(IVT_INT_ADC1);
     NVIC_SetIntPriority(IVT_INT_ADC1, _NVIC_INT_PRIORITY_LVL1);
     delay_ms(1);
     ADC_SR = 0x0000;
     ADC_CSR = 0x0000;
     enable_ADC_block(true);
     delay_ms(20);
}


void setup_GPIOs()
{
    enable_GPIOA(true);
    setup_GPIOA(0, GPIO_input, output_PP, medium_speed, no_pull_resistor);
    
    enable_GPIOB(true);
    setup_GPIOB(6, GPIO_output, output_PP, medium_speed, no_pull_resistor);
}


void show_value(signed int value, unsigned char type)
{
    unsigned char ch[1] = {0x20};

    
    if(value > 0)
    {
        ch[0] = 0x20;
    }
    else
    {
        ch[0] = 0x2D;
        value = -value;
    }
    LCD_GLASS_WriteChar(ch, false, 0, 1);
    
    if((value > 999) && (value <= 9999))
    {
    
        ch[0] = ((value / 1000) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 2);
        ch[0] = (((value / 100) % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 3);
        ch[0] = (((value / 10) % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, type, 0, 4);
        ch[0] = ((value % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 5);
        
        show_const_msgs(6, type);
    }
    else if((value > 99) && (value <= 999))
    {
        ch[0] = (((value / 100) % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 2);
        ch[0] = (((value / 10) % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, type, 0, 3);
        ch[0] = ((value % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 4);
        
        show_const_msgs(5, type);

        ch[0] = 0x20;
        LCD_GLASS_WriteChar(ch, false, 0, 7);

    }
    else if((value >= 0) && (value <= 99))
    {
        ch[0] = (((value / 10) % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, type, 0, 2);
        ch[0] = ((value % 10) + 0x30);
        LCD_GLASS_WriteChar(ch, false, 0, 3);
        
        show_const_msgs(4, type);
        clear_disp(6);
    }
}


void show_const_msgs(unsigned char pos, unsigned char type)
{
    switch(type)
    {
        case 1:
        {
            show_degree_C(pos);
            break;
        }
        default:
        {
            clear_disp(pos);
            break;
        }
    }
}


void show_degree_C(unsigned char pos)
{
     unsigned char ch[1] = {0x20};
    
     ch[0] = '°';
     LCD_GLASS_WriteChar(ch, false, 0, pos);
     ch[0] = 'C';
     LCD_GLASS_WriteChar(ch, false, 0, (1 + pos));
}


void clear_disp(unsigned char pos)
{
     unsigned char ch[1] = {0x20};

     ch[0] = 0x20;
     LCD_GLASS_WriteChar(ch, false, 0, pos);
     ch[0] = 0x20;
     LCD_GLASS_WriteChar(ch, false, 0, (1 + pos));
}