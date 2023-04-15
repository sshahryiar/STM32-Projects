_setup_GPIOs:
;ssd1306.c,4 :: 		void setup_GPIOs()
PUSH	(R14)
;ssd1306.c,6 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1306.c,9 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_10MHZ | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #1044
MOVT	R2, #0
;ssd1306.c,8 :: 		(_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7),
MOVS	R1, #240
;ssd1306.c,7 :: 		GPIO_Config(&GPIOB_BASE,
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;ssd1306.c,9 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_10MHZ | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ssd1306.c,10 :: 		delay_ms(200);
LDR	R7, [PC, #1599999]
NOP
L_setup_GPIOs0:
SUBS	R7, R7, #1
BNE	L_setup_GPIOs0
B	#4
	#1599999
NOP
;ssd1306.c,11 :: 		}
L_end_setup_GPIOs:
POP	(R15)
; end of _setup_GPIOs
_OLED_init:
;ssd1306.c,14 :: 		void OLED_init()
PUSH	(R14)
;ssd1306.c,16 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;ssd1306.c,17 :: 		setup_GPIOs();
BL	_setup_GPIOs+0
;ssd1306.c,18 :: 		OLED_reset_sequence();
BL	_OLED_reset_sequence+0
;ssd1306.c,20 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_OFF) , CMD);;
MOVS	R1, #0
MOVS	R0, #174
BL	_OLED_write+0
;ssd1306.c,22 :: 		OLED_write(Set_Display_Clock_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #213
BL	_OLED_write+0
;ssd1306.c,23 :: 		OLED_write(0x80, CMD);
MOVS	R1, #0
MOVS	R0, #128
BL	_OLED_write+0
;ssd1306.c,25 :: 		OLED_write(Set_Multiplex_Ratio_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #168
BL	_OLED_write+0
;ssd1306.c,26 :: 		OLED_write(0x3F, CMD);
MOVS	R1, #0
MOVS	R0, #63
BL	_OLED_write+0
;ssd1306.c,28 :: 		OLED_write(Set_Display_Offset_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #211
BL	_OLED_write+0
;ssd1306.c,29 :: 		OLED_write(0x00, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1306.c,31 :: 		OLED_write((Set_Display_Start_Line_CMD | 0x00), CMD);
MOVS	R1, #0
MOVS	R0, #64
BL	_OLED_write+0
;ssd1306.c,33 :: 		OLED_write(Set_Charge_Pump_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #141
BL	_OLED_write+0
;ssd1306.c,34 :: 		OLED_write((Set_Higher_Column_Start_Address_CMD | Enable_Charge_Pump), CMD);
MOVS	R1, #0
MOVS	R0, #20
BL	_OLED_write+0
;ssd1306.c,36 :: 		OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #32
BL	_OLED_write+0
;ssd1306.c,37 :: 		OLED_write(Page_Addressing_Mode, CMD);
MOVS	R1, #0
MOVS	R0, #2
BL	_OLED_write+0
;ssd1306.c,39 :: 		OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
MOVS	R1, #0
MOVS	R0, #161
BL	_OLED_write+0
;ssd1306.c,41 :: 		OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
MOVS	R1, #0
MOVS	R0, #200
BL	_OLED_write+0
;ssd1306.c,43 :: 		OLED_write(Set_Common_HW_Config_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #218
BL	_OLED_write+0
;ssd1306.c,44 :: 		OLED_write(0x12, CMD);
MOVS	R1, #0
MOVS	R0, #18
BL	_OLED_write+0
;ssd1306.c,46 :: 		OLED_write(Set_Contrast_Control_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #129
BL	_OLED_write+0
;ssd1306.c,47 :: 		OLED_write(0xCF, CMD);
MOVS	R1, #0
MOVS	R0, #207
BL	_OLED_write+0
;ssd1306.c,49 :: 		OLED_write(Set_Pre_charge_Period_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #217
BL	_OLED_write+0
;ssd1306.c,50 :: 		OLED_write(0xF1, CMD);
MOVS	R1, #0
MOVS	R0, #241
BL	_OLED_write+0
;ssd1306.c,52 :: 		OLED_write(Set_VCOMH_Level_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #219
BL	_OLED_write+0
;ssd1306.c,53 :: 		OLED_write(0x40, CMD);
MOVS	R1, #0
MOVS	R0, #64
BL	_OLED_write+0
;ssd1306.c,55 :: 		OLED_write((Set_Entire_Display_ON_CMD | Normal_Display), CMD);
MOVS	R1, #0
MOVS	R0, #164
BL	_OLED_write+0
;ssd1306.c,57 :: 		OLED_write((Set_Normal_or_Inverse_Display_CMD | Non_Inverted_Display), CMD);
MOVS	R1, #0
MOVS	R0, #166
BL	_OLED_write+0
;ssd1306.c,59 :: 		OLED_write((Set_Display_ON_or_OFF_CMD + Display_ON) , CMD);
MOVS	R1, #0
MOVS	R0, #175
BL	_OLED_write+0
;ssd1306.c,61 :: 		OLED_gotoxy(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1306.c,63 :: 		OLED_clear_screen();
BL	_OLED_clear_screen+0
;ssd1306.c,64 :: 		}
L_end_OLED_init:
POP	(R15)
; end of _OLED_init
_OLED_reset_sequence:
;ssd1306.c,67 :: 		void OLED_reset_sequence()
;ssd1306.c,69 :: 		delay_ms(40);
LDR	R7, [PC, #319999]
NOP
L_OLED_reset_sequence2:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence2
B	#4
	#319999
NOP
;ssd1306.c,70 :: 		SCL = 1;
MOVW	R2, #lo_addr(GPIOB_ODRbits+0)
MOVT	R2, #hi_addr(GPIOB_ODRbits+0)
_LX	[R2, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R1, #128
ORRS	R0, R1
_SX	[R2, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,71 :: 		RST = 0;
MOVW	R2, #lo_addr(GPIOB_ODRbits+0)
MOVT	R2, #hi_addr(GPIOB_ODRbits+0)
_LX	[R2, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R1, #32
BICS	R0, R1
_SX	[R2, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,72 :: 		delay_ms(40);
LDR	R7, [PC, #319999]
NOP
L_OLED_reset_sequence4:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence4
B	#4
	#319999
NOP
;ssd1306.c,73 :: 		RST = 1;
MOVW	R2, #lo_addr(GPIOB_ODRbits+0)
MOVT	R2, #hi_addr(GPIOB_ODRbits+0)
_LX	[R2, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R1, #32
ORRS	R0, R1
_SX	[R2, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,74 :: 		SCL = 0;
MOVW	R2, #lo_addr(GPIOB_ODRbits+0)
MOVT	R2, #hi_addr(GPIOB_ODRbits+0)
_LX	[R2, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R1, #128
BICS	R0, R1
_SX	[R2, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,75 :: 		}
L_end_OLED_reset_sequence:
BX	LR
; end of _OLED_reset_sequence
_OLED_write:
;ssd1306.c,78 :: 		void OLED_write(unsigned char value, unsigned char type)
; type start address is: 4 (R1)
; value start address is: 0 (R0)
PUSH	(R14)
; type end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; type start address is: 4 (R1)
;ssd1306.c,80 :: 		unsigned char s = 0x08;
; s start address is: 20 (R5)
MOVS	R5, #8
;ssd1306.c,82 :: 		DC = type;
MOVW	R4, #lo_addr(GPIOB_ODRbits+0)
MOVT	R4, #hi_addr(GPIOB_ODRbits+0)
_LX	[R4, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R3, #1
ANDS	R3, R1
BEQ	L__OLED_write249
MOVS	R3, #16
ORRS	R2, R3
B	L__OLED_write248
L__OLED_write249:
MOVS	R3, #16
BICS	R2, R3
L__OLED_write248:
; type end address is: 4 (R1)
_SX	[R4, ByteOffset(GPIOB_ODRbits+0)]
; value end address is: 0 (R0)
; s end address is: 20 (R5)
UXTB	R1, R0
UXTB	R0, R5
;ssd1306.c,84 :: 		while(s > 0)
L_OLED_write6:
; s start address is: 0 (R0)
; value start address is: 4 (R1)
CMP	R0, #0
IT	LS
BLLS	L_OLED_write7
;ssd1306.c,86 :: 		if((value & 0x80) != 0)
MOVS	R2, #128
ANDS	R2, R1
UXTB	R2, R2
CMP	R2, #0
IT	EQ
BLEQ	L_OLED_write8
;ssd1306.c,88 :: 		SDA = 1;
MOVW	R4, #lo_addr(GPIOB_ODRbits+0)
MOVT	R4, #hi_addr(GPIOB_ODRbits+0)
_LX	[R4, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R3, #64
ORRS	R2, R3
_SX	[R4, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,89 :: 		}
IT	AL
BLAL	L_OLED_write9
L_OLED_write8:
;ssd1306.c,92 :: 		SDA = 0;
MOVW	R4, #lo_addr(GPIOB_ODRbits+0)
MOVT	R4, #hi_addr(GPIOB_ODRbits+0)
_LX	[R4, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R3, #64
BICS	R2, R3
_SX	[R4, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,93 :: 		}
L_OLED_write9:
;ssd1306.c,95 :: 		SCL = 1;
MOVW	R4, #lo_addr(GPIOB_ODRbits+0)
MOVT	R4, #hi_addr(GPIOB_ODRbits+0)
_LX	[R4, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R3, #128
ORRS	R2, R3
_SX	[R4, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,96 :: 		SCL = 0;
MOVW	R4, #lo_addr(GPIOB_ODRbits+0)
MOVT	R4, #hi_addr(GPIOB_ODRbits+0)
_LX	[R4, ByteOffset(GPIOB_ODRbits+0)]
MOVS	R3, #128
BICS	R2, R3
_SX	[R4, ByteOffset(GPIOB_ODRbits+0)]
;ssd1306.c,98 :: 		value <<= 1;
LSLS	R2, R1, #1
UXTB	R1, R2
;ssd1306.c,99 :: 		s--;
SUBS	R0, R0, #1
UXTB	R0, R0
;ssd1306.c,100 :: 		}
; value end address is: 4 (R1)
; s end address is: 0 (R0)
IT	AL
BLAL	L_OLED_write6
L_OLED_write7:
;ssd1306.c,101 :: 		}
L_end_OLED_write:
POP	(R15)
; end of _OLED_write
_OLED_gotoxy:
;ssd1306.c,104 :: 		void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
PUSH	(R14)
UXTB	R6, R0
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 24 (R6)
; y_pos start address is: 4 (R1)
;ssd1306.c,106 :: 		OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
MOV	R2, R1
ADDS	R2, #176
; y_pos end address is: 4 (R1)
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,107 :: 		OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
MOVS	R2, #15
ANDS	R2, R6
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,108 :: 		OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
MOVS	R2, #240
ANDS	R2, R6
UXTB	R2, R2
; x_pos end address is: 24 (R6)
LSRS	R3, R2, #4
UXTB	R3, R3
MOVS	R2, #16
ORRS	R2, R3
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,109 :: 		}
L_end_OLED_gotoxy:
POP	(R15)
; end of _OLED_gotoxy
_OLED_fill:
;ssd1306.c,112 :: 		void OLED_fill(unsigned char bmp_data)
; bmp_data start address is: 0 (R0)
PUSH	(R14)
SUB	SP, SP, #4
; bmp_data end address is: 0 (R0)
; bmp_data start address is: 0 (R0)
;ssd1306.c,114 :: 		unsigned char x_pos = 0x00;
;ssd1306.c,115 :: 		unsigned char page = 0x00;
;ssd1306.c,117 :: 		for(page = y_min; page < y_max; page++)
; page start address is: 28 (R7)
MOVS	R7, #0
; bmp_data end address is: 0 (R0)
; page end address is: 28 (R7)
UXTB	R6, R0
L_OLED_fill10:
; page start address is: 28 (R7)
; bmp_data start address is: 24 (R6)
CMP	R7, #8
IT	CS
BLCS	L_OLED_fill11
;ssd1306.c,119 :: 		OLED_write((Set_Page_Start_Address_CMD + page), CMD);
MOV	R1, R7
ADDS	R1, #176
UXTB	R0, R1
MOVS	R1, #0
BL	_OLED_write+0
;ssd1306.c,120 :: 		OLED_write(Set_Lower_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1306.c,121 :: 		OLED_write(Set_Higher_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #16
BL	_OLED_write+0
;ssd1306.c,123 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
; x_pos start address is: 0 (R0)
MOVS	R0, #0
; bmp_data end address is: 24 (R6)
; x_pos end address is: 0 (R0)
; page end address is: 28 (R7)
L_OLED_fill13:
; x_pos start address is: 0 (R0)
; bmp_data start address is: 24 (R6)
; page start address is: 28 (R7)
CMP	R0, #128
IT	CS
BLCS	L_OLED_fill14
;ssd1306.c,125 :: 		OLED_write(bmp_data, DAT);
STR	R0, [SP, #0]
MOVS	R1, #1
UXTB	R0, R6
BL	_OLED_write+0
LDR	R0, [SP, #0]
UXTB	R0, R0
;ssd1306.c,123 :: 		for(x_pos = x_min; x_pos < x_max; x_pos++)
ADDS	R0, #1
UXTB	R0, R0
;ssd1306.c,126 :: 		}
; x_pos end address is: 0 (R0)
IT	AL
BLAL	L_OLED_fill13
L_OLED_fill14:
;ssd1306.c,117 :: 		for(page = y_min; page < y_max; page++)
ADDS	R7, #1
UXTB	R7, R7
;ssd1306.c,127 :: 		}
; bmp_data end address is: 24 (R6)
; page end address is: 28 (R7)
IT	AL
BLAL	L_OLED_fill10
L_OLED_fill11:
;ssd1306.c,128 :: 		}
L_end_OLED_fill:
ADD	SP, SP, #4
POP	(R15)
; end of _OLED_fill
_OLED_clear_screen:
;ssd1306.c,131 :: 		void OLED_clear_screen()
PUSH	(R14)
;ssd1306.c,133 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;ssd1306.c,134 :: 		}
L_end_OLED_clear_screen:
POP	(R15)
; end of _OLED_clear_screen
_OLED_clear_buffer:
;ssd1306.c,137 :: 		void OLED_clear_buffer()
PUSH	(R14)
;ssd1306.c,139 :: 		unsigned int s = 0x00;
;ssd1306.c,141 :: 		for(s = 0; s < buffer_size; s++)
; s start address is: 8 (R2)
MOVS	R2, #0
; s end address is: 8 (R2)
L_OLED_clear_buffer16:
; s start address is: 8 (R2)
MOVW	R0, #1024
MOVT	R0, #0
CMP	R2, R0
IT	CS
BLCS	L_OLED_clear_buffer17
;ssd1306.c,143 :: 		buffer[s] = 0x00;
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
;ssd1306.c,141 :: 		for(s = 0; s < buffer_size; s++)
ADDS	R2, #1
UXTH	R2, R2
;ssd1306.c,144 :: 		}
; s end address is: 8 (R2)
IT	AL
BLAL	L_OLED_clear_buffer16
L_OLED_clear_buffer17:
;ssd1306.c,145 :: 		}
L_end_OLED_clear_buffer:
POP	(R15)
; end of _OLED_clear_buffer
_OLED_cursor:
;ssd1306.c,148 :: 		void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
PUSH	(R14)
UXTB	R7, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 28 (R7)
;ssd1306.c,150 :: 		unsigned char i = 0x00;
;ssd1306.c,152 :: 		if(y_pos != 0x00)
CMP	R7, #0
IT	EQ
BLEQ	L_OLED_cursor19
;ssd1306.c,154 :: 		if(x_pos == 1)
CMP	R0, #1
IT	NE
BLNE	L_OLED_cursor20
; x_pos end address is: 0 (R0)
;ssd1306.c,156 :: 		OLED_gotoxy(0x00, (y_pos + 0x02));
ADDS	R2, R7, #2
; y_pos end address is: 28 (R7)
UXTB	R1, R2
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1306.c,157 :: 		}
IT	AL
BLAL	L_OLED_cursor21
L_OLED_cursor20:
;ssd1306.c,160 :: 		OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
; y_pos start address is: 28 (R7)
; x_pos start address is: 0 (R0)
ADDS	R5, R7, #2
; y_pos end address is: 28 (R7)
SUBS	R4, R0, #2
SXTH	R4, R4
; x_pos end address is: 0 (R0)
MOVS	R3, #6
MOV	R2, R3
MULS	R2, R4, R2
SXTH	R2, R2
ADDS	R2, #80
UXTB	R1, R5
UXTB	R0, R2
BL	_OLED_gotoxy+0
;ssd1306.c,161 :: 		}
L_OLED_cursor21:
;ssd1306.c,163 :: 		for(i = 0; i < 6; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_OLED_cursor22:
; i start address is: 24 (R6)
CMP	R6, #6
IT	CS
BLCS	L_OLED_cursor23
;ssd1306.c,165 :: 		OLED_write(0xFF, DAT);
MOVS	R1, #1
MOVS	R0, #255
BL	_OLED_write+0
;ssd1306.c,163 :: 		for(i = 0; i < 6; i++)
ADDS	R6, #1
UXTB	R6, R6
;ssd1306.c,166 :: 		}
; i end address is: 24 (R6)
IT	AL
BLAL	L_OLED_cursor22
L_OLED_cursor23:
;ssd1306.c,167 :: 		}
L_OLED_cursor19:
;ssd1306.c,168 :: 		}
L_end_OLED_cursor:
POP	(R15)
; end of _OLED_cursor
_OLED_draw_bitmap:
;ssd1306.c,171 :: 		void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
; yb start address is: 4 (R1)
PUSH	(R14)
SUB	SP, SP, #20
STR	R0, [SP, #8]
STR	R2, [SP, #12]
STR	R3, [SP, #16]
; yb end address is: 4 (R1)
; yb start address is: 4 (R1)
LDR	R4, [SP, #24]
STR	R4, [SP, #24]
;ssd1306.c,173 :: 		unsigned int s = 0x0000;
MOV	R6, SP
MOVS	R5, #2
ADDS	R5, R5, R6
MOVW	R7, #lo_addr(?ICSOLED_draw_bitmap_s_L0+0)
MOVT	R7, #hi_addr(?ICSOLED_draw_bitmap_s_L0+0)
BL	___CC2DW+0
;ssd1306.c,174 :: 		unsigned char x_pos = 0x00;
;ssd1306.c,175 :: 		unsigned char y_pos = 0x00;
;ssd1306.c,177 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
; y_pos start address is: 28 (R7)
UXTB	R7, R1
; yb end address is: 4 (R1)
; y_pos end address is: 28 (R7)
L_OLED_draw_bitmap25:
; y_pos start address is: 28 (R7)
LDR	R4, [SP, #16]
UXTB	R4, R4
CMP	R7, R4
IT	HI
BLHI	L_OLED_draw_bitmap26
;ssd1306.c,179 :: 		OLED_gotoxy(xb, y_pos);
UXTB	R1, R7
LDR	R0, [SP, #8]
UXTB	R0, R0
BL	_OLED_gotoxy+0
;ssd1306.c,180 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
LDR	R4, [SP, #8]
UXTB	R4, R4
STR	R4, [SP, #4]
; y_pos end address is: 28 (R7)
L_OLED_draw_bitmap28:
; y_pos start address is: 28 (R7)
LDR	R5, [SP, #12]
UXTB	R5, R5
LDR	R4, [SP, #4]
UXTB	R4, R4
CMP	R4, R5
IT	CS
BLCS	L_OLED_draw_bitmap29
;ssd1306.c,182 :: 		OLED_write(bmp_img[s], DAT);
LDR	R5, [SP, #0]
UXTH	R5, R5
LDR	R4, [SP, #24]
ADDS	R4, R4, R5
LDRB	R4, [R4, #0]
MOVS	R1, #1
UXTB	R0, R4
BL	_OLED_write+0
;ssd1306.c,183 :: 		s++;
LDR	R4, [SP, #0]
UXTH	R4, R4
ADDS	R4, #1
STR	R4, [SP, #0]
;ssd1306.c,180 :: 		for(x_pos = xb; x_pos < xe; x_pos++)
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #1
STR	R4, [SP, #4]
;ssd1306.c,184 :: 		}
IT	AL
BLAL	L_OLED_draw_bitmap28
L_OLED_draw_bitmap29:
;ssd1306.c,177 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
ADDS	R7, #1
UXTB	R7, R7
;ssd1306.c,185 :: 		}
; y_pos end address is: 28 (R7)
IT	AL
BLAL	L_OLED_draw_bitmap25
L_OLED_draw_bitmap26:
;ssd1306.c,186 :: 		}
L_end_OLED_draw_bitmap:
ADD	SP, SP, #20
POP	(R15)
; end of _OLED_draw_bitmap
_OLED_print_char:
;ssd1306.c,189 :: 		void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
; ch start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
PUSH	(R14)
; ch end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; ch start address is: 8 (R2)
;ssd1306.c,191 :: 		unsigned char chr = 0x00;
;ssd1306.c,192 :: 		unsigned char s = 0x00;
;ssd1306.c,194 :: 		chr = (ch - 32);
MOV	R3, R2
SUBS	R3, #32
; ch end address is: 8 (R2)
; chr start address is: 28 (R7)
UXTB	R7, R3
;ssd1306.c,196 :: 		if(x_pos > (x_max - 6))
CMP	R0, #122
IT	LS
BLLS	L__OLED_print_char213
;ssd1306.c,198 :: 		x_pos = 0;
MOVS	R0, #0
;ssd1306.c,199 :: 		y_pos++;
ADDS	R1, #1
UXTB	R1, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
;ssd1306.c,200 :: 		}
IT	AL
BLAL	L_OLED_print_char31
L__OLED_print_char213:
;ssd1306.c,196 :: 		if(x_pos > (x_max - 6))
;ssd1306.c,200 :: 		}
L_OLED_print_char31:
;ssd1306.c,201 :: 		OLED_gotoxy(x_pos, y_pos);
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1306.c,203 :: 		for(s = 0x00; s < 0x06; s++)
; s start address is: 0 (R0)
MOVS	R0, #0
; chr end address is: 28 (R7)
; s end address is: 0 (R0)
UXTB	R6, R7
UXTB	R7, R0
L_OLED_print_char32:
; s start address is: 28 (R7)
; chr start address is: 24 (R6)
; chr start address is: 24 (R6)
; chr end address is: 24 (R6)
CMP	R7, #6
IT	CS
BLCS	L_OLED_print_char33
; chr end address is: 24 (R6)
;ssd1306.c,205 :: 		OLED_write(font_regular[chr][s], DAT);
; chr start address is: 24 (R6)
MOVS	R3, #6
MOV	R4, R6
MULS	R4, R3, R4
MOVW	R3, #lo_addr(_font_regular+0)
MOVT	R3, #hi_addr(_font_regular+0)
ADDS	R3, R3, R4
ADDS	R3, R3, R7
LDRB	R3, [R3, #0]
MOVS	R1, #1
UXTB	R0, R3
BL	_OLED_write+0
;ssd1306.c,203 :: 		for(s = 0x00; s < 0x06; s++)
ADDS	R7, #1
UXTB	R7, R7
;ssd1306.c,206 :: 		}
; chr end address is: 24 (R6)
; s end address is: 28 (R7)
IT	AL
BLAL	L_OLED_print_char32
L_OLED_print_char33:
;ssd1306.c,207 :: 		}
L_end_OLED_print_char:
POP	(R15)
; end of _OLED_print_char
_OLED_print_string:
;ssd1306.c,210 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
PUSH	(R14)
SUB	SP, SP, #20
STR	R0, [SP, #8]
STR	R1, [SP, #12]
STR	R2, [SP, #16]
;ssd1306.c,212 :: 		unsigned char chr = 0x00;
;ssd1306.c,213 :: 		unsigned char i = 0x00;
;ssd1306.c,214 :: 		unsigned char j = 0x00;
MOVS	R3, #0
STR	R3, [SP, #4]
;ssd1306.c,216 :: 		while(ch[j] != '\0')
L_OLED_print_string35:
LDR	R4, [SP, #4]
UXTB	R4, R4
LDR	R3, [SP, #16]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	EQ
BLEQ	L_OLED_print_string36
;ssd1306.c,218 :: 		chr = (ch[j] - 32);
LDR	R4, [SP, #4]
UXTB	R4, R4
LDR	R3, [SP, #16]
ADDS	R3, R3, R4
LDRB	R3, [R3, #0]
SUBS	R3, #32
STR	R3, [SP, #0]
;ssd1306.c,220 :: 		if(x_pos > (x_max - 0x06))
LDR	R3, [SP, #8]
UXTB	R3, R3
CMP	R3, #122
IT	LS
BLLS	L_OLED_print_string37
;ssd1306.c,222 :: 		x_pos = 0x00;
MOVS	R3, #0
STR	R3, [SP, #8]
;ssd1306.c,223 :: 		y_pos++;
LDR	R3, [SP, #12]
UXTB	R3, R3
ADDS	R3, #1
STR	R3, [SP, #12]
;ssd1306.c,224 :: 		}
L_OLED_print_string37:
;ssd1306.c,225 :: 		OLED_gotoxy(x_pos, y_pos);
LDR	R1, [SP, #12]
UXTB	R1, R1
LDR	R0, [SP, #8]
UXTB	R0, R0
BL	_OLED_gotoxy+0
;ssd1306.c,227 :: 		for(i = 0x00; i < 0x06; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_OLED_print_string38:
; i start address is: 24 (R6)
CMP	R6, #6
IT	CS
BLCS	L_OLED_print_string39
;ssd1306.c,229 :: 		OLED_write(font_regular[chr][i], DAT);
LDR	R5, [SP, #0]
UXTB	R5, R5
MOVS	R3, #6
MOV	R4, R5
MULS	R4, R3, R4
MOVW	R3, #lo_addr(_font_regular+0)
MOVT	R3, #hi_addr(_font_regular+0)
ADDS	R3, R3, R4
ADDS	R3, R3, R6
LDRB	R3, [R3, #0]
MOVS	R1, #1
UXTB	R0, R3
BL	_OLED_write+0
;ssd1306.c,227 :: 		for(i = 0x00; i < 0x06; i++)
ADDS	R3, R6, #1
; i end address is: 24 (R6)
; i start address is: 4 (R1)
UXTB	R1, R3
;ssd1306.c,230 :: 		}
UXTB	R6, R1
; i end address is: 4 (R1)
IT	AL
BLAL	L_OLED_print_string38
L_OLED_print_string39:
;ssd1306.c,232 :: 		j++;
LDR	R3, [SP, #4]
UXTB	R3, R3
ADDS	R3, #1
STR	R3, [SP, #4]
;ssd1306.c,233 :: 		x_pos += 6;
LDR	R3, [SP, #8]
UXTB	R3, R3
ADDS	R3, #6
STR	R3, [SP, #8]
;ssd1306.c,234 :: 		}
IT	AL
BLAL	L_OLED_print_string35
L_OLED_print_string36:
;ssd1306.c,235 :: 		}
L_end_OLED_print_string:
ADD	SP, SP, #20
POP	(R15)
; end of _OLED_print_string
_OLED_print_chr:
;ssd1306.c,238 :: 		void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
PUSH	(R14)
SUB	SP, SP, #12
STR	R0, [SP, #0]
STR	R1, [SP, #4]
STR	R2, [SP, #8]
;ssd1306.c,240 :: 		unsigned char ch = 0x00;
;ssd1306.c,242 :: 		if(value < 0x00)
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #0
IT	GE
BLGE	L_OLED_print_chr41
;ssd1306.c,244 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
LDR	R1, [SP, #4]
UXTB	R1, R1
LDR	R0, [SP, #0]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,245 :: 		value = -value;
LDR	R3, [SP, #8]
SXTH	R3, R3
RSBS	R3, R3, #0
STR	R3, [SP, #8]
;ssd1306.c,246 :: 		}
IT	AL
BLAL	L_OLED_print_chr42
L_OLED_print_chr41:
;ssd1306.c,249 :: 		OLED_print_char(x_pos, y_pos,' ');
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
LDR	R0, [SP, #0]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,250 :: 		}
L_OLED_print_chr42:
;ssd1306.c,252 :: 		if((value > 99) && (value <= 999))
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #99
IT	LE
BLLE	L__OLED_print_chr218
LDR	R4, [SP, #8]
SXTH	R4, R4
MOVW	R3, #999
MOVT	R3, #0
CMP	R4, R3
IT	GT
BLGT	L__OLED_print_chr217
L__OLED_print_chr216:
;ssd1306.c,254 :: 		ch = (value / 100);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #100
BL	__Div_32x32_S+0
;ssd1306.c,255 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,256 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
SXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,257 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,258 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,259 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,260 :: 		}
IT	AL
BLAL	L_OLED_print_chr46
;ssd1306.c,252 :: 		if((value > 99) && (value <= 999))
L__OLED_print_chr218:
L__OLED_print_chr217:
;ssd1306.c,261 :: 		else if((value > 9) && (value <= 99))
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #9
IT	LE
BLLE	L__OLED_print_chr220
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #99
IT	GT
BLGT	L__OLED_print_chr219
L__OLED_print_chr215:
;ssd1306.c,263 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
SXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,264 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,265 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,266 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,267 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,268 :: 		}
IT	AL
BLAL	L_OLED_print_chr50
;ssd1306.c,261 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_chr220:
L__OLED_print_chr219:
;ssd1306.c,269 :: 		else if((value >= 0) && (value <= 9))
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #0
IT	LT
BLLT	L__OLED_print_chr222
LDR	R3, [SP, #8]
SXTH	R3, R3
CMP	R3, #9
IT	GT
BLGT	L__OLED_print_chr221
L__OLED_print_chr214:
;ssd1306.c,271 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
SXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,272 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,273 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,274 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,269 :: 		else if((value >= 0) && (value <= 9))
L__OLED_print_chr222:
L__OLED_print_chr221:
;ssd1306.c,275 :: 		}
L_OLED_print_chr50:
L_OLED_print_chr46:
;ssd1306.c,276 :: 		}
L_end_OLED_print_chr:
ADD	SP, SP, #12
POP	(R15)
; end of _OLED_print_chr
_OLED_print_int:
;ssd1306.c,279 :: 		void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
PUSH	(R14)
SUB	SP, SP, #12
STR	R0, [SP, #0]
STR	R1, [SP, #4]
STR	R2, [SP, #8]
;ssd1306.c,281 :: 		unsigned char ch = 0x00;
;ssd1306.c,283 :: 		if(value < 0)
LDR	R3, [SP, #8]
CMP	R3, #0
IT	GE
BLGE	L_OLED_print_int54
;ssd1306.c,285 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
LDR	R1, [SP, #4]
UXTB	R1, R1
LDR	R0, [SP, #0]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,286 :: 		value = -value;
LDR	R3, [SP, #8]
RSBS	R3, R3, #0
STR	R3, [SP, #8]
;ssd1306.c,287 :: 		}
IT	AL
BLAL	L_OLED_print_int55
L_OLED_print_int54:
;ssd1306.c,290 :: 		OLED_print_char(x_pos, y_pos,' ');
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
LDR	R0, [SP, #0]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,291 :: 		}
L_OLED_print_int55:
;ssd1306.c,293 :: 		if(value > 9999)
LDR	R4, [SP, #8]
MOVW	R3, #9999
MOVT	R3, #0
CMP	R4, R3
IT	LE
BLLE	L_OLED_print_int56
;ssd1306.c,295 :: 		ch = (value / 10000);
LDR	R0, [SP, #8]
MOVW	R2, #10000
MOVT	R2, #0
BL	__Div_32x32_S+0
;ssd1306.c,296 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,298 :: 		ch = ((value % 10000)/ 1000);
LDR	R0, [SP, #8]
MOVW	R2, #10000
MOVT	R2, #0
BL	__Div_32x32_S+0
MOV	R0, R2
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_S+0
;ssd1306.c,299 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,301 :: 		ch = ((value % 1000) / 100);
LDR	R0, [SP, #8]
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #100
BL	__Div_32x32_S+0
;ssd1306.c,302 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,304 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,305 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #24
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,307 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,308 :: 		OLED_print_char((x_pos + 30), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #30
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,309 :: 		}
IT	AL
BLAL	L_OLED_print_int57
L_OLED_print_int56:
;ssd1306.c,311 :: 		else if((value > 999) && (value <= 9999))
LDR	R4, [SP, #8]
MOVW	R3, #999
MOVT	R3, #0
CMP	R4, R3
IT	LE
BLLE	L__OLED_print_int227
LDR	R4, [SP, #8]
MOVW	R3, #9999
MOVT	R3, #0
CMP	R4, R3
IT	GT
BLGT	L__OLED_print_int226
L__OLED_print_int225:
;ssd1306.c,313 :: 		ch = ((value % 10000)/ 1000);
LDR	R0, [SP, #8]
MOVW	R2, #10000
MOVT	R2, #0
BL	__Div_32x32_S+0
MOV	R0, R2
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_S+0
;ssd1306.c,314 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,316 :: 		ch = ((value % 1000) / 100);
LDR	R0, [SP, #8]
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #100
BL	__Div_32x32_S+0
;ssd1306.c,317 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,319 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,320 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,322 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,323 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #24
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,324 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #30
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,325 :: 		}
IT	AL
BLAL	L_OLED_print_int61
;ssd1306.c,311 :: 		else if((value > 999) && (value <= 9999))
L__OLED_print_int227:
L__OLED_print_int226:
;ssd1306.c,326 :: 		else if((value > 99) && (value <= 999))
LDR	R3, [SP, #8]
CMP	R3, #99
IT	LE
BLLE	L__OLED_print_int229
LDR	R4, [SP, #8]
MOVW	R3, #999
MOVT	R3, #0
CMP	R4, R3
IT	GT
BLGT	L__OLED_print_int228
L__OLED_print_int224:
;ssd1306.c,328 :: 		ch = ((value % 1000) / 100);
LDR	R0, [SP, #8]
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #100
BL	__Div_32x32_S+0
;ssd1306.c,329 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,331 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,332 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,334 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,335 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,336 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #24
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,337 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #30
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,338 :: 		}
IT	AL
BLAL	L_OLED_print_int65
;ssd1306.c,326 :: 		else if((value > 99) && (value <= 999))
L__OLED_print_int229:
L__OLED_print_int228:
;ssd1306.c,339 :: 		else if((value > 9) && (value <= 99))
LDR	R3, [SP, #8]
CMP	R3, #9
IT	LE
BLLE	L__OLED_print_int231
LDR	R3, [SP, #8]
CMP	R3, #99
IT	GT
BLGT	L__OLED_print_int230
L__OLED_print_int223:
;ssd1306.c,341 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
MOVS	R2, #100
BL	__Div_32x32_S+0
MOV	R0, R2
MOVS	R2, #10
BL	__Div_32x32_S+0
;ssd1306.c,342 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,344 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,345 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,347 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,348 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #24
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,349 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #30
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,350 :: 		}
IT	AL
BLAL	L_OLED_print_int69
;ssd1306.c,339 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_int231:
L__OLED_print_int230:
;ssd1306.c,353 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
MOVS	R2, #10
BL	__Div_32x32_S+0
MOV	R0, R2
;ssd1306.c,354 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R0
MOV	R4, R3
ADDS	R4, #48
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #6
UXTB	R2, R4
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,355 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #12
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,356 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #18
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,357 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #24
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,358 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
LDR	R3, [SP, #0]
UXTB	R3, R3
ADDS	R3, #30
MOVS	R2, #32
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,359 :: 		}
L_OLED_print_int69:
L_OLED_print_int65:
L_OLED_print_int61:
L_OLED_print_int57:
;ssd1306.c,360 :: 		}
L_end_OLED_print_int:
ADD	SP, SP, #12
POP	(R15)
; end of _OLED_print_int
_OLED_print_decimal:
;ssd1306.c,363 :: 		void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
PUSH	(R14)
SUB	SP, SP, #16
STR	R0, [SP, #0]
STR	R1, [SP, #4]
STR	R2, [SP, #8]
STR	R3, [SP, #12]
;ssd1306.c,365 :: 		unsigned char ch = 0x00;
;ssd1306.c,367 :: 		OLED_print_char(x_pos, y_pos, '.');
MOVS	R2, #46
LDR	R1, [SP, #4]
UXTB	R1, R1
LDR	R0, [SP, #0]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,369 :: 		ch = (value / 1000);
LDR	R0, [SP, #8]
UXTH	R0, R0
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_U+0
;ssd1306.c,370 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R4, R0
MOV	R5, R4
ADDS	R5, #48
LDR	R4, [SP, #0]
UXTB	R4, R4
ADDS	R4, #6
UXTB	R2, R5
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,372 :: 		if(points > 1)
LDR	R4, [SP, #12]
UXTB	R4, R4
CMP	R4, #1
IT	LS
BLLS	L_OLED_print_decimal70
;ssd1306.c,374 :: 		ch = ((value % 1000) / 100);
LDR	R0, [SP, #8]
UXTH	R0, R0
MOVW	R2, #1000
MOVT	R2, #0
BL	__Div_32x32_U+0
MOV	R0, R2
UXTH	R0, R0
MOVS	R2, #100
BL	__Div_32x32_U+0
;ssd1306.c,375 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R4, R0
MOV	R5, R4
ADDS	R5, #48
LDR	R4, [SP, #0]
UXTB	R4, R4
ADDS	R4, #12
UXTB	R2, R5
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,378 :: 		if(points > 2)
LDR	R4, [SP, #12]
UXTB	R4, R4
CMP	R4, #2
IT	LS
BLLS	L_OLED_print_decimal71
;ssd1306.c,380 :: 		ch = ((value % 100) / 10);
LDR	R0, [SP, #8]
UXTH	R0, R0
MOVS	R2, #100
BL	__Div_32x32_U+0
MOV	R0, R2
UXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_U+0
;ssd1306.c,381 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R4, R0
MOV	R5, R4
ADDS	R5, #48
LDR	R4, [SP, #0]
UXTB	R4, R4
ADDS	R4, #18
UXTB	R2, R5
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,383 :: 		if(points > 3)
LDR	R4, [SP, #12]
UXTB	R4, R4
CMP	R4, #3
IT	LS
BLLS	L_OLED_print_decimal72
;ssd1306.c,385 :: 		ch = (value % 10);
LDR	R0, [SP, #8]
UXTH	R0, R0
MOVS	R2, #10
BL	__Div_32x32_U+0
MOV	R0, R2
;ssd1306.c,386 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R4, R0
MOV	R5, R4
ADDS	R5, #48
LDR	R4, [SP, #0]
UXTB	R4, R4
ADDS	R4, #24
UXTB	R2, R5
LDR	R1, [SP, #4]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,387 :: 		}
L_OLED_print_decimal72:
;ssd1306.c,388 :: 		}
L_OLED_print_decimal71:
;ssd1306.c,389 :: 		}
L_OLED_print_decimal70:
;ssd1306.c,390 :: 		}
L_end_OLED_print_decimal:
ADD	SP, SP, #16
POP	(R15)
; end of _OLED_print_decimal
_OLED_print_float:
;ssd1306.c,393 :: 		void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
PUSH	(R14)
SUB	SP, SP, #24
STR	R0, [SP, #4]
STR	R1, [SP, #8]
STR	R2, [SP, #12]
STR	R3, [SP, #16]
;ssd1306.c,395 :: 		signed long tmp = 0x00;
;ssd1306.c,397 :: 		tmp = value;
LDR	R0, [SP, #12]
BL	__FloatToSignedIntegral+0
STR	R0, [SP, #0]
;ssd1306.c,398 :: 		OLED_print_int(x_pos, y_pos, tmp);
MOV	R2, R0
LDR	R1, [SP, #8]
UXTB	R1, R1
LDR	R0, [SP, #4]
UXTB	R0, R0
BL	_OLED_print_int+0
;ssd1306.c,399 :: 		tmp = ((value - tmp) * 10000);
LDR	R0, [SP, #0]
BL	__SignedIntegralToFloat+0
STR	R0, [SP, #20]
STR	R0, [SP, #20]
LDR	R2, [SP, #20]
LDR	R0, [SP, #12]
BL	__Sub_FP+0
MOVW	R2, #16384
MOVT	R2, #17948
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
STR	R0, [SP, #0]
;ssd1306.c,401 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BLGE	L_OLED_print_float73
;ssd1306.c,403 :: 		tmp = -tmp;
LDR	R4, [SP, #0]
RSBS	R4, R4, #0
STR	R4, [SP, #0]
;ssd1306.c,404 :: 		}
L_OLED_print_float73:
;ssd1306.c,406 :: 		if((value >= 9999) && (value < 99999))
LDR	R2, [SP, #12]
MOVW	R0, #15360
MOVT	R0, #17948
BL	__Compare_FP+0
BGT	L__OLED_print_float262
MOVS	R0, #1
B	L__OLED_print_float263
L__OLED_print_float262:
MOVS	R0, #0
L__OLED_print_float263:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float237
LDR	R2, [SP, #12]
MOVW	R0, #20352
MOVT	R0, #18371
BL	__Compare_FP+0
BLE	L__OLED_print_float264
MOVS	R0, #1
B	L__OLED_print_float265
L__OLED_print_float264:
MOVS	R0, #0
L__OLED_print_float265:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float236
L__OLED_print_float235:
;ssd1306.c,408 :: 		OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #36
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #0]
LDR	R1, [SP, #8]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1306.c,409 :: 		}
IT	AL
BLAL	L_OLED_print_float77
;ssd1306.c,406 :: 		if((value >= 9999) && (value < 99999))
L__OLED_print_float237:
L__OLED_print_float236:
;ssd1306.c,410 :: 		else if((value >= 999) && (value < 9999))
LDR	R2, [SP, #12]
MOVW	R0, #49152
MOVT	R0, #17529
BL	__Compare_FP+0
BGT	L__OLED_print_float266
MOVS	R0, #1
B	L__OLED_print_float267
L__OLED_print_float266:
MOVS	R0, #0
L__OLED_print_float267:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float239
LDR	R2, [SP, #12]
MOVW	R0, #15360
MOVT	R0, #17948
BL	__Compare_FP+0
BLE	L__OLED_print_float268
MOVS	R0, #1
B	L__OLED_print_float269
L__OLED_print_float268:
MOVS	R0, #0
L__OLED_print_float269:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float238
L__OLED_print_float234:
;ssd1306.c,412 :: 		OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #30
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #0]
LDR	R1, [SP, #8]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1306.c,413 :: 		}
IT	AL
BLAL	L_OLED_print_float81
;ssd1306.c,410 :: 		else if((value >= 999) && (value < 9999))
L__OLED_print_float239:
L__OLED_print_float238:
;ssd1306.c,414 :: 		else if((value >= 99) && (value < 999))
LDR	R2, [SP, #12]
MOVW	R0, #0
MOVT	R0, #17094
BL	__Compare_FP+0
BGT	L__OLED_print_float270
MOVS	R0, #1
B	L__OLED_print_float271
L__OLED_print_float270:
MOVS	R0, #0
L__OLED_print_float271:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float241
LDR	R2, [SP, #12]
MOVW	R0, #49152
MOVT	R0, #17529
BL	__Compare_FP+0
BLE	L__OLED_print_float272
MOVS	R0, #1
B	L__OLED_print_float273
L__OLED_print_float272:
MOVS	R0, #0
L__OLED_print_float273:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float240
L__OLED_print_float233:
;ssd1306.c,416 :: 		OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #24
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #0]
LDR	R1, [SP, #8]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1306.c,417 :: 		}
IT	AL
BLAL	L_OLED_print_float85
;ssd1306.c,414 :: 		else if((value >= 99) && (value < 999))
L__OLED_print_float241:
L__OLED_print_float240:
;ssd1306.c,418 :: 		else if((value >= 9) && (value < 99))
LDR	R2, [SP, #12]
MOVW	R0, #0
MOVT	R0, #16656
BL	__Compare_FP+0
BGT	L__OLED_print_float274
MOVS	R0, #1
B	L__OLED_print_float275
L__OLED_print_float274:
MOVS	R0, #0
L__OLED_print_float275:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float243
LDR	R2, [SP, #12]
MOVW	R0, #0
MOVT	R0, #17094
BL	__Compare_FP+0
BLE	L__OLED_print_float276
MOVS	R0, #1
B	L__OLED_print_float277
L__OLED_print_float276:
MOVS	R0, #0
L__OLED_print_float277:
CMP	R0, #0
IT	EQ
BLEQ	L__OLED_print_float242
L__OLED_print_float232:
;ssd1306.c,420 :: 		OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #18
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #0]
LDR	R1, [SP, #8]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1306.c,421 :: 		}
IT	AL
BLAL	L_OLED_print_float89
;ssd1306.c,418 :: 		else if((value >= 9) && (value < 99))
L__OLED_print_float243:
L__OLED_print_float242:
;ssd1306.c,422 :: 		else if(value < 9)
LDR	R2, [SP, #12]
MOVW	R0, #0
MOVT	R0, #16656
BL	__Compare_FP+0
BLE	L__OLED_print_float278
MOVS	R0, #1
B	L__OLED_print_float279
L__OLED_print_float278:
MOVS	R0, #0
L__OLED_print_float279:
CMP	R0, #0
IT	EQ
BLEQ	L_OLED_print_float90
;ssd1306.c,424 :: 		OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #12
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #0]
LDR	R1, [SP, #8]
UXTB	R1, R1
UXTB	R0, R4
BL	_OLED_print_decimal+0
;ssd1306.c,425 :: 		if((value) < 0)
LDR	R2, [SP, #12]
MOVS	R0, #0
BL	__Compare_FP+0
BLE	L__OLED_print_float280
MOVS	R0, #1
B	L__OLED_print_float281
L__OLED_print_float280:
MOVS	R0, #0
L__OLED_print_float281:
CMP	R0, #0
IT	EQ
BLEQ	L_OLED_print_float91
;ssd1306.c,427 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
LDR	R1, [SP, #8]
UXTB	R1, R1
LDR	R0, [SP, #4]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,428 :: 		}
IT	AL
BLAL	L_OLED_print_float92
L_OLED_print_float91:
;ssd1306.c,431 :: 		OLED_print_char(x_pos, y_pos, ' ');
MOVS	R2, #32
LDR	R1, [SP, #8]
UXTB	R1, R1
LDR	R0, [SP, #4]
UXTB	R0, R0
BL	_OLED_print_char+0
;ssd1306.c,432 :: 		}
L_OLED_print_float92:
;ssd1306.c,433 :: 		}
L_OLED_print_float90:
L_OLED_print_float89:
L_OLED_print_float85:
L_OLED_print_float81:
L_OLED_print_float77:
;ssd1306.c,434 :: 		}
L_end_OLED_print_float:
ADD	SP, SP, #24
POP	(R15)
; end of _OLED_print_float
_Draw_Pixel:
;ssd1306.c,437 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
PUSH	(R14)
UXTB	R5, R1
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 20 (R5)
; colour start address is: 8 (R2)
;ssd1306.c,439 :: 		unsigned char value = 0x00;
;ssd1306.c,440 :: 		unsigned char page = 0x00;
;ssd1306.c,441 :: 		unsigned char bit_pos = 0x00;
;ssd1306.c,443 :: 		page = (y_pos / y_max);
LSRS	R4, R5, #3
UXTB	R4, R4
; page start address is: 4 (R1)
UXTB	R1, R4
;ssd1306.c,444 :: 		bit_pos = (y_pos - (page * y_max));
LSLS	R3, R4, #3
SXTH	R3, R3
SUBS	R3, R5, R3
; y_pos end address is: 20 (R5)
; bit_pos start address is: 20 (R5)
UXTB	R5, R3
;ssd1306.c,445 :: 		value = buffer[((page * x_max) + x_pos)];
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
;ssd1306.c,447 :: 		if((colour & 0x01) != 0)
MOVS	R3, #1
ANDS	R3, R2
UXTB	R3, R3
; colour end address is: 8 (R2)
CMP	R3, #0
IT	EQ
BLEQ	L_Draw_Pixel93
;ssd1306.c,449 :: 		value |= (1 << bit_pos);
MOVS	R3, #1
LSLS	R3, R5
SXTH	R3, R3
; bit_pos end address is: 20 (R5)
ORRS	R3, R4
; value end address is: 16 (R4)
; value start address is: 28 (R7)
UXTB	R7, R3
;ssd1306.c,450 :: 		}
; value end address is: 28 (R7)
IT	AL
BLAL	L_Draw_Pixel94
L_Draw_Pixel93:
;ssd1306.c,453 :: 		value &= (~(1 << bit_pos));
; value start address is: 16 (R4)
; bit_pos start address is: 20 (R5)
MOVS	R3, #1
LSLS	R3, R5
SXTH	R3, R3
; bit_pos end address is: 20 (R5)
MVN	R3, R3
SXTH	R3, R3
ANDS	R3, R4
; value end address is: 16 (R4)
; value start address is: 28 (R7)
UXTB	R7, R3
; value end address is: 28 (R7)
;ssd1306.c,454 :: 		}
L_Draw_Pixel94:
;ssd1306.c,456 :: 		buffer[((page * x_max) + x_pos)] = value;
; value start address is: 28 (R7)
LSLS	R3, R1, #7
SXTH	R3, R3
ADDS	R4, R3, R0
SXTH	R4, R4
MOVW	R3, #lo_addr(_buffer+0)
MOVT	R3, #hi_addr(_buffer+0)
ADDS	R3, R3, R4
STRB	R7, [R3, #0]
;ssd1306.c,457 :: 		OLED_gotoxy(x_pos, page);
; page end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1306.c,458 :: 		OLED_write(value, DAT);
MOVS	R1, #1
UXTB	R0, R7
; value end address is: 28 (R7)
BL	_OLED_write+0
;ssd1306.c,459 :: 		}
L_end_Draw_Pixel:
POP	(R15)
; end of _Draw_Pixel
_Draw_Line:
;ssd1306.c,462 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
PUSH	(R14)
SUB	SP, SP, #36
STR	R0, [SP, #20]
STR	R1, [SP, #24]
STR	R2, [SP, #28]
STR	R3, [SP, #32]
LDR	R4, [SP, #40]
UXTB	R4, R4
STR	R4, [SP, #40]
;ssd1306.c,464 :: 		signed int dx = 0x0000;
;ssd1306.c,465 :: 		signed int dy = 0x0000;
;ssd1306.c,466 :: 		signed int stepx = 0x0000;
;ssd1306.c,467 :: 		signed int stepy = 0x0000;
;ssd1306.c,468 :: 		signed int fraction = 0x0000;
;ssd1306.c,470 :: 		dy = (y2 - y1);
LDR	R5, [SP, #24]
SXTH	R5, R5
LDR	R4, [SP, #32]
SXTH	R4, R4
SUBS	R6, R4, R5
SXTH	R6, R6
STR	R6, [SP, #4]
;ssd1306.c,471 :: 		dx = (x2 - x1);
LDR	R5, [SP, #20]
SXTH	R5, R5
LDR	R4, [SP, #28]
SXTH	R4, R4
SUBS	R4, R4, R5
STR	R4, [SP, #0]
;ssd1306.c,473 :: 		if (dy < 0)
CMP	R6, #0
IT	GE
BLGE	L_Draw_Line95
;ssd1306.c,475 :: 		dy = -dy;
LDR	R4, [SP, #4]
SXTH	R4, R4
RSBS	R4, R4, #0
STR	R4, [SP, #4]
;ssd1306.c,476 :: 		stepy = -1;
MOVS	R4, #0
MVN	R4, R4
SXTH	R4, R4
STR	R4, [SP, #12]
;ssd1306.c,477 :: 		}
IT	AL
BLAL	L_Draw_Line96
L_Draw_Line95:
;ssd1306.c,480 :: 		stepy = 1;
MOVS	R4, #1
STR	R4, [SP, #12]
;ssd1306.c,481 :: 		}
L_Draw_Line96:
;ssd1306.c,483 :: 		if (dx < 0)
LDR	R4, [SP, #0]
SXTH	R4, R4
CMP	R4, #0
IT	GE
BLGE	L_Draw_Line97
;ssd1306.c,485 :: 		dx = -dx;
LDR	R4, [SP, #0]
SXTH	R4, R4
RSBS	R4, R4, #0
STR	R4, [SP, #0]
;ssd1306.c,486 :: 		stepx = -1;
MOVS	R4, #0
MVN	R4, R4
SXTH	R4, R4
STR	R4, [SP, #8]
;ssd1306.c,487 :: 		}
IT	AL
BLAL	L_Draw_Line98
L_Draw_Line97:
;ssd1306.c,490 :: 		stepx = 1;
MOVS	R4, #1
STR	R4, [SP, #8]
;ssd1306.c,491 :: 		}
L_Draw_Line98:
;ssd1306.c,493 :: 		dx <<= 1;
LDR	R4, [SP, #0]
SXTH	R4, R4
LSLS	R4, R4, #1
STR	R4, [SP, #0]
;ssd1306.c,494 :: 		dy <<= 1;
LDR	R4, [SP, #4]
SXTH	R4, R4
LSLS	R4, R4, #1
STR	R4, [SP, #4]
;ssd1306.c,496 :: 		Draw_Pixel(x1, y1, colour);
LDR	R2, [SP, #40]
UXTB	R2, R2
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,498 :: 		if(dx > dy)
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #0]
SXTH	R4, R4
CMP	R4, R5
IT	LE
BLLE	L_Draw_Line99
;ssd1306.c,500 :: 		fraction = (dy - (dx >> 1));
LDR	R4, [SP, #0]
SXTH	R4, R4
ASRS	R5, R4, #1
SXTH	R5, R5
LDR	R4, [SP, #4]
SXTH	R4, R4
SUBS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,501 :: 		while (x1 != x2)
L_Draw_Line100:
LDR	R5, [SP, #28]
SXTH	R5, R5
LDR	R4, [SP, #20]
SXTH	R4, R4
CMP	R4, R5
IT	EQ
BLEQ	L_Draw_Line101
;ssd1306.c,503 :: 		if(fraction >= 0)
LDR	R4, [SP, #16]
SXTH	R4, R4
CMP	R4, #0
IT	LT
BLLT	L_Draw_Line102
;ssd1306.c,505 :: 		y1 += stepy;
LDR	R5, [SP, #12]
SXTH	R5, R5
LDR	R4, [SP, #24]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #24]
;ssd1306.c,506 :: 		fraction -= dx;
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,507 :: 		}
L_Draw_Line102:
;ssd1306.c,509 :: 		x1 += stepx;
LDR	R5, [SP, #8]
SXTH	R5, R5
LDR	R4, [SP, #20]
SXTH	R4, R4
ADDS	R6, R4, R5
STR	R6, [SP, #20]
;ssd1306.c,510 :: 		fraction += dy;
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,512 :: 		Draw_Pixel(x1, y1, colour);
LDR	R2, [SP, #40]
UXTB	R2, R2
LDR	R1, [SP, #24]
SXTH	R1, R1
UXTB	R0, R6
BL	_Draw_Pixel+0
;ssd1306.c,513 :: 		}
IT	AL
BLAL	L_Draw_Line100
L_Draw_Line101:
;ssd1306.c,514 :: 		}
IT	AL
BLAL	L_Draw_Line103
L_Draw_Line99:
;ssd1306.c,517 :: 		fraction = (dx - (dy >> 1));
LDR	R4, [SP, #4]
SXTH	R4, R4
ASRS	R5, R4, #1
SXTH	R5, R5
LDR	R4, [SP, #0]
SXTH	R4, R4
SUBS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,518 :: 		while (y1 != y2)
L_Draw_Line104:
LDR	R5, [SP, #32]
SXTH	R5, R5
LDR	R4, [SP, #24]
SXTH	R4, R4
CMP	R4, R5
IT	EQ
BLEQ	L_Draw_Line105
;ssd1306.c,520 :: 		if (fraction >= 0)
LDR	R4, [SP, #16]
SXTH	R4, R4
CMP	R4, #0
IT	LT
BLLT	L_Draw_Line106
;ssd1306.c,522 :: 		x1 += stepx;
LDR	R5, [SP, #8]
SXTH	R5, R5
LDR	R4, [SP, #20]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #20]
;ssd1306.c,523 :: 		fraction -= dy;
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,524 :: 		}
L_Draw_Line106:
;ssd1306.c,526 :: 		y1 += stepy;
LDR	R5, [SP, #12]
SXTH	R5, R5
LDR	R4, [SP, #24]
SXTH	R4, R4
ADDS	R6, R4, R5
STR	R6, [SP, #24]
;ssd1306.c,527 :: 		fraction += dx;
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #16]
;ssd1306.c,529 :: 		Draw_Pixel(x1, y1, colour);
LDR	R2, [SP, #40]
UXTB	R2, R2
UXTB	R1, R6
LDR	R0, [SP, #20]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,530 :: 		}
IT	AL
BLAL	L_Draw_Line104
L_Draw_Line105:
;ssd1306.c,531 :: 		}
L_Draw_Line103:
;ssd1306.c,532 :: 		}
L_end_Draw_Line:
ADD	SP, SP, #36
POP	(R15)
; end of _Draw_Line
_Draw_Rectangle:
;ssd1306.c,535 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
PUSH	(R14)
SUB	SP, SP, #36
STR	R0, [SP, #20]
STR	R1, [SP, #24]
STR	R2, [SP, #28]
STR	R3, [SP, #32]
; fill start address is: 0 (R0)
LDR	R0, [SP, #40]
UXTB	R0, R0
LDR	R4, [SP, #44]
UXTB	R4, R4
STR	R4, [SP, #44]
LDR	R4, [SP, #48]
UXTB	R4, R4
STR	R4, [SP, #48]
;ssd1306.c,537 :: 		unsigned short i = 0x00;
;ssd1306.c,538 :: 		unsigned short xmin = 0x00;
;ssd1306.c,539 :: 		unsigned short xmax = 0x00;
;ssd1306.c,540 :: 		unsigned short ymin = 0x00;
;ssd1306.c,541 :: 		unsigned short ymax = 0x00;
;ssd1306.c,543 :: 		if(fill != 0)
CMP	R0, #0
IT	EQ
BLEQ	L_Draw_Rectangle107
; fill end address is: 0 (R0)
;ssd1306.c,545 :: 		if(x1 < x2)
LDR	R5, [SP, #28]
SXTH	R5, R5
LDR	R4, [SP, #20]
SXTH	R4, R4
CMP	R4, R5
IT	GE
BLGE	L_Draw_Rectangle108
;ssd1306.c,547 :: 		xmin = x1;
LDR	R4, [SP, #20]
SXTH	R4, R4
STR	R4, [SP, #4]
;ssd1306.c,548 :: 		xmax = x2;
LDR	R4, [SP, #28]
SXTH	R4, R4
STR	R4, [SP, #8]
;ssd1306.c,549 :: 		}
IT	AL
BLAL	L_Draw_Rectangle109
L_Draw_Rectangle108:
;ssd1306.c,552 :: 		xmin = x2;
LDR	R4, [SP, #28]
SXTH	R4, R4
STR	R4, [SP, #4]
;ssd1306.c,553 :: 		xmax = x1;
LDR	R4, [SP, #20]
SXTH	R4, R4
STR	R4, [SP, #8]
;ssd1306.c,554 :: 		}
L_Draw_Rectangle109:
;ssd1306.c,556 :: 		if(y1 < y2)
LDR	R5, [SP, #32]
SXTH	R5, R5
LDR	R4, [SP, #24]
SXTH	R4, R4
CMP	R4, R5
IT	GE
BLGE	L_Draw_Rectangle110
;ssd1306.c,558 :: 		ymin = y1;
LDR	R4, [SP, #24]
SXTH	R4, R4
STR	R4, [SP, #12]
;ssd1306.c,559 :: 		ymax = y2;
LDR	R4, [SP, #32]
SXTH	R4, R4
STR	R4, [SP, #16]
;ssd1306.c,560 :: 		}
IT	AL
BLAL	L_Draw_Rectangle111
L_Draw_Rectangle110:
;ssd1306.c,563 :: 		ymin = y2;
LDR	R4, [SP, #32]
SXTH	R4, R4
STR	R4, [SP, #12]
;ssd1306.c,564 :: 		ymax = y1;
LDR	R4, [SP, #24]
SXTH	R4, R4
STR	R4, [SP, #16]
;ssd1306.c,565 :: 		}
L_Draw_Rectangle111:
;ssd1306.c,567 :: 		for(; xmin <= xmax; ++xmin)
L_Draw_Rectangle112:
LDR	R5, [SP, #8]
UXTB	R5, R5
LDR	R4, [SP, #4]
UXTB	R4, R4
CMP	R4, R5
IT	HI
BLHI	L_Draw_Rectangle113
;ssd1306.c,569 :: 		for(i = ymin; i <= ymax; ++i)
LDR	R4, [SP, #12]
UXTB	R4, R4
STR	R4, [SP, #0]
L_Draw_Rectangle115:
LDR	R5, [SP, #16]
UXTB	R5, R5
LDR	R4, [SP, #0]
UXTB	R4, R4
CMP	R4, R5
IT	HI
BLHI	L_Draw_Rectangle116
;ssd1306.c,571 :: 		Draw_Pixel(xmin, i, colour);
LDR	R2, [SP, #44]
UXTB	R2, R2
LDR	R1, [SP, #0]
UXTB	R1, R1
LDR	R0, [SP, #4]
UXTB	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,569 :: 		for(i = ymin; i <= ymax; ++i)
LDR	R4, [SP, #0]
UXTB	R4, R4
ADDS	R4, #1
STR	R4, [SP, #0]
;ssd1306.c,572 :: 		}
IT	AL
BLAL	L_Draw_Rectangle115
L_Draw_Rectangle116:
;ssd1306.c,567 :: 		for(; xmin <= xmax; ++xmin)
LDR	R4, [SP, #4]
UXTB	R4, R4
ADDS	R4, #1
STR	R4, [SP, #4]
;ssd1306.c,573 :: 		}
IT	AL
BLAL	L_Draw_Rectangle112
L_Draw_Rectangle113:
;ssd1306.c,574 :: 		}
IT	AL
BLAL	L_Draw_Rectangle118
L_Draw_Rectangle107:
;ssd1306.c,578 :: 		Draw_Line(x1, y1, x2, y1, colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
LDR	R3, [SP, #24]
SXTH	R3, R3
LDR	R2, [SP, #28]
SXTH	R2, R2
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,579 :: 		Draw_Line(x1, y2, x2, y2, colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
LDR	R3, [SP, #32]
SXTH	R3, R3
LDR	R2, [SP, #28]
SXTH	R2, R2
LDR	R1, [SP, #32]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,580 :: 		Draw_Line(x1, y1, x1, y2, colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
LDR	R3, [SP, #32]
SXTH	R3, R3
LDR	R2, [SP, #20]
SXTH	R2, R2
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,581 :: 		Draw_Line(x2, y1, x2, y2, colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
LDR	R3, [SP, #32]
SXTH	R3, R3
LDR	R2, [SP, #28]
SXTH	R2, R2
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #28]
SXTH	R0, R0
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,582 :: 		}
L_Draw_Rectangle118:
;ssd1306.c,584 :: 		if(type != SQUARE)
LDR	R4, [SP, #48]
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BLEQ	L_Draw_Rectangle119
;ssd1306.c,586 :: 		Draw_Pixel(x1, y1, ~colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
MVN	R4, R4
UXTB	R2, R4
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,587 :: 		Draw_Pixel(x1, y2, ~colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
MVN	R4, R4
UXTB	R2, R4
LDR	R1, [SP, #32]
SXTH	R1, R1
LDR	R0, [SP, #20]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,588 :: 		Draw_Pixel(x2, y1, ~colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
MVN	R4, R4
UXTB	R2, R4
LDR	R1, [SP, #24]
SXTH	R1, R1
LDR	R0, [SP, #28]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,589 :: 		Draw_Pixel(x2, y2, ~colour);
LDR	R4, [SP, #44]
UXTB	R4, R4
MVN	R4, R4
UXTB	R2, R4
LDR	R1, [SP, #32]
SXTH	R1, R1
LDR	R0, [SP, #28]
SXTH	R0, R0
BL	_Draw_Pixel+0
;ssd1306.c,590 :: 		}
L_Draw_Rectangle119:
;ssd1306.c,591 :: 		}
L_end_Draw_Rectangle:
ADD	SP, SP, #36
POP	(R15)
; end of _Draw_Rectangle
_Draw_Circle:
;ssd1306.c,594 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
; radius start address is: 8 (R2)
PUSH	(R14)
SUB	SP, SP, #24
STR	R0, [SP, #12]
SXTH	R0, R2
STR	R1, [SP, #16]
STR	R3, [SP, #20]
; radius end address is: 8 (R2)
; radius start address is: 0 (R0)
LDR	R4, [SP, #28]
UXTB	R4, R4
STR	R4, [SP, #28]
;ssd1306.c,596 :: 		signed int a = 0x0000;
MOV	R6, SP
MOVS	R5, #2
ADDS	R5, R5, R6
MOVW	R7, #lo_addr(?ICSDraw_Circle_a_L0+0)
MOVT	R7, #hi_addr(?ICSDraw_Circle_a_L0+0)
BL	___CC2DW+0
;ssd1306.c,597 :: 		signed int b = 0x0000;
;ssd1306.c,598 :: 		signed int P = 0x0000;
;ssd1306.c,600 :: 		b = radius;
STR	R0, [SP, #4]
;ssd1306.c,601 :: 		P = (1 - b);
MOVS	R4, #1
SUBS	R4, R4, R0
; radius end address is: 0 (R0)
STR	R4, [SP, #8]
;ssd1306.c,603 :: 		do
L_Draw_Circle120:
;ssd1306.c,605 :: 		if(fill != 0)
LDR	R4, [SP, #20]
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BLEQ	L_Draw_Circle123
;ssd1306.c,607 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
LDR	R0, [SP, #28]
UXTB	R0, R0
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R7, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
PUSH	(R0)
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,608 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
LDR	R0, [SP, #28]
UXTB	R0, R0
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R7, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
PUSH	(R0)
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,609 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
LDR	R0, [SP, #28]
UXTB	R0, R0
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R7, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
PUSH	(R0)
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,610 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
LDR	R0, [SP, #28]
UXTB	R0, R0
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R7, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
PUSH	(R0)
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,611 :: 		}
IT	AL
BLAL	L_Draw_Circle124
L_Draw_Circle123:
;ssd1306.c,614 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,615 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,616 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,617 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
ADDS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,618 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,619 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
ADDS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,620 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R6, R4, R5
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,621 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDR	R5, [SP, #0]
SXTH	R5, R5
LDR	R4, [SP, #16]
SXTH	R4, R4
SUBS	R6, R4, R5
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #12]
SXTH	R4, R4
SUBS	R4, R4, R5
LDR	R2, [SP, #28]
UXTB	R2, R2
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,622 :: 		}
L_Draw_Circle124:
;ssd1306.c,624 :: 		if(P < 0)
LDR	R4, [SP, #8]
SXTH	R4, R4
CMP	R4, #0
IT	GE
BLGE	L_Draw_Circle125
;ssd1306.c,626 :: 		P += (3 + (2 * a++));
LDR	R4, [SP, #0]
SXTH	R4, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #3
SXTH	R5, R5
LDR	R4, [SP, #8]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #8]
LDR	R4, [SP, #0]
SXTH	R4, R4
ADDS	R4, #1
STR	R4, [SP, #0]
;ssd1306.c,627 :: 		}
IT	AL
BLAL	L_Draw_Circle126
L_Draw_Circle125:
;ssd1306.c,630 :: 		P += (5 + (2 * ((a++) - (b--))));
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #0]
SXTH	R4, R4
SUBS	R4, R4, R5
SXTH	R4, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #5
SXTH	R5, R5
LDR	R4, [SP, #8]
SXTH	R4, R4
ADDS	R4, R4, R5
STR	R4, [SP, #8]
LDR	R4, [SP, #0]
SXTH	R4, R4
ADDS	R4, #1
STR	R4, [SP, #0]
LDR	R4, [SP, #4]
SXTH	R4, R4
SUBS	R4, R4, #1
STR	R4, [SP, #4]
;ssd1306.c,631 :: 		}
L_Draw_Circle126:
;ssd1306.c,632 :: 		}while(a <= b);
LDR	R5, [SP, #4]
SXTH	R5, R5
LDR	R4, [SP, #0]
SXTH	R4, R4
CMP	R4, R5
IT	LE
BLLE	L_Draw_Circle120
;ssd1306.c,633 :: 		}
L_end_Draw_Circle:
ADD	SP, SP, #24
POP	(R15)
; end of _Draw_Circle
_main:
;OLED_Demo.c,7 :: 		void main()
SUB	SP, SP, #28
;OLED_Demo.c,11 :: 		unsigned int m = 0;
;OLED_Demo.c,12 :: 		unsigned char n = 0;
;OLED_Demo.c,13 :: 		unsigned char o = 0;
;OLED_Demo.c,14 :: 		unsigned char p = 0;
;OLED_Demo.c,16 :: 		signed int i = -9;
;OLED_Demo.c,18 :: 		float f = -10.0;
;OLED_Demo.c,20 :: 		setup();
BL	_setup+0
;OLED_Demo.c,22 :: 		while(1)
L_main127:
;OLED_Demo.c,24 :: 		i = -9;
MOVS	R0, #8
MVN	R0, R0
SXTH	R0, R0
STR	R0, [SP, #20]
;OLED_Demo.c,25 :: 		f = -10.0;
MOVW	R0, #0
MOVT	R0, #49440
STR	R0, [SP, #24]
;OLED_Demo.c,27 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,28 :: 		OLED_fill(0xAA);
MOVS	R0, #170
BL	_OLED_fill+0
;OLED_Demo.c,29 :: 		delay_ms(600);
LDR	R7, [PC, #4799999]
NOP
L_main129:
SUBS	R7, R7, #1
BNE	L_main129
B	#4
	#4799999
NOP
;OLED_Demo.c,31 :: 		OLED_fill(0x55);
MOVS	R0, #85
BL	_OLED_fill+0
;OLED_Demo.c,32 :: 		delay_ms(600);
LDR	R7, [PC, #4799999]
NOP
L_main131:
SUBS	R7, R7, #1
BNE	L_main131
B	#4
	#4799999
NOP
;OLED_Demo.c,34 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,35 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,36 :: 		for(m = 18; m < 114; m += 10)
MOVS	R0, #18
STR	R0, [SP, #8]
L_main133:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #114
IT	CS
BLCS	L_main134
;OLED_Demo.c,38 :: 		for(n = 12;  n < 57; n += 8)
MOVS	R0, #12
STR	R0, [SP, #12]
L_main136:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #57
IT	CS
BLCS	L_main137
;OLED_Demo.c,40 :: 		Draw_Circle(m, n, 4, toggle, ON);
MOVS	R2, #1
LDR	R1, [SP, #4]
MOVS	R0, #1
ANDS	R0, R1
LSRS	R0, R0, #0
PUSH	(R2)
UXTB	R3, R0
MOVS	R2, #4
LDR	R1, [SP, #16]
UXTB	R1, R1
LDR	R0, [SP, #12]
UXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;OLED_Demo.c,41 :: 		toggle ^= ON;
LDR	R0, [SP, #4]
MOVS	R1, #1
ANDS	R1, R0
LSRS	R1, R1, #0
MOVS	R0, #1
EORS	R0, R1
UXTB	R2, R0
LDR	R0, [SP, #4]
MOVS	R1, #1
ANDS	R1, R2
BEQ	L__main288
MOVS	R1, #1
ORRS	R0, R1
B	L__main287
L__main288:
MOVS	R1, #1
BICS	R0, R1
L__main287:
STR	R0, [SP, #4]
;OLED_Demo.c,42 :: 		delay_ms(40);
LDR	R7, [PC, #319999]
NOP
L_main139:
SUBS	R7, R7, #1
BNE	L_main139
B	#4
	#319999
NOP
;OLED_Demo.c,38 :: 		for(n = 12;  n < 57; n += 8)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #8
STR	R0, [SP, #12]
;OLED_Demo.c,43 :: 		}
IT	AL
BLAL	L_main136
L_main137:
;OLED_Demo.c,36 :: 		for(m = 18; m < 114; m += 10)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #10
STR	R0, [SP, #8]
;OLED_Demo.c,44 :: 		}
IT	AL
BLAL	L_main133
L_main134:
;OLED_Demo.c,45 :: 		delay_ms(1600);
LDR	R7, [PC, #12799999]
NOP
L_main141:
SUBS	R7, R7, #1
BNE	L_main141
B	#4
	#12799999
NOP
;OLED_Demo.c,47 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,48 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,49 :: 		for(n = 1;  n < 32; n++)
MOVS	R0, #1
STR	R0, [SP, #12]
L_main143:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #32
IT	CS
BLCS	L_main144
;OLED_Demo.c,51 :: 		Draw_Circle(63, 31, n, ON, ON);
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #1
LDR	R2, [SP, #16]
UXTB	R2, R2
MOVS	R1, #31
MOVS	R0, #63
BL	_Draw_Circle+0
ADD	SP, SP, #4
;OLED_Demo.c,49 :: 		for(n = 1;  n < 32; n++)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #1
STR	R0, [SP, #12]
;OLED_Demo.c,52 :: 		}
IT	AL
BLAL	L_main143
L_main144:
;OLED_Demo.c,53 :: 		delay_ms(2000);
LDR	R7, [PC, #15999999]
NOP
L_main146:
SUBS	R7, R7, #1
BNE	L_main146
B	#4
	#15999999
NOP
;OLED_Demo.c,54 :: 		for(n = 1;  n < 32; n++)
MOVS	R0, #1
STR	R0, [SP, #12]
L_main148:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #32
IT	CS
BLCS	L_main149
;OLED_Demo.c,56 :: 		Draw_Circle(63, 31, n, ON, OFF);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #1
LDR	R2, [SP, #16]
UXTB	R2, R2
MOVS	R1, #31
MOVS	R0, #63
BL	_Draw_Circle+0
ADD	SP, SP, #4
;OLED_Demo.c,54 :: 		for(n = 1;  n < 32; n++)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #1
STR	R0, [SP, #12]
;OLED_Demo.c,57 :: 		}
IT	AL
BLAL	L_main148
L_main149:
;OLED_Demo.c,58 :: 		delay_ms(900);
LDR	R7, [PC, #7199999]
NOP
L_main151:
SUBS	R7, R7, #1
BNE	L_main151
B	#4
	#7199999
NOP
;OLED_Demo.c,60 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,61 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,62 :: 		for(n = 1;  n < 32; n++)
MOVS	R0, #1
STR	R0, [SP, #12]
L_main153:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #32
IT	CS
BLCS	L_main154
;OLED_Demo.c,64 :: 		Draw_Circle(63, 31, n, N, toggle);
LDR	R1, [SP, #4]
MOVS	R0, #1
ANDS	R0, R1
LSRS	R0, R0, #0
PUSH	(R0)
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #16]
UXTB	R2, R2
MOVS	R1, #31
MOVS	R0, #63
BL	_Draw_Circle+0
ADD	SP, SP, #4
;OLED_Demo.c,65 :: 		toggle ^= ON;
LDR	R0, [SP, #4]
MOVS	R1, #1
ANDS	R1, R0
LSRS	R1, R1, #0
MOVS	R0, #1
EORS	R0, R1
UXTB	R2, R0
LDR	R0, [SP, #4]
MOVS	R1, #1
ANDS	R1, R2
BEQ	L__main290
MOVS	R1, #1
ORRS	R0, R1
B	L__main289
L__main290:
MOVS	R1, #1
BICS	R0, R1
L__main289:
STR	R0, [SP, #4]
;OLED_Demo.c,66 :: 		delay_ms(10);
LDR	R7, [PC, #79999]
NOP
L_main156:
SUBS	R7, R7, #1
BNE	L_main156
B	#4
	#79999
NOP
;OLED_Demo.c,62 :: 		for(n = 1;  n < 32; n++)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #1
STR	R0, [SP, #12]
;OLED_Demo.c,67 :: 		}
IT	AL
BLAL	L_main153
L_main154:
;OLED_Demo.c,68 :: 		delay_ms(2000);
LDR	R7, [PC, #15999999]
NOP
L_main158:
SUBS	R7, R7, #1
BNE	L_main158
B	#4
	#15999999
NOP
;OLED_Demo.c,70 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,71 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,72 :: 		for(m = 0; m < 128; m += 4)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main160:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main161
;OLED_Demo.c,74 :: 		for(n = 0; n < 64; n += 4)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main163:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #64
IT	CS
BLCS	L_main164
;OLED_Demo.c,76 :: 		Draw_Line(m, n, 127, 63, ON);
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #63
MOVS	R2, #127
LDR	R1, [SP, #16]
UXTB	R1, R1
LDR	R0, [SP, #12]
UXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;OLED_Demo.c,74 :: 		for(n = 0; n < 64; n += 4)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #4
STR	R0, [SP, #12]
;OLED_Demo.c,77 :: 		}
IT	AL
BLAL	L_main163
L_main164:
;OLED_Demo.c,72 :: 		for(m = 0; m < 128; m += 4)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #4
STR	R0, [SP, #8]
;OLED_Demo.c,78 :: 		}
IT	AL
BLAL	L_main160
L_main161:
;OLED_Demo.c,79 :: 		for(m = 0; m < 128; m += 4)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main166:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main167
;OLED_Demo.c,81 :: 		for(n = 0; n < 64; n += 4)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main169:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #64
IT	CS
BLCS	L_main170
;OLED_Demo.c,83 :: 		Draw_Line(127, 63, m, n, ON);
MOVS	R0, #1
PUSH	(R0)
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #12]
UXTH	R2, R2
MOVS	R1, #63
MOVS	R0, #127
BL	_Draw_Line+0
ADD	SP, SP, #4
;OLED_Demo.c,81 :: 		for(n = 0; n < 64; n += 4)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #4
STR	R0, [SP, #12]
;OLED_Demo.c,84 :: 		}
IT	AL
BLAL	L_main169
L_main170:
;OLED_Demo.c,79 :: 		for(m = 0; m < 128; m += 4)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #4
STR	R0, [SP, #8]
;OLED_Demo.c,85 :: 		}
IT	AL
BLAL	L_main166
L_main167:
;OLED_Demo.c,86 :: 		delay_ms(1600);
LDR	R7, [PC, #12799999]
NOP
L_main172:
SUBS	R7, R7, #1
BNE	L_main172
B	#4
	#12799999
NOP
;OLED_Demo.c,87 :: 		for(m = 0; m < 128; m += 4)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main174:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main175
;OLED_Demo.c,89 :: 		for(n = 0; n < 64; n += 4)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main177:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #64
IT	CS
BLCS	L_main178
;OLED_Demo.c,91 :: 		Draw_Line(m, n, 127, 63, OFF);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #63
MOVS	R2, #127
LDR	R1, [SP, #16]
UXTB	R1, R1
LDR	R0, [SP, #12]
UXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;OLED_Demo.c,89 :: 		for(n = 0; n < 64; n += 4)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #4
STR	R0, [SP, #12]
;OLED_Demo.c,92 :: 		}
IT	AL
BLAL	L_main177
L_main178:
;OLED_Demo.c,87 :: 		for(m = 0; m < 128; m += 4)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #4
STR	R0, [SP, #8]
;OLED_Demo.c,93 :: 		}
IT	AL
BLAL	L_main174
L_main175:
;OLED_Demo.c,94 :: 		for(m = 0; m < 128; m += 4)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main180:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main181
;OLED_Demo.c,96 :: 		for(n = 0; n < 64; n += 4)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main183:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #64
IT	CS
BLCS	L_main184
;OLED_Demo.c,98 :: 		Draw_Line(127, 63, m, n, OFF);
MOVS	R0, #0
PUSH	(R0)
LDR	R3, [SP, #16]
UXTB	R3, R3
LDR	R2, [SP, #12]
UXTH	R2, R2
MOVS	R1, #63
MOVS	R0, #127
BL	_Draw_Line+0
ADD	SP, SP, #4
;OLED_Demo.c,96 :: 		for(n = 0; n < 64; n += 4)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #4
STR	R0, [SP, #12]
;OLED_Demo.c,99 :: 		}
IT	AL
BLAL	L_main183
L_main184:
;OLED_Demo.c,94 :: 		for(m = 0; m < 128; m += 4)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #4
STR	R0, [SP, #8]
;OLED_Demo.c,100 :: 		}
IT	AL
BLAL	L_main180
L_main181:
;OLED_Demo.c,101 :: 		delay_ms(1600);
LDR	R7, [PC, #12799999]
NOP
L_main186:
SUBS	R7, R7, #1
BNE	L_main186
B	#4
	#12799999
NOP
;OLED_Demo.c,103 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,104 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,105 :: 		for(m = 0; m < 128; m += 8)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main188:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main189
;OLED_Demo.c,107 :: 		for(n = 0; n < 64; n += 8)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main191:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #64
IT	CS
BLCS	L_main192
;OLED_Demo.c,109 :: 		Draw_Rectangle(m, 0, 127, n, OFF, ON, ROUND);
MOVS	R2, #1
MOVS	R1, #1
MOVS	R0, #0
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
LDR	R3, [SP, #24]
UXTB	R3, R3
MOVS	R2, #127
MOVS	R1, #0
LDR	R0, [SP, #20]
UXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
;OLED_Demo.c,107 :: 		for(n = 0; n < 64; n += 8)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #8
STR	R0, [SP, #12]
;OLED_Demo.c,110 :: 		}
IT	AL
BLAL	L_main191
L_main192:
;OLED_Demo.c,105 :: 		for(m = 0; m < 128; m += 8)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #8
STR	R0, [SP, #8]
;OLED_Demo.c,111 :: 		}
IT	AL
BLAL	L_main188
L_main189:
;OLED_Demo.c,112 :: 		delay_ms(600);
LDR	R7, [PC, #4799999]
NOP
L_main194:
SUBS	R7, R7, #1
BNE	L_main194
B	#4
	#4799999
NOP
;OLED_Demo.c,114 :: 		for(m = 0; m < 128; m++)
MOVS	R0, #0
STR	R0, [SP, #8]
L_main196:
LDR	R0, [SP, #8]
UXTH	R0, R0
CMP	R0, #128
IT	CS
BLCS	L_main197
;OLED_Demo.c,116 :: 		n = (28 + (28 * sin(m * 0.04090874)));
LDR	R0, [SP, #8]
UXTH	R0, R0
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #36844
MOVT	R2, #15655
BL	__Mul_FP+0
BL	_sin+0
MOVW	R2, #0
MOVT	R2, #16864
BL	__Mul_FP+0
MOVW	R2, #0
MOVT	R2, #16864
BL	__Add_FP+0
BL	__FloatToUnsignedIntegral+0
UXTB	R0, R0
;OLED_Demo.c,117 :: 		Draw_Pixel(m, n, ON);
MOVS	R2, #1
UXTB	R1, R0
LDR	R0, [SP, #8]
UXTH	R0, R0
BL	_Draw_Pixel+0
;OLED_Demo.c,118 :: 		n = (28 + (28 * cos(m * 0.04090874)));
LDR	R0, [SP, #8]
UXTH	R0, R0
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #36844
MOVT	R2, #15655
BL	__Mul_FP+0
BL	_cos+0
MOVW	R2, #0
MOVT	R2, #16864
BL	__Mul_FP+0
MOVW	R2, #0
MOVT	R2, #16864
BL	__Add_FP+0
BL	__FloatToUnsignedIntegral+0
UXTB	R0, R0
;OLED_Demo.c,119 :: 		Draw_Pixel(m, n, ON);
MOVS	R2, #1
UXTB	R1, R0
LDR	R0, [SP, #8]
UXTH	R0, R0
BL	_Draw_Pixel+0
;OLED_Demo.c,120 :: 		delay_ms(20);
LDR	R7, [PC, #159999]
NOP
L_main199:
SUBS	R7, R7, #1
BNE	L_main199
B	#4
	#159999
NOP
;OLED_Demo.c,114 :: 		for(m = 0; m < 128; m++)
LDR	R0, [SP, #8]
UXTH	R0, R0
ADDS	R0, #1
STR	R0, [SP, #8]
;OLED_Demo.c,121 :: 		}
IT	AL
BLAL	L_main196
L_main197:
;OLED_Demo.c,122 :: 		delay_ms(2000);
LDR	R7, [PC, #15999999]
NOP
L_main201:
SUBS	R7, R7, #1
BNE	L_main201
B	#4
	#15999999
NOP
;OLED_Demo.c,124 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,125 :: 		OLED_clear_buffer();
BL	_OLED_clear_buffer+0
;OLED_Demo.c,126 :: 		for(n = 0; n < 63; n++)
MOVS	R0, #0
STR	R0, [SP, #12]
L_main203:
LDR	R0, [SP, #12]
UXTB	R0, R0
CMP	R0, #63
IT	CS
BLCS	L_main204
;OLED_Demo.c,128 :: 		Draw_Rectangle((0 + (n * 2)), (0 + n), (127 - (n * 2)), (63 - n), OFF, ON, SQUARE);
MOVS	R6, #0
MOVS	R5, #1
MOVS	R4, #0
LDR	R1, [SP, #12]
UXTB	R1, R1
MOVS	R0, #63
SUBS	R3, R0, R1
LDR	R0, [SP, #12]
UXTB	R0, R0
LSLS	R2, R0, #1
SXTH	R2, R2
MOVS	R0, #127
SUBS	R1, R0, R2
LDR	R0, [SP, #12]
UXTB	R0, R0
STR	R0, [SP, #0]
SXTH	R0, R2
SXTH	R2, R1
LDR	R1, [SP, #0]
SXTH	R1, R1
PUSH	(R6)
PUSH	(R5)
PUSH	(R4)
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
;OLED_Demo.c,129 :: 		delay_ms(40);
LDR	R7, [PC, #319999]
NOP
L_main206:
SUBS	R7, R7, #1
BNE	L_main206
B	#4
	#319999
NOP
;OLED_Demo.c,126 :: 		for(n = 0; n < 63; n++)
LDR	R0, [SP, #12]
UXTB	R0, R0
ADDS	R0, #1
STR	R0, [SP, #12]
;OLED_Demo.c,130 :: 		}
IT	AL
BLAL	L_main203
L_main204:
;OLED_Demo.c,132 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;OLED_Demo.c,133 :: 		OLED_print_string(36, 1, "MicroArena");
MOVW	R0, #lo_addr(?lstr1_OLED_Demo+0)
MOVT	R0, #hi_addr(?lstr1_OLED_Demo+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #36
BL	_OLED_print_string+0
;OLED_Demo.c,134 :: 		OLED_print_string(12, 2, "fb.com/MicroArena");
MOVW	R0, #lo_addr(?lstr2_OLED_Demo+0)
MOVT	R0, #hi_addr(?lstr2_OLED_Demo+0)
MOV	R2, R0
MOVS	R1, #2
MOVS	R0, #12
BL	_OLED_print_string+0
;OLED_Demo.c,135 :: 		for(p = 0; p < 250; p++)
MOVS	R0, #0
STR	R0, [SP, #16]
L_main208:
LDR	R0, [SP, #16]
UXTB	R0, R0
CMP	R0, #250
IT	CS
BLCS	L_main209
;OLED_Demo.c,137 :: 		f += 0.1;
LDR	R2, [SP, #24]
MOVW	R0, #52429
MOVT	R0, #15820
BL	__Add_FP+0
STR	R0, [SP, #24]
;OLED_Demo.c,138 :: 		i += 1;
LDR	R1, [SP, #20]
SXTH	R1, R1
ADDS	R1, #1
STR	R1, [SP, #20]
;OLED_Demo.c,140 :: 		OLED_print_float(1, 5, f, 1);
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #5
MOVS	R0, #1
BL	_OLED_print_float+0
;OLED_Demo.c,141 :: 		OLED_print_int(1, 6, i);
LDR	R2, [SP, #20]
SXTH	R2, R2
MOVS	R1, #6
MOVS	R0, #1
BL	_OLED_print_int+0
;OLED_Demo.c,142 :: 		OLED_print_chr(1, 7, p);
LDR	R2, [SP, #16]
UXTB	R2, R2
MOVS	R1, #7
MOVS	R0, #1
BL	_OLED_print_chr+0
;OLED_Demo.c,144 :: 		delay_ms(99);
LDR	R7, [PC, #791999]
NOP
L_main211:
SUBS	R7, R7, #1
BNE	L_main211
B	#4
	#791999
NOP
;OLED_Demo.c,135 :: 		for(p = 0; p < 250; p++)
LDR	R0, [SP, #16]
UXTB	R0, R0
ADDS	R0, #1
STR	R0, [SP, #16]
;OLED_Demo.c,145 :: 		}
IT	AL
BLAL	L_main208
L_main209:
;OLED_Demo.c,147 :: 		OLED_fill(0xFF);
MOVS	R0, #255
BL	_OLED_fill+0
;OLED_Demo.c,148 :: 		};
IT	AL
BLAL	L_main127
;OLED_Demo.c,149 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;OLED_Demo.c,152 :: 		void setup()
PUSH	(R14)
;OLED_Demo.c,154 :: 		OLED_init();
BL	_OLED_init+0
;OLED_Demo.c,155 :: 		}
L_end_setup:
POP	(R15)
; end of _setup
