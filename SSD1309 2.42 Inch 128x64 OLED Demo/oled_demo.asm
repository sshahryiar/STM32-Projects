_setup_GPIOs:
;ssd1309.c,5 :: 		void setup_GPIOs()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1309.c,7 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1309.c,10 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;ssd1309.c,9 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_10),
MOVW	R1, #1040
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;ssd1309.c,10 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ssd1309.c,14 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #24
MOVT	R2, #8
;ssd1309.c,13 :: 		(_GPIO_PINMASK_5 | _GPIO_PINMASK_7),
MOVW	R1, #160
;ssd1309.c,12 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;ssd1309.c,14 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ssd1309.c,18 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #40
MOVT	R2, #8
;ssd1309.c,17 :: 		_GPIO_PINMASK_6,
MOVW	R1, #64
;ssd1309.c,16 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;ssd1309.c,18 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ssd1309.c,20 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1309.c,23 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;ssd1309.c,22 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7,
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;ssd1309.c,23 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ssd1309.c,25 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SPI1_PA567);
MOVW	R0, #lo_addr(__GPIO_MODULE_SPI1_PA567+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_SPI1_PA567+0)
BL	_GPIO_Alternate_Function_Enable+0
;ssd1309.c,27 :: 		RCC_APB2ENRbits.SPI1EN = HIGH;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;ssd1309.c,32 :: 		&_GPIO_MODULE_SPI1_PA567);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI1_PA567+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI1_PA567+0)
;ssd1309.c,31 :: 		| _SPI_SS_ENABLE | _SPI_SSM_ENABLE | _SPI_SSI_0),
MOVW	R1, #516
;ssd1309.c,29 :: 		SPI1_Init_Advanced(_SPI_FPCLK_DIV8, (_SPI_8_BIT | _SPI_MASTER | _SPI_CLK_IDLE_LOW
MOVS	R0, #2
;ssd1309.c,32 :: 		&_GPIO_MODULE_SPI1_PA567);
BL	_SPI1_Init_Advanced+0
;ssd1309.c,33 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_setup_GPIOs0:
SUBS	R7, R7, #1
BNE	L_setup_GPIOs0
NOP
NOP
NOP
;ssd1309.c,34 :: 		}
L_end_setup_GPIOs:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_GPIOs
_swap:
;ssd1309.c,37 :: 		void swap(signed int *a, signed int *b)
; b start address is: 4 (R1)
; a start address is: 0 (R0)
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 4 (R1)
;ssd1309.c,39 :: 		signed int temp = 0x0000;
;ssd1309.c,41 :: 		temp = *b;
LDRSH	R2, [R1, #0]
; temp start address is: 12 (R3)
SXTH	R3, R2
;ssd1309.c,42 :: 		*b = *a;
LDRSH	R2, [R0, #0]
STRH	R2, [R1, #0]
; b end address is: 4 (R1)
;ssd1309.c,43 :: 		*a = temp;
STRH	R3, [R0, #0]
; a end address is: 0 (R0)
; temp end address is: 12 (R3)
;ssd1309.c,44 :: 		}
L_end_swap:
BX	LR
; end of _swap
_OLED_init:
;ssd1309.c,47 :: 		void OLED_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1309.c,49 :: 		setup_GPIOs();
BL	_setup_GPIOs+0
;ssd1309.c,51 :: 		OLED_reset_sequence();
BL	_OLED_reset_sequence+0
;ssd1309.c,53 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_OFF) , CMD);;
MOVS	R1, #0
MOVS	R0, #174
BL	_OLED_write+0
;ssd1309.c,55 :: 		OLED_write(Set_Display_Clock_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #213
BL	_OLED_write+0
;ssd1309.c,56 :: 		OLED_write(0x80, CMD);
MOVS	R1, #0
MOVS	R0, #128
BL	_OLED_write+0
;ssd1309.c,58 :: 		OLED_write(Set_Multiplex_Ratio_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #168
BL	_OLED_write+0
;ssd1309.c,59 :: 		OLED_write(0x3F, CMD);
MOVS	R1, #0
MOVS	R0, #63
BL	_OLED_write+0
;ssd1309.c,61 :: 		OLED_write(Set_Display_Offset_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #211
BL	_OLED_write+0
;ssd1309.c,62 :: 		OLED_write(0x00, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1309.c,64 :: 		OLED_write((Set_Display_Start_Line_CMD | 0x00), CMD);
MOVS	R1, #0
MOVS	R0, #64
BL	_OLED_write+0
;ssd1309.c,66 :: 		OLED_write(Set_Charge_Pump_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #141
BL	_OLED_write+0
;ssd1309.c,67 :: 		OLED_write((Set_Higher_Column_Start_Address_CMD | Enable_Charge_Pump), CMD);
MOVS	R1, #0
MOVS	R0, #20
BL	_OLED_write+0
;ssd1309.c,69 :: 		OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #32
BL	_OLED_write+0
;ssd1309.c,70 :: 		OLED_write(Page_Addressing_Mode, CMD);
MOVS	R1, #0
MOVS	R0, #2
BL	_OLED_write+0
;ssd1309.c,72 :: 		OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
MOVS	R1, #0
MOVS	R0, #161
BL	_OLED_write+0
;ssd1309.c,74 :: 		OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
MOVS	R1, #0
MOVS	R0, #200
BL	_OLED_write+0
;ssd1309.c,76 :: 		OLED_write(Set_Common_HW_Config_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #218
BL	_OLED_write+0
;ssd1309.c,77 :: 		OLED_write(0x12, CMD);
MOVS	R1, #0
MOVS	R0, #18
BL	_OLED_write+0
;ssd1309.c,79 :: 		OLED_write(Set_Contrast_Control_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #129
BL	_OLED_write+0
;ssd1309.c,80 :: 		OLED_write(0xCF, CMD);
MOVS	R1, #0
MOVS	R0, #207
BL	_OLED_write+0
;ssd1309.c,82 :: 		OLED_write(Set_Pre_charge_Period_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #217
BL	_OLED_write+0
;ssd1309.c,83 :: 		OLED_write(0xF1, CMD);
MOVS	R1, #0
MOVS	R0, #241
BL	_OLED_write+0
;ssd1309.c,85 :: 		OLED_write(Set_VCOMH_Level_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #219
BL	_OLED_write+0
;ssd1309.c,86 :: 		OLED_write(0x40, CMD);
MOVS	R1, #0
MOVS	R0, #64
BL	_OLED_write+0
;ssd1309.c,88 :: 		OLED_write((Set_Entire_Display_ON_CMD | Normal_Display), CMD);
MOVS	R1, #0
MOVS	R0, #164
BL	_OLED_write+0
;ssd1309.c,90 :: 		OLED_write((Set_Normal_or_Inverse_Display_CMD | Non_Inverted_Display), CMD);
MOVS	R1, #0
MOVS	R0, #166
BL	_OLED_write+0
;ssd1309.c,92 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_ON) , CMD);
MOVS	R1, #0
MOVS	R0, #175
BL	_OLED_write+0
;ssd1309.c,94 :: 		OLED_gotoxy(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1309.c,96 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;ssd1309.c,97 :: 		OLED_clear_screen();
BL	_OLED_clear_screen+0
;ssd1309.c,98 :: 		}
L_end_OLED_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_init
_OLED_reset_sequence:
;ssd1309.c,101 :: 		void OLED_reset_sequence()
;ssd1309.c,103 :: 		delay_ms(40);
MOVW	R7, #21247
MOVT	R7, #7
NOP
NOP
L_OLED_reset_sequence2:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence2
NOP
NOP
NOP
;ssd1309.c,104 :: 		RST = LOW;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODRbits+0)
MOVT	R0, #hi_addr(GPIOB_ODRbits+0)
_SX	[R0, ByteOffset(GPIOB_ODRbits+0)]
;ssd1309.c,105 :: 		delay_ms(40);
MOVW	R7, #21247
MOVT	R7, #7
NOP
NOP
L_OLED_reset_sequence4:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence4
NOP
NOP
NOP
;ssd1309.c,106 :: 		RST = HIGH;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODRbits+0)
MOVT	R0, #hi_addr(GPIOB_ODRbits+0)
_SX	[R0, ByteOffset(GPIOB_ODRbits+0)]
;ssd1309.c,107 :: 		}
L_end_OLED_reset_sequence:
BX	LR
; end of _OLED_reset_sequence
_OLED_write:
;ssd1309.c,110 :: 		void OLED_write(unsigned char value, unsigned char type)
; type start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; type end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; type start address is: 4 (R1)
;ssd1309.c,112 :: 		DC = (type & 0x01);
AND	R3, R1, #1
UXTB	R3, R3
; type end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
_SX	[R2, ByteOffset(GPIOA_ODRbits+0)]
;ssd1309.c,113 :: 		CS = LOW;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
_SX	[R2, ByteOffset(GPIOA_ODRbits+0)]
;ssd1309.c,114 :: 		SPI1_Write(value);
; value end address is: 0 (R0)
BL	_SPI1_Write+0
;ssd1309.c,115 :: 		CS = HIGH;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
_SX	[R2, ByteOffset(GPIOA_ODRbits+0)]
;ssd1309.c,116 :: 		}
L_end_OLED_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_write
_OLED_gotoxy:
;ssd1309.c,119 :: 		void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R0
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 16 (R4)
; y_pos start address is: 4 (R1)
;ssd1309.c,121 :: 		OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
ADDW	R2, R1, #176
; y_pos end address is: 4 (R1)
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1309.c,122 :: 		OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
AND	R2, R4, #15
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1309.c,123 :: 		OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
AND	R2, R4, #240
UXTB	R2, R2
; x_pos end address is: 16 (R4)
LSRS	R2, R2, #4
UXTB	R2, R2
ORR	R2, R2, #16
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1309.c,124 :: 		}
L_end_OLED_gotoxy:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_gotoxy
_OLED_fill:
;ssd1309.c,127 :: 		void OLED_fill(unsigned char bmp_data)
; bmp_data start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; bmp_data end address is: 0 (R0)
; bmp_data start address is: 0 (R0)
;ssd1309.c,129 :: 		unsigned char x_pos = 0x00;
;ssd1309.c,130 :: 		unsigned char page = 0x00;
;ssd1309.c,132 :: 		for(page = y_min; page < y_max; page++)
; page start address is: 20 (R5)
MOVS	R5, #0
; bmp_data end address is: 0 (R0)
; page end address is: 20 (R5)
UXTB	R4, R0
L_OLED_fill6:
; page start address is: 20 (R5)
; bmp_data start address is: 16 (R4)
CMP	R5, #8
IT	CS
BCS	L_OLED_fill7
;ssd1309.c,134 :: 		OLED_write((Set_Page_Start_Address_CMD + page), CMD);
ADDW	R1, R5, #176
UXTB	R0, R1
MOVS	R1, #0
BL	_OLED_write+0
;ssd1309.c,135 :: 		OLED_write(Set_Lower_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1309.c,136 :: 		OLED_write(Set_Higher_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #16
BL	_OLED_write+0
;ssd1309.c,138 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
; x_pos start address is: 24 (R6)
MOVS	R6, #0
; bmp_data end address is: 16 (R4)
; x_pos end address is: 24 (R6)
; page end address is: 20 (R5)
L_OLED_fill9:
; x_pos start address is: 24 (R6)
; bmp_data start address is: 16 (R4)
; page start address is: 20 (R5)
CMP	R6, #128
IT	CS
BCS	L_OLED_fill10
;ssd1309.c,140 :: 		OLED_write(bmp_data, DAT);
MOVS	R1, #1
UXTB	R0, R4
BL	_OLED_write+0
;ssd1309.c,138 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
ADDS	R6, R6, #1
UXTB	R6, R6
;ssd1309.c,141 :: 		}
; x_pos end address is: 24 (R6)
IT	AL
BAL	L_OLED_fill9
L_OLED_fill10:
;ssd1309.c,132 :: 		for(page = y_min; page < y_max; page++)
ADDS	R5, R5, #1
UXTB	R5, R5
;ssd1309.c,142 :: 		}
; bmp_data end address is: 16 (R4)
; page end address is: 20 (R5)
IT	AL
BAL	L_OLED_fill6
L_OLED_fill7:
;ssd1309.c,143 :: 		}
L_end_OLED_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_fill
_OLED_clear_screen:
;ssd1309.c,146 :: 		void OLED_clear_screen()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1309.c,148 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;ssd1309.c,149 :: 		}
L_end_OLED_clear_screen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_clear_screen
_OLED_clear_buffer:
;ssd1309.c,152 :: 		void OLED_clear_buffer()
;ssd1309.c,154 :: 		unsigned int s = 0x00;
;ssd1309.c,156 :: 		for(s = 0; s < buffer_size; s++)
; s start address is: 8 (R2)
MOVS	R2, #0
; s end address is: 8 (R2)
L_OLED_clear_buffer12:
; s start address is: 8 (R2)
CMP	R2, #1024
IT	CS
BCS	L_OLED_clear_buffer13
;ssd1309.c,158 :: 		buffer[s] = 0x00;
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
;ssd1309.c,156 :: 		for(s = 0; s < buffer_size; s++)
ADDS	R2, R2, #1
UXTH	R2, R2
;ssd1309.c,159 :: 		}
; s end address is: 8 (R2)
IT	AL
BAL	L_OLED_clear_buffer12
L_OLED_clear_buffer13:
;ssd1309.c,160 :: 		}
L_end_OLED_clear_buffer:
BX	LR
; end of _OLED_clear_buffer
_OLED_cursor:
;ssd1309.c,163 :: 		void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 20 (R5)
;ssd1309.c,165 :: 		unsigned char i = 0x00;
;ssd1309.c,167 :: 		if(y_pos != 0x00)
CMP	R5, #0
IT	EQ
BEQ	L_OLED_cursor15
;ssd1309.c,169 :: 		if(x_pos == 1)
CMP	R0, #1
IT	NE
BNE	L_OLED_cursor16
; x_pos end address is: 0 (R0)
;ssd1309.c,171 :: 		OLED_gotoxy(0x00, (y_pos + 0x02));
ADDS	R2, R5, #2
; y_pos end address is: 20 (R5)
UXTB	R1, R2
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1309.c,172 :: 		}
IT	AL
BAL	L_OLED_cursor17
L_OLED_cursor16:
;ssd1309.c,175 :: 		OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
; y_pos start address is: 20 (R5)
; x_pos start address is: 0 (R0)
ADDS	R4, R5, #2
; y_pos end address is: 20 (R5)
SUBS	R3, R0, #2
SXTH	R3, R3
; x_pos end address is: 0 (R0)
MOVS	R2, #6
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R2, R2
ADDS	R2, #80
UXTB	R1, R4
UXTB	R0, R2
BL	_OLED_gotoxy+0
;ssd1309.c,176 :: 		}
L_OLED_cursor17:
;ssd1309.c,178 :: 		for(i = 0; i < 6; i++)
; i start address is: 16 (R4)
MOVS	R4, #0
; i end address is: 16 (R4)
L_OLED_cursor18:
; i start address is: 16 (R4)
CMP	R4, #6
IT	CS
BCS	L_OLED_cursor19
;ssd1309.c,180 :: 		OLED_write(0xFF, DAT);
MOVS	R1, #1
MOVS	R0, #255
BL	_OLED_write+0
;ssd1309.c,178 :: 		for(i = 0; i < 6; i++)
ADDS	R4, R4, #1
UXTB	R4, R4
;ssd1309.c,181 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_OLED_cursor18
L_OLED_cursor19:
;ssd1309.c,182 :: 		}
L_OLED_cursor15:
;ssd1309.c,183 :: 		}
L_end_OLED_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_cursor
_OLED_print_Image:
;ssd1309.c,186 :: 		void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
; pixel start address is: 4 (R1)
; bmp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; pixel end address is: 4 (R1)
; bmp end address is: 0 (R0)
; bmp start address is: 0 (R0)
; pixel start address is: 4 (R1)
;ssd1309.c,188 :: 		unsigned char x_pos = 0x00;
;ssd1309.c,189 :: 		unsigned char page = 0x00;
;ssd1309.c,191 :: 		if(pixel != OFF)
CMP	R1, #0
IT	EQ
BEQ	L_OLED_print_Image21
; pixel end address is: 4 (R1)
;ssd1309.c,193 :: 		pixel = 0xFF;
; pixel start address is: 24 (R6)
MOVS	R6, #255
;ssd1309.c,194 :: 		}
; pixel end address is: 24 (R6)
IT	AL
BAL	L_OLED_print_Image22
L_OLED_print_Image21:
;ssd1309.c,197 :: 		pixel = 0x00;
; pixel start address is: 24 (R6)
MOVS	R6, #0
; pixel end address is: 24 (R6)
;ssd1309.c,198 :: 		}
L_OLED_print_Image22:
;ssd1309.c,200 :: 		for(page = 0; page < y_max; page++)
; pixel start address is: 24 (R6)
; page start address is: 20 (R5)
MOVS	R5, #0
; bmp end address is: 0 (R0)
; pixel end address is: 24 (R6)
; page end address is: 20 (R5)
MOV	R7, R0
L_OLED_print_Image23:
; page start address is: 20 (R5)
; pixel start address is: 24 (R6)
; bmp start address is: 28 (R7)
CMP	R5, #8
IT	CS
BCS	L_OLED_print_Image24
;ssd1309.c,202 :: 		OLED_gotoxy(x_min, page);
UXTB	R1, R5
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1309.c,203 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
; x_pos start address is: 0 (R0)
MOVS	R0, #0
; pixel end address is: 24 (R6)
; x_pos end address is: 0 (R0)
; bmp end address is: 28 (R7)
; page end address is: 20 (R5)
UXTB	R4, R6
UXTB	R6, R0
L_OLED_print_Image26:
; x_pos start address is: 24 (R6)
; bmp start address is: 28 (R7)
; pixel start address is: 16 (R4)
; page start address is: 20 (R5)
CMP	R6, #128
IT	CS
BCS	L_OLED_print_Image27
;ssd1309.c,205 :: 		OLED_write((*bmp++ ^ pixel), DAT);
LDRB	R2, [R7, #0]
EORS	R2, R4
MOVS	R1, #1
UXTB	R0, R2
BL	_OLED_write+0
ADDS	R7, R7, #1
;ssd1309.c,203 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
ADDS	R6, R6, #1
UXTB	R6, R6
;ssd1309.c,206 :: 		}
; x_pos end address is: 24 (R6)
IT	AL
BAL	L_OLED_print_Image26
L_OLED_print_Image27:
;ssd1309.c,200 :: 		for(page = 0; page < y_max; page++)
ADDS	R5, R5, #1
UXTB	R5, R5
;ssd1309.c,207 :: 		}
; pixel end address is: 16 (R4)
; bmp end address is: 28 (R7)
; page end address is: 20 (R5)
UXTB	R6, R4
IT	AL
BAL	L_OLED_print_Image23
L_OLED_print_Image24:
;ssd1309.c,208 :: 		}
L_end_OLED_print_Image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_Image
_OLED_draw_bitmap:
;ssd1309.c,211 :: 		void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
; ye start address is: 12 (R3)
; xe start address is: 8 (R2)
; yb start address is: 4 (R1)
; xb start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ye end address is: 12 (R3)
; xe end address is: 8 (R2)
; yb end address is: 4 (R1)
; xb end address is: 0 (R0)
; xb start address is: 0 (R0)
; yb start address is: 4 (R1)
; xe start address is: 8 (R2)
; ye start address is: 12 (R3)
; bmp_img start address is: 16 (R4)
LDR	R4, [SP, #4]
;ssd1309.c,213 :: 		unsigned int s = 0x0000;
; s start address is: 44 (R11)
MOVW	R11, #0
;ssd1309.c,214 :: 		unsigned char x_pos = 0x00;
;ssd1309.c,215 :: 		unsigned char y_pos = 0x00;
;ssd1309.c,217 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
; y_pos start address is: 20 (R5)
UXTB	R5, R1
; xb end address is: 0 (R0)
; yb end address is: 4 (R1)
; xe end address is: 8 (R2)
; ye end address is: 12 (R3)
; bmp_img end address is: 16 (R4)
; s end address is: 44 (R11)
; y_pos end address is: 20 (R5)
UXTB	R6, R0
UXTB	R7, R2
UXTB	R8, R3
MOV	R9, R4
L_OLED_draw_bitmap29:
; y_pos start address is: 20 (R5)
; s start address is: 44 (R11)
; bmp_img start address is: 36 (R9)
; ye start address is: 32 (R8)
; xe start address is: 28 (R7)
; xb start address is: 24 (R6)
CMP	R5, R8
IT	HI
BHI	L_OLED_draw_bitmap30
;ssd1309.c,219 :: 		OLED_gotoxy(xb, y_pos);
UXTB	R1, R5
UXTB	R0, R6
BL	_OLED_gotoxy+0
;ssd1309.c,220 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
; x_pos start address is: 40 (R10)
UXTB	R10, R6
; xb end address is: 24 (R6)
; xe end address is: 28 (R7)
; ye end address is: 32 (R8)
; bmp_img end address is: 36 (R9)
; s end address is: 44 (R11)
; x_pos end address is: 40 (R10)
; y_pos end address is: 20 (R5)
L_OLED_draw_bitmap32:
; x_pos start address is: 40 (R10)
; xb start address is: 24 (R6)
; xe start address is: 28 (R7)
; ye start address is: 32 (R8)
; bmp_img start address is: 36 (R9)
; s start address is: 44 (R11)
; y_pos start address is: 20 (R5)
CMP	R10, R7
IT	CS
BCS	L_OLED_draw_bitmap33
;ssd1309.c,222 :: 		OLED_write(bmp_img[s], DAT);
ADD	R4, R9, R11, LSL #0
LDRB	R4, [R4, #0]
MOVS	R1, #1
UXTB	R0, R4
BL	_OLED_write+0
;ssd1309.c,223 :: 		s++;
ADD	R11, R11, #1
UXTH	R11, R11
;ssd1309.c,220 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
ADD	R10, R10, #1
UXTB	R10, R10
;ssd1309.c,224 :: 		}
; x_pos end address is: 40 (R10)
IT	AL
BAL	L_OLED_draw_bitmap32
L_OLED_draw_bitmap33:
;ssd1309.c,217 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
ADDS	R5, R5, #1
UXTB	R5, R5
;ssd1309.c,225 :: 		}
; xb end address is: 24 (R6)
; xe end address is: 28 (R7)
; ye end address is: 32 (R8)
; bmp_img end address is: 36 (R9)
; s end address is: 44 (R11)
; y_pos end address is: 20 (R5)
IT	AL
BAL	L_OLED_draw_bitmap29
L_OLED_draw_bitmap30:
;ssd1309.c,226 :: 		}
L_end_OLED_draw_bitmap:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_draw_bitmap
_OLED_print_char:
;ssd1309.c,229 :: 		void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
; ch start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ch end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; ch start address is: 8 (R2)
;ssd1309.c,231 :: 		unsigned char chr = 0x00;
;ssd1309.c,232 :: 		unsigned char s = 0x00;
;ssd1309.c,234 :: 		chr = (ch - 32);
SUBW	R3, R2, #32
; ch end address is: 8 (R2)
; chr start address is: 20 (R5)
UXTB	R5, R3
;ssd1309.c,236 :: 		if(x_pos > (x_max - 6))
CMP	R0, #122
IT	LE
BLE	L__OLED_print_char231
;ssd1309.c,238 :: 		x_pos = 0;
MOVS	R0, #0
;ssd1309.c,239 :: 		y_pos++;
ADDS	R1, R1, #1
UXTB	R1, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
;ssd1309.c,240 :: 		}
IT	AL
BAL	L_OLED_print_char35
L__OLED_print_char231:
;ssd1309.c,236 :: 		if(x_pos > (x_max - 6))
;ssd1309.c,240 :: 		}
L_OLED_print_char35:
;ssd1309.c,242 :: 		OLED_gotoxy(x_pos, y_pos);
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1309.c,244 :: 		for(s = 0x00; s < 0x06; s++)
; s start address is: 24 (R6)
MOVS	R6, #0
; s end address is: 24 (R6)
L_OLED_print_char36:
; s start address is: 24 (R6)
; chr start address is: 20 (R5)
; chr end address is: 20 (R5)
CMP	R6, #6
IT	CS
BCS	L_OLED_print_char37
; chr end address is: 20 (R5)
;ssd1309.c,246 :: 		OLED_write(font_regular[chr][s], DAT);
; chr start address is: 20 (R5)
MOVS	R3, #6
MUL	R4, R3, R5
MOVW	R3, #lo_addr(_font_regular+0)
MOVT	R3, #hi_addr(_font_regular+0)
ADDS	R3, R3, R4
ADDS	R3, R3, R6
LDRB	R3, [R3, #0]
MOVS	R1, #1
UXTB	R0, R3
BL	_OLED_write+0
;ssd1309.c,244 :: 		for(s = 0x00; s < 0x06; s++)
ADDS	R6, R6, #1
UXTB	R6, R6
;ssd1309.c,247 :: 		}
; chr end address is: 20 (R5)
; s end address is: 24 (R6)
IT	AL
BAL	L_OLED_print_char36
L_OLED_print_char37:
;ssd1309.c,248 :: 		}
L_end_OLED_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_char
_OLED_print_string:
;ssd1309.c,251 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
; ch start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ch end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; ch start address is: 8 (R2)
;ssd1309.c,253 :: 		unsigned char chr = 0x00;
;ssd1309.c,254 :: 		unsigned char i = 0x00;
;ssd1309.c,255 :: 		unsigned char j = 0x00;
; j start address is: 40 (R10)
MOVW	R10, #0
; x_pos end address is: 0 (R0)
; y_pos end address is: 4 (R1)
; ch end address is: 8 (R2)
; j end address is: 40 (R10)
STRB	R1, [SP, #4]
UXTB	R1, R0
MOV	R7, R2
LDRB	R0, [SP, #4]
;ssd1309.c,257 :: 		while(ch[j] != '\0')
L_OLED_print_string39:
; j start address is: 40 (R10)
; ch start address is: 28 (R7)
; y_pos start address is: 0 (R0)
; x_pos start address is: 4 (R1)
ADD	R3, R7, R10, LSL #0
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	EQ
BEQ	L_OLED_print_string40
;ssd1309.c,259 :: 		chr = (ch[j] - 32);
ADD	R3, R7, R10, LSL #0
LDRB	R3, [R3, #0]
SUBS	R3, #32
; chr start address is: 36 (R9)
UXTB	R9, R3
;ssd1309.c,261 :: 		if(x_pos > (x_max - 0x06))
CMP	R1, #122
IT	LE
BLE	L__OLED_print_string232
;ssd1309.c,263 :: 		x_pos = 0x00;
MOVS	R1, #0
;ssd1309.c,264 :: 		y_pos++;
ADDS	R6, R0, #1
UXTB	R6, R6
; y_pos end address is: 0 (R0)
; y_pos start address is: 24 (R6)
; y_pos end address is: 24 (R6)
; x_pos end address is: 4 (R1)
UXTB	R5, R1
;ssd1309.c,265 :: 		}
IT	AL
BAL	L_OLED_print_string41
L__OLED_print_string232:
;ssd1309.c,261 :: 		if(x_pos > (x_max - 0x06))
UXTB	R6, R0
UXTB	R5, R1
;ssd1309.c,265 :: 		}
L_OLED_print_string41:
;ssd1309.c,266 :: 		OLED_gotoxy(x_pos, y_pos);
; y_pos start address is: 24 (R6)
; x_pos start address is: 20 (R5)
UXTB	R1, R6
UXTB	R0, R5
BL	_OLED_gotoxy+0
;ssd1309.c,268 :: 		for(i = 0x00; i < 0x06; i++)
; i start address is: 32 (R8)
MOVW	R8, #0
; x_pos end address is: 20 (R5)
; y_pos end address is: 24 (R6)
; ch end address is: 28 (R7)
; i end address is: 32 (R8)
; j end address is: 40 (R10)
L_OLED_print_string42:
; i start address is: 32 (R8)
; x_pos start address is: 20 (R5)
; y_pos start address is: 24 (R6)
; chr start address is: 36 (R9)
; chr end address is: 36 (R9)
; ch start address is: 28 (R7)
; j start address is: 40 (R10)
CMP	R8, #6
IT	CS
BCS	L_OLED_print_string43
; chr end address is: 36 (R9)
;ssd1309.c,270 :: 		OLED_write(font_regular[chr][i], DAT);
; chr start address is: 36 (R9)
MOVS	R3, #6
MUL	R4, R3, R9
MOVW	R3, #lo_addr(_font_regular+0)
MOVT	R3, #hi_addr(_font_regular+0)
ADDS	R3, R3, R4
ADD	R3, R3, R8, LSL #0
LDRB	R3, [R3, #0]
MOVS	R1, #1
UXTB	R0, R3
BL	_OLED_write+0
;ssd1309.c,268 :: 		for(i = 0x00; i < 0x06; i++)
ADD	R8, R8, #1
UXTB	R8, R8
;ssd1309.c,271 :: 		}
; chr end address is: 36 (R9)
; i end address is: 32 (R8)
IT	AL
BAL	L_OLED_print_string42
L_OLED_print_string43:
;ssd1309.c,273 :: 		j++;
ADD	R10, R10, #1
UXTB	R10, R10
;ssd1309.c,274 :: 		x_pos += 6;
ADDS	R3, R5, #6
; x_pos end address is: 20 (R5)
; x_pos start address is: 4 (R1)
UXTB	R1, R3
;ssd1309.c,275 :: 		}
; y_pos end address is: 24 (R6)
; ch end address is: 28 (R7)
; j end address is: 40 (R10)
; x_pos end address is: 4 (R1)
UXTB	R0, R6
IT	AL
BAL	L_OLED_print_string39
L_OLED_print_string40:
;ssd1309.c,276 :: 		}
L_end_OLED_print_string:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _OLED_print_string
_OLED_print_chr:
;ssd1309.c,279 :: 		void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
SXTH	R9, R2
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 36 (R9)
;ssd1309.c,281 :: 		unsigned char ch = 0x00;
;ssd1309.c,283 :: 		if(value < 0x00)
CMP	R9, #0
IT	GE
BGE	L_OLED_print_chr45
;ssd1309.c,285 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
UXTB	R1, R8
UXTB	R0, R7
BL	_OLED_print_char+0
;ssd1309.c,286 :: 		value = -value;
RSB	R9, R9, #0
SXTH	R9, R9
;ssd1309.c,287 :: 		}
IT	AL
BAL	L_OLED_print_chr46
L_OLED_print_chr45:
;ssd1309.c,290 :: 		OLED_print_char(x_pos, y_pos,' ');
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R7
BL	_OLED_print_char+0
; value end address is: 36 (R9)
;ssd1309.c,291 :: 		}
L_OLED_print_chr46:
;ssd1309.c,293 :: 		if((value > 99) && (value <= 999))
; value start address is: 36 (R9)
CMP	R9, #99
IT	LE
BLE	L__OLED_print_chr237
MOVW	R3, #999
CMP	R9, R3
IT	GT
BGT	L__OLED_print_chr236
L__OLED_print_chr235:
;ssd1309.c,295 :: 		ch = (value / 100);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R3, R9, R3
;ssd1309.c,296 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,297 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R3, R4, R3
;ssd1309.c,298 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,299 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,300 :: 		OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #18
; x_pos end address is: 28 (R7)
UXTB	R2, R4
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,301 :: 		}
IT	AL
BAL	L_OLED_print_chr50
;ssd1309.c,293 :: 		if((value > 99) && (value <= 999))
L__OLED_print_chr237:
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__OLED_print_chr236:
;ssd1309.c,302 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__OLED_print_chr239
CMP	R9, #99
IT	GT
BGT	L__OLED_print_chr238
L__OLED_print_chr234:
;ssd1309.c,304 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R3, R4, R3
;ssd1309.c,305 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,306 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,307 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,308 :: 		OLED_print_char((x_pos + 18), y_pos , 0x20);
ADDW	R3, R7, #18
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,309 :: 		}
IT	AL
BAL	L_OLED_print_chr54
;ssd1309.c,302 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_chr239:
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__OLED_print_chr238:
;ssd1309.c,310 :: 		else if((value >= 0) && (value <= 9))
CMP	R9, #0
IT	LT
BLT	L__OLED_print_chr241
CMP	R9, #9
IT	GT
BGT	L__OLED_print_chr240
L__OLED_print_chr233:
;ssd1309.c,312 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,313 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,314 :: 		OLED_print_char((x_pos + 12), y_pos , 0x20);
ADDW	R3, R7, #12
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,315 :: 		OLED_print_char((x_pos + 18), y_pos , 0x20);
ADDW	R3, R7, #18
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,310 :: 		else if((value >= 0) && (value <= 9))
L__OLED_print_chr241:
L__OLED_print_chr240:
;ssd1309.c,316 :: 		}
L_OLED_print_chr54:
L_OLED_print_chr50:
;ssd1309.c,317 :: 		}
L_end_OLED_print_chr:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_chr
_OLED_print_int:
;ssd1309.c,320 :: 		void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
MOV	R9, R2
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 36 (R9)
;ssd1309.c,322 :: 		unsigned char ch = 0x00;
;ssd1309.c,324 :: 		if(value < 0)
CMP	R9, #0
IT	GE
BGE	L_OLED_print_int58
;ssd1309.c,326 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
UXTB	R1, R8
UXTB	R0, R7
BL	_OLED_print_char+0
;ssd1309.c,327 :: 		value = -value;
RSB	R9, R9, #0
;ssd1309.c,328 :: 		}
IT	AL
BAL	L_OLED_print_int59
L_OLED_print_int58:
;ssd1309.c,331 :: 		OLED_print_char(x_pos, y_pos,' ');
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R7
BL	_OLED_print_char+0
; value end address is: 36 (R9)
;ssd1309.c,332 :: 		}
L_OLED_print_int59:
;ssd1309.c,334 :: 		if(value > 9999)
; value start address is: 36 (R9)
MOVW	R3, #9999
CMP	R9, R3
IT	LE
BLE	L_OLED_print_int60
;ssd1309.c,336 :: 		ch = (value / 10000);
MOVW	R3, #10000
SDIV	R3, R9, R3
;ssd1309.c,337 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,339 :: 		ch = ((value % 10000)/ 1000);
MOVW	R3, #10000
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVW	R3, #1000
SDIV	R3, R4, R3
;ssd1309.c,340 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,342 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1309.c,343 :: 		OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #18
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,345 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1309.c,346 :: 		OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #24
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,348 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,349 :: 		OLED_print_char((x_pos + 30), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R2, R4
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,350 :: 		}
IT	AL
BAL	L_OLED_print_int61
L_OLED_print_int60:
;ssd1309.c,352 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
MOVW	R3, #999
CMP	R9, R3
IT	LE
BLE	L__OLED_print_int246
MOVW	R3, #9999
CMP	R9, R3
IT	GT
BGT	L__OLED_print_int245
L__OLED_print_int244:
;ssd1309.c,354 :: 		ch = ((value % 10000)/ 1000);
MOVW	R3, #10000
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVW	R3, #1000
SDIV	R3, R4, R3
;ssd1309.c,355 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,357 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1309.c,358 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,360 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1309.c,361 :: 		OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #18
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,363 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,364 :: 		OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #24
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,365 :: 		OLED_print_char((x_pos + 30), y_pos , 0x20);
ADDW	R3, R7, #30
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,366 :: 		}
IT	AL
BAL	L_OLED_print_int65
;ssd1309.c,352 :: 		else if((value > 999) && (value <= 9999))
L__OLED_print_int246:
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__OLED_print_int245:
;ssd1309.c,367 :: 		else if((value > 99) && (value <= 999))
CMP	R9, #99
IT	LE
BLE	L__OLED_print_int248
MOVW	R3, #999
CMP	R9, R3
IT	GT
BGT	L__OLED_print_int247
L__OLED_print_int243:
;ssd1309.c,369 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1309.c,370 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,372 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1309.c,373 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,375 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,376 :: 		OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #18
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,377 :: 		OLED_print_char((x_pos + 24), y_pos , 0x20);
ADDW	R3, R7, #24
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,378 :: 		OLED_print_char((x_pos + 30), y_pos , 0x20);
ADDW	R3, R7, #30
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,379 :: 		}
IT	AL
BAL	L_OLED_print_int69
;ssd1309.c,367 :: 		else if((value > 99) && (value <= 999))
L__OLED_print_int248:
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__OLED_print_int247:
;ssd1309.c,380 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__OLED_print_int250
CMP	R9, #99
IT	GT
BGT	L__OLED_print_int249
L__OLED_print_int242:
;ssd1309.c,382 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R9, R3
MLS	R4, R3, R4, R9
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1309.c,383 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,385 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,386 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDW	R3, R7, #12
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,388 :: 		OLED_print_char((x_pos + 18), y_pos , 0x20);
ADDW	R3, R7, #18
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,389 :: 		OLED_print_char((x_pos + 24), y_pos , 0x20);
ADDW	R3, R7, #24
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,390 :: 		OLED_print_char((x_pos + 30), y_pos , 0x20);
ADDW	R3, R7, #30
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,391 :: 		}
IT	AL
BAL	L_OLED_print_int73
;ssd1309.c,380 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_int250:
; value start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__OLED_print_int249:
;ssd1309.c,394 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R9, R4
MLS	R3, R4, R3, R9
; value end address is: 36 (R9)
;ssd1309.c,395 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADDS	R3, R7, #6
UXTB	R2, R4
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,396 :: 		OLED_print_char((x_pos + 12), y_pos , 0x20);
ADDW	R3, R7, #12
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,397 :: 		OLED_print_char((x_pos + 18), y_pos , 0x20);
ADDW	R3, R7, #18
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,398 :: 		OLED_print_char((x_pos + 24), y_pos , 0x20);
ADDW	R3, R7, #24
MOVS	R2, #32
UXTB	R1, R8
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,399 :: 		OLED_print_char((x_pos + 30), y_pos , 0x20);
ADDW	R3, R7, #30
; x_pos end address is: 28 (R7)
MOVS	R2, #32
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1309.c,400 :: 		}
L_OLED_print_int73:
L_OLED_print_int69:
L_OLED_print_int65:
L_OLED_print_int61:
;ssd1309.c,401 :: 		}
L_end_OLED_print_int:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_int
_OLED_print_decimal:
;ssd1309.c,404 :: 		void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
; points start address is: 12 (R3)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
UXTH	R9, R2
UXTB	R10, R3
; points end address is: 12 (R3)
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 36 (R9)
; points start address is: 40 (R10)
;ssd1309.c,406 :: 		unsigned char ch = 0x00;
;ssd1309.c,408 :: 		OLED_print_char(x_pos, y_pos, '.');
MOVS	R2, #46
UXTB	R1, R8
UXTB	R0, R7
BL	_OLED_print_char+0
;ssd1309.c,410 :: 		ch = (value / 1000);
MOVW	R4, #1000
UDIV	R4, R9, R4
;ssd1309.c,411 :: 		OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADDS	R4, R7, #6
UXTB	R2, R5
UXTB	R1, R8
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1309.c,413 :: 		if(points > 1)
CMP	R10, #1
IT	LS
BLS	L_OLED_print_decimal74
;ssd1309.c,415 :: 		ch = ((value % 1000) / 100);
MOVW	R4, #1000
UDIV	R5, R9, R4
MLS	R5, R4, R5, R9
UXTH	R5, R5
MOVS	R4, #100
UDIV	R4, R5, R4
;ssd1309.c,416 :: 		OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADDW	R4, R7, #12
UXTB	R2, R5
UXTB	R1, R8
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1309.c,419 :: 		if(points > 2)
CMP	R10, #2
IT	LS
BLS	L_OLED_print_decimal75
;ssd1309.c,421 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
UDIV	R5, R9, R4
MLS	R5, R4, R5, R9
UXTH	R5, R5
MOVS	R4, #10
UDIV	R4, R5, R4
;ssd1309.c,422 :: 		OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADDW	R4, R7, #18
UXTB	R2, R5
UXTB	R1, R8
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1309.c,424 :: 		if(points > 3)
CMP	R10, #3
IT	LS
BLS	L_OLED_print_decimal76
; points end address is: 40 (R10)
;ssd1309.c,426 :: 		ch = (value % 10);
MOVS	R5, #10
UDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
;ssd1309.c,427 :: 		OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADDW	R4, R7, #24
; x_pos end address is: 28 (R7)
UXTB	R2, R5
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1309.c,428 :: 		}
L_OLED_print_decimal76:
;ssd1309.c,429 :: 		}
L_OLED_print_decimal75:
;ssd1309.c,430 :: 		}
L_OLED_print_decimal74:
;ssd1309.c,431 :: 		}
L_end_OLED_print_decimal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_decimal
_OLED_print_float:
;ssd1309.c,434 :: 		void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R11, R0
UXTB	R12, R1
STR	R2, [SP, #4]
STRB	R3, [SP, #8]
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 44 (R11)
; y_pos start address is: 48 (R12)
;ssd1309.c,436 :: 		signed long tmp = 0x00;
;ssd1309.c,438 :: 		tmp = value;
LDR	R0, [SP, #4]
BL	__FloatToSignedIntegral+0
STR	R0, [SP, #12]
;ssd1309.c,439 :: 		OLED_print_int(x_pos, y_pos, tmp);
MOV	R2, R0
UXTB	R1, R12
UXTB	R0, R11
BL	_OLED_print_int+0
;ssd1309.c,440 :: 		tmp = ((value - tmp) * 10000);
LDR	R0, [SP, #12]
BL	__SignedIntegralToFloat+0
STR	R0, [SP, #16]
LDR	R2, [SP, #16]
LDR	R0, [SP, #4]
BL	__Sub_FP+0
MOVW	R2, #16384
MOVT	R2, #17948
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
STR	R0, [SP, #12]
;ssd1309.c,442 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BGE	L_OLED_print_float77
;ssd1309.c,444 :: 		tmp = -tmp;
LDR	R4, [SP, #12]
RSBS	R4, R4, #0
STR	R4, [SP, #12]
;ssd1309.c,445 :: 		}
L_OLED_print_float77:
;ssd1309.c,447 :: 		if((value >= 10000) && (value < 100000))
LDR	R2, [SP, #4]
MOVW	R0, #16384
MOVT	R0, #17948
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__OLED_print_float283
MOVS	R0, #1
L__OLED_print_float283:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float256
LDR	R2, [SP, #4]
MOVW	R0, #20480
MOVT	R0, #18371
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float284
MOVS	R0, #1
L__OLED_print_float284:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float255
L__OLED_print_float254:
;ssd1309.c,449 :: 		OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
ADD	R4, R11, #36
; x_pos end address is: 44 (R11)
LDRB	R3, [SP, #8]
LDR	R2, [SP, #12]
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1309.c,450 :: 		}
IT	AL
BAL	L_OLED_print_float81
;ssd1309.c,447 :: 		if((value >= 10000) && (value < 100000))
L__OLED_print_float256:
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
L__OLED_print_float255:
;ssd1309.c,451 :: 		else if((value >= 1000) && (value < 10000))
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #17530
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__OLED_print_float285
MOVS	R0, #1
L__OLED_print_float285:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float258
LDR	R2, [SP, #4]
MOVW	R0, #16384
MOVT	R0, #17948
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float286
MOVS	R0, #1
L__OLED_print_float286:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float257
L__OLED_print_float253:
;ssd1309.c,453 :: 		OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
ADD	R4, R11, #30
; x_pos end address is: 44 (R11)
LDRB	R3, [SP, #8]
LDR	R2, [SP, #12]
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1309.c,454 :: 		}
IT	AL
BAL	L_OLED_print_float85
;ssd1309.c,451 :: 		else if((value >= 1000) && (value < 10000))
L__OLED_print_float258:
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
L__OLED_print_float257:
;ssd1309.c,455 :: 		else if((value >= 100) && (value < 1000))
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #17096
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__OLED_print_float287
MOVS	R0, #1
L__OLED_print_float287:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float260
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #17530
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float288
MOVS	R0, #1
L__OLED_print_float288:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float259
L__OLED_print_float252:
;ssd1309.c,457 :: 		OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
ADD	R4, R11, #24
; x_pos end address is: 44 (R11)
LDRB	R3, [SP, #8]
LDR	R2, [SP, #12]
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1309.c,458 :: 		}
IT	AL
BAL	L_OLED_print_float89
;ssd1309.c,455 :: 		else if((value >= 100) && (value < 1000))
L__OLED_print_float260:
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
L__OLED_print_float259:
;ssd1309.c,459 :: 		else if((value >= 10) && (value < 100))
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #16672
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__OLED_print_float289
MOVS	R0, #1
L__OLED_print_float289:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float262
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #17096
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float290
MOVS	R0, #1
L__OLED_print_float290:
CMP	R0, #0
IT	EQ
BEQ	L__OLED_print_float261
L__OLED_print_float251:
;ssd1309.c,461 :: 		OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
ADD	R4, R11, #18
; x_pos end address is: 44 (R11)
LDRB	R3, [SP, #8]
LDR	R2, [SP, #12]
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1309.c,462 :: 		}
IT	AL
BAL	L_OLED_print_float93
;ssd1309.c,459 :: 		else if((value >= 10) && (value < 100))
L__OLED_print_float262:
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
L__OLED_print_float261:
;ssd1309.c,463 :: 		else if(value < 10)
LDR	R2, [SP, #4]
MOVW	R0, #0
MOVT	R0, #16672
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float291
MOVS	R0, #1
L__OLED_print_float291:
CMP	R0, #0
IT	EQ
BEQ	L_OLED_print_float94
;ssd1309.c,465 :: 		OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
ADD	R4, R11, #12
LDRB	R3, [SP, #8]
LDR	R2, [SP, #12]
UXTB	R1, R12
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1309.c,466 :: 		if((value) < 0)
LDR	R2, [SP, #4]
MOV	R0, #0
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__OLED_print_float292
MOVS	R0, #1
L__OLED_print_float292:
CMP	R0, #0
IT	EQ
BEQ	L_OLED_print_float95
;ssd1309.c,468 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R11
; x_pos end address is: 44 (R11)
BL	_OLED_print_char+0
;ssd1309.c,469 :: 		}
IT	AL
BAL	L_OLED_print_float96
L_OLED_print_float95:
;ssd1309.c,472 :: 		OLED_print_char(x_pos, y_pos, ' ');
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
MOVS	R2, #32
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R11
; x_pos end address is: 44 (R11)
BL	_OLED_print_char+0
;ssd1309.c,473 :: 		}
L_OLED_print_float96:
;ssd1309.c,474 :: 		}
L_OLED_print_float94:
L_OLED_print_float93:
L_OLED_print_float89:
L_OLED_print_float85:
L_OLED_print_float81:
;ssd1309.c,475 :: 		}
L_end_OLED_print_float:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _OLED_print_float
_Draw_Pixel:
;ssd1309.c,478 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R1
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 20 (R5)
; colour start address is: 8 (R2)
;ssd1309.c,480 :: 		unsigned char value = 0x00;
;ssd1309.c,481 :: 		unsigned char page = 0x00;
;ssd1309.c,482 :: 		unsigned char bit_pos = 0x00;
;ssd1309.c,484 :: 		page = (y_pos / y_max);
LSRS	R4, R5, #3
UXTB	R4, R4
; page start address is: 4 (R1)
UXTB	R1, R4
;ssd1309.c,485 :: 		bit_pos = (y_pos - (page * y_max));
LSLS	R3, R4, #3
SXTH	R3, R3
SUB	R3, R5, R3
; y_pos end address is: 20 (R5)
; bit_pos start address is: 20 (R5)
UXTB	R5, R3
;ssd1309.c,486 :: 		value = buffer[((page * x_max) + x_pos)];
LSLS	R3, R4, #7
SXTH	R3, R3
ADDS	R4, R3, R0
SXTH	R4, R4
MOVW	R3, #lo_addr(_buffer+0)
MOVT	R3, #hi_addr(_buffer+0)
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
; value start address is: 16 (R4)
UXTB	R4, R3
;ssd1309.c,488 :: 		if((colour & 0x01) != 0)
AND	R3, R2, #1
UXTB	R3, R3
; colour end address is: 8 (R2)
CMP	R3, #0
IT	EQ
BEQ	L_Draw_Pixel97
;ssd1309.c,490 :: 		value |= (1 << bit_pos);
MOVS	R3, #1
SXTH	R3, R3
LSLS	R3, R5
SXTH	R3, R3
; bit_pos end address is: 20 (R5)
ORR	R3, R4, R3, LSL #0
; value end address is: 16 (R4)
; value start address is: 20 (R5)
UXTB	R5, R3
;ssd1309.c,491 :: 		}
; value end address is: 20 (R5)
IT	AL
BAL	L_Draw_Pixel98
L_Draw_Pixel97:
;ssd1309.c,494 :: 		value &= (~(1 << bit_pos));
; value start address is: 16 (R4)
; bit_pos start address is: 20 (R5)
MOVS	R3, #1
SXTH	R3, R3
LSLS	R3, R5
SXTH	R3, R3
; bit_pos end address is: 20 (R5)
MVN	R3, R3
SXTH	R3, R3
AND	R3, R4, R3, LSL #0
; value end address is: 16 (R4)
; value start address is: 20 (R5)
UXTB	R5, R3
; value end address is: 20 (R5)
;ssd1309.c,495 :: 		}
L_Draw_Pixel98:
;ssd1309.c,497 :: 		buffer[((page * x_max) + x_pos)] = value;
; value start address is: 20 (R5)
LSLS	R3, R1, #7
SXTH	R3, R3
ADDS	R4, R3, R0
SXTH	R4, R4
MOVW	R3, #lo_addr(_buffer+0)
MOVT	R3, #hi_addr(_buffer+0)
ADDS	R3, R3, R4
STRB	R5, [R3, #0]
;ssd1309.c,498 :: 		OLED_gotoxy(x_pos, page);
; page end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1309.c,499 :: 		OLED_write(value, DAT);
MOVS	R1, #1
UXTB	R0, R5
; value end address is: 20 (R5)
BL	_OLED_write+0
;ssd1309.c,500 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;ssd1309.c,503 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
SXTH	R6, R0
SXTH	R7, R1
SXTH	R10, R2
SXTH	R11, R3
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 24 (R6)
; y1 start address is: 28 (R7)
; x2 start address is: 40 (R10)
; y2 start address is: 44 (R11)
; colour start address is: 32 (R8)
LDRB	R8, [SP, #12]
;ssd1309.c,505 :: 		signed int dx = 0x0000;
;ssd1309.c,506 :: 		signed int dy = 0x0000;
;ssd1309.c,507 :: 		signed int stepx = 0x0000;
;ssd1309.c,508 :: 		signed int stepy = 0x0000;
;ssd1309.c,509 :: 		signed int fraction = 0x0000;
;ssd1309.c,511 :: 		dy = (y2 - y1);
SUB	R5, R11, R7, LSL #0
SXTH	R5, R5
; dy start address is: 4 (R1)
SXTH	R1, R5
;ssd1309.c,512 :: 		dx = (x2 - x1);
SUB	R4, R10, R6, LSL #0
; dx start address is: 0 (R0)
SXTH	R0, R4
;ssd1309.c,514 :: 		if (dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line99
;ssd1309.c,516 :: 		dy = -dy;
RSBS	R1, R1, #0
SXTH	R1, R1
;ssd1309.c,517 :: 		stepy = -1;
; stepy start address is: 36 (R9)
MOVW	R9, #65535
SXTH	R9, R9
;ssd1309.c,518 :: 		}
; stepy end address is: 36 (R9)
IT	AL
BAL	L_Draw_Line100
L_Draw_Line99:
;ssd1309.c,521 :: 		stepy = 1;
; stepy start address is: 36 (R9)
MOVW	R9, #1
SXTH	R9, R9
; dy end address is: 4 (R1)
; stepy end address is: 36 (R9)
;ssd1309.c,522 :: 		}
L_Draw_Line100:
;ssd1309.c,524 :: 		if (dx < 0)
; stepy start address is: 36 (R9)
; dy start address is: 4 (R1)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line101
;ssd1309.c,526 :: 		dx = -dx;
RSBS	R2, R0, #0
SXTH	R2, R2
; dx end address is: 0 (R0)
; dx start address is: 8 (R2)
;ssd1309.c,527 :: 		stepx = -1;
; stepx start address is: 0 (R0)
MOVW	R0, #65535
SXTH	R0, R0
;ssd1309.c,528 :: 		}
; stepx end address is: 0 (R0)
; dx end address is: 8 (R2)
IT	AL
BAL	L_Draw_Line102
L_Draw_Line101:
;ssd1309.c,531 :: 		stepx = 1;
; stepx start address is: 8 (R2)
; dx start address is: 0 (R0)
MOVS	R2, #1
SXTH	R2, R2
; dx end address is: 0 (R0)
; stepx end address is: 8 (R2)
STRH	R2, [SP, #4]
SXTH	R2, R0
LDRSH	R0, [SP, #4]
;ssd1309.c,532 :: 		}
L_Draw_Line102:
;ssd1309.c,534 :: 		dx <<= 1;
; stepx start address is: 0 (R0)
; dx start address is: 8 (R2)
LSLS	R4, R2, #1
; dx end address is: 8 (R2)
; dx start address is: 48 (R12)
SXTH	R12, R4
;ssd1309.c,535 :: 		dy <<= 1;
LSLS	R4, R1, #1
; dy end address is: 4 (R1)
; dy start address is: 8 (R2)
SXTH	R2, R4
;ssd1309.c,537 :: 		Draw_Pixel(x1, y1, colour);
STRH	R2, [SP, #4]
STRH	R0, [SP, #6]
UXTB	R2, R8
UXTB	R1, R7
UXTB	R0, R6
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R2, [SP, #4]
;ssd1309.c,539 :: 		if(dx > dy)
CMP	R12, R2
IT	LE
BLE	L_Draw_Line103
; y2 end address is: 44 (R11)
;ssd1309.c,541 :: 		fraction = (dy - (dx >> 1));
ASR	R4, R12, #1
SXTH	R4, R4
SUB	R1, R2, R4
SXTH	R1, R1
; fraction start address is: 4 (R1)
; x2 end address is: 40 (R10)
; stepx end address is: 0 (R0)
; dx end address is: 48 (R12)
; dy end address is: 8 (R2)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; fraction end address is: 4 (R1)
SXTH	R11, R12
SXTH	R12, R0
SXTH	R0, R10
SXTH	R10, R2
SXTH	R2, R6
;ssd1309.c,542 :: 		while (x1 != x2)
L_Draw_Line104:
; fraction start address is: 4 (R1)
; stepx start address is: 48 (R12)
; dx start address is: 44 (R11)
; dy start address is: 40 (R10)
; dy start address is: 40 (R10)
; dy end address is: 40 (R10)
; dx start address is: 44 (R11)
; dx end address is: 44 (R11)
; stepx start address is: 48 (R12)
; stepx end address is: 48 (R12)
; stepy start address is: 36 (R9)
; stepy end address is: 36 (R9)
; colour start address is: 32 (R8)
; colour end address is: 32 (R8)
; x2 start address is: 0 (R0)
; y1 start address is: 28 (R7)
; x1 start address is: 8 (R2)
CMP	R2, R0
IT	EQ
BEQ	L_Draw_Line105
; dy end address is: 40 (R10)
; dx end address is: 44 (R11)
; stepx end address is: 48 (R12)
; colour end address is: 32 (R8)
; stepy end address is: 36 (R9)
;ssd1309.c,544 :: 		if(fraction >= 0)
; stepy start address is: 36 (R9)
; colour start address is: 32 (R8)
; stepx start address is: 48 (R12)
; dx start address is: 44 (R11)
; dy start address is: 40 (R10)
CMP	R1, #0
IT	LT
BLT	L__Draw_Line263
;ssd1309.c,546 :: 		y1 += stepy;
ADD	R7, R7, R9, LSL #0
SXTH	R7, R7
;ssd1309.c,547 :: 		fraction -= dx;
SUB	R1, R1, R11, LSL #0
SXTH	R1, R1
; y1 end address is: 28 (R7)
; fraction end address is: 4 (R1)
;ssd1309.c,548 :: 		}
IT	AL
BAL	L_Draw_Line106
L__Draw_Line263:
;ssd1309.c,544 :: 		if(fraction >= 0)
;ssd1309.c,548 :: 		}
L_Draw_Line106:
;ssd1309.c,550 :: 		x1 += stepx;
; fraction start address is: 4 (R1)
; y1 start address is: 28 (R7)
ADD	R5, R2, R12, LSL #0
; x1 end address is: 8 (R2)
; x1 start address is: 24 (R6)
SXTH	R6, R5
;ssd1309.c,551 :: 		fraction += dy;
ADD	R1, R1, R10, LSL #0
SXTH	R1, R1
;ssd1309.c,553 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
UXTB	R2, R8
UXTB	R1, R7
UXTB	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1309.c,554 :: 		}
SXTH	R2, R6
; dy end address is: 40 (R10)
; dx end address is: 44 (R11)
; stepx end address is: 48 (R12)
; colour end address is: 32 (R8)
; x2 end address is: 0 (R0)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; fraction end address is: 4 (R1)
; stepy end address is: 36 (R9)
IT	AL
BAL	L_Draw_Line104
L_Draw_Line105:
;ssd1309.c,555 :: 		}
IT	AL
BAL	L_Draw_Line107
L_Draw_Line103:
;ssd1309.c,558 :: 		fraction = (dx - (dy >> 1));
; y2 start address is: 44 (R11)
; stepy start address is: 36 (R9)
; x1 start address is: 24 (R6)
; y1 start address is: 28 (R7)
; colour start address is: 32 (R8)
; dy start address is: 8 (R2)
; dx start address is: 48 (R12)
; stepx start address is: 0 (R0)
ASRS	R4, R2, #1
SXTH	R4, R4
SUB	R3, R12, R4, LSL #0
SXTH	R3, R3
; fraction start address is: 12 (R3)
; stepx end address is: 0 (R0)
; dx end address is: 48 (R12)
; dy end address is: 8 (R2)
; colour end address is: 32 (R8)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; fraction end address is: 12 (R3)
; y2 end address is: 44 (R11)
SXTH	R1, R6
SXTH	R6, R2
UXTB	R10, R8
SXTH	R8, R0
SXTH	R0, R7
SXTH	R7, R12
;ssd1309.c,559 :: 		while (y1 != y2)
L_Draw_Line108:
; colour start address is: 40 (R10)
; stepx start address is: 32 (R8)
; dx start address is: 28 (R7)
; dy start address is: 24 (R6)
; fraction start address is: 12 (R3)
; dy start address is: 24 (R6)
; dy end address is: 24 (R6)
; dx start address is: 28 (R7)
; dx end address is: 28 (R7)
; stepx start address is: 32 (R8)
; stepx end address is: 32 (R8)
; stepy start address is: 36 (R9)
; stepy end address is: 36 (R9)
; colour start address is: 40 (R10)
; colour end address is: 40 (R10)
; y2 start address is: 44 (R11)
; y1 start address is: 0 (R0)
; x1 start address is: 4 (R1)
CMP	R0, R11
IT	EQ
BEQ	L_Draw_Line109
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 36 (R9)
; colour end address is: 40 (R10)
;ssd1309.c,561 :: 		if (fraction >= 0)
; colour start address is: 40 (R10)
; stepy start address is: 36 (R9)
; stepx start address is: 32 (R8)
; dx start address is: 28 (R7)
; dy start address is: 24 (R6)
CMP	R3, #0
IT	LT
BLT	L__Draw_Line264
;ssd1309.c,563 :: 		x1 += stepx;
ADD	R1, R1, R8, LSL #0
SXTH	R1, R1
;ssd1309.c,564 :: 		fraction -= dy;
SUB	R2, R3, R6
SXTH	R2, R2
; fraction end address is: 12 (R3)
; fraction start address is: 8 (R2)
; fraction end address is: 8 (R2)
; x1 end address is: 4 (R1)
;ssd1309.c,565 :: 		}
IT	AL
BAL	L_Draw_Line110
L__Draw_Line264:
;ssd1309.c,561 :: 		if (fraction >= 0)
SXTH	R2, R3
;ssd1309.c,565 :: 		}
L_Draw_Line110:
;ssd1309.c,567 :: 		y1 += stepy;
; fraction start address is: 8 (R2)
; x1 start address is: 4 (R1)
ADD	R5, R0, R9, LSL #0
; y1 end address is: 0 (R0)
; y1 start address is: 48 (R12)
SXTH	R12, R5
;ssd1309.c,568 :: 		fraction += dx;
ADDS	R4, R2, R7
; fraction end address is: 8 (R2)
; fraction start address is: 0 (R0)
SXTH	R0, R4
;ssd1309.c,570 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
UXTB	R2, R10
UXTB	R0, R1
UXTB	R1, R5
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #8]
LDRSH	R0, [SP, #4]
;ssd1309.c,571 :: 		}
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 36 (R9)
; colour end address is: 40 (R10)
; y2 end address is: 44 (R11)
; x1 end address is: 4 (R1)
; y1 end address is: 48 (R12)
; fraction end address is: 0 (R0)
SXTH	R3, R0
SXTH	R0, R12
IT	AL
BAL	L_Draw_Line108
L_Draw_Line109:
;ssd1309.c,572 :: 		}
L_Draw_Line107:
;ssd1309.c,573 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_Line
_Draw_V_Line:
;ssd1309.c,576 :: 		void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
; colour start address is: 12 (R3)
; x1 start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
SXTH	R6, R0
STRH	R1, [SP, #8]
STRH	R2, [SP, #12]
UXTH	R7, R3
; colour end address is: 12 (R3)
; x1 end address is: 0 (R0)
; x1 start address is: 24 (R6)
; colour start address is: 28 (R7)
;ssd1309.c,578 :: 		signed int pos = 0;
;ssd1309.c,579 :: 		signed int temp = 0;
;ssd1309.c,581 :: 		if(y1 > y2)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line111
;ssd1309.c,583 :: 		swap(&y1, &y2);
ADD	R5, SP, #12
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,584 :: 		}
L_Draw_V_Line111:
;ssd1309.c,586 :: 		while(y2 > (y1 - 1))
STRH	R7, [SP, #4]
; colour end address is: 28 (R7)
SXTH	R7, R6
LDRH	R6, [SP, #4]
L_Draw_V_Line112:
; x1 end address is: 24 (R6)
; x1 start address is: 28 (R7)
; colour start address is: 24 (R6)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
; x1 start address is: 28 (R7)
; x1 end address is: 28 (R7)
LDRSH	R4, [SP, #8]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line113
; colour end address is: 24 (R6)
; x1 end address is: 28 (R7)
;ssd1309.c,588 :: 		Draw_Pixel(x1, y2, colour);
; x1 start address is: 28 (R7)
; colour start address is: 24 (R6)
UXTB	R2, R6
LDRSH	R1, [SP, #12]
UXTB	R0, R7
BL	_Draw_Pixel+0
;ssd1309.c,589 :: 		y2--;
LDRSH	R4, [SP, #12]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ssd1309.c,590 :: 		}
; colour end address is: 24 (R6)
; x1 end address is: 28 (R7)
IT	AL
BAL	L_Draw_V_Line112
L_Draw_V_Line113:
;ssd1309.c,591 :: 		}
L_end_Draw_V_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_V_Line
_Draw_H_Line:
;ssd1309.c,594 :: 		void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
; colour start address is: 12 (R3)
; y1 start address is: 8 (R2)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
SXTH	R6, R2
UXTH	R7, R3
; colour end address is: 12 (R3)
; y1 end address is: 8 (R2)
; y1 start address is: 24 (R6)
; colour start address is: 28 (R7)
;ssd1309.c,596 :: 		signed int pos = 0;
;ssd1309.c,597 :: 		signed int temp = 0;
;ssd1309.c,599 :: 		if(x1 > x2)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line114
;ssd1309.c,601 :: 		swap(&x1, &x2);
ADD	R5, SP, #12
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,602 :: 		}
L_Draw_H_Line114:
;ssd1309.c,604 :: 		while(x2 > (x1 - 1))
STRH	R7, [SP, #4]
; colour end address is: 28 (R7)
SXTH	R7, R6
LDRH	R6, [SP, #4]
L_Draw_H_Line115:
; y1 end address is: 24 (R6)
; y1 start address is: 28 (R7)
; colour start address is: 24 (R6)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
; y1 start address is: 28 (R7)
; y1 end address is: 28 (R7)
LDRSH	R4, [SP, #8]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line116
; colour end address is: 24 (R6)
; y1 end address is: 28 (R7)
;ssd1309.c,606 :: 		Draw_Pixel(x2, y1, colour);
; y1 start address is: 28 (R7)
; colour start address is: 24 (R6)
UXTB	R2, R6
UXTB	R1, R7
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1309.c,607 :: 		x2--;
LDRSH	R4, [SP, #12]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ssd1309.c,608 :: 		}
; colour end address is: 24 (R6)
; y1 end address is: 28 (R7)
IT	AL
BAL	L_Draw_H_Line115
L_Draw_H_Line116:
;ssd1309.c,609 :: 		}
L_end_Draw_H_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_H_Line
_Draw_Triangle:
;ssd1309.c,612 :: 		void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
SUB	SP, SP, #32
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
STRH	R2, [SP, #16]
STRH	R3, [SP, #20]
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #32]
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #36]
; fill start address is: 0 (R0)
LDRB	R0, [SP, #40]
LDRH	R4, [SP, #44]
STRH	R4, [SP, #44]
;ssd1309.c,614 :: 		signed int a = 0;
MOVW	R4, #0
STRH	R4, [SP, #4]
MOVW	R4, #0
STRH	R4, [SP, #6]
;ssd1309.c,615 :: 		signed int b = 0;
;ssd1309.c,616 :: 		signed int sa = 0;
;ssd1309.c,617 :: 		signed int sb = 0;
;ssd1309.c,618 :: 		signed int yp = 0;
;ssd1309.c,619 :: 		signed int last = 0;
;ssd1309.c,620 :: 		signed int dx12 = 0;
;ssd1309.c,621 :: 		signed int dx23 = 0;
;ssd1309.c,622 :: 		signed int dx13 = 0;
;ssd1309.c,623 :: 		signed int dy12 = 0;
;ssd1309.c,624 :: 		signed int dy23 = 0;
;ssd1309.c,625 :: 		signed int dy13 = 0;
;ssd1309.c,627 :: 		switch(fill)
IT	AL
BAL	L_Draw_Triangle117
; fill end address is: 0 (R0)
;ssd1309.c,629 :: 		case YES:
L_Draw_Triangle119:
;ssd1309.c,631 :: 		if(y1 > y2)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle120
;ssd1309.c,633 :: 		swap(&y1, &y2);
ADD	R5, SP, #20
ADD	R4, SP, #12
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,634 :: 		swap(&x1, &x2);
ADD	R5, SP, #16
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,635 :: 		}
L_Draw_Triangle120:
;ssd1309.c,636 :: 		if(y2 > y3)
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #20]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle121
;ssd1309.c,638 :: 		swap(&y3, &y2);
ADD	R5, SP, #20
ADD	R4, SP, #36
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,639 :: 		swap(&x3, &x2);
ADD	R5, SP, #16
ADD	R4, SP, #32
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,640 :: 		}
L_Draw_Triangle121:
;ssd1309.c,641 :: 		if(y1 > y2)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle122
;ssd1309.c,643 :: 		swap(&y1, &y2);
ADD	R5, SP, #20
ADD	R4, SP, #12
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,644 :: 		swap(&x1, &x2);
ADD	R5, SP, #16
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,645 :: 		}
L_Draw_Triangle122:
;ssd1309.c,647 :: 		if(y1 == y3)
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle123
;ssd1309.c,649 :: 		a = b = x1;
LDRSH	R4, [SP, #8]
STRH	R4, [SP, #6]
LDRSH	R4, [SP, #8]
STRH	R4, [SP, #4]
;ssd1309.c,651 :: 		if(x2 < a)
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle124
;ssd1309.c,653 :: 		a = x2;
LDRSH	R4, [SP, #16]
STRH	R4, [SP, #4]
;ssd1309.c,654 :: 		}
IT	AL
BAL	L_Draw_Triangle125
L_Draw_Triangle124:
;ssd1309.c,655 :: 		else if(x2 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle126
;ssd1309.c,657 :: 		b = x2;
LDRSH	R4, [SP, #16]
STRH	R4, [SP, #6]
;ssd1309.c,658 :: 		}
L_Draw_Triangle126:
L_Draw_Triangle125:
;ssd1309.c,659 :: 		if(x2 < a)
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle127
;ssd1309.c,661 :: 		a = x3;
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #4]
;ssd1309.c,662 :: 		}
IT	AL
BAL	L_Draw_Triangle128
L_Draw_Triangle127:
;ssd1309.c,663 :: 		else if(x3 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle129
;ssd1309.c,665 :: 		b = x3;
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #6]
;ssd1309.c,666 :: 		}
L_Draw_Triangle129:
L_Draw_Triangle128:
;ssd1309.c,668 :: 		Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #44]
LDRSH	R2, [SP, #12]
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1309.c,669 :: 		return;
IT	AL
BAL	L_end_Draw_Triangle
;ssd1309.c,670 :: 		}
L_Draw_Triangle123:
;ssd1309.c,672 :: 		dx12 = (x2 - x1);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R4, R4, R5
STRH	R4, [SP, #26]
;ssd1309.c,673 :: 		dy12 = (y2 - y1);
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #20]
SUB	R4, R4, R5
STRH	R4, [SP, #30]
;ssd1309.c,674 :: 		dx13 = (x3 - x1);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #32]
SUB	R4, R4, R5
STRH	R4, [SP, #28]
;ssd1309.c,675 :: 		dy13 = (y3 - y1);
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #36]
SUB	R12, R4, R5, LSL #0
SXTH	R12, R12
; dy13 start address is: 48 (R12)
;ssd1309.c,676 :: 		dx23 = (x3 - x2);
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #32]
SUB	R9, R4, R5, LSL #0
SXTH	R9, R9
; dx23 start address is: 36 (R9)
;ssd1309.c,677 :: 		dy23 = (y3 - y2);
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #36]
SUB	R11, R4, R5, LSL #0
SXTH	R11, R11
; dy23 start address is: 44 (R11)
;ssd1309.c,678 :: 		sa = 0,
; sa start address is: 28 (R7)
MOVS	R7, #0
SXTH	R7, R7
;ssd1309.c,679 :: 		sb = 0;
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #22]
;ssd1309.c,681 :: 		if(y2 == y3)
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #20]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle130
;ssd1309.c,683 :: 		last = y2;
LDRSH	R4, [SP, #20]
STRH	R4, [SP, #24]
;ssd1309.c,684 :: 		}
IT	AL
BAL	L_Draw_Triangle131
L_Draw_Triangle130:
;ssd1309.c,687 :: 		last = (y2 - 1);
LDRSH	R4, [SP, #20]
SUBS	R4, R4, #1
STRH	R4, [SP, #24]
;ssd1309.c,688 :: 		}
L_Draw_Triangle131:
;ssd1309.c,690 :: 		for(yp = y1; yp <= last; yp++)
; yp start address is: 32 (R8)
LDRSH	R8, [SP, #12]
; sa end address is: 28 (R7)
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
; yp end address is: 32 (R8)
SXTH	R0, R7
L_Draw_Triangle132:
; yp start address is: 32 (R8)
; sa start address is: 0 (R0)
; dy23 start address is: 44 (R11)
; dx23 start address is: 36 (R9)
; dy13 start address is: 48 (R12)
LDRSH	R4, [SP, #24]
CMP	R8, R4
IT	GT
BGT	L_Draw_Triangle133
;ssd1309.c,692 :: 		a = (x1 + (sa / dy12));
LDRSH	R4, [SP, #30]
SDIV	R5, R0, R4
SXTH	R5, R5
LDRSH	R4, [SP, #8]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ssd1309.c,693 :: 		b = (x1 + (sb / dy13));
LDRSH	R4, [SP, #22]
SDIV	R5, R4, R12
SXTH	R5, R5
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ssd1309.c,694 :: 		sa += dx12;
LDRSH	R4, [SP, #26]
ADD	R10, R0, R4, LSL #0
SXTH	R10, R10
; sa end address is: 0 (R0)
; sa start address is: 40 (R10)
;ssd1309.c,695 :: 		sb += dx13;
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #22]
ADDS	R4, R4, R5
STRH	R4, [SP, #22]
;ssd1309.c,696 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle135
;ssd1309.c,698 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,699 :: 		}
L_Draw_Triangle135:
;ssd1309.c,700 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #44]
SXTH	R2, R8
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1309.c,690 :: 		for(yp = y1; yp <= last; yp++)
ADD	R4, R8, #1
; yp end address is: 32 (R8)
; yp start address is: 0 (R0)
SXTH	R0, R4
;ssd1309.c,701 :: 		}
; yp end address is: 0 (R0)
; sa end address is: 40 (R10)
SXTH	R8, R0
SXTH	R0, R10
IT	AL
BAL	L_Draw_Triangle132
L_Draw_Triangle133:
;ssd1309.c,703 :: 		sa = (dx23 * (yp - y2));
; yp start address is: 32 (R8)
LDRSH	R4, [SP, #20]
SUB	R4, R8, R4, LSL #0
SXTH	R4, R4
MUL	R0, R9, R4
SXTH	R0, R0
; sa start address is: 0 (R0)
;ssd1309.c,704 :: 		sb = (dx13 * (yp - y1));
LDRSH	R4, [SP, #12]
SUB	R5, R8, R4, LSL #0
SXTH	R5, R5
LDRSH	R4, [SP, #28]
MULS	R4, R5, R4
STRH	R4, [SP, #22]
; sa end address is: 0 (R0)
; yp end address is: 32 (R8)
;ssd1309.c,705 :: 		for(; yp <= y3; yp++)
L_Draw_Triangle136:
; sa start address is: 0 (R0)
; dy13 start address is: 48 (R12)
; dy13 end address is: 48 (R12)
; dx23 start address is: 36 (R9)
; dx23 end address is: 36 (R9)
; dy23 start address is: 44 (R11)
; dy23 end address is: 44 (R11)
; yp start address is: 32 (R8)
LDRSH	R4, [SP, #36]
CMP	R8, R4
IT	GT
BGT	L_Draw_Triangle137
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
;ssd1309.c,707 :: 		a = (x2 + (sa / dy23));
; dy23 start address is: 44 (R11)
; dx23 start address is: 36 (R9)
; dy13 start address is: 48 (R12)
SDIV	R5, R0, R11
SXTH	R5, R5
LDRSH	R4, [SP, #16]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ssd1309.c,708 :: 		b = (x1 + (sb / dy13));
LDRSH	R4, [SP, #22]
SDIV	R5, R4, R12
SXTH	R5, R5
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ssd1309.c,709 :: 		sa += dx23;
ADD	R4, R0, R9, LSL #0
; sa end address is: 0 (R0)
; sa start address is: 40 (R10)
SXTH	R10, R4
;ssd1309.c,710 :: 		sb += dx13;
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #22]
ADDS	R4, R4, R5
STRH	R4, [SP, #22]
;ssd1309.c,712 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle139
;ssd1309.c,714 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1309.c,715 :: 		}
L_Draw_Triangle139:
;ssd1309.c,716 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #44]
SXTH	R2, R8
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1309.c,705 :: 		for(; yp <= y3; yp++)
ADD	R4, R8, #1
; yp end address is: 32 (R8)
; yp start address is: 4 (R1)
SXTH	R1, R4
;ssd1309.c,717 :: 		}
SXTH	R8, R1
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
; sa end address is: 40 (R10)
; yp end address is: 4 (R1)
SXTH	R0, R10
IT	AL
BAL	L_Draw_Triangle136
L_Draw_Triangle137:
;ssd1309.c,720 :: 		break;
IT	AL
BAL	L_Draw_Triangle118
;ssd1309.c,722 :: 		default:
L_Draw_Triangle140:
;ssd1309.c,724 :: 		Draw_Line(x1, y1, x2, y2, colour);
LDRH	R4, [SP, #44]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,725 :: 		Draw_Line(x2, y2, x3, y3, colour);
LDRH	R4, [SP, #44]
LDRSH	R3, [SP, #36]
LDRSH	R2, [SP, #32]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #16]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,726 :: 		Draw_Line(x3, y3, x1, y1, colour);
LDRH	R4, [SP, #44]
LDRSH	R3, [SP, #12]
LDRSH	R2, [SP, #8]
LDRSH	R1, [SP, #36]
LDRSH	R0, [SP, #32]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,727 :: 		break;
IT	AL
BAL	L_Draw_Triangle118
;ssd1309.c,729 :: 		}
L_Draw_Triangle117:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Triangle119
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle140
L_Draw_Triangle118:
;ssd1309.c,730 :: 		}
L_end_Draw_Triangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _Draw_Triangle
_Draw_Rectangle:
;ssd1309.c,733 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
; y2 start address is: 12 (R3)
SUB	SP, SP, #28
STR	LR, [SP, #0]
STRH	R0, [SP, #12]
SXTH	R0, R3
STRH	R1, [SP, #16]
STRH	R2, [SP, #20]
; y2 end address is: 12 (R3)
; y2 start address is: 0 (R0)
; fill start address is: 8 (R2)
LDRB	R2, [SP, #28]
; colour start address is: 4 (R1)
LDRB	R1, [SP, #32]
LDRB	R4, [SP, #36]
STRB	R4, [SP, #36]
;ssd1309.c,735 :: 		unsigned short i = 0x00;
;ssd1309.c,736 :: 		unsigned short xmin = 0x00;
;ssd1309.c,737 :: 		unsigned short xmax = 0x00;
;ssd1309.c,738 :: 		unsigned short ymin = 0x00;
;ssd1309.c,739 :: 		unsigned short ymax = 0x00;
;ssd1309.c,741 :: 		if(fill != 0)
CMP	R2, #0
IT	EQ
BEQ	L_Draw_Rectangle141
; fill end address is: 8 (R2)
;ssd1309.c,743 :: 		if(x1 < x2)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle142
;ssd1309.c,745 :: 		xmin = x1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #22]
;ssd1309.c,746 :: 		xmax = x2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #23]
;ssd1309.c,747 :: 		}
IT	AL
BAL	L_Draw_Rectangle143
L_Draw_Rectangle142:
;ssd1309.c,750 :: 		xmin = x2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #22]
;ssd1309.c,751 :: 		xmax = x1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #23]
;ssd1309.c,752 :: 		}
L_Draw_Rectangle143:
;ssd1309.c,754 :: 		if(y1 < y2)
LDRSH	R4, [SP, #16]
CMP	R4, R0
IT	GE
BGE	L_Draw_Rectangle144
;ssd1309.c,756 :: 		ymin = y1;
LDRSH	R4, [SP, #16]
STRB	R4, [SP, #24]
;ssd1309.c,757 :: 		ymax = y2;
STRB	R0, [SP, #25]
;ssd1309.c,758 :: 		}
IT	AL
BAL	L_Draw_Rectangle145
L_Draw_Rectangle144:
;ssd1309.c,761 :: 		ymin = y2;
STRB	R0, [SP, #24]
;ssd1309.c,762 :: 		ymax = y1;
LDRSH	R4, [SP, #16]
STRB	R4, [SP, #25]
;ssd1309.c,763 :: 		}
L_Draw_Rectangle145:
;ssd1309.c,765 :: 		for(; xmin <= xmax; ++xmin)
SXTH	R7, R0
; y2 end address is: 0 (R0)
; colour end address is: 4 (R1)
UXTB	R6, R1
L_Draw_Rectangle146:
; colour start address is: 24 (R6)
; y2 start address is: 28 (R7)
LDRB	R5, [SP, #23]
LDRB	R4, [SP, #22]
CMP	R4, R5
IT	HI
BHI	L_Draw_Rectangle147
;ssd1309.c,767 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 40 (R10)
LDRB	R10, [SP, #24]
; i end address is: 40 (R10)
; colour end address is: 24 (R6)
; y2 end address is: 28 (R7)
UXTB	R8, R6
SXTH	R9, R7
L_Draw_Rectangle149:
; i start address is: 40 (R10)
; y2 start address is: 36 (R9)
; colour start address is: 32 (R8)
LDRB	R4, [SP, #25]
CMP	R10, R4
IT	HI
BHI	L_Draw_Rectangle150
;ssd1309.c,769 :: 		Draw_Pixel(xmin, i, colour);
UXTB	R2, R8
UXTB	R1, R10
LDRB	R0, [SP, #22]
BL	_Draw_Pixel+0
;ssd1309.c,767 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R10, #1
; i end address is: 40 (R10)
; i start address is: 0 (R0)
UXTB	R0, R4
;ssd1309.c,770 :: 		}
; i end address is: 0 (R0)
UXTB	R10, R0
IT	AL
BAL	L_Draw_Rectangle149
L_Draw_Rectangle150:
;ssd1309.c,765 :: 		for(; xmin <= xmax; ++xmin)
LDRB	R4, [SP, #22]
ADDS	R4, R4, #1
STRB	R4, [SP, #22]
;ssd1309.c,771 :: 		}
SXTH	R7, R9
; y2 end address is: 36 (R9)
; colour end address is: 32 (R8)
UXTB	R6, R8
IT	AL
BAL	L_Draw_Rectangle146
L_Draw_Rectangle147:
;ssd1309.c,772 :: 		}
; y2 start address is: 28 (R7)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
; y2 end address is: 28 (R7)
IT	AL
BAL	L_Draw_Rectangle152
L_Draw_Rectangle141:
;ssd1309.c,776 :: 		Draw_Line(x1, y1, x2, y1, colour);
; colour start address is: 4 (R1)
; y2 start address is: 0 (R0)
UXTB	R4, R1
STRB	R1, [SP, #4]
STRH	R0, [SP, #8]
LDRSH	R3, [SP, #16]
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #12]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #8]
LDRB	R1, [SP, #4]
;ssd1309.c,777 :: 		Draw_Line(x1, y2, x2, y2, colour);
UXTB	R4, R1
STRB	R1, [SP, #4]
STRH	R0, [SP, #8]
SXTH	R3, R0
LDRSH	R2, [SP, #20]
SXTH	R1, R3
LDRSH	R0, [SP, #12]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #8]
LDRB	R1, [SP, #4]
;ssd1309.c,778 :: 		Draw_Line(x1, y1, x1, y2, colour);
UXTB	R4, R1
STRB	R1, [SP, #4]
STRH	R0, [SP, #8]
SXTH	R3, R0
LDRSH	R2, [SP, #12]
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #12]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #8]
LDRB	R1, [SP, #4]
;ssd1309.c,779 :: 		Draw_Line(x2, y1, x2, y2, colour);
UXTB	R4, R1
STRB	R1, [SP, #4]
STRH	R0, [SP, #8]
SXTH	R3, R0
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #20]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
; y2 end address is: 0 (R0)
; colour end address is: 4 (R1)
LDRSH	R0, [SP, #8]
LDRB	R1, [SP, #4]
SXTH	R7, R0
UXTB	R6, R1
;ssd1309.c,780 :: 		}
L_Draw_Rectangle152:
;ssd1309.c,782 :: 		if(type != SQUARE)
; colour start address is: 24 (R6)
; y2 start address is: 28 (R7)
LDRB	R4, [SP, #36]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle153
;ssd1309.c,784 :: 		Draw_Pixel(x1, y1, ~colour);
MVN	R4, R6
UXTB	R2, R4
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1309.c,785 :: 		Draw_Pixel(x1, y2, ~colour);
MVN	R4, R6
UXTB	R2, R4
UXTB	R1, R7
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1309.c,786 :: 		Draw_Pixel(x2, y1, ~colour);
MVN	R4, R6
UXTB	R2, R4
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #20]
BL	_Draw_Pixel+0
;ssd1309.c,787 :: 		Draw_Pixel(x2, y2, ~colour);
MVN	R4, R6
; colour end address is: 24 (R6)
UXTB	R2, R4
UXTB	R1, R7
; y2 end address is: 28 (R7)
LDRSH	R0, [SP, #20]
BL	_Draw_Pixel+0
;ssd1309.c,788 :: 		}
L_Draw_Rectangle153:
;ssd1309.c,789 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _Draw_Rectangle
_Draw_Circle:
;ssd1309.c,792 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
; radius start address is: 8 (R2)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
SXTH	R0, R2
STRH	R1, [SP, #12]
STRB	R3, [SP, #16]
; radius end address is: 8 (R2)
; radius start address is: 0 (R0)
LDRB	R4, [SP, #24]
STRB	R4, [SP, #24]
;ssd1309.c,794 :: 		signed int a = 0x0000;
MOVW	R4, #0
STRH	R4, [SP, #4]
;ssd1309.c,795 :: 		signed int b = 0x0000;
;ssd1309.c,796 :: 		signed int P = 0x0000;
;ssd1309.c,798 :: 		b = radius;
STRH	R0, [SP, #18]
;ssd1309.c,799 :: 		P = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #20]
;ssd1309.c,801 :: 		do
L_Draw_Circle154:
;ssd1309.c,803 :: 		if(fill != 0)
LDRB	R4, [SP, #16]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Circle157
;ssd1309.c,805 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
ADDS	R7, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,806 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
SUB	R7, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,807 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R7, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,808 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R7, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1309.c,809 :: 		}
IT	AL
BAL	L_Draw_Circle158
L_Draw_Circle157:
;ssd1309.c,812 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,813 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,814 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,815 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,816 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,817 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,818 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #12]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,819 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R6, R4, R5
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1309.c,820 :: 		}
L_Draw_Circle158:
;ssd1309.c,822 :: 		if(P < 0)
LDRSH	R4, [SP, #20]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle159
;ssd1309.c,824 :: 		P += (3 + (2 * a++));
LDRSH	R4, [SP, #4]
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #3
SXTH	R5, R5
LDRSH	R4, [SP, #20]
ADDS	R4, R4, R5
STRH	R4, [SP, #20]
LDRSH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
;ssd1309.c,825 :: 		}
IT	AL
BAL	L_Draw_Circle160
L_Draw_Circle159:
;ssd1309.c,828 :: 		P += (5 + (2 * ((a++) - (b--))));
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #4]
SUB	R4, R4, R5
SXTH	R4, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #5
SXTH	R5, R5
LDRSH	R4, [SP, #20]
ADDS	R4, R4, R5
STRH	R4, [SP, #20]
LDRSH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
LDRSH	R4, [SP, #18]
SUBS	R4, R4, #1
STRH	R4, [SP, #18]
;ssd1309.c,829 :: 		}
L_Draw_Circle160:
;ssd1309.c,830 :: 		}while(a <= b);
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_Circle154
;ssd1309.c,831 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_main:
;oled_demo.c,9 :: 		void main()
SUB	SP, SP, #12
;oled_demo.c,11 :: 		unsigned int m = 0;
;oled_demo.c,12 :: 		unsigned char n = 0;
;oled_demo.c,13 :: 		unsigned char o = 0;
;oled_demo.c,14 :: 		unsigned char p = 0;
;oled_demo.c,16 :: 		signed int i = -9;
;oled_demo.c,18 :: 		float f = -10.0;
;oled_demo.c,20 :: 		setup_MCU();
BL	_setup_MCU+0
;oled_demo.c,22 :: 		while(1)
L_main161:
;oled_demo.c,24 :: 		i = -9;
MOVW	R0, #65527
SXTH	R0, R0
STRH	R0, [SP, #6]
;oled_demo.c,25 :: 		f = -10.0;
MOVW	R0, #0
MOVT	R0, #49440
STR	R0, [SP, #8]
;oled_demo.c,27 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,28 :: 		OLED_fill(0xAA);
MOVS	R0, #170
BL	_OLED_fill+0
;oled_demo.c,29 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_main163:
SUBS	R7, R7, #1
BNE	L_main163
NOP
NOP
NOP
;oled_demo.c,31 :: 		OLED_fill(0x55);
MOVS	R0, #85
BL	_OLED_fill+0
;oled_demo.c,32 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_main165:
SUBS	R7, R7, #1
BNE	L_main165
NOP
NOP
NOP
;oled_demo.c,34 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,35 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,36 :: 		OLED_print_Image(mikro_logo, OFF);
MOVS	R1, #0
MOVW	R0, #lo_addr(_mikro_logo+0)
MOVT	R0, #hi_addr(_mikro_logo+0)
BL	_OLED_print_Image+0
;oled_demo.c,37 :: 		delay_ms(2400);
MOVW	R7, #29695
MOVT	R7, #439
NOP
NOP
L_main167:
SUBS	R7, R7, #1
BNE	L_main167
NOP
NOP
NOP
;oled_demo.c,39 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,40 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,41 :: 		for(m = 1; m < 30; m++)
; m start address is: 12 (R3)
MOVS	R3, #1
; m end address is: 12 (R3)
UXTH	R1, R3
L_main169:
; m start address is: 4 (R1)
CMP	R1, #30
IT	CS
BCS	L_main170
;oled_demo.c,43 :: 		Draw_Circle(63, 31, m, YES, ON);
MOVS	R0, #1
STRH	R1, [SP, #0]
PUSH	(R0)
MOVS	R3, #1
SXTH	R2, R1
MOVS	R1, #31
SXTH	R1, R1
MOVS	R0, #63
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
LDRH	R1, [SP, #0]
;oled_demo.c,44 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main172:
SUBS	R7, R7, #1
BNE	L_main172
NOP
NOP
NOP
;oled_demo.c,41 :: 		for(m = 1; m < 30; m++)
ADDS	R3, R1, #1
UXTH	R3, R3
; m end address is: 4 (R1)
; m start address is: 12 (R3)
;oled_demo.c,45 :: 		}
UXTH	R1, R3
; m end address is: 12 (R3)
IT	AL
BAL	L_main169
L_main170:
;oled_demo.c,46 :: 		delay_ms(900);
MOVW	R7, #52095
MOVT	R7, #164
NOP
NOP
L_main174:
SUBS	R7, R7, #1
BNE	L_main174
NOP
NOP
NOP
;oled_demo.c,47 :: 		for(m = 1; m < 30; m++)
; m start address is: 12 (R3)
MOVS	R3, #1
; m end address is: 12 (R3)
UXTH	R1, R3
L_main176:
; m start address is: 4 (R1)
CMP	R1, #30
IT	CS
BCS	L_main177
;oled_demo.c,49 :: 		Draw_Circle(63, 31, m, YES, OFF);
MOVS	R0, #0
STRH	R1, [SP, #0]
PUSH	(R0)
MOVS	R3, #1
SXTH	R2, R1
MOVS	R1, #31
SXTH	R1, R1
MOVS	R0, #63
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
LDRH	R1, [SP, #0]
;oled_demo.c,50 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main179:
SUBS	R7, R7, #1
BNE	L_main179
NOP
NOP
NOP
;oled_demo.c,47 :: 		for(m = 1; m < 30; m++)
ADDS	R3, R1, #1
UXTH	R3, R3
; m end address is: 4 (R1)
; m start address is: 12 (R3)
;oled_demo.c,51 :: 		}
UXTH	R1, R3
; m end address is: 12 (R3)
IT	AL
BAL	L_main176
L_main177:
;oled_demo.c,52 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main181:
SUBS	R7, R7, #1
BNE	L_main181
NOP
NOP
NOP
;oled_demo.c,54 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,55 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,56 :: 		for(m = 1; m < 31; m += 2)
; m start address is: 12 (R3)
MOVS	R3, #1
; m end address is: 12 (R3)
UXTH	R1, R3
L_main183:
; m start address is: 4 (R1)
CMP	R1, #31
IT	CS
BCS	L_main184
;oled_demo.c,58 :: 		Draw_Circle(63, 31, m, NO, ON);
MOVS	R0, #1
STRH	R1, [SP, #0]
PUSH	(R0)
MOVS	R3, #0
SXTH	R2, R1
MOVS	R1, #31
SXTH	R1, R1
MOVS	R0, #63
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
LDRH	R1, [SP, #0]
;oled_demo.c,59 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main186:
SUBS	R7, R7, #1
BNE	L_main186
NOP
NOP
NOP
;oled_demo.c,56 :: 		for(m = 1; m < 31; m += 2)
ADDS	R0, R1, #2
; m end address is: 4 (R1)
; m start address is: 12 (R3)
UXTH	R3, R0
;oled_demo.c,60 :: 		}
UXTH	R1, R3
; m end address is: 12 (R3)
IT	AL
BAL	L_main183
L_main184:
;oled_demo.c,61 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main188:
SUBS	R7, R7, #1
BNE	L_main188
NOP
NOP
NOP
;oled_demo.c,63 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,64 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,65 :: 		for(m = 1; m < 31; m++)
; m start address is: 32 (R8)
MOVW	R8, #1
; m end address is: 32 (R8)
UXTH	R6, R8
L_main190:
; m start address is: 24 (R6)
CMP	R6, #31
IT	CS
BCS	L_main191
;oled_demo.c,67 :: 		Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m), NO, YES, SQUARE);
MOVS	R5, #0
MOVS	R4, #1
MOVS	R3, #0
RSB	R2, R6, #62
RSB	R1, R6, #126
ADDS	R0, R6, #1
STRH	R6, [SP, #0]
PUSH	(R5)
PUSH	(R4)
PUSH	(R3)
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
LDRH	R6, [SP, #0]
;oled_demo.c,68 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main193:
SUBS	R7, R7, #1
BNE	L_main193
NOP
NOP
NOP
;oled_demo.c,65 :: 		for(m = 1; m < 31; m++)
ADD	R8, R6, #1
UXTH	R8, R8
; m end address is: 24 (R6)
; m start address is: 32 (R8)
;oled_demo.c,69 :: 		}
UXTH	R6, R8
; m end address is: 32 (R8)
IT	AL
BAL	L_main190
L_main191:
;oled_demo.c,70 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main195:
SUBS	R7, R7, #1
BNE	L_main195
NOP
NOP
NOP
;oled_demo.c,72 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,73 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,74 :: 		for(m = 1; m < 31; m++)
; m start address is: 32 (R8)
MOVW	R8, #1
; m end address is: 32 (R8)
UXTH	R6, R8
L_main197:
; m start address is: 24 (R6)
CMP	R6, #31
IT	CS
BCS	L_main198
;oled_demo.c,76 :: 		Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m), NO, YES, ROUND);
MOVS	R5, #1
MOVS	R4, #1
MOVS	R3, #0
RSB	R2, R6, #62
RSB	R1, R6, #126
ADDS	R0, R6, #1
STRH	R6, [SP, #0]
PUSH	(R5)
PUSH	(R4)
PUSH	(R3)
SXTH	R3, R2
SXTH	R2, R1
SXTH	R1, R0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
LDRH	R6, [SP, #0]
;oled_demo.c,77 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main200:
SUBS	R7, R7, #1
BNE	L_main200
NOP
NOP
NOP
;oled_demo.c,74 :: 		for(m = 1; m < 31; m++)
ADDS	R0, R6, #1
; m end address is: 24 (R6)
; m start address is: 32 (R8)
UXTH	R8, R0
;oled_demo.c,78 :: 		}
UXTH	R6, R8
; m end address is: 32 (R8)
IT	AL
BAL	L_main197
L_main198:
;oled_demo.c,79 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main202:
SUBS	R7, R7, #1
BNE	L_main202
NOP
NOP
NOP
;oled_demo.c,81 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,82 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,83 :: 		for(m = 0; m < 128; m += 10)
; m start address is: 24 (R6)
MOVS	R6, #0
; m end address is: 24 (R6)
L_main204:
; m start address is: 24 (R6)
CMP	R6, #128
IT	CS
BCS	L_main205
;oled_demo.c,85 :: 		for(n = 0; n < 64; n += 8)
; n start address is: 12 (R3)
MOVS	R3, #0
; n end address is: 12 (R3)
; m end address is: 24 (R6)
UXTH	R4, R6
L_main207:
; n start address is: 12 (R3)
; m start address is: 16 (R4)
CMP	R3, #64
IT	CS
BCS	L_main208
;oled_demo.c,87 :: 		Draw_Line(m, n, 127, 63, ON);
MOVS	R0, #1
STRH	R4, [SP, #0]
STRB	R3, [SP, #2]
PUSH	(R0)
MOVS	R2, #127
SXTH	R2, R2
UXTB	R1, R3
MOVS	R3, #63
SXTH	R3, R3
SXTH	R0, R4
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRB	R3, [SP, #2]
LDRH	R4, [SP, #0]
;oled_demo.c,88 :: 		Draw_Line((127 - m), (63 - n), 0, 0, ON);
MOVS	R2, #1
RSB	R1, R3, #63
RSB	R0, R4, #127
STRH	R4, [SP, #0]
STRB	R3, [SP, #2]
PUSH	(R2)
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRB	R3, [SP, #2]
LDRH	R4, [SP, #0]
;oled_demo.c,89 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main210:
SUBS	R7, R7, #1
BNE	L_main210
NOP
NOP
NOP
;oled_demo.c,85 :: 		for(n = 0; n < 64; n += 8)
ADDW	R0, R3, #8
; n end address is: 12 (R3)
; n start address is: 0 (R0)
UXTB	R0, R0
;oled_demo.c,90 :: 		}
; n end address is: 0 (R0)
UXTB	R3, R0
IT	AL
BAL	L_main207
L_main208:
;oled_demo.c,83 :: 		for(m = 0; m < 128; m += 10)
ADDW	R6, R4, #10
UXTH	R6, R6
; m end address is: 16 (R4)
; m start address is: 24 (R6)
;oled_demo.c,91 :: 		}
; m end address is: 24 (R6)
IT	AL
BAL	L_main204
L_main205:
;oled_demo.c,92 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main212:
SUBS	R7, R7, #1
BNE	L_main212
NOP
NOP
NOP
;oled_demo.c,94 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,95 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,96 :: 		Draw_Triangle(0, 63, 127, 63, 63, 0, NO, ON);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #63
SXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #63
SXTH	R3, R3
MOVS	R2, #127
SXTH	R2, R2
MOVS	R1, #63
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Triangle+0
ADD	SP, SP, #16
;oled_demo.c,97 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main214:
SUBS	R7, R7, #1
BNE	L_main214
NOP
NOP
NOP
;oled_demo.c,98 :: 		Draw_Triangle(0, 63, 127, 63, 63, 0, YES, ON);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #63
SXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #63
SXTH	R3, R3
MOVS	R2, #127
SXTH	R2, R2
MOVS	R1, #63
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Triangle+0
ADD	SP, SP, #16
;oled_demo.c,99 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main216:
SUBS	R7, R7, #1
BNE	L_main216
NOP
NOP
NOP
;oled_demo.c,101 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,102 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;oled_demo.c,103 :: 		for(m = 0; m < 128; m += 8)
; m start address is: 24 (R6)
MOVS	R6, #0
; m end address is: 24 (R6)
L_main218:
; m start address is: 24 (R6)
CMP	R6, #128
IT	CS
BCS	L_main219
;oled_demo.c,105 :: 		for(n = 0; n < 64; n += 8)
; n start address is: 16 (R4)
MOVS	R4, #0
; n end address is: 16 (R4)
; m end address is: 24 (R6)
UXTB	R3, R4
UXTH	R4, R6
L_main221:
; n start address is: 12 (R3)
; m start address is: 16 (R4)
CMP	R3, #64
IT	CS
BCS	L_main222
;oled_demo.c,107 :: 		Draw_Rectangle(m, 0, 127, n, OFF, ON, ROUND);
MOVS	R2, #1
MOVS	R1, #1
MOVS	R0, #0
STRH	R4, [SP, #0]
STRB	R3, [SP, #2]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R2, #127
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
SXTH	R0, R4
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
LDRB	R3, [SP, #2]
LDRH	R4, [SP, #0]
;oled_demo.c,105 :: 		for(n = 0; n < 64; n += 8)
ADDW	R0, R3, #8
; n end address is: 12 (R3)
; n start address is: 0 (R0)
UXTB	R0, R0
;oled_demo.c,108 :: 		}
; n end address is: 0 (R0)
UXTB	R3, R0
IT	AL
BAL	L_main221
L_main222:
;oled_demo.c,103 :: 		for(m = 0; m < 128; m += 8)
ADDW	R0, R4, #8
; m end address is: 16 (R4)
; m start address is: 24 (R6)
UXTH	R6, R0
;oled_demo.c,109 :: 		}
; m end address is: 24 (R6)
IT	AL
BAL	L_main218
L_main219:
;oled_demo.c,110 :: 		delay_ms(1600);
MOVW	R7, #63487
MOVT	R7, #292
NOP
NOP
L_main224:
SUBS	R7, R7, #1
BNE	L_main224
NOP
NOP
NOP
;oled_demo.c,113 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;oled_demo.c,114 :: 		OLED_print_string(36, 1, "MicroArena");
MOVW	R0, #lo_addr(?lstr1_oled_demo+0)
MOVT	R0, #hi_addr(?lstr1_oled_demo+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #36
BL	_OLED_print_string+0
;oled_demo.c,115 :: 		OLED_print_string(12, 2, "fb.com/MicroArena");
MOVW	R0, #lo_addr(?lstr2_oled_demo+0)
MOVT	R0, #hi_addr(?lstr2_oled_demo+0)
MOV	R2, R0
MOVS	R1, #2
MOVS	R0, #12
BL	_OLED_print_string+0
;oled_demo.c,116 :: 		for(p = 0; p < 250; p++)
MOVS	R0, #0
STRB	R0, [SP, #4]
L_main226:
LDRB	R0, [SP, #4]
CMP	R0, #250
IT	CS
BCS	L_main227
;oled_demo.c,118 :: 		f += 0.1;
LDR	R2, [SP, #8]
MOVW	R0, #52429
MOVT	R0, #15820
BL	__Add_FP+0
STR	R0, [SP, #8]
;oled_demo.c,119 :: 		i += 1;
LDRSH	R1, [SP, #6]
ADDS	R1, R1, #1
STRH	R1, [SP, #6]
;oled_demo.c,121 :: 		OLED_print_float(52, 5, f, 1);
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #5
MOVS	R0, #52
BL	_OLED_print_float+0
;oled_demo.c,122 :: 		OLED_print_int(52, 6, i);
LDRSH	R2, [SP, #6]
MOVS	R1, #6
MOVS	R0, #52
BL	_OLED_print_int+0
;oled_demo.c,123 :: 		OLED_print_chr(52, 7, p);
LDRB	R2, [SP, #4]
MOVS	R1, #7
MOVS	R0, #52
BL	_OLED_print_chr+0
;oled_demo.c,125 :: 		delay_ms(99);
MOVW	R7, #8351
MOVT	R7, #18
NOP
NOP
L_main229:
SUBS	R7, R7, #1
BNE	L_main229
NOP
NOP
NOP
;oled_demo.c,116 :: 		for(p = 0; p < 250; p++)
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
;oled_demo.c,126 :: 		}
IT	AL
BAL	L_main226
L_main227:
;oled_demo.c,128 :: 		OLED_fill(0xFF);
MOVS	R0, #255
BL	_OLED_fill+0
;oled_demo.c,129 :: 		};
IT	AL
BAL	L_main161
;oled_demo.c,130 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_MCU:
;oled_demo.c,133 :: 		void setup_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;oled_demo.c,135 :: 		OLED_init();
BL	_OLED_init+0
;oled_demo.c,136 :: 		}
L_end_setup_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_MCU
