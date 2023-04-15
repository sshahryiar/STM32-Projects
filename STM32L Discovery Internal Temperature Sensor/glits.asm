_LCD_GLASS_Init:
;glass_lcd.c,5 :: 		void LCD_GLASS_Init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;glass_lcd.c,7 :: 		LCD_GLASS_Configure_GPIO();
BL	_LCD_GLASS_Configure_GPIO+0
;glass_lcd.c,8 :: 		RCC_APB1ENRbits.PWREN = true;
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,9 :: 		RCC_APB1ENRbits.LCDEN = true;
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,10 :: 		PWR_CRbits.DBP = true;
MOVW	R0, #lo_addr(PWR_CRbits+0)
MOVT	R0, #hi_addr(PWR_CRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,11 :: 		RTC_software_reset_state(true);
MOVW	R0, #lo_addr(RCC_CSRbits+0)
MOVT	R0, #hi_addr(RCC_CSRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,12 :: 		RTC_software_reset_state(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(RCC_CSRbits+0)
MOVT	R0, #hi_addr(RCC_CSRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,13 :: 		LSE_on_state(true);
MOVW	R0, #lo_addr(RCC_CSRbits+0)
MOVT	R0, #hi_addr(RCC_CSRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,14 :: 		while(RCC_CSRbits.LSERDY == false);
L_LCD_GLASS_Init0:
MOVW	R1, #lo_addr(RCC_CSRbits+0)
MOVT	R1, #hi_addr(RCC_CSRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_LCD_GLASS_Init1
IT	AL
BAL	L_LCD_GLASS_Init0
L_LCD_GLASS_Init1:
;glass_lcd.c,15 :: 		RTC_and_LCD_clock_source_selection(LSE_oscillator);
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #65536
MOVW	R0, #lo_addr(RCC_CSR+0)
MOVT	R0, #hi_addr(RCC_CSR+0)
STR	R1, [R0, #0]
;glass_lcd.c,16 :: 		LCD_Master_Reset();
BL	_LCD_Master_Reset+0
;glass_lcd.c,17 :: 		high_drive_enable(false);
MOVS	R2, #0
MOVW	R0, #lo_addr(LCD_FCRbits+0)
MOVT	R0, #hi_addr(LCD_FCRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,18 :: 		start_of_frame_interrupt_enable(false);
MOVW	R0, #lo_addr(LCD_FCRbits+0)
MOVT	R0, #hi_addr(LCD_FCRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,19 :: 		update_display_done_interrupt_enable(false);
MOVW	R0, #lo_addr(LCD_FCRbits+0)
MOVT	R0, #hi_addr(LCD_FCRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,20 :: 		set_bias(_1_3_bias);
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #96
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
STR	R1, [R0, #0]
;glass_lcd.c,21 :: 		select_duty(_1_4_duty);
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #28
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
STR	R1, [R0, #0]
;glass_lcd.c,22 :: 		mux_segment_enable(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(LCD_CRbits+0)
MOVT	R0, #hi_addr(LCD_CRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,23 :: 		voltage_source_selection(internal);
MOVW	R0, #lo_addr(LCD_CRbits+0)
MOVT	R0, #hi_addr(LCD_CRbits+0)
STR	R2, [R0, #0]
;glass_lcd.c,24 :: 		DIV_clock_divider(ck_ps_div_17);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #3932160
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #262144
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,25 :: 		PS_16_bit_prescaler(LCDCLK_div_8);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #62914560
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12582912
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,26 :: 		blink_mode_selection(blink_disabled);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,27 :: 		dead_time_duration(no_dead_time);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #896
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,28 :: 		pulse_ON_duration(_0_4_ck_ps);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,29 :: 		contrast_control(VLCD3_111_VLCD7);
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3072
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,30 :: 		while(LCD_SRbits.FCRSF == false);
L_LCD_GLASS_Init29:
MOVW	R1, #lo_addr(LCD_SRbits+0)
MOVT	R1, #hi_addr(LCD_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_LCD_GLASS_Init30
IT	AL
BAL	L_LCD_GLASS_Init29
L_LCD_GLASS_Init30:
;glass_lcd.c,31 :: 		LCD_controller_enable(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(LCD_CRbits+0)
MOVT	R0, #hi_addr(LCD_CRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,32 :: 		while(LCD_SRbits.RDY == false);
L_LCD_GLASS_Init31:
MOVW	R1, #lo_addr(LCD_SRbits+0)
MOVT	R1, #hi_addr(LCD_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_LCD_GLASS_Init32
IT	AL
BAL	L_LCD_GLASS_Init31
L_LCD_GLASS_Init32:
;glass_lcd.c,33 :: 		while(LCD_SRbits.ENS == false);
L_LCD_GLASS_Init33:
MOVW	R1, #lo_addr(LCD_SRbits+0)
MOVT	R1, #hi_addr(LCD_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_LCD_GLASS_Init34
IT	AL
BAL	L_LCD_GLASS_Init33
L_LCD_GLASS_Init34:
;glass_lcd.c,34 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;glass_lcd.c,36 :: 		}
L_end_LCD_GLASS_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_GLASS_Init
_LCD_Master_Reset:
;glass_lcd.c,39 :: 		void LCD_Master_Reset()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;glass_lcd.c,41 :: 		LCD_CR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_CR+0)
MOVT	R0, #hi_addr(LCD_CR+0)
STR	R1, [R0, #0]
;glass_lcd.c,42 :: 		LCD_SR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_SR+0)
MOVT	R0, #hi_addr(LCD_SR+0)
STR	R1, [R0, #0]
;glass_lcd.c,43 :: 		LCD_FCR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_FCR+0)
MOVT	R0, #hi_addr(LCD_FCR+0)
STR	R1, [R0, #0]
;glass_lcd.c,44 :: 		LCD_CLR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_CLR+0)
MOVT	R0, #hi_addr(LCD_CLR+0)
STR	R1, [R0, #0]
;glass_lcd.c,45 :: 		LCD_RAM_clear();
BL	_LCD_RAM_clear+0
;glass_lcd.c,46 :: 		}
L_end_LCD_Master_Reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_Master_Reset
_LCD_RAM_clear:
;glass_lcd.c,49 :: 		void LCD_RAM_clear()
;glass_lcd.c,51 :: 		LCD_RAM_COM0 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM0+0)
MOVT	R0, #hi_addr(LCD_RAM_COM0+0)
STR	R1, [R0, #0]
;glass_lcd.c,52 :: 		LCD_RAM_COM1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM1+0)
MOVT	R0, #hi_addr(LCD_RAM_COM1+0)
STR	R1, [R0, #0]
;glass_lcd.c,53 :: 		LCD_RAM_COM2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM2+0)
MOVT	R0, #hi_addr(LCD_RAM_COM2+0)
STR	R1, [R0, #0]
;glass_lcd.c,54 :: 		LCD_RAM_COM3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM3+0)
MOVT	R0, #hi_addr(LCD_RAM_COM3+0)
STR	R1, [R0, #0]
;glass_lcd.c,55 :: 		LCD_RAM_COM4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM4+0)
MOVT	R0, #hi_addr(LCD_RAM_COM4+0)
STR	R1, [R0, #0]
;glass_lcd.c,56 :: 		LCD_RAM_COM5 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM5+0)
MOVT	R0, #hi_addr(LCD_RAM_COM5+0)
STR	R1, [R0, #0]
;glass_lcd.c,57 :: 		LCD_RAM_COM6 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM6+0)
MOVT	R0, #hi_addr(LCD_RAM_COM6+0)
STR	R1, [R0, #0]
;glass_lcd.c,58 :: 		LCD_RAM_COM7 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(LCD_RAM_COM7+0)
MOVT	R0, #hi_addr(LCD_RAM_COM7+0)
STR	R1, [R0, #0]
;glass_lcd.c,59 :: 		}
L_end_LCD_RAM_clear:
BX	LR
; end of _LCD_RAM_clear
_LCD_GLASS_Configure_GPIO:
;glass_lcd.c,62 :: 		void LCD_GLASS_Configure_GPIO()
;glass_lcd.c,64 :: 		enable_GPIOA(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,65 :: 		setup_GPIOA(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,66 :: 		setup_GPIOA(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,67 :: 		setup_GPIOA(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,68 :: 		setup_GPIOA(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,69 :: 		setup_GPIOA(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,70 :: 		setup_GPIOA(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,71 :: 		setup_GPIOA(15, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1073741824
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,73 :: 		setup_GPIOA_AF(1, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO149:
;glass_lcd.c,74 :: 		setup_GPIOA_AF(2, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO162:
;glass_lcd.c,75 :: 		setup_GPIOA_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO175:
;glass_lcd.c,76 :: 		setup_GPIOA_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO182:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,77 :: 		setup_GPIOA_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO193:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,78 :: 		setup_GPIOA_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO204:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,79 :: 		setup_GPIOA_AF(15, AF11_LCD);
L_LCD_GLASS_Configure_GPIO215:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,81 :: 		enable_GPIOB(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,82 :: 		setup_GPIOB(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,83 :: 		setup_GPIOB(4, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #768
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,84 :: 		setup_GPIOB(5, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #32
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3072
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,85 :: 		setup_GPIOB(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,86 :: 		setup_GPIOB(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,87 :: 		setup_GPIOB(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,88 :: 		setup_GPIOB(11, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2048
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12582912
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,89 :: 		setup_GPIOB(12, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #50331648
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,90 :: 		setup_GPIOB(13, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #134217728
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8192
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #201326592
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,91 :: 		setup_GPIOB(14, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #536870912
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #16384
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #805306368
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,92 :: 		setup_GPIOB(15, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1073741824
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,94 :: 		setup_GPIOB_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO397:
;glass_lcd.c,95 :: 		setup_GPIOB_AF(4, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #720896
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO410:
;glass_lcd.c,96 :: 		setup_GPIOB_AF(5, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11534336
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO423:
;glass_lcd.c,97 :: 		setup_GPIOB_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO430:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,98 :: 		setup_GPIOB_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO441:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,99 :: 		setup_GPIOB_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO452:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,100 :: 		setup_GPIOB_AF(11, AF11_LCD);
L_LCD_GLASS_Configure_GPIO463:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,101 :: 		setup_GPIOB_AF(12, AF11_LCD);
L_LCD_GLASS_Configure_GPIO474:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #720896
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,102 :: 		setup_GPIOB_AF(13, AF11_LCD);
L_LCD_GLASS_Configure_GPIO485:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11534336
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,103 :: 		setup_GPIOB_AF(14, AF11_LCD);
L_LCD_GLASS_Configure_GPIO496:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,104 :: 		setup_GPIOB_AF(15, AF11_LCD);
L_LCD_GLASS_Configure_GPIO507:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,106 :: 		enable_GPIOC(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,107 :: 		setup_GPIOC(0, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,108 :: 		setup_GPIOC(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,109 :: 		setup_GPIOC(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,110 :: 		setup_GPIOC(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,111 :: 		setup_GPIOC(6, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #64
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12288
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,112 :: 		setup_GPIOC(7, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #49152
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,113 :: 		setup_GPIOC(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,114 :: 		setup_GPIOC(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,115 :: 		setup_GPIOC(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,116 :: 		setup_GPIOC(11, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2048
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12582912
MOVW	R0, #lo_addr(GPIOC_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;glass_lcd.c,118 :: 		setup_GPIOC_AF(0, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO674:
;glass_lcd.c,119 :: 		setup_GPIOC_AF(1, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO687:
;glass_lcd.c,120 :: 		setup_GPIOC_AF(2, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO700:
;glass_lcd.c,121 :: 		setup_GPIOC_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO713:
;glass_lcd.c,122 :: 		setup_GPIOC_AF(6, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO726:
;glass_lcd.c,123 :: 		setup_GPIOC_AF(7, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO739:
;glass_lcd.c,124 :: 		setup_GPIOC_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO746:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,125 :: 		setup_GPIOC_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO757:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,126 :: 		setup_GPIOC_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO768:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,127 :: 		setup_GPIOC_AF(11, AF11_LCD);
L_LCD_GLASS_Configure_GPIO779:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;glass_lcd.c,128 :: 		}
L_end_LCD_GLASS_Configure_GPIO:
BX	LR
; end of _LCD_GLASS_Configure_GPIO
_LCD_bar:
;glass_lcd.c,131 :: 		void LCD_bar()
;glass_lcd.c,133 :: 		LCD_RAM_COM2 &= 0xFFFF5FFF;
MOVW	R0, #lo_addr(LCD_RAM_COM2+0)
MOVT	R0, #hi_addr(LCD_RAM_COM2+0)
LDR	R1, [R0, #0]
MVN	R0, #40960
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_RAM_COM2+0)
MOVT	R0, #hi_addr(LCD_RAM_COM2+0)
STR	R1, [R0, #0]
;glass_lcd.c,134 :: 		LCD_RAM_COM3 &= 0xFFFF5FFF;
MOVW	R0, #lo_addr(LCD_RAM_COM3+0)
MOVT	R0, #hi_addr(LCD_RAM_COM3+0)
LDR	R1, [R0, #0]
MVN	R0, #40960
ANDS	R1, R0
MOVW	R0, #lo_addr(LCD_RAM_COM3+0)
MOVT	R0, #hi_addr(LCD_RAM_COM3+0)
STR	R1, [R0, #0]
;glass_lcd.c,136 :: 		LCD_RAM_COM2 |= ((unsigned long)((unsigned long)t_bar[0] << 0x0C));
MOVW	R0, #lo_addr(_t_bar+0)
MOVT	R0, #hi_addr(_t_bar+0)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #12
MOVW	R0, #lo_addr(LCD_RAM_COM2+0)
MOVT	R0, #hi_addr(LCD_RAM_COM2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(LCD_RAM_COM2+0)
MOVT	R0, #hi_addr(LCD_RAM_COM2+0)
STR	R1, [R0, #0]
;glass_lcd.c,138 :: 		LCD_RAM_COM3 |= ((unsigned long)((unsigned long)t_bar[1] << 0x0C));
MOVW	R0, #lo_addr(_t_bar+1)
MOVT	R0, #hi_addr(_t_bar+1)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #12
MOVW	R0, #lo_addr(LCD_RAM_COM3+0)
MOVT	R0, #hi_addr(LCD_RAM_COM3+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(LCD_RAM_COM3+0)
MOVT	R0, #hi_addr(LCD_RAM_COM3+0)
STR	R1, [R0, #0]
;glass_lcd.c,139 :: 		}
L_end_LCD_bar:
BX	LR
; end of _LCD_bar
_LCD_GLASS_WriteChar:
;glass_lcd.c,142 :: 		void LCD_GLASS_WriteChar(unsigned char *ch, unsigned char point, unsigned char column, unsigned char position)
; position start address is: 12 (R3)
; column start address is: 8 (R2)
; point start address is: 4 (R1)
; ch start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; position end address is: 12 (R3)
; column end address is: 8 (R2)
; point end address is: 4 (R1)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
; point start address is: 4 (R1)
; column start address is: 8 (R2)
; position start address is: 12 (R3)
;glass_lcd.c,147 :: 		LCD_Conv_Char_Seg(ch, point, column, digit);
ADD	R4, SP, #8
STRB	R3, [SP, #4]
MOV	R3, R4
; column end address is: 8 (R2)
; point end address is: 4 (R1)
; ch end address is: 0 (R0)
BL	glits_LCD_Conv_Char_Seg+0
; position end address is: 12 (R3)
LDRB	R3, [SP, #4]
UXTB	R0, R3
;glass_lcd.c,149 :: 		while(LCD_SRbits.UDR == true);
L_LCD_GLASS_WriteChar787:
; position start address is: 0 (R0)
MOVW	R5, #lo_addr(LCD_SRbits+0)
MOVT	R5, #hi_addr(LCD_SRbits+0)
LDR	R4, [R5, #0]
CMP	R4, #0
IT	EQ
BEQ	L_LCD_GLASS_WriteChar788
IT	AL
BAL	L_LCD_GLASS_WriteChar787
L_LCD_GLASS_WriteChar788:
;glass_lcd.c,151 :: 		switch (position)
IT	AL
BAL	L_LCD_GLASS_WriteChar789
; position end address is: 0 (R0)
;glass_lcd.c,154 :: 		case 1:
L_LCD_GLASS_WriteChar791:
;glass_lcd.c,156 :: 		LCD_RAM_COM0 &= 0xCFFFFFFC;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MOVW	R4, #65532
MOVT	R4, #53247
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,157 :: 		LCD_RAM_COM1 &= 0xCFFFFFFC;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MOVW	R4, #65532
MOVT	R4, #53247
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,158 :: 		LCD_RAM_COM2 &= 0xCFFFFFFC;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MOVW	R4, #65532
MOVT	R4, #53247
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,159 :: 		LCD_RAM_COM3 &= 0xCFFFFFFC;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MOVW	R4, #65532
MOVT	R4, #53247
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,161 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x00]) & 0x03)); // 1G 1B 1M 1E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #26
UXTB	R4, R6
AND	R4, R4, #3
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,162 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x01]) & 0x03)); // 1F 1A 1C 1D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #26
UXTB	R4, R6
AND	R4, R4, #3
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,163 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x02]) & 0x03)); // 1Q 1K 1Col 1P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #26
UXTB	R4, R6
AND	R4, R4, #3
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,164 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x1A) | (((unsigned long)digit[0x03]) & 0x03)); // 1H 1J 1DP 1N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #26
UXTB	R4, R6
AND	R4, R4, #3
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,166 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,170 :: 		case 2:
L_LCD_GLASS_WriteChar792:
;glass_lcd.c,172 :: 		LCD_RAM_COM0 &= 0xF3FFFF03;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MOVW	R4, #65283
MOVT	R4, #62463
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,173 :: 		LCD_RAM_COM1 &= 0xF3FFFF03;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MOVW	R4, #65283
MOVT	R4, #62463
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,174 :: 		LCD_RAM_COM2 &= 0xF3FFFF03;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MOVW	R4, #65283
MOVT	R4, #62463
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,175 :: 		LCD_RAM_COM3 &= 0xF3FFFF03;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MOVW	R4, #65283
MOVT	R4, #62463
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,177 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x00]) & 0x02) << 0x06) | ((((unsigned long)digit[0x00]) & 0x01) << 0x02)); // 2G 2B 2M 2E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #24
UXTB	R4, R6
AND	R4, R4, #2
LSLS	R4, R4, #6
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #2
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,178 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x01]) & 0x02) << 0x06) | ((((unsigned long)digit[0x01]) & 0x01) << 0x02)); // 2F 2A 2C 2D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #24
UXTB	R4, R6
AND	R4, R4, #2
LSLS	R4, R4, #6
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #2
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,179 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x02]) & 0x02) << 0x06) | ((((unsigned long)digit[0x02]) & 0x01) << 0x02)); // 2Q 2K 2Col 2P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #24
UXTB	R4, R6
AND	R4, R4, #2
LSLS	R4, R4, #6
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #2
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,180 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x18) | ((((unsigned long)digit[0x03]) & 0x02) << 0x06) | ((((unsigned long)digit[0x03]) & 0x01) << 0x02)); // 2H 2J 2DP 2N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #24
UXTB	R4, R6
AND	R4, R4, #2
LSLS	R4, R4, #6
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #2
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,182 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,186 :: 		case 3:
L_LCD_GLASS_WriteChar793:
;glass_lcd.c,188 :: 		LCD_RAM_COM0 &= 0xFCFFFCFF;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MVN	R4, #50332416
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,189 :: 		LCD_RAM_COM1 &= 0xFCFFFCFF;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MVN	R4, #50332416
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,190 :: 		LCD_RAM_COM2 &= 0xFCFFFCFF;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MVN	R4, #50332416
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,191 :: 		LCD_RAM_COM3 &= 0xFCFFFCFF;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MVN	R4, #50332416
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,193 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x00]) & 0x03) << 0x08)); // 3G 3B 3M 3E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #22
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #8
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,194 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x01]) & 0x03) << 0x08)); // 3F 3A 3C 3D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #22
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #8
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,195 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x02]) & 0x03) << 0x08)); // 3Q 3K 3Col 3P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #22
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #8
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,196 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x16) | ((((unsigned long)digit[0x03]) & 0x03) << 0x08)); // 3H 3J 3DP 3N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #22
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #8
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,198 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,202 :: 		case 4:
L_LCD_GLASS_WriteChar794:
;glass_lcd.c,204 :: 		LCD_RAM_COM0 &= 0xFFCFF3FF;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MOVW	R4, #62463
MOVT	R4, #65487
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,205 :: 		LCD_RAM_COM1 &= 0xFFCFF3FF;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MOVW	R4, #62463
MOVT	R4, #65487
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,206 :: 		LCD_RAM_COM2 &= 0xFFCFF3FF;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MOVW	R4, #62463
MOVT	R4, #65487
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,207 :: 		LCD_RAM_COM3 &= 0xFFCFF3FF;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MOVW	R4, #62463
MOVT	R4, #65487
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,209 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0A)); // 4G 4B 4M 4E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #18
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #10
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,210 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0A)); // 4F 4A 4C 4D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #18
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #10
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,211 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x02]) & 0x03) << 0x0A)); // 4Q 4K 4Col 4P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #18
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #10
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,212 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x12) | ((((unsigned long)digit[0x03]) & 0x03) << 0x0A)); // 4H 4J 4DP 4N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #18
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #10
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,214 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,218 :: 		case 5:
L_LCD_GLASS_WriteChar795:
;glass_lcd.c,220 :: 		LCD_RAM_COM0 &= 0xFFF3CFFF;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MVN	R4, #798720
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,221 :: 		LCD_RAM_COM1 &= 0xFFF3CFFF;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MVN	R4, #798720
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,222 :: 		LCD_RAM_COM2 &= 0xFFF3CFFF;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MVN	R4, #798720
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,223 :: 		LCD_RAM_COM3 &= 0xFFF3CFFF;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MVN	R4, #798720
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,225 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0C)); // 5G 5B 5M 5E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #16
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #12
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,226 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0C)); // 5F 5A 5C 5D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #16
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #12
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,227 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0C)); // 5Q 5K   5P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #16
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #12
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,228 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x0C) << 0x10) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0C)); // 5H 5J   5N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #12
LSLS	R5, R4, #16
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #12
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,230 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,234 :: 		case 6:
L_LCD_GLASS_WriteChar796:
;glass_lcd.c,236 :: 		LCD_RAM_COM0 &= 0xFFFC3FFF;
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R5, [R4, #0]
MVN	R4, #245760
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,237 :: 		LCD_RAM_COM1 &= 0xFFFC3FFF;
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R5, [R4, #0]
MVN	R4, #245760
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,238 :: 		LCD_RAM_COM2 &= 0xFFFC3FFF;
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R5, [R4, #0]
MVN	R4, #245760
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,239 :: 		LCD_RAM_COM3 &= 0xFFFC3FFF;
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R5, [R4, #0]
MVN	R4, #245760
ANDS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,241 :: 		LCD_RAM_COM0 |= (((((unsigned long)digit[0x00]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x00]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x00]) & 0x03) << 0x0E)) ; // 6B 6G 6M 6E
ADD	R7, SP, #8
LDRB	R6, [R7, #0]
UXTB	R4, R6
AND	R4, R4, #4
LSLS	R5, R4, #15
UXTB	R4, R6
AND	R4, R4, #8
LSLS	R4, R4, #13
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #14
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM0+0)
MOVT	R4, #hi_addr(LCD_RAM_COM0+0)
STR	R5, [R4, #0]
;glass_lcd.c,242 :: 		LCD_RAM_COM1 |= (((((unsigned long)digit[0x01]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x01]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x01]) & 0x03) << 0x0E)) ; // 6A 6F 6C 6D
ADDS	R4, R7, #1
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #4
LSLS	R5, R4, #15
UXTB	R4, R6
AND	R4, R4, #8
LSLS	R4, R4, #13
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #3
LSLS	R4, R4, #14
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM1+0)
MOVT	R4, #hi_addr(LCD_RAM_COM1+0)
STR	R5, [R4, #0]
;glass_lcd.c,243 :: 		LCD_RAM_COM2 |= (((((unsigned long)digit[0x02]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x02]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x02]) & 0x01) << 0x0E)) ; // 6K 6Q    6P
ADDS	R4, R7, #2
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #4
LSLS	R5, R4, #15
UXTB	R4, R6
AND	R4, R4, #8
LSLS	R4, R4, #13
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #14
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM2+0)
MOVT	R4, #hi_addr(LCD_RAM_COM2+0)
STR	R5, [R4, #0]
;glass_lcd.c,244 :: 		LCD_RAM_COM3 |= (((((unsigned long)digit[0x03]) & 0x04) << 0x0F) | ((((unsigned long)digit[0x03]) & 0x08) << 0x0D) | ((((unsigned long)digit[0x03]) & 0x01) << 0x0E)) ; // 6J 6H   6N
ADDS	R4, R7, #3
LDRB	R6, [R4, #0]
UXTB	R4, R6
AND	R4, R4, #4
LSLS	R5, R4, #15
UXTB	R4, R6
AND	R4, R4, #8
LSLS	R4, R4, #13
ORRS	R5, R4
UXTB	R4, R6
AND	R4, R4, #1
LSLS	R4, R4, #14
ORRS	R5, R4
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(LCD_RAM_COM3+0)
MOVT	R4, #hi_addr(LCD_RAM_COM3+0)
STR	R5, [R4, #0]
;glass_lcd.c,246 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,249 :: 		default:
L_LCD_GLASS_WriteChar797:
;glass_lcd.c,251 :: 		break;
IT	AL
BAL	L_LCD_GLASS_WriteChar790
;glass_lcd.c,253 :: 		}
L_LCD_GLASS_WriteChar789:
; position start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_LCD_GLASS_WriteChar791
CMP	R0, #2
IT	EQ
BEQ	L_LCD_GLASS_WriteChar792
CMP	R0, #3
IT	EQ
BEQ	L_LCD_GLASS_WriteChar793
CMP	R0, #4
IT	EQ
BEQ	L_LCD_GLASS_WriteChar794
CMP	R0, #5
IT	EQ
BEQ	L_LCD_GLASS_WriteChar795
CMP	R0, #6
IT	EQ
BEQ	L_LCD_GLASS_WriteChar796
; position end address is: 0 (R0)
IT	AL
BAL	L_LCD_GLASS_WriteChar797
L_LCD_GLASS_WriteChar790:
;glass_lcd.c,256 :: 		LCD_bar();
BL	_LCD_bar+0
;glass_lcd.c,257 :: 		update_display_request();
MOVS	R5, #1
MOVW	R4, #lo_addr(LCD_SRbits+0)
MOVT	R4, #hi_addr(LCD_SRbits+0)
STR	R5, [R4, #0]
;glass_lcd.c,258 :: 		}
L_end_LCD_GLASS_WriteChar:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _LCD_GLASS_WriteChar
_LCD_GLASS_DisplayString:
;glass_lcd.c,261 :: 		void LCD_GLASS_DisplayString(unsigned char *ptr)
; ptr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
;glass_lcd.c,263 :: 		unsigned char i = 0x01;
; i start address is: 32 (R8)
MOVW	R8, #1
; ptr end address is: 0 (R0)
; i end address is: 32 (R8)
MOV	R9, R0
;glass_lcd.c,266 :: 		while((*ptr != 0) & (i < 0x08))
L_LCD_GLASS_DisplayString798:
; i start address is: 32 (R8)
; ptr start address is: 36 (R9)
LDRB	R1, [R9, #0]
CMP	R1, #0
MOVW	R2, #0
BEQ	L__LCD_GLASS_DisplayString990
MOVS	R2, #1
L__LCD_GLASS_DisplayString990:
CMP	R8, #8
MOVW	R1, #0
BCS	L__LCD_GLASS_DisplayString991
MOVS	R1, #1
L__LCD_GLASS_DisplayString991:
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_LCD_GLASS_DisplayString799
;glass_lcd.c,269 :: 		LCD_GLASS_WriteChar(ptr, false, false, i);
UXTB	R3, R8
MOVS	R2, #0
MOVS	R1, #0
MOV	R0, R9
BL	_LCD_GLASS_WriteChar+0
;glass_lcd.c,272 :: 		ptr++;
ADD	R9, R9, #1
;glass_lcd.c,274 :: 		i++;
ADD	R8, R8, #1
UXTB	R8, R8
;glass_lcd.c,275 :: 		}
; ptr end address is: 36 (R9)
; i end address is: 32 (R8)
IT	AL
BAL	L_LCD_GLASS_DisplayString798
L_LCD_GLASS_DisplayString799:
;glass_lcd.c,276 :: 		}
L_end_LCD_GLASS_DisplayString:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_GLASS_DisplayString
_LCD_GLASS_DisplayStrDeci:
;glass_lcd.c,279 :: 		void LCD_GLASS_DisplayStrDeci(unsigned int *ptr)
; ptr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
;glass_lcd.c,281 :: 		unsigned char i = 0x01;
; i start address is: 32 (R8)
MOVW	R8, #1
;glass_lcd.c,282 :: 		unsigned char char_tmp = 0x00;
MOVS	R1, #0
STRB	R1, [SP, #4]
; ptr end address is: 0 (R0)
; i end address is: 32 (R8)
MOV	R9, R0
;glass_lcd.c,286 :: 		while((*ptr != 0) & (i < 0x08))
L_LCD_GLASS_DisplayStrDeci800:
; i start address is: 32 (R8)
; ptr start address is: 36 (R9)
LDRH	R1, [R9, #0]
CMP	R1, #0
MOVW	R2, #0
BEQ	L__LCD_GLASS_DisplayStrDeci993
MOVS	R2, #1
L__LCD_GLASS_DisplayStrDeci993:
CMP	R8, #8
MOVW	R1, #0
BCS	L__LCD_GLASS_DisplayStrDeci994
MOVS	R1, #1
L__LCD_GLASS_DisplayStrDeci994:
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_LCD_GLASS_DisplayStrDeci801
;glass_lcd.c,288 :: 		char_tmp = ((*ptr) & 0x00FF);
LDRH	R1, [R9, #0]
AND	R1, R1, #255
STRB	R1, [SP, #4]
;glass_lcd.c,290 :: 		switch((*ptr) & 0xF000)
LDRH	R1, [R9, #0]
AND	R1, R1, #61440
STRH	R1, [SP, #8]
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci802
;glass_lcd.c,292 :: 		case DOT:
L_LCD_GLASS_DisplayStrDeci804:
;glass_lcd.c,295 :: 		LCD_GLASS_WriteChar(&char_tmp, POINT_ON, COLUMN_OFF, i);
ADD	R1, SP, #4
UXTB	R3, R8
MOVS	R2, #0
MOV	R0, R1
MOVS	R1, #1
BL	_LCD_GLASS_WriteChar+0
;glass_lcd.c,296 :: 		break;
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci803
;glass_lcd.c,298 :: 		case DOUBLE_DOT:
L_LCD_GLASS_DisplayStrDeci805:
;glass_lcd.c,301 :: 		LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_ON, i);
ADD	R1, SP, #4
UXTB	R3, R8
MOVS	R2, #1
MOV	R0, R1
MOVS	R1, #0
BL	_LCD_GLASS_WriteChar+0
;glass_lcd.c,302 :: 		break;
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci803
;glass_lcd.c,304 :: 		default:
L_LCD_GLASS_DisplayStrDeci806:
;glass_lcd.c,306 :: 		LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_OFF, i);
ADD	R1, SP, #4
UXTB	R3, R8
MOVS	R2, #0
MOV	R0, R1
MOVS	R1, #0
BL	_LCD_GLASS_WriteChar+0
;glass_lcd.c,307 :: 		break;
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci803
;glass_lcd.c,309 :: 		}/* Point on the next character */
L_LCD_GLASS_DisplayStrDeci802:
LDRH	R1, [SP, #8]
CMP	R1, #32768
IT	EQ
BEQ	L_LCD_GLASS_DisplayStrDeci804
CMP	R1, #16384
IT	EQ
BEQ	L_LCD_GLASS_DisplayStrDeci805
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci806
L_LCD_GLASS_DisplayStrDeci803:
;glass_lcd.c,310 :: 		ptr++;
ADD	R9, R9, #2
;glass_lcd.c,312 :: 		i++;
ADD	R8, R8, #1
UXTB	R8, R8
;glass_lcd.c,313 :: 		}
; ptr end address is: 36 (R9)
; i end address is: 32 (R8)
IT	AL
BAL	L_LCD_GLASS_DisplayStrDeci800
L_LCD_GLASS_DisplayStrDeci801:
;glass_lcd.c,314 :: 		}
L_end_LCD_GLASS_DisplayStrDeci:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _LCD_GLASS_DisplayStrDeci
_LCD_GLASS_Clear:
;glass_lcd.c,317 :: 		void LCD_GLASS_Clear()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;glass_lcd.c,320 :: 		while(LCD_SRbits.UDR == true);
L_LCD_GLASS_Clear807:
MOVW	R1, #lo_addr(LCD_SRbits+0)
MOVT	R1, #hi_addr(LCD_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_LCD_GLASS_Clear808
IT	AL
BAL	L_LCD_GLASS_Clear807
L_LCD_GLASS_Clear808:
;glass_lcd.c,321 :: 		LCD_RAM_Clear();
BL	_LCD_RAM_clear+0
;glass_lcd.c,323 :: 		update_display_request();
MOVS	R1, #1
MOVW	R0, #lo_addr(LCD_SRbits+0)
MOVT	R0, #hi_addr(LCD_SRbits+0)
STR	R1, [R0, #0]
;glass_lcd.c,324 :: 		}
L_end_LCD_GLASS_Clear:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LCD_GLASS_Clear
_LCD_GLASS_ScrollSentence:
;glass_lcd.c,327 :: 		void LCD_GLASS_ScrollSentence(unsigned char *ptr, unsigned int nScroll, unsigned int ScrollSpeed)
; ScrollSpeed start address is: 8 (R2)
; ptr start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRH	R1, [SP, #16]
; ScrollSpeed end address is: 8 (R2)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
; ScrollSpeed start address is: 8 (R2)
;glass_lcd.c,329 :: 		unsigned char Repetition = 0x00;
;glass_lcd.c,330 :: 		unsigned char Char_Nb = 0x00;
;glass_lcd.c,332 :: 		unsigned char str[7] = "";
MOVS	R3, #0
STRB	R3, [SP, #9]
STRB	R3, [SP, #10]
STRB	R3, [SP, #11]
STRB	R3, [SP, #12]
STRB	R3, [SP, #13]
STRB	R3, [SP, #14]
STRB	R3, [SP, #15]
;glass_lcd.c,333 :: 		unsigned char Str_size = 0x00;
;glass_lcd.c,335 :: 		if(ptr == 0)
CMP	R0, #0
IT	NE
BNE	L_LCD_GLASS_ScrollSentence809
; ScrollSpeed end address is: 8 (R2)
; ptr end address is: 0 (R0)
;glass_lcd.c,337 :: 		return;
IT	AL
BAL	L_end_LCD_GLASS_ScrollSentence
;glass_lcd.c,338 :: 		}
L_LCD_GLASS_ScrollSentence809:
;glass_lcd.c,341 :: 		for(ptr1 = ptr, Str_size = 0x00 ; *ptr1 != 0x00; Str_size++, ptr1++)
; ptr start address is: 0 (R0)
; ScrollSpeed start address is: 8 (R2)
STR	R0, [SP, #4]
; Str_size start address is: 48 (R12)
MOVW	R12, #0
; ScrollSpeed end address is: 8 (R2)
; ptr end address is: 0 (R0)
; Str_size end address is: 48 (R12)
UXTH	R11, R2
UXTB	R10, R12
L_LCD_GLASS_ScrollSentence810:
; Str_size start address is: 40 (R10)
; ScrollSpeed start address is: 44 (R11)
; ptr start address is: 0 (R0)
LDR	R3, [SP, #4]
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	EQ
BEQ	L_LCD_GLASS_ScrollSentence811
ADD	R3, R10, #1
; Str_size end address is: 40 (R10)
; Str_size start address is: 48 (R12)
UXTB	R12, R3
LDR	R3, [SP, #4]
ADDS	R3, R3, #1
STR	R3, [SP, #4]
;glass_lcd.c,343 :: 		};
; Str_size end address is: 48 (R12)
UXTB	R10, R12
IT	AL
BAL	L_LCD_GLASS_ScrollSentence810
L_LCD_GLASS_ScrollSentence811:
;glass_lcd.c,345 :: 		ptr1 = ptr;
; Str_size start address is: 40 (R10)
STR	R0, [SP, #4]
;glass_lcd.c,346 :: 		LCD_GLASS_DisplayString(ptr);
; ptr end address is: 0 (R0)
BL	_LCD_GLASS_DisplayString+0
;glass_lcd.c,347 :: 		Vdelay_ms(ScrollSpeed);
UXTH	R0, R11
BL	_VDelay_ms+0
;glass_lcd.c,350 :: 		for(Repetition = 0x00; Repetition < nScroll; Repetition++)
MOVS	R3, #0
STRB	R3, [SP, #8]
; Str_size end address is: 40 (R10)
; ScrollSpeed end address is: 44 (R11)
UXTB	R1, R10
UXTH	R0, R11
L_LCD_GLASS_ScrollSentence813:
; ScrollSpeed start address is: 0 (R0)
; Str_size start address is: 4 (R1)
LDRH	R4, [SP, #16]
LDRB	R3, [SP, #8]
CMP	R3, R4
IT	CS
BCS	L_LCD_GLASS_ScrollSentence814
;glass_lcd.c,352 :: 		for(Char_Nb = 0x00; Char_Nb < Str_size; Char_Nb++)
; Char_Nb start address is: 8 (R2)
MOVS	R2, #0
; ScrollSpeed end address is: 0 (R0)
; Str_size end address is: 4 (R1)
; Char_Nb end address is: 8 (R2)
UXTH	R11, R0
UXTB	R10, R1
UXTB	R12, R2
L_LCD_GLASS_ScrollSentence816:
; Char_Nb start address is: 48 (R12)
; Str_size start address is: 40 (R10)
; ScrollSpeed start address is: 44 (R11)
CMP	R12, R10
IT	CS
BCS	L_LCD_GLASS_ScrollSentence817
;glass_lcd.c,354 :: 		*(str) = *(ptr1 + ((Char_Nb + 0x01) % Str_size));
ADD	R6, SP, #9
ADD	R3, R12, #1
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R6, #0]
;glass_lcd.c,355 :: 		*(str + 0x01) = *(ptr1 + ((Char_Nb + 0x02) % Str_size));
ADDS	R5, R6, #1
ADD	R3, R12, #2
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R5, #0]
;glass_lcd.c,356 :: 		*(str + 0x02) = *(ptr1 + ((Char_Nb + 0x03) % Str_size));
ADDS	R5, R6, #2
ADD	R3, R12, #3
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R5, #0]
;glass_lcd.c,357 :: 		*(str + 0x03) = *(ptr1 + ((Char_Nb + 0x04) % Str_size));
ADDS	R5, R6, #3
ADD	R3, R12, #4
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R5, #0]
;glass_lcd.c,358 :: 		*(str + 0x04) = *(ptr1 + ((Char_Nb + 0x05) % Str_size));
ADDS	R5, R6, #4
ADD	R3, R12, #5
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R5, #0]
;glass_lcd.c,359 :: 		*(str + 0x05) = *(ptr1 + ((Char_Nb + 0x06) % Str_size));
ADDS	R5, R6, #5
ADD	R3, R12, #6
SXTH	R3, R3
SDIV	R4, R3, R10
MLS	R4, R10, R4, R3
SXTH	R4, R4
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
STRB	R3, [R5, #0]
;glass_lcd.c,360 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;glass_lcd.c,361 :: 		LCD_GLASS_DisplayString(str);
ADD	R3, SP, #9
MOV	R0, R3
BL	_LCD_GLASS_DisplayString+0
;glass_lcd.c,363 :: 		Vdelay_ms(ScrollSpeed);
UXTH	R0, R11
BL	_VDelay_ms+0
;glass_lcd.c,352 :: 		for(Char_Nb = 0x00; Char_Nb < Str_size; Char_Nb++)
ADD	R3, R12, #1
; Char_Nb end address is: 48 (R12)
; Char_Nb start address is: 8 (R2)
UXTB	R2, R3
;glass_lcd.c,364 :: 		}
; Char_Nb end address is: 8 (R2)
UXTB	R12, R2
IT	AL
BAL	L_LCD_GLASS_ScrollSentence816
L_LCD_GLASS_ScrollSentence817:
;glass_lcd.c,350 :: 		for(Repetition = 0x00; Repetition < nScroll; Repetition++)
LDRB	R3, [SP, #8]
ADDS	R3, R3, #1
STRB	R3, [SP, #8]
;glass_lcd.c,365 :: 		}
UXTB	R1, R10
; Str_size end address is: 40 (R10)
; ScrollSpeed end address is: 44 (R11)
UXTH	R0, R11
IT	AL
BAL	L_LCD_GLASS_ScrollSentence813
L_LCD_GLASS_ScrollSentence814:
;glass_lcd.c,366 :: 		}
L_end_LCD_GLASS_ScrollSentence:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _LCD_GLASS_ScrollSentence
glits_LCD_Conv_Char_Seg:
;glass_lcd.c,369 :: 		static void LCD_Conv_Char_Seg(unsigned char *c, unsigned char point, unsigned char column, unsigned char *digit)
; digit start address is: 12 (R3)
; column start address is: 8 (R2)
; point start address is: 4 (R1)
; c start address is: 0 (R0)
SUB	SP, SP, #4
; digit end address is: 12 (R3)
; column end address is: 8 (R2)
; point end address is: 4 (R1)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
; point start address is: 4 (R1)
; column start address is: 8 (R2)
; digit start address is: 12 (R3)
;glass_lcd.c,371 :: 		unsigned char i = 0x00;
;glass_lcd.c,372 :: 		unsigned char j = 0x00;
;glass_lcd.c,374 :: 		unsigned int ch = 0x0000;
; ch start address is: 20 (R5)
MOVW	R5, #0
;glass_lcd.c,376 :: 		switch(*c)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg819
; c end address is: 0 (R0)
; ch end address is: 20 (R5)
;glass_lcd.c,378 :: 		case ' ':
L_glits_LCD_Conv_Char_Seg821:
;glass_lcd.c,380 :: 		ch = 0x00;
; ch start address is: 0 (R0)
MOVS	R0, #0
;glass_lcd.c,381 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,383 :: 		case '*':
L_glits_LCD_Conv_Char_Seg822:
;glass_lcd.c,385 :: 		ch = star;
; ch start address is: 0 (R0)
MOVW	R0, #41181
;glass_lcd.c,386 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,388 :: 		case 'µ':
L_glits_LCD_Conv_Char_Seg823:
;glass_lcd.c,390 :: 		ch = C_UMAP;
; ch start address is: 0 (R0)
MOVW	R0, #24708
;glass_lcd.c,391 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,393 :: 		case 'm':
L_glits_LCD_Conv_Char_Seg824:
;glass_lcd.c,395 :: 		ch = C_mMap;
; ch start address is: 0 (R0)
MOVW	R0, #45584
;glass_lcd.c,396 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,398 :: 		case 'n':
L_glits_LCD_Conv_Char_Seg825:
;glass_lcd.c,400 :: 		ch = C_nMap;
; ch start address is: 0 (R0)
MOVW	R0, #8720
;glass_lcd.c,401 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,403 :: 		case '-':
L_glits_LCD_Conv_Char_Seg826:
;glass_lcd.c,405 :: 		ch = C_minus;
; ch start address is: 0 (R0)
MOVW	R0, #40960
;glass_lcd.c,406 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,408 :: 		case '/':
L_glits_LCD_Conv_Char_Seg827:
;glass_lcd.c,410 :: 		ch = C_slatch;
; ch start address is: 0 (R0)
MOVS	R0, #192
;glass_lcd.c,411 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,413 :: 		case '°':
L_glits_LCD_Conv_Char_Seg828:
;glass_lcd.c,415 :: 		ch = C_percent_1;
; ch start address is: 0 (R0)
MOVW	R0, #60416
;glass_lcd.c,416 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,418 :: 		case '%':
L_glits_LCD_Conv_Char_Seg829:
;glass_lcd.c,420 :: 		ch = C_percent_2;
; ch start address is: 0 (R0)
MOVW	R0, #45824
;glass_lcd.c,421 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,423 :: 		case '[':
L_glits_LCD_Conv_Char_Seg830:
;glass_lcd.c,425 :: 		ch = bracket_open;
; ch start address is: 0 (R0)
MOVW	R0, #7424
;glass_lcd.c,426 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,428 :: 		case ']':
L_glits_LCD_Conv_Char_Seg831:
;glass_lcd.c,430 :: 		ch = bracket_close;
; ch start address is: 0 (R0)
MOVW	R0, #18176
;glass_lcd.c,431 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,433 :: 		case 0xFF:
L_glits_LCD_Conv_Char_Seg832:
;glass_lcd.c,435 :: 		ch = C_full;
; ch start address is: 0 (R0)
MOVW	R0, #65501
;glass_lcd.c,436 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,438 :: 		case '0':
L_glits_LCD_Conv_Char_Seg833:
;glass_lcd.c,439 :: 		case '1':
; c start address is: 0 (R0)
L_glits_LCD_Conv_Char_Seg834:
;glass_lcd.c,440 :: 		case '2':
L_glits_LCD_Conv_Char_Seg835:
;glass_lcd.c,441 :: 		case '3':
L_glits_LCD_Conv_Char_Seg836:
;glass_lcd.c,442 :: 		case '4':
L_glits_LCD_Conv_Char_Seg837:
;glass_lcd.c,443 :: 		case '5':
L_glits_LCD_Conv_Char_Seg838:
;glass_lcd.c,444 :: 		case '6':
L_glits_LCD_Conv_Char_Seg839:
;glass_lcd.c,445 :: 		case '7':
L_glits_LCD_Conv_Char_Seg840:
;glass_lcd.c,446 :: 		case '8':
L_glits_LCD_Conv_Char_Seg841:
;glass_lcd.c,447 :: 		case '9':
L_glits_LCD_Conv_Char_Seg842:
;glass_lcd.c,449 :: 		ch = NumberMap[(*c - 0x30)];
LDRB	R4, [R0, #0]
; c end address is: 0 (R0)
SUBS	R4, #48
SXTH	R4, R4
LSLS	R5, R4, #1
MOVW	R4, #lo_addr(_NumberMap+0)
MOVT	R4, #hi_addr(_NumberMap+0)
ADDS	R4, R4, R5
LDRH	R0, [R4, #0]
; ch start address is: 0 (R0)
;glass_lcd.c,450 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,452 :: 		default:
L_glits_LCD_Conv_Char_Seg843:
;glass_lcd.c,455 :: 		if((*c < 0x5B) && (*c > 0x40))
; ch start address is: 20 (R5)
; c start address is: 0 (R0)
LDRB	R4, [R0, #0]
CMP	R4, #91
IT	CS
BCS	L_glits_LCD_Conv_Char_Seg968
LDRB	R4, [R0, #0]
CMP	R4, #64
IT	LS
BLS	L_glits_LCD_Conv_Char_Seg969
; ch end address is: 20 (R5)
L_glits_LCD_Conv_Char_Seg963:
;glass_lcd.c,457 :: 		ch = CapLetterMap[(*c - 'A')];
LDRB	R4, [R0, #0]
SUBS	R4, #65
SXTH	R4, R4
LSLS	R5, R4, #1
MOVW	R4, #lo_addr(_CapLetterMap+0)
MOVT	R4, #hi_addr(_CapLetterMap+0)
ADDS	R4, R4, R5
LDRH	R5, [R4, #0]
; ch start address is: 20 (R5)
; ch end address is: 20 (R5)
;glass_lcd.c,455 :: 		if((*c < 0x5B) && (*c > 0x40))
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg965
L_glits_LCD_Conv_Char_Seg968:
L_glits_LCD_Conv_Char_Seg965:
; ch start address is: 20 (R5)
; ch end address is: 20 (R5)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg964
L_glits_LCD_Conv_Char_Seg969:
L_glits_LCD_Conv_Char_Seg964:
;glass_lcd.c,460 :: 		if((*c <0x7B) && (*c > 0x60))
; ch start address is: 20 (R5)
LDRB	R4, [R0, #0]
CMP	R4, #123
IT	CS
BCS	L_glits_LCD_Conv_Char_Seg970
LDRB	R4, [R0, #0]
CMP	R4, #96
IT	LS
BLS	L_glits_LCD_Conv_Char_Seg971
; ch end address is: 20 (R5)
L_glits_LCD_Conv_Char_Seg962:
;glass_lcd.c,462 :: 		ch = SmallLetterMap[(*c - 'a')];
LDRB	R4, [R0, #0]
; c end address is: 0 (R0)
SUBS	R4, #97
SXTH	R4, R4
LSLS	R5, R4, #1
MOVW	R4, #lo_addr(_SmallLetterMap+0)
MOVT	R4, #hi_addr(_SmallLetterMap+0)
ADDS	R4, R4, R5
LDRH	R0, [R4, #0]
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;glass_lcd.c,460 :: 		if((*c <0x7B) && (*c > 0x60))
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg967
L_glits_LCD_Conv_Char_Seg970:
UXTH	R0, R5
L_glits_LCD_Conv_Char_Seg967:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg966
L_glits_LCD_Conv_Char_Seg971:
UXTH	R0, R5
L_glits_LCD_Conv_Char_Seg966:
;glass_lcd.c,464 :: 		break;
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg820
;glass_lcd.c,466 :: 		}
L_glits_LCD_Conv_Char_Seg819:
; ch start address is: 20 (R5)
; c start address is: 0 (R0)
LDRB	R4, [R0, #0]
CMP	R4, #32
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg821
LDRB	R4, [R0, #0]
CMP	R4, #42
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg822
LDRB	R4, [R0, #0]
CMP	R4, #181
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg823
LDRB	R4, [R0, #0]
CMP	R4, #109
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg824
LDRB	R4, [R0, #0]
CMP	R4, #110
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg825
LDRB	R4, [R0, #0]
CMP	R4, #45
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg826
LDRB	R4, [R0, #0]
CMP	R4, #47
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg827
LDRB	R4, [R0, #0]
CMP	R4, #176
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg828
LDRB	R4, [R0, #0]
CMP	R4, #37
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg829
LDRB	R4, [R0, #0]
CMP	R4, #91
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg830
LDRB	R4, [R0, #0]
CMP	R4, #93
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg831
LDRB	R4, [R0, #0]
CMP	R4, #255
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg832
LDRB	R4, [R0, #0]
CMP	R4, #48
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg833
LDRB	R4, [R0, #0]
CMP	R4, #49
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg834
LDRB	R4, [R0, #0]
CMP	R4, #50
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg835
LDRB	R4, [R0, #0]
CMP	R4, #51
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg836
LDRB	R4, [R0, #0]
CMP	R4, #52
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg837
LDRB	R4, [R0, #0]
CMP	R4, #53
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg838
LDRB	R4, [R0, #0]
CMP	R4, #54
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg839
LDRB	R4, [R0, #0]
CMP	R4, #55
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg840
LDRB	R4, [R0, #0]
CMP	R4, #56
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg841
LDRB	R4, [R0, #0]
CMP	R4, #57
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg842
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg843
; c end address is: 0 (R0)
; ch end address is: 20 (R5)
L_glits_LCD_Conv_Char_Seg820:
;glass_lcd.c,469 :: 		if(point != 0)
; ch start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg972
; point end address is: 4 (R1)
;glass_lcd.c,471 :: 		ch |= 0x0002;
ORR	R0, R0, #2
UXTH	R0, R0
; ch end address is: 0 (R0)
;glass_lcd.c,472 :: 		}
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg850
L_glits_LCD_Conv_Char_Seg972:
;glass_lcd.c,469 :: 		if(point != 0)
;glass_lcd.c,472 :: 		}
L_glits_LCD_Conv_Char_Seg850:
;glass_lcd.c,475 :: 		if(column != 0)
; ch start address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_glits_LCD_Conv_Char_Seg973
; column end address is: 8 (R2)
;glass_lcd.c,477 :: 		ch |= 0x0020;
ORR	R0, R0, #32
UXTH	R0, R0
; ch end address is: 0 (R0)
;glass_lcd.c,478 :: 		}
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg851
L_glits_LCD_Conv_Char_Seg973:
;glass_lcd.c,475 :: 		if(column != 0)
;glass_lcd.c,478 :: 		}
L_glits_LCD_Conv_Char_Seg851:
;glass_lcd.c,480 :: 		for(i = 0x0C, j = 0x00 ; j < 0x04; i -= 0x04, j++)
; ch start address is: 0 (R0)
; i start address is: 4 (R1)
MOVS	R1, #12
; j start address is: 8 (R2)
MOVS	R2, #0
; digit end address is: 12 (R3)
; i end address is: 4 (R1)
; j end address is: 8 (R2)
STRB	R1, [SP, #0]
MOV	R1, R3
LDRB	R3, [SP, #0]
L_glits_LCD_Conv_Char_Seg852:
; j start address is: 8 (R2)
; digit start address is: 4 (R1)
; i start address is: 12 (R3)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; digit start address is: 4 (R1)
; digit end address is: 4 (R1)
CMP	R2, #4
IT	CS
BCS	L_glits_LCD_Conv_Char_Seg853
; ch end address is: 0 (R0)
; digit end address is: 4 (R1)
;glass_lcd.c,482 :: 		digit[j] = ((ch >> i) & 0x0F); //To isolate the less signifiant bit
; digit start address is: 4 (R1)
; ch start address is: 0 (R0)
ADDS	R5, R1, R2
LSR	R4, R0, R3
UXTH	R4, R4
AND	R4, R4, #15
STRB	R4, [R5, #0]
;glass_lcd.c,480 :: 		for(i = 0x0C, j = 0x00 ; j < 0x04; i -= 0x04, j++)
SUBS	R4, R3, #4
UXTB	R3, R4
ADDS	R2, R2, #1
UXTB	R2, R2
;glass_lcd.c,483 :: 		}
; ch end address is: 0 (R0)
; digit end address is: 4 (R1)
; i end address is: 12 (R3)
; j end address is: 8 (R2)
IT	AL
BAL	L_glits_LCD_Conv_Char_Seg852
L_glits_LCD_Conv_Char_Seg853:
;glass_lcd.c,484 :: 		}
L_end_LCD_Conv_Char_Seg:
ADD	SP, SP, #4
BX	LR
; end of glits_LCD_Conv_Char_Seg
_ADC_ISR:
;glits.c,29 :: 		ics ICS_AUTO
;glits.c,31 :: 		if(get_ADC_AWD_flag() != 0)
MOVW	R0, #lo_addr(ADC_SR+0)
MOVT	R0, #hi_addr(ADC_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_ADC_ISR855
;glits.c,33 :: 		GPIOB_pin_high(6);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;glits.c,34 :: 		clear_ADC_AWD_flag();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC_SRbits+0)
MOVT	R0, #hi_addr(ADC_SRbits+0)
STR	R1, [R0, #0]
;glits.c,35 :: 		}
L_ADC_ISR855:
;glits.c,37 :: 		if(get_ADC_regular_channel_EOC_state() != 0)
MOVW	R0, #lo_addr(ADC_SR+0)
MOVT	R0, #hi_addr(ADC_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	EQ
BEQ	L_ADC_ISR856
;glits.c,39 :: 		adc_accum += (ADC_DR & 0x0FFF);;
MOVW	R0, #lo_addr(ADC_DR+0)
MOVT	R0, #hi_addr(ADC_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
AND	R2, R1, R0, LSL #0
MOVW	R1, #lo_addr(_adc_accum+0)
MOVT	R1, #hi_addr(_adc_accum+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;glits.c,40 :: 		samples++;
MOVW	R1, #lo_addr(_samples+0)
MOVT	R1, #hi_addr(_samples+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;glits.c,41 :: 		if(samples >= 16)
CMP	R0, #16
IT	CC
BCC	L_ADC_ISR857
;glits.c,43 :: 		avg = (adc_accum >> 4);
MOVW	R2, #lo_addr(_adc_accum+0)
MOVT	R2, #hi_addr(_adc_accum+0)
LDR	R0, [R2, #0]
ASRS	R1, R0, #4
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
STRH	R1, [R0, #0]
;glits.c,44 :: 		adc_accum = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;glits.c,45 :: 		samples = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_samples+0)
MOVT	R0, #hi_addr(_samples+0)
STRB	R1, [R0, #0]
;glits.c,46 :: 		}
L_ADC_ISR857:
;glits.c,47 :: 		}
L_ADC_ISR856:
;glits.c,48 :: 		}
L_end_ADC_ISR:
BX	LR
; end of _ADC_ISR
_main:
;glits.c,51 :: 		void main()
SUB	SP, SP, #4
;glits.c,54 :: 		float t = 0;
;glits.c,56 :: 		setup_LCD();
BL	_setup_LCD+0
;glits.c,57 :: 		setup_ADC();
BL	_setup_ADC+0
;glits.c,58 :: 		setup_GPIOs();
BL	_setup_GPIOs+0
;glits.c,60 :: 		while(1)
L_main858:
;glits.c,62 :: 		if(get_GPIOA_pin_state(0) == 1)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #1
IT	NE
BNE	L_main860
;glits.c,64 :: 		while(get_GPIOA_pin_state(0) == 1);
L_main861:
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #1
IT	NE
BNE	L_main862
IT	AL
BAL	L_main861
L_main862:
;glits.c,65 :: 		disp = ~disp;
LDRB	R0, [SP, #0]
UBFX	R0, R0, #0, #1
EOR	R1, R0, #1
LDRB	R0, [SP, #0]
BFI	R0, R1, #0, #1
STRB	R0, [SP, #0]
;glits.c,66 :: 		}
L_main860:
;glits.c,68 :: 		switch(disp)
IT	AL
BAL	L_main863
;glits.c,70 :: 		case 1:
L_main865:
;glits.c,72 :: 		show_value(avg, 0);
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
LDRH	R0, [R0, #0]
MOVS	R1, #0
BL	_show_value+0
;glits.c,73 :: 		break;
IT	AL
BAL	L_main864
;glits.c,75 :: 		default:
L_main866:
;glits.c,78 :: 		t *= (avg - TS_CAL1);
MOVW	R0, #lo_addr(_avg+0)
MOVT	R0, #hi_addr(_avg+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, #676
UXTH	R0, R0
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #27029
MOVT	R2, #16103
BL	__Mul_FP+0
;glits.c,79 :: 		t += 30.0;
MOVW	R2, #0
MOVT	R2, #16880
BL	__Add_FP+0
;glits.c,80 :: 		t *= 10;
MOVW	R2, #0
MOVT	R2, #16672
BL	__Mul_FP+0
;glits.c,81 :: 		t -= offset;
MOVW	R2, #0
MOVT	R2, #17096
BL	__Sub_FP+0
;glits.c,83 :: 		show_value(t, 1);
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
MOVS	R1, #1
BL	_show_value+0
;glits.c,84 :: 		break;
IT	AL
BAL	L_main864
;glits.c,86 :: 		}
L_main863:
LDRB	R0, [SP, #0]
UBFX	R0, R0, #0, #1
CMP	R0, #0
IT	NE
BNE	L_main865
IT	AL
BAL	L_main866
L_main864:
;glits.c,88 :: 		delay_ms(200);
MOVW	R7, #27135
MOVT	R7, #24
NOP
NOP
L_main867:
SUBS	R7, R7, #1
BNE	L_main867
NOP
NOP
NOP
NOP
;glits.c,89 :: 		GPIOB_pin_low(6);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;glits.c,90 :: 		set_ADC_regular_conversions(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R1, [R0, #0]
;glits.c,92 :: 		};
IT	AL
BAL	L_main858
;glits.c,93 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_LCD:
;glits.c,96 :: 		void setup_LCD()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;glits.c,98 :: 		LCD_GLASS_Init();
BL	_LCD_GLASS_Init+0
;glits.c,99 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;glits.c,100 :: 		}
L_end_setup_LCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_LCD
_setup_ADC:
;glits.c,103 :: 		void setup_ADC()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;glits.c,105 :: 		enable_ADC_low_power(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB2LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2LPENRbits+0)
STR	R3, [R0, #0]
;glits.c,106 :: 		enable_ADC(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R3, [R0, #0]
;glits.c,107 :: 		enable_ADC_block(false);
MOVS	R2, #0
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R2, [R0, #0]
;glits.c,108 :: 		set_ADC_configuration(Bank_A);
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
STR	R1, [R0, #0]
;glits.c,109 :: 		set_ADC_resolution(ADC_12_bits);
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
STR	R1, [R0, #0]
;glits.c,110 :: 		set_ADC_data_alignment(right_align);
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R2, [R0, #0]
;glits.c,111 :: 		set_ADC_power_down_during_delay_phase(ADC_powered_down_during_delay);
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R3, [R0, #0]
;glits.c,112 :: 		set_ADC_power_down_during_idle_phase(ADC_powered_down_when_waiting_for_start_event);
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R3, [R0, #0]
;glits.c,113 :: 		set_ADC_end_of_conversion_selection(EOC_at_each_conversion);
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R3, [R0, #0]
;glits.c,114 :: 		set_ADC_EOC_delay(until_read);
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(ADC_CR2+0)
MOVT	R0, #hi_addr(ADC_CR2+0)
STR	R1, [R0, #0]
;glits.c,115 :: 		set_ADC_reference_and_temperature_sensor(true);
MOVW	R0, #lo_addr(ADC_CCRbits+0)
MOVT	R0, #hi_addr(ADC_CCRbits+0)
STR	R3, [R0, #0]
;glits.c,116 :: 		set_ADC_AWD_for_regular_channels(true);
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R3, [R0, #0]
;glits.c,117 :: 		set_ADC_AWD_on_single_channel_in_scan_mode(AWD_enabled_on_single_channel);
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R3, [R0, #0]
;glits.c,118 :: 		set_ADC_AWD_channel(16);
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #31
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(ADC_CR1+0)
MOVT	R0, #hi_addr(ADC_CR1+0)
STR	R1, [R0, #0]
;glits.c,119 :: 		set_ADC_AWD_high_threshold(700);
MOVW	R1, #700
MOVW	R0, #lo_addr(ADC_HTR+0)
MOVT	R0, #hi_addr(ADC_HTR+0)
STR	R1, [R0, #0]
;glits.c,120 :: 		set_ADC_AWD_low_threshold(600);
MOVW	R1, #600
MOVW	R0, #lo_addr(ADC_LTR+0)
MOVT	R0, #hi_addr(ADC_LTR+0)
STR	R1, [R0, #0]
;glits.c,121 :: 		enable_ADC_continuous_conversion(false);
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R2, [R0, #0]
;glits.c,122 :: 		set_ADC_sample_time(sample_time_96_cycles, 16);
L_setup_ADC884:
MOVW	R0, #lo_addr(ADC_SMPR2+0)
MOVT	R0, #hi_addr(ADC_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #1835008
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_SMPR2+0)
MOVT	R0, #hi_addr(ADC_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_SMPR2+0)
MOVT	R0, #hi_addr(ADC_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1310720
MOVW	R0, #lo_addr(ADC_SMPR2+0)
MOVT	R0, #hi_addr(ADC_SMPR2+0)
STR	R1, [R0, #0]
L_setup_ADC889:
;glits.c,123 :: 		set_ADC_regular_number_of_conversions(1);
MOVW	R0, #lo_addr(ADC_SQR1+0)
MOVT	R0, #hi_addr(ADC_SQR1+0)
LDR	R1, [R0, #0]
MVN	R0, #32505856
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_SQR1+0)
MOVT	R0, #hi_addr(ADC_SQR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_SQR1+0)
MOVT	R0, #hi_addr(ADC_SQR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_SQR1+0)
MOVT	R0, #hi_addr(ADC_SQR1+0)
STR	R1, [R0, #0]
;glits.c,124 :: 		set_ADC_regular_sequence(1, 16);
MOVW	R0, #lo_addr(ADC_SQR5+0)
MOVT	R0, #hi_addr(ADC_SQR5+0)
LDR	R1, [R0, #0]
MVN	R0, #31
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_SQR5+0)
MOVT	R0, #hi_addr(ADC_SQR5+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_SQR5+0)
MOVT	R0, #hi_addr(ADC_SQR5+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(ADC_SQR5+0)
MOVT	R0, #hi_addr(ADC_SQR5+0)
STR	R1, [R0, #0]
L_setup_ADC900:
;glits.c,125 :: 		set_ADC_prescaler(HSI_div_4);
MOVW	R0, #lo_addr(ADC_CCR+0)
MOVT	R0, #hi_addr(ADC_CCR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC_CCR+0)
MOVT	R0, #hi_addr(ADC_CCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC_CCR+0)
MOVT	R0, #hi_addr(ADC_CCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(ADC_CCR+0)
MOVT	R0, #hi_addr(ADC_CCR+0)
STR	R1, [R0, #0]
;glits.c,126 :: 		set_ADC_AWD_interrupt(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R1, [R0, #0]
;glits.c,127 :: 		set_ADC_end_of_conversion_interrupt(true);
MOVW	R0, #lo_addr(ADC_CR1bits+0)
MOVT	R0, #hi_addr(ADC_CR1bits+0)
STR	R1, [R0, #0]
;glits.c,128 :: 		NVIC_IntEnable(IVT_INT_ADC1);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;glits.c,129 :: 		NVIC_SetIntPriority(IVT_INT_ADC1, _NVIC_INT_PRIORITY_LVL1);
MOVS	R1, #1
MOVS	R0, #34
BL	_NVIC_SetIntPriority+0
;glits.c,130 :: 		delay_ms(1);
MOVW	R7, #7999
MOVT	R7, #0
NOP
NOP
L_setup_ADC911:
SUBS	R7, R7, #1
BNE	L_setup_ADC911
NOP
NOP
;glits.c,131 :: 		ADC_SR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC_SR+0)
MOVT	R0, #hi_addr(ADC_SR+0)
STR	R1, [R0, #0]
;glits.c,132 :: 		ADC_CSR = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC_CSR+0)
MOVT	R0, #hi_addr(ADC_CSR+0)
STR	R1, [R0, #0]
;glits.c,133 :: 		enable_ADC_block(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC_CR2bits+0)
MOVT	R0, #hi_addr(ADC_CR2bits+0)
STR	R1, [R0, #0]
;glits.c,134 :: 		delay_ms(20);
MOVW	R7, #28927
MOVT	R7, #2
NOP
NOP
L_setup_ADC913:
SUBS	R7, R7, #1
BNE	L_setup_ADC913
NOP
NOP
NOP
NOP
;glits.c,135 :: 		}
L_end_setup_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_ADC
_setup_GPIOs:
;glits.c,138 :: 		void setup_GPIOs()
;glits.c,140 :: 		enable_GPIOA(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R2, [R0, #0]
;glits.c,141 :: 		setup_GPIOA(0, GPIO_input, output_PP, medium_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;glits.c,143 :: 		enable_GPIOB(true);
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R2, [R0, #0]
;glits.c,144 :: 		setup_GPIOB(6, GPIO_output, output_PP, medium_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #64
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOB_OSPEEDER+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;glits.c,145 :: 		}
L_end_setup_GPIOs:
BX	LR
; end of _setup_GPIOs
_show_value:
;glits.c,148 :: 		void show_value(signed int value, unsigned char type)
; type start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R10, R1
; type end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; type start address is: 40 (R10)
;glits.c,150 :: 		unsigned char ch[1] = {0x20};
MOVS	R2, #32
STRB	R2, [SP, #4]
;glits.c,153 :: 		if(value > 0)
CMP	R0, #0
IT	LE
BLE	L_show_value945
;glits.c,155 :: 		ch[0] = 0x20;
ADD	R3, SP, #4
MOVS	R2, #32
STRB	R2, [R3, #0]
;glits.c,156 :: 		}
SXTH	R11, R0
IT	AL
BAL	L_show_value946
L_show_value945:
;glits.c,159 :: 		ch[0] = 0x2D;
ADD	R3, SP, #4
MOVS	R2, #45
STRB	R2, [R3, #0]
;glits.c,160 :: 		value = -value;
RSB	R11, R0, #0
SXTH	R11, R11
; value end address is: 0 (R0)
; value start address is: 44 (R11)
; value end address is: 44 (R11)
;glits.c,161 :: 		}
L_show_value946:
;glits.c,162 :: 		LCD_GLASS_WriteChar(ch, false, 0, 1);
; value start address is: 44 (R11)
ADD	R2, SP, #4
MOVS	R3, #1
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,164 :: 		if((value > 999) && (value <= 9999))
MOVW	R2, #999
CMP	R11, R2
IT	LE
BLE	L__show_value978
MOVW	R2, #9999
CMP	R11, R2
IT	GT
BGT	L__show_value977
L__show_value976:
;glits.c,167 :: 		ch[0] = ((value / 1000) + 0x30);
ADD	R3, SP, #4
STR	R3, [SP, #8]
MOVW	R2, #1000
SXTH	R2, R2
SDIV	R2, R11, R2
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R3, #0]
;glits.c,168 :: 		LCD_GLASS_WriteChar(ch, false, 0, 2);
MOVS	R2, #0
MOVS	R1, #0
MOV	R0, R3
MOVS	R3, #2
BL	_LCD_GLASS_WriteChar+0
;glits.c,169 :: 		ch[0] = (((value / 100) % 10) + 0x30);
ADD	R5, SP, #4
MOVS	R2, #100
SXTH	R2, R2
SDIV	R4, R11, R2
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R4, R3
MLS	R2, R3, R2, R4
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R5, #0]
;glits.c,170 :: 		LCD_GLASS_WriteChar(ch, false, 0, 3);
LDR	R2, [SP, #8]
MOVS	R3, #3
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,171 :: 		ch[0] = (((value / 10) % 10) + 0x30);
ADD	R5, SP, #4
MOVS	R2, #10
SXTH	R2, R2
SDIV	R4, R11, R2
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R4, R3
MLS	R2, R3, R2, R4
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R5, #0]
;glits.c,172 :: 		LCD_GLASS_WriteChar(ch, type, 0, 4);
LDR	R2, [SP, #8]
MOVS	R3, #4
UXTB	R1, R10
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,173 :: 		ch[0] = ((value % 10) + 0x30);
ADD	R4, SP, #4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R11, R3
MLS	R2, R3, R2, R11
SXTH	R2, R2
; value end address is: 44 (R11)
ADDS	R2, #48
STRB	R2, [R4, #0]
;glits.c,174 :: 		LCD_GLASS_WriteChar(ch, false, 0, 5);
LDR	R2, [SP, #8]
MOVS	R3, #5
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,176 :: 		show_const_msgs(6, type);
UXTB	R1, R10
; type end address is: 40 (R10)
MOVS	R0, #6
BL	_show_const_msgs+0
;glits.c,177 :: 		}
IT	AL
BAL	L_show_value950
;glits.c,164 :: 		if((value > 999) && (value <= 9999))
L__show_value978:
; value start address is: 44 (R11)
; type start address is: 40 (R10)
L__show_value977:
;glits.c,178 :: 		else if((value > 99) && (value <= 999))
CMP	R11, #99
IT	LE
BLE	L__show_value980
MOVW	R2, #999
CMP	R11, R2
IT	GT
BGT	L__show_value979
L__show_value975:
;glits.c,180 :: 		ch[0] = (((value / 100) % 10) + 0x30);
ADD	R5, SP, #4
STR	R5, [SP, #8]
MOVS	R2, #100
SXTH	R2, R2
SDIV	R4, R11, R2
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R4, R3
MLS	R2, R3, R2, R4
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R5, #0]
;glits.c,181 :: 		LCD_GLASS_WriteChar(ch, false, 0, 2);
MOVS	R3, #2
MOVS	R2, #0
MOVS	R1, #0
MOV	R0, R5
BL	_LCD_GLASS_WriteChar+0
;glits.c,182 :: 		ch[0] = (((value / 10) % 10) + 0x30);
ADD	R5, SP, #4
MOVS	R2, #10
SXTH	R2, R2
SDIV	R4, R11, R2
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R4, R3
MLS	R2, R3, R2, R4
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R5, #0]
;glits.c,183 :: 		LCD_GLASS_WriteChar(ch, type, 0, 3);
LDR	R2, [SP, #8]
MOVS	R3, #3
UXTB	R1, R10
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,184 :: 		ch[0] = ((value % 10) + 0x30);
ADD	R4, SP, #4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R11, R3
MLS	R2, R3, R2, R11
SXTH	R2, R2
; value end address is: 44 (R11)
ADDS	R2, #48
STRB	R2, [R4, #0]
;glits.c,185 :: 		LCD_GLASS_WriteChar(ch, false, 0, 4);
LDR	R2, [SP, #8]
MOVS	R3, #4
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,187 :: 		show_const_msgs(5, type);
UXTB	R1, R10
; type end address is: 40 (R10)
MOVS	R0, #5
BL	_show_const_msgs+0
;glits.c,189 :: 		ch[0] = 0x20;
ADD	R3, SP, #4
MOVS	R2, #32
STRB	R2, [R3, #0]
;glits.c,190 :: 		LCD_GLASS_WriteChar(ch, false, 0, 7);
LDR	R2, [SP, #8]
MOVS	R3, #7
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,192 :: 		}
IT	AL
BAL	L_show_value954
;glits.c,178 :: 		else if((value > 99) && (value <= 999))
L__show_value980:
; value start address is: 44 (R11)
; type start address is: 40 (R10)
L__show_value979:
;glits.c,193 :: 		else if((value >= 0) && (value <= 99))
CMP	R11, #0
IT	LT
BLT	L__show_value982
CMP	R11, #99
IT	GT
BGT	L__show_value981
L__show_value974:
;glits.c,195 :: 		ch[0] = (((value / 10) % 10) + 0x30);
ADD	R5, SP, #4
STR	R5, [SP, #8]
MOVS	R2, #10
SXTH	R2, R2
SDIV	R4, R11, R2
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R4, R3
MLS	R2, R3, R2, R4
SXTH	R2, R2
ADDS	R2, #48
STRB	R2, [R5, #0]
;glits.c,196 :: 		LCD_GLASS_WriteChar(ch, type, 0, 2);
MOVS	R3, #2
MOVS	R2, #0
UXTB	R1, R10
MOV	R0, R5
BL	_LCD_GLASS_WriteChar+0
;glits.c,197 :: 		ch[0] = ((value % 10) + 0x30);
ADD	R4, SP, #4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R2, R11, R3
MLS	R2, R3, R2, R11
SXTH	R2, R2
; value end address is: 44 (R11)
ADDS	R2, #48
STRB	R2, [R4, #0]
;glits.c,198 :: 		LCD_GLASS_WriteChar(ch, false, 0, 3);
LDR	R2, [SP, #8]
MOVS	R3, #3
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,200 :: 		show_const_msgs(4, type);
UXTB	R1, R10
; type end address is: 40 (R10)
MOVS	R0, #4
BL	_show_const_msgs+0
;glits.c,201 :: 		clear_disp(6);
MOVS	R0, #6
BL	_clear_disp+0
;glits.c,193 :: 		else if((value >= 0) && (value <= 99))
L__show_value982:
L__show_value981:
;glits.c,202 :: 		}
L_show_value954:
L_show_value950:
;glits.c,203 :: 		}
L_end_show_value:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _show_value
_show_const_msgs:
;glits.c,206 :: 		void show_const_msgs(unsigned char pos, unsigned char type)
; type start address is: 4 (R1)
; pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R9, R0
; type end address is: 4 (R1)
; pos end address is: 0 (R0)
; pos start address is: 36 (R9)
; type start address is: 4 (R1)
;glits.c,208 :: 		switch(type)
IT	AL
BAL	L_show_const_msgs958
; type end address is: 4 (R1)
;glits.c,210 :: 		case 1:
L_show_const_msgs960:
;glits.c,212 :: 		show_degree_C(pos);
UXTB	R0, R9
; pos end address is: 36 (R9)
BL	_show_degree_C+0
;glits.c,213 :: 		break;
IT	AL
BAL	L_show_const_msgs959
;glits.c,215 :: 		default:
L_show_const_msgs961:
;glits.c,217 :: 		clear_disp(pos);
; pos start address is: 36 (R9)
UXTB	R0, R9
; pos end address is: 36 (R9)
BL	_clear_disp+0
;glits.c,218 :: 		break;
IT	AL
BAL	L_show_const_msgs959
;glits.c,220 :: 		}
L_show_const_msgs958:
; type start address is: 4 (R1)
; pos start address is: 36 (R9)
CMP	R1, #1
IT	EQ
BEQ	L_show_const_msgs960
; type end address is: 4 (R1)
IT	AL
BAL	L_show_const_msgs961
; pos end address is: 36 (R9)
L_show_const_msgs959:
;glits.c,221 :: 		}
L_end_show_const_msgs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _show_const_msgs
_show_degree_C:
;glits.c,224 :: 		void show_degree_C(unsigned char pos)
; pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R8, R0
; pos end address is: 0 (R0)
; pos start address is: 32 (R8)
;glits.c,226 :: 		unsigned char ch[1] = {0x20};
MOVS	R1, #32
STRB	R1, [SP, #4]
;glits.c,228 :: 		ch[0] = '°';
ADD	R2, SP, #4
STR	R2, [SP, #8]
MOVS	R1, #176
STRB	R1, [R2, #0]
;glits.c,229 :: 		LCD_GLASS_WriteChar(ch, false, 0, pos);
UXTB	R3, R8
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,230 :: 		ch[0] = 'C';
ADD	R2, SP, #4
MOVS	R1, #67
STRB	R1, [R2, #0]
;glits.c,231 :: 		LCD_GLASS_WriteChar(ch, false, 0, (1 + pos));
ADD	R2, R8, #1
; pos end address is: 32 (R8)
LDR	R1, [SP, #8]
UXTB	R3, R2
MOVS	R2, #0
MOV	R0, R1
MOVS	R1, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,232 :: 		}
L_end_show_degree_C:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _show_degree_C
_clear_disp:
;glits.c,235 :: 		void clear_disp(unsigned char pos)
; pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R8, R0
; pos end address is: 0 (R0)
; pos start address is: 32 (R8)
;glits.c,237 :: 		unsigned char ch[1] = {0x20};
MOVS	R1, #32
STRB	R1, [SP, #4]
;glits.c,239 :: 		ch[0] = 0x20;
ADD	R2, SP, #4
STR	R2, [SP, #8]
MOVS	R1, #32
STRB	R1, [R2, #0]
;glits.c,240 :: 		LCD_GLASS_WriteChar(ch, false, 0, pos);
UXTB	R3, R8
MOVS	R1, #0
MOV	R0, R2
MOVS	R2, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,241 :: 		ch[0] = 0x20;
ADD	R2, SP, #4
MOVS	R1, #32
STRB	R1, [R2, #0]
;glits.c,242 :: 		LCD_GLASS_WriteChar(ch, false, 0, (1 + pos));
ADD	R2, R8, #1
; pos end address is: 32 (R8)
LDR	R1, [SP, #8]
UXTB	R3, R2
MOVS	R2, #0
MOV	R0, R1
MOVS	R1, #0
BL	_LCD_GLASS_WriteChar+0
;glits.c,243 :: 		}
L_end_clear_disp:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _clear_disp
