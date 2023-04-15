/*                Definitons for ADC Module                */


//Miscellaneous

#define enable                                                                           0x01
#define disable                                                                          0x00

#define true                                                                             0x01
#define false                                                                            0x00

#define high                                                                             0x01
#define low                                                                              0x00

#define reset                                                                            0x00


//ADC function definitions

#define enable_ADC(mode)                                                                 RCC_APB2ENRbits.ADC1EN = mode
#define enable_ADC_low_power(mode)                                                       RCC_APB2LPENRbits.ADC1LPEN = mode

/* Functions for ADC status register (ADC_SR) */

#define get_ADC_injected_channel_not_ready_state()                                       get_bit(ADC_SR, 9)
#define get_ADC_regular_channel_not_ready_state()                                        get_bit(ADC_SR, 8)
#define get_ADC_ON_status()                                                              get_bit(ADC_SR, 6)
#define get_ADC_overrun_state()                                                          get_bit(ADC_SR, 5)
#define get_ADC_regular_channel_start_flag()                                             get_bit(ADC_SR, 4)
#define get_ADC_injected_channel_start_flag()                                            get_bit(ADC_SR, 3)
#define get_ADC_injected_channel_EOC_state()                                             get_bit(ADC_SR, 2)
#define get_ADC_regular_channel_EOC_state()                                              get_bit(ADC_SR, 1)
#define get_ADC_AWD_flag()                                                               get_bit(ADC_SR, 0)

#define clear_ADC_EOC_flag()                                                             ADC_SRbits.EOC = 0
#define clear_ADC_AWD_flag()                                                             ADC_SRbits.AWD = 0
#define clear_ADC_overrun()                                                              ADC_SRbits.OVR = 0
#define clear_ADC_JEOC_flag()                                                            ADC_SRbits.JEOC = 0
#define clear_ADC_regular_channel_start_flag()                                           ADC_SRbits.STRT = 0
#define clear_ADC_injected_channel_start_flag()                                          ADC_SRbits.JSTRT = 0


/* Functions and definitions for ADC control register 1 (ADC_CR1) */

#define set_ADC_overrun_interrupt(mode)                                                  ADC_CR1bits.OVRIE = mode


#define ADC_12_bits                                                                      0x0
#define ADC_10_bits                                                                      0x1
#define ADC_8_bits                                                                       0x2
#define ADC_6_bits                                                                       0x3

#define set_ADC_resolution(value)                                                        do{ADC_CR1 &= (~(0x3 << 24)); ADC_CR1 |= (value << 24);}while(0)


#define set_ADC_AWD_for_regular_channels(mode)                                           ADC_CR1bits.AWDEN = mode
#define set_ADC_AWD_for_injected_channels(mode)                                          ADC_CR1bits.JAWDEN = mode


#define ADC_powered_up_when_waiting_for_start_event                                      0
#define ADC_powered_down_when_waiting_for_start_event                                    1

#define set_ADC_power_down_during_idle_phase(mode)                                       ADC_CR1bits.PDI = mode


#define ADC_powered_up_during_delay                                                      0
#define ADC_powered_down_during_delay                                                    1

#define set_ADC_power_down_during_delay_phase(mode)                                      ADC_CR1bits.PDD = mode


#define set_ADC_number_of_discontinuous_conversions(value)                               do{ADC_CR1 &= (~(0x7 << 13)); ADC_CR1 |= (value << 13);}while(0)

#define set_ADC_discontinuous_conversion_mode_in_injected_mode(mode)                     ADC_CR1bits.JDISCEN = mode
#define set_ADC_discontinuous_conversion_mode_in_regular_mode(mode)                      ADC_CR1bits.DISCEN = mode

#define set_ADC_auto_injection(mode)                                                     ADC_CR1bits.JAUTO = mode


#define AWD_enabled_on_all_channels                                                      0
#define AWD_enabled_on_single_channel                                                    1

#define set_ADC_AWD_on_single_channel_in_scan_mode(mode)                                 ADC_CR1bits.AWDSGL = mode


#define enable_ADC_scan_mode(mode)                                                       ADC_CR1bits.SCAN = mode

#define set_ADC_injected_channel_interrupt(mode)                                         ADC_CR1bits.JEOCIE = mode
#define set_ADC_AWD_interrupt(mode)                                                      ADC_CR1bits.AWDIE = mode
#define set_ADC_end_of_conversion_interrupt(mode)                                        ADC_CR1bits.EOCIE = mode
#define set_ADC_AWD_channel(value)                                                       do{ADC_CR1 &= 0xFFFFFFE0; ADC_CR1 |= (0x0000001F & value);}while(0)


