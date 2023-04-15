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
BL	lcd_test_LCD_Conv_Char_Seg+0
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
BEQ	L__LCD_GLASS_DisplayString882
MOVS	R2, #1
L__LCD_GLASS_DisplayString882:
CMP	R8, #8
MOVW	R1, #0
BCS	L__LCD_GLASS_DisplayString883
MOVS	R1, #1
L__LCD_GLASS_DisplayString883:
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
BEQ	L__LCD_GLASS_DisplayStrDeci885
MOVS	R2, #1
L__LCD_GLASS_DisplayStrDeci885:
CMP	R8, #8
MOVW	R1, #0
BCS	L__LCD_GLASS_DisplayStrDeci886
MOVS	R1, #1
L__LCD_GLASS_DisplayStrDeci886:
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
lcd_test_LCD_Conv_Char_Seg:
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
BAL	L_lcd_test_LCD_Conv_Char_Seg819
; c end address is: 0 (R0)
; ch end address is: 20 (R5)
;glass_lcd.c,378 :: 		case ' ':
L_lcd_test_LCD_Conv_Char_Seg821:
;glass_lcd.c,380 :: 		ch = 0x00;
; ch start address is: 0 (R0)
MOVS	R0, #0
;glass_lcd.c,381 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,383 :: 		case '*':
L_lcd_test_LCD_Conv_Char_Seg822:
;glass_lcd.c,385 :: 		ch = star;
; ch start address is: 0 (R0)
MOVW	R0, #41181
;glass_lcd.c,386 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,388 :: 		case 'µ':
L_lcd_test_LCD_Conv_Char_Seg823:
;glass_lcd.c,390 :: 		ch = C_UMAP;
; ch start address is: 0 (R0)
MOVW	R0, #24708
;glass_lcd.c,391 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,393 :: 		case 'm':
L_lcd_test_LCD_Conv_Char_Seg824:
;glass_lcd.c,395 :: 		ch = C_mMap;
; ch start address is: 0 (R0)
MOVW	R0, #45584
;glass_lcd.c,396 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,398 :: 		case 'n':
L_lcd_test_LCD_Conv_Char_Seg825:
;glass_lcd.c,400 :: 		ch = C_nMap;
; ch start address is: 0 (R0)
MOVW	R0, #8720
;glass_lcd.c,401 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,403 :: 		case '-':
L_lcd_test_LCD_Conv_Char_Seg826:
;glass_lcd.c,405 :: 		ch = C_minus;
; ch start address is: 0 (R0)
MOVW	R0, #40960
;glass_lcd.c,406 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,408 :: 		case '/':
L_lcd_test_LCD_Conv_Char_Seg827:
;glass_lcd.c,410 :: 		ch = C_slatch;
; ch start address is: 0 (R0)
MOVS	R0, #192
;glass_lcd.c,411 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,413 :: 		case '°':
L_lcd_test_LCD_Conv_Char_Seg828:
;glass_lcd.c,415 :: 		ch = C_percent_1;
; ch start address is: 0 (R0)
MOVW	R0, #60416
;glass_lcd.c,416 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,418 :: 		case '%':
L_lcd_test_LCD_Conv_Char_Seg829:
;glass_lcd.c,420 :: 		ch = C_percent_2;
; ch start address is: 0 (R0)
MOVW	R0, #45824
;glass_lcd.c,421 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,423 :: 		case '[':
L_lcd_test_LCD_Conv_Char_Seg830:
;glass_lcd.c,425 :: 		ch = bracket_open;
; ch start address is: 0 (R0)
MOVW	R0, #7424
;glass_lcd.c,426 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,428 :: 		case ']':
L_lcd_test_LCD_Conv_Char_Seg831:
;glass_lcd.c,430 :: 		ch = bracket_close;
; ch start address is: 0 (R0)
MOVW	R0, #18176
;glass_lcd.c,431 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,433 :: 		case 0xFF:
L_lcd_test_LCD_Conv_Char_Seg832:
;glass_lcd.c,435 :: 		ch = C_full;
; ch start address is: 0 (R0)
MOVW	R0, #65501
;glass_lcd.c,436 :: 		break;
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,438 :: 		case '0':
L_lcd_test_LCD_Conv_Char_Seg833:
;glass_lcd.c,439 :: 		case '1':
; c start address is: 0 (R0)
L_lcd_test_LCD_Conv_Char_Seg834:
;glass_lcd.c,440 :: 		case '2':
L_lcd_test_LCD_Conv_Char_Seg835:
;glass_lcd.c,441 :: 		case '3':
L_lcd_test_LCD_Conv_Char_Seg836:
;glass_lcd.c,442 :: 		case '4':
L_lcd_test_LCD_Conv_Char_Seg837:
;glass_lcd.c,443 :: 		case '5':
L_lcd_test_LCD_Conv_Char_Seg838:
;glass_lcd.c,444 :: 		case '6':
L_lcd_test_LCD_Conv_Char_Seg839:
;glass_lcd.c,445 :: 		case '7':
L_lcd_test_LCD_Conv_Char_Seg840:
;glass_lcd.c,446 :: 		case '8':
L_lcd_test_LCD_Conv_Char_Seg841:
;glass_lcd.c,447 :: 		case '9':
L_lcd_test_LCD_Conv_Char_Seg842:
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
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,452 :: 		default:
L_lcd_test_LCD_Conv_Char_Seg843:
;glass_lcd.c,455 :: 		if((*c < 0x5B) && (*c > 0x40))
; ch start address is: 20 (R5)
; c start address is: 0 (R0)
LDRB	R4, [R0, #0]
CMP	R4, #91
IT	CS
BCS	L_lcd_test_LCD_Conv_Char_Seg869
LDRB	R4, [R0, #0]
CMP	R4, #64
IT	LS
BLS	L_lcd_test_LCD_Conv_Char_Seg870
; ch end address is: 20 (R5)
L_lcd_test_LCD_Conv_Char_Seg864:
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
BAL	L_lcd_test_LCD_Conv_Char_Seg866
L_lcd_test_LCD_Conv_Char_Seg869:
L_lcd_test_LCD_Conv_Char_Seg866:
; ch start address is: 20 (R5)
; ch end address is: 20 (R5)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg865
L_lcd_test_LCD_Conv_Char_Seg870:
L_lcd_test_LCD_Conv_Char_Seg865:
;glass_lcd.c,460 :: 		if((*c <0x7B) && (*c > 0x60))
; ch start address is: 20 (R5)
LDRB	R4, [R0, #0]
CMP	R4, #123
IT	CS
BCS	L_lcd_test_LCD_Conv_Char_Seg871
LDRB	R4, [R0, #0]
CMP	R4, #96
IT	LS
BLS	L_lcd_test_LCD_Conv_Char_Seg872
; ch end address is: 20 (R5)
L_lcd_test_LCD_Conv_Char_Seg863:
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
BAL	L_lcd_test_LCD_Conv_Char_Seg868
L_lcd_test_LCD_Conv_Char_Seg871:
UXTH	R0, R5
L_lcd_test_LCD_Conv_Char_Seg868:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg867
L_lcd_test_LCD_Conv_Char_Seg872:
UXTH	R0, R5
L_lcd_test_LCD_Conv_Char_Seg867:
;glass_lcd.c,464 :: 		break;
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg820
;glass_lcd.c,466 :: 		}
L_lcd_test_LCD_Conv_Char_Seg819:
; ch start address is: 20 (R5)
; c start address is: 0 (R0)
LDRB	R4, [R0, #0]
CMP	R4, #32
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg821
LDRB	R4, [R0, #0]
CMP	R4, #42
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg822
LDRB	R4, [R0, #0]
CMP	R4, #181
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg823
LDRB	R4, [R0, #0]
CMP	R4, #109
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg824
LDRB	R4, [R0, #0]
CMP	R4, #110
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg825
LDRB	R4, [R0, #0]
CMP	R4, #45
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg826
LDRB	R4, [R0, #0]
CMP	R4, #47
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg827
LDRB	R4, [R0, #0]
CMP	R4, #176
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg828
LDRB	R4, [R0, #0]
CMP	R4, #37
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg829
LDRB	R4, [R0, #0]
CMP	R4, #91
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg830
LDRB	R4, [R0, #0]
CMP	R4, #93
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg831
LDRB	R4, [R0, #0]
CMP	R4, #255
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg832
LDRB	R4, [R0, #0]
CMP	R4, #48
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg833
LDRB	R4, [R0, #0]
CMP	R4, #49
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg834
LDRB	R4, [R0, #0]
CMP	R4, #50
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg835
LDRB	R4, [R0, #0]
CMP	R4, #51
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg836
LDRB	R4, [R0, #0]
CMP	R4, #52
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg837
LDRB	R4, [R0, #0]
CMP	R4, #53
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg838
LDRB	R4, [R0, #0]
CMP	R4, #54
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg839
LDRB	R4, [R0, #0]
CMP	R4, #55
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg840
LDRB	R4, [R0, #0]
CMP	R4, #56
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg841
LDRB	R4, [R0, #0]
CMP	R4, #57
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg842
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg843
; c end address is: 0 (R0)
; ch end address is: 20 (R5)
L_lcd_test_LCD_Conv_Char_Seg820:
;glass_lcd.c,469 :: 		if(point != 0)
; ch start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg873
; point end address is: 4 (R1)
;glass_lcd.c,471 :: 		ch |= 0x0002;
ORR	R0, R0, #2
UXTH	R0, R0
; ch end address is: 0 (R0)
;glass_lcd.c,472 :: 		}
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg850
L_lcd_test_LCD_Conv_Char_Seg873:
;glass_lcd.c,469 :: 		if(point != 0)
;glass_lcd.c,472 :: 		}
L_lcd_test_LCD_Conv_Char_Seg850:
;glass_lcd.c,475 :: 		if(column != 0)
; ch start address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_lcd_test_LCD_Conv_Char_Seg874
; column end address is: 8 (R2)
;glass_lcd.c,477 :: 		ch |= 0x0020;
ORR	R0, R0, #32
UXTH	R0, R0
; ch end address is: 0 (R0)
;glass_lcd.c,478 :: 		}
IT	AL
BAL	L_lcd_test_LCD_Conv_Char_Seg851
L_lcd_test_LCD_Conv_Char_Seg874:
;glass_lcd.c,475 :: 		if(column != 0)
;glass_lcd.c,478 :: 		}
L_lcd_test_LCD_Conv_Char_Seg851:
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
L_lcd_test_LCD_Conv_Char_Seg852:
; j start address is: 8 (R2)
; digit start address is: 4 (R1)
; i start address is: 12 (R3)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; digit start address is: 4 (R1)
; digit end address is: 4 (R1)
CMP	R2, #4
IT	CS
BCS	L_lcd_test_LCD_Conv_Char_Seg853
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
BAL	L_lcd_test_LCD_Conv_Char_Seg852
L_lcd_test_LCD_Conv_Char_Seg853:
;glass_lcd.c,484 :: 		}
L_end_LCD_Conv_Char_Seg:
ADD	SP, SP, #4
BX	LR
; end of lcd_test_LCD_Conv_Char_Seg
_main:
;lcd_test.c,4 :: 		void main()
SUB	SP, SP, #88
;lcd_test.c,6 :: 		LCD_GLASS_Init();
BL	_LCD_GLASS_Init+0
;lcd_test.c,8 :: 		LCD_GLASS_DisplayString("STM32L");
MOVS	R0, #83
STRB	R0, [SP, #0]
MOVS	R0, #84
STRB	R0, [SP, #1]
MOVS	R0, #77
STRB	R0, [SP, #2]
MOVS	R0, #51
STRB	R0, [SP, #3]
MOVS	R0, #50
STRB	R0, [SP, #4]
MOVS	R0, #76
STRB	R0, [SP, #5]
MOVS	R0, #0
STRB	R0, [SP, #6]
ADD	R0, SP, #0
BL	_LCD_GLASS_DisplayString+0
;lcd_test.c,9 :: 		delay_ms(6000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_main855:
SUBS	R7, R7, #1
BNE	L_main855
NOP
NOP
NOP
;lcd_test.c,10 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;lcd_test.c,11 :: 		while(1)
L_main857:
;lcd_test.c,13 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;lcd_test.c,14 :: 		LCD_GLASS_ScrollSentence("      * MICROARENA *      ", 1, SCROLL_SPEED_L);
ADD	R11, SP, #7
ADD	R10, R11, #27
MOVW	R12, #lo_addr(?ICS?lstr2_lcd_test+0)
MOVT	R12, #hi_addr(?ICS?lstr2_lcd_test+0)
BL	___CC2DW+0
ADD	R0, SP, #7
MOVW	R2, #400
MOVS	R1, #1
BL	_LCD_GLASS_ScrollSentence+0
;lcd_test.c,15 :: 		delay_ms(600);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_main859:
SUBS	R7, R7, #1
BNE	L_main859
NOP
NOP
NOP
;lcd_test.c,16 :: 		LCD_GLASS_Clear();
BL	_LCD_GLASS_Clear+0
;lcd_test.c,17 :: 		LCD_GLASS_ScrollSentence("      [ https://www.facebook.com/MicroArena ]     ", 1, SCROLL_SPEED);
ADD	R11, SP, #34
ADD	R10, R11, #51
MOVW	R12, #lo_addr(?ICS?lstr3_lcd_test+0)
MOVT	R12, #hi_addr(?ICS?lstr3_lcd_test+0)
BL	___CC2DW+0
ADD	R0, SP, #34
MOVS	R2, #200
MOVS	R1, #1
BL	_LCD_GLASS_ScrollSentence+0
;lcd_test.c,18 :: 		delay_ms(600);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_main861:
SUBS	R7, R7, #1
BNE	L_main861
NOP
NOP
NOP
;lcd_test.c,19 :: 		};
IT	AL
BAL	L_main857
;lcd_test.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
