/*                Glass LCD SPL              */


//Functions and constants related to RCC_CSR

#define RTC_software_reset_state(state)                                                  RCC_CSRbits.RTCRST = state
#define LSE_on_state(state)                                                              RCC_CSRbits.LSEON = state


#define No_clock                                                                         0x0
#define LSE_oscillator                                                                   0x1
#define LSI_oscillator                                                                   0x2
#define HSE_oscillator_prescaled                                                         0x3

#define RTC_and_LCD_clock_source_selection(sel)                                          do{RCC_CSR &= (~(0x3 << 0x10)); RCC_CSR |= (sel << 0x10);}while(0)


//Functions and constants for LCD Control Register (LCD_CR)

#define LCD_controller_enable(state)                                                     LCD_CRbits.LCDEN = state


#define internal                                                                         0x0
#define external                                                                         0x1

#define voltage_source_selection(sel)                                                    LCD_CRbits.VSEL = sel


#define static_duty                                                                      0x0
#define _1_2_duty                                                                        0x1
#define _1_3_duty                                                                        0x2
#define _1_4_duty                                                                        0x3
#define _1_8_duty                                                                        0x4

#define select_duty(duty)                                                                do{LCD_CR &= (~(0x7 << 0x2)); LCD_CR |= (duty << 0x2);}while(0)


#define _1_4_bias                                                                        0x0
#define _1_2_bias                                                                        0x1
#define _1_3_bias                                                                        0x2

#define set_bias(bias)                                                                   do{LCD_CR &= (~(0x3 << 0x5)); LCD_CR |= (bias << 0x5);}while(0)

#define mux_segment_enable(state)                                                        LCD_CRbits.MUX_SEG = state


//Functions and constants for LCD Frame Control Register (LCD_FCR)

#define high_drive_enable(state)                                                         LCD_FCRbits.HD = state
#define start_of_frame_interrupt_enable(state)                                           LCD_FCRbits.SOFIE = state
#define update_display_done_interrupt_enable(state)                                      LCD_FCRbits.UDDIE = state


#define _0_4_ck_ps                                                                       0x0
#define _1_5_ck_ps                                                                       0x1
#define _2_6_ck_ps                                                                       0x2
#define _3_7_ck_ps                                                                       0x3

#define pulse_ON_duration(dur)                                                           do{LCD_FCR &= (~(0x7 << 0x4)); LCD_FCR |= (dur << 0x4);}while(0)


#define no_dead_time                                                                     0x0
#define _1_phase_period_dead_time                                                        0x1
#define _2_phase_period_dead_time                                                        0x2
#define _3_phase_period_dead_time                                                        0x3
#define _4_phase_period_dead_time                                                        0x4
#define _5_phase_period_dead_time                                                        0x5
#define _6_phase_period_dead_time                                                        0x6
#define _7_phase_period_dead_time                                                        0x7

#define dead_time_duration(dur)                                                          do{LCD_FCR &= (~(0x7 << 0x7)); LCD_FCR |= (dur << 0x7);}while(0)


#define VLCD0_100_VLCD4                                                                  0x0
#define VLCD1_101_VLCD5                                                                  0x1
#define VLCD2_110_VLCD6                                                                  0x2
#define VLCD3_111_VLCD7                                                                  0x3

#define contrast_control(con_lvl)                                                        do{LCD_FCR &= (~(0x3 << 0xA)); LCD_FCR |= (con_lvl << 0xA);}while(0)


#define fLCD_8100__fLCD_128                                                              0x0
#define fLCD_16101__fLCD_256                                                             0x1
#define fLCD_32110__fLCD_512                                                             0x2
#define fLCD_64111__fLCD_1024                                                            0x3

#define blink_frequency_selection(sel)                                                   do{LCD_FCR &= (~(0x7 << 0xD)); LCD_FCR |= (sel << 0xD);}while(0)


#define blink_disabled                                                                   0x0
#define blink_enabled_on_SEG0_COM0                                                       0x1
#define blink_enabled_on_SEG0_all_COMs                                                   0x2
#define full_blink_enabled                                                               0x3

#define blink_mode_selection(sel)                                                        do{LCD_FCR &= (~(0x3 << 0x10)); LCD_FCR |= (sel << 0x10);}while(0)


#define ck_ps_div_16                                                                     0x0
#define ck_ps_div_17                                                                     0x1
#define ck_ps_div_18                                                                     0x2
#define ck_ps_div_19                                                                     0x3
#define ck_ps_div_20                                                                     0x4
#define ck_ps_div_21                                                                     0x5
#define ck_ps_div_22                                                                     0x6
#define ck_ps_div_23                                                                     0x7
#define ck_ps_div_24                                                                     0x8
#define ck_ps_div_25                                                                     0x9
#define ck_ps_div_26                                                                     0xA
#define ck_ps_div_27                                                                     0xB
#define ck_ps_div_28                                                                     0xC
#define ck_ps_div_29                                                                     0xD
#define ck_ps_div_30                                                                     0xE
#define ck_ps_div_31                                                                     0xF

#define DIV_clock_divider(div_val)                                                       do{LCD_FCR &= (~(0xF << 0x12)); LCD_FCR |= (div_val << 0x12);}while(0)


#define LCDCLK_div_1                                                                     0x0
#define LCDCLK_div_2                                                                     0x1
#define LCDCLK_div_4                                                                     0x2
#define LCDCLK_div_8                                                                     0x3
#define LCDCLK_div_16                                                                    0x4
#define LCDCLK_div_32                                                                    0x5
#define LCDCLK_div_64                                                                    0x6
#define LCDCLK_div_128                                                                   0x7
#define LCDCLK_div_256                                                                   0x8
#define LCDCLK_div_512                                                                   0x9
#define LCDCLK_div_1024                                                                  0xA
#define LCDCLK_div_2048                                                                  0xB
#define LCDCLK_div_4096                                                                  0xC
#define LCDCLK_div_8192                                                                  0xD
#define LCDCLK_div_16384                                                                 0xE
#define LCDCLK_div_32768                                                                 0xF

#define PS_16_bit_prescaler(ps_val)                                                      do{LCD_FCR &= (~(0xF << 0x16)); LCD_FCR |= (ps_val << 0x16);}while(0)


//Functions and constants for LCD Clear Register (LCD_CLR)

#define display_update_done(state)                                                       LCD_CLRbits.UDDC = state
#define start_of_frame_flag_clear(state)                                                 LCD_CLRbits.SOFC = state


//Functions and constants for LCD Status Register (LCD_SR)

#define update_display_request()                                                         LCD_SRbits.UDR = true