/* Functions and definitions for ADC control register 2 (ADC_CR2) */

#define set_ADC_regular_conversions(mode)                                                ADC_CR2bits.SWSTART = mode
#define set_ADC_injected_conversions(mode)                                               ADC_CR2bits.JSWSTART = mode


#define trigger_detection_disabled                                                       0x0
#define trigger_on_rising_edge                                                           0x1
#define trigger_on_falling_edge                                                          0x2
#define trigger_on_bot_edges                                                             0x3

#define set_ADC_regular_external_trigger_edge(value)                                     do{ADC_CR2 &= (~(0x3 << 20));  ADC_CR2 |= (value << 20);}while(0)
#define set_ADC_injected_external_trigger_edge(value)                                    do{ADC_CR2 &= (~(0x3 << 20));  ADC_CR2 |= (value << 20);}while(0)


#define TIM9_CC2_event                                                                   0x0
#define TIM9_TRGO_event                                                                  0x1
#define TIM2_CC3_event                                                                   0x2
#define TIM2_CC2_event                                                                   0x3
#define TIM3_TRGO_event                                                                  0x4
#define TIM4_CC4_event                                                                   0x5
#define TIM2_TRGO_event                                                                  0x6
#define TIM3_CC1_event                                                                   0x7
#define TIM3_CC3_event                                                                   0x8
#define TIM4_TRGO_event                                                                  0x9
#define TIM6_TRGO_event                                                                  0xA
#define EXTI_line_11                                                                     0xF

#define set_ADC_external_trigger_regular_conversion_source(mode)                         do{if((mode >= 0x0) && (mode < 0xA) || (mode == 0xF)){ADC_CR2 &= (~(0xF << 24)); ADC_CR2 |= (mode << 24);}}while(0)


#define TIM9_CC1_event                                                                   0x0
#define TIM9_TRGO_event                                                                  0x1
#define TIM2_TRGO_event                                                                  0x2
#define TIM2_CC1_event                                                                   0x3
#define TIM3_CC4_event                                                                   0x4
#define TIM4_TRGO_event                                                                  0x5
#define TIM4_CC1_event                                                                   0x6
#define TIM4_CC2_event                                                                   0x7
#define TIM4_CC3_event                                                                   0x8
#define TIM10_CC1_event                                                                  0x9
#define TIM7_TRGO_event                                                                  0xA
#define EXTI_line_15                                                                     0xF

#define set_ADC_external_trigger_regular_conversion_source(mode)                         do{if((mode >= 0x0) && (mode < 0xA) || (mode == 0xF)){ADC_CR2 &= (~(0xF << 16)); ADC_CR2 |= (mode << 16);}}while(0)


#define right_align                                                                      0
#define left_align                                                                       1

#define set_ADC_data_alignment(mode)                                                     ADC_CR2bits.ALIGN = mode


#define EOC_at_sequence_end                                                              0
#define EOC_at_each_conversion                                                           1

#define set_ADC_end_of_conversion_selection(mode)                                        ADC_CR2bits.EOCS = mode


#define no_new DMA_request_issued_after_last_transfer                                    0
#define DMA_requests_issued_unless_stopped                                               1

#define set_ADC_DMA_disable_selection(mode)                                              ADC_CR2bits.DDS = mode


#define enable_ADC_DMA(mode)                                                             ADC_CR2bits.DMA_ = mode


#define no_delay                                                                         0x0
#define until_read                                                                       0x1
#define _7_APB_clock_cycles_after_EOC                                                    0x2
#define _15_APB_clock_cycles_after_EOC                                                   0x3
#define _31_APB_clock_cycles_after_EOC                                                   0x4
#define _63_APB_clock_cycles_after_EOC                                                   0x5
#define _127_APB_clock_cycles_after_EOC                                                  0x6
#define _255_APB_clock_cycles_after_EOC                                                  0x7

#define set_ADC_EOC_delay(value)                                                         do{ADC_CR2 &= (~(0x7 << 4));  ADC_CR2 |= (value << 4);}while(0)


#define Bank_A                                                                           0
#define Bank_B                                                                           1

#define set_ADC_configuration(mode)                                                      do{ADC_CR2 &= (~(0x1 << 2));  ADC_CR2 |= (mode << 2);}while(0)


#define enable_ADC_continuous_conversion(mode)                                           ADC_CR2bits.CONT = mode
#define enable_ADC_block(mode)                                                           ADC_CR2bits.ADON = mode


/* Functions and definitions for ADC sample time registers */

#define sample_time_4_cycles                                                             0x0
#define sample_time_9_cycles                                                             0x1
#define sample_time_16_cycles                                                            0x2
#define sample_time_24_cycles                                                            0x3
#define sample_time_48_cycles                                                            0x4
#define sample_time_96_cycles                                                            0x5
#define sample_time_192_cycles                                                           0x6
#define sample_time_384_cycles                                                           0x7

#define set_ADC_sample_time(value, channel)                                              do{if((channel >= 0) && (channel <= 9)){ADC_SMPR3 &= (~(0x7 << (channel * 3))); ADC_SMPR3 |= (value << (channel * 3));}  else if((channel >= 10) && (channel <= 19)){ADC_SMPR2 &= (~(0x7 << ((channel - 10) * 3))); ADC_SMPR2 |= (value << ((channel - 10) * 3));}  else if((channel >= 20) && (channel <= 29)){ADC_SMPR1 &= (~(0x7 << ((channel - 20) * 3))); ADC_SMPR1 |= (value << ((channel - 20) * 3));}}while(0)
#define set_ADC_sample_time_30_31(value, channel)                                        do{ADC_SMPR0 &= (~(0x7 << ((channel - 30) * 3))); ADC_SMPR0 |= (value << ((channel - 30) * 3));}while(0)

/* Functions and definitions for ADC regular sequence registers */

#define set_ADC_regular_number_of_conversions(value)                                     do{ADC_SQR1 &= (~(0x1F << 20)); ADC_SQR1 |= ((value - 1) << 20);}while(0)
#define set_ADC_regular_sequence(seq, channel)                                           do{if((seq >= 1) && (seq <= 6)){ADC_SQR5 &= (~(0x1F << ((seq - 1) * 5)));  ADC_SQR5 |= (channel << ((seq - 1) * 5));}  else if((seq >= 7) && (seq <= 12)){ADC_SQR4 &= (~(0x1F << ((seq - 7) * 5)));  ADC_SQR4 |= (channel << ((seq - 7) * 5));}  else if((seq >= 13) && (seq <= 18)){ADC_SQR4 &= (~(0x1F << ((seq - 13) * 5)));  ADC_SQR4 |= (channel << ((seq - 13) * 5));}  else if((seq >= 19) && (seq <= 24)){ADC_SQR4 &= (~(0x1F << ((seq - 19) * 5)));  ADC_SQR4 |= (channel << ((seq - 19) * 5));}  else if((seq >= 25) && (seq <= 28)){ADC_SQR4 &= (~(0x1F << ((seq - 20) * 5)));  ADC_SQR4 |= (channel << ((seq - 20) * 5));}}while(0)


/* Functions and definitions for ADC injected sequence registers */

#define set_ADC_injected_number_of_conversions(value)                                    do{ADC_JSQR &= (~(0x3 << 20)); ADC_JSQR |= ((value - 1) << 20);}while(0)
#define set_ADC_injected_sequence(seq, channel)                                          do{ADC_JSQR &= (~(0x1F << ((seq - 1) * 5))); ADC_JSQR |= (channel << ((seq - 1) * 5));}while(0)


/* Functions and definitions for ADC common control register (ADC_CCR) */

#define set_ADC_reference_and_temperature_sensor(mode)                                   ADC_CCRbits.TSVREFE = mode


#define HSI_div_1                                                                        0
#define HSI_div_2                                                                        1
#define HSI_div_4                                                                        2

#define set_ADC_prescaler(value)                                                         do{ADC_CCR &= (~(0x3 << 16));  ADC_CCR |= (value << 16);}while(0)


/* Miscellaneous */

#define set_ADC_AWD_high_threshold(value)                                                ADC_HTR = (value & 0xFFF)
#define set_ADC_AWD_low_threshold(value)                                                 ADC_LTR = (value & 0xFFF)
#define set_ADC_injected_channel_offset_1(value)                                         ADC_JOFR1 = (value & 0xFFF)
#define set_ADC_injected_channel_offset_2(value)                                         ADC_JOFR2 = (value & 0xFFF)
#define set_ADC_injected_channel_offset_3(value)                                         ADC_JOFR3 = (value & 0xFFF)
#define set_ADC_injected_channel_offset_4(value)                                         ADC_JOFR4 = (value & 0xFFF)