_LM75_init:
;lm75.c,4 :: 		void LM75_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lm75.c,6 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB89);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;lm75.c,7 :: 		delay_ms(10);
MOVW	R7, #17854
MOVT	R7, #4
NOP
NOP
L_LM75_init0:
SUBS	R7, R7, #1
BNE	L_LM75_init0
NOP
NOP
NOP
;lm75.c,8 :: 		I2C_Set_Active(&I2C1_Start, &I2C1_Read, &I2C1_Write);
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;lm75.c,10 :: 		LM75_write_byte(pointer_conf_reg, (queue_value_1 | OS_POL_LOW | OS_Comp | normal));
MOVS	R1, #0
MOVS	R0, #1
BL	_LM75_write_byte+0
;lm75.c,11 :: 		}
L_end_LM75_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LM75_init
_LM75_write_byte:
;lm75.c,14 :: 		void LM75_write_byte(unsigned char pointer, unsigned char value)
; value start address is: 4 (R1)
; pointer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; value end address is: 4 (R1)
; pointer end address is: 0 (R0)
; pointer start address is: 0 (R0)
; value start address is: 4 (R1)
;lm75.c,16 :: 		unsigned char values[0x02] = {0x00, 0x00};
MOVS	R2, #0
STRB	R2, [SP, #4]
MOVS	R2, #0
STRB	R2, [SP, #5]
;lm75.c,18 :: 		values[0] = pointer;
ADD	R2, SP, #4
STRB	R0, [R2, #0]
; pointer end address is: 0 (R0)
;lm75.c,19 :: 		values[1] = value;
ADDS	R2, R2, #1
STRB	R1, [R2, #0]
; value end address is: 4 (R1)
;lm75.c,21 :: 		I2C1_Start();
BL	_I2C1_Start+0
;lm75.c,22 :: 		I2C1_Write(LM75_I2C_Address, values, 2, END_MODE_STOP);
ADD	R2, SP, #4
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #2
MOVS	R0, #72
BL	_I2C1_Write+0
;lm75.c,23 :: 		}
L_end_LM75_write_byte:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _LM75_write_byte
_LM75_write_bytes:
;lm75.c,26 :: 		void LM75_write_bytes(unsigned char pointer, signed int value)
; value start address is: 4 (R1)
; pointer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; value end address is: 4 (R1)
; pointer end address is: 0 (R0)
; pointer start address is: 0 (R0)
; value start address is: 4 (R1)
;lm75.c,28 :: 		unsigned char values[0x03] = {0x00, 0x00, 0x00};
MOVS	R2, #0
STRB	R2, [SP, #4]
MOVS	R2, #0
STRB	R2, [SP, #5]
MOVS	R2, #0
STRB	R2, [SP, #6]
;lm75.c,30 :: 		values[0] = pointer;
ADD	R4, SP, #4
STRB	R0, [R4, #0]
; pointer end address is: 0 (R0)
;lm75.c,31 :: 		values[1] = ((value & 0xFF00) >> 8);
ADDS	R3, R4, #1
AND	R2, R1, #65280
UXTH	R2, R2
LSRS	R2, R2, #8
STRB	R2, [R3, #0]
;lm75.c,32 :: 		values[2] = (value & 0x00FF);
ADDS	R3, R4, #2
AND	R2, R1, #255
; value end address is: 4 (R1)
STRB	R2, [R3, #0]
;lm75.c,34 :: 		I2C1_Start();
BL	_I2C1_Start+0
;lm75.c,35 :: 		I2C1_Write(LM75_I2C_Address, values, 3, END_MODE_STOP);
ADD	R2, SP, #4
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #3
MOVS	R0, #72
BL	_I2C1_Write+0
;lm75.c,36 :: 		}
L_end_LM75_write_bytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _LM75_write_bytes
_LM75_read_byte:
;lm75.c,39 :: 		signed int LM75_read_byte(unsigned char pointer)
; pointer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; pointer end address is: 0 (R0)
; pointer start address is: 0 (R0)
;lm75.c,41 :: 		unsigned char value_p[0x01] = {0x00};
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
;lm75.c,42 :: 		unsigned char value_d[0x01] = {0x00};
;lm75.c,44 :: 		value_p[0] = pointer;
ADD	R1, SP, #4
STRB	R0, [R1, #0]
; pointer end address is: 0 (R0)
;lm75.c,46 :: 		I2C1_Start();
BL	_I2C1_Start+0
;lm75.c,47 :: 		I2C1_Write(LM75_I2C_Address, value_p, 1, END_MODE_RESTART);
ADD	R1, SP, #4
MOVW	R3, #0
MOVS	R2, #1
MOVS	R0, #72
BL	_I2C1_Write+0
;lm75.c,48 :: 		I2C1_Read(LM75_I2C_Address, value_d, 1, END_MODE_STOP);
ADD	R1, SP, #5
MOVW	R3, #1
MOVS	R2, #1
MOVS	R0, #72
BL	_I2C1_Read+0
;lm75.c,50 :: 		return (value_d[0x00]);
ADD	R1, SP, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
;lm75.c,51 :: 		}
L_end_LM75_read_byte:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _LM75_read_byte
_LM75_read_bytes:
;lm75.c,54 :: 		signed int LM75_read_bytes(unsigned char pointer)
; pointer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; pointer end address is: 0 (R0)
; pointer start address is: 0 (R0)
;lm75.c,56 :: 		unsigned char value_p[0x01] = {0x00};
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
MOVS	R1, #0
STRB	R1, [SP, #6]
;lm75.c,57 :: 		unsigned char value_d[0x02] = {0x00, 0x00};
;lm75.c,59 :: 		signed int value = 0x0000;
;lm75.c,61 :: 		value_p[0] = pointer;
ADD	R1, SP, #4
STRB	R0, [R1, #0]
; pointer end address is: 0 (R0)
;lm75.c,63 :: 		I2C1_Start();
BL	_I2C1_Start+0
;lm75.c,64 :: 		I2C1_Write(LM75_I2C_Address, value_p, 1, END_MODE_RESTART);
ADD	R1, SP, #4
MOVW	R3, #0
MOVS	R2, #1
MOVS	R0, #72
BL	_I2C1_Write+0
;lm75.c,65 :: 		I2C1_Read(LM75_I2C_Address, value_d, 2, END_MODE_STOP);
ADD	R1, SP, #5
MOVW	R3, #1
MOVS	R2, #2
MOVS	R0, #72
BL	_I2C1_Read+0
;lm75.c,67 :: 		value = ((signed int)value_d[0x00]);
ADD	R3, SP, #5
LDRB	R1, [R3, #0]
;lm75.c,68 :: 		value <<= 0x08;
LSLS	R2, R1, #8
SXTH	R2, R2
;lm75.c,69 :: 		value |= ((signed int)value_d[0x01]);
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
;lm75.c,71 :: 		return value;
SXTH	R0, R1
;lm75.c,72 :: 		}
L_end_LM75_read_bytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _LM75_read_bytes
_get_temp:
;lm75.c,75 :: 		float get_temp()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lm75.c,77 :: 		float temp = 0.0;
;lm75.c,79 :: 		temp = (LM75_read_bytes(pointer_temp_reg) >> 5);
MOVS	R0, #0
BL	_LM75_read_bytes+0
ASRS	R0, R0, #5
SXTH	R0, R0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
;lm75.c,80 :: 		temp *= 0.125;
VMOV.F32	S0, #0.125
VMUL.F32	S0, S1, S0
;lm75.c,82 :: 		return temp;
VMOV.F32	S0, S0
;lm75.c,83 :: 		}
L_end_get_temp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _get_temp
_OLED_init:
;ssd1306.c,5 :: 		void OLED_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1306.c,7 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1306.c,11 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;ssd1306.c,10 :: 		(_GPIO_PINMASK_8 | _GPIO_PINMASK_9),
MOVW	R1, #768
;ssd1306.c,9 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;ssd1306.c,11 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ssd1306.c,13 :: 		OLED_SA0 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;ssd1306.c,15 :: 		OLED_reset_sequence();
BL	_OLED_reset_sequence+0
;ssd1306.c,17 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB89);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;ssd1306.c,18 :: 		delay_ms(10);
MOVW	R7, #17854
MOVT	R7, #4
NOP
NOP
L_OLED_init2:
SUBS	R7, R7, #1
BNE	L_OLED_init2
NOP
NOP
NOP
;ssd1306.c,19 :: 		I2C_Set_Active(&I2C1_Start, &I2C1_Read, &I2C1_Write);
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;ssd1306.c,21 :: 		OLED_write((Set_Display_ON_or_OFF_CMD | Display_OFF), CMD);
MOVS	R1, #0
MOVS	R0, #174
BL	_OLED_write+0
;ssd1306.c,22 :: 		OLED_write(Set_Multiplex_Ratio_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #168
BL	_OLED_write+0
;ssd1306.c,23 :: 		OLED_write(0x3F, CMD);
MOVS	R1, #0
MOVS	R0, #63
BL	_OLED_write+0
;ssd1306.c,24 :: 		OLED_write(Set_Display_Offset_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #211
BL	_OLED_write+0
;ssd1306.c,25 :: 		OLED_write(0x00, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1306.c,26 :: 		OLED_write(Set_Display_Start_Line_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #64
BL	_OLED_write+0
;ssd1306.c,27 :: 		OLED_write((Set_Segment_Remap_CMD | Column_Address_0_Mapped_to_SEG127), CMD);
MOVS	R1, #0
MOVS	R0, #161
BL	_OLED_write+0
;ssd1306.c,28 :: 		OLED_write((Set_COM_Output_Scan_Direction_CMD | Scan_from_COM63_to_0), CMD);
MOVS	R1, #0
MOVS	R0, #200
BL	_OLED_write+0
;ssd1306.c,29 :: 		OLED_write(Set_Common_HW_Config_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #218
BL	_OLED_write+0
;ssd1306.c,30 :: 		OLED_write(0x12, CMD);
MOVS	R1, #0
MOVS	R0, #18
BL	_OLED_write+0
;ssd1306.c,31 :: 		OLED_write(Set_Contrast_Control_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #129
BL	_OLED_write+0
;ssd1306.c,32 :: 		OLED_write(0xFF, CMD);
MOVS	R1, #0
MOVS	R0, #255
BL	_OLED_write+0
;ssd1306.c,33 :: 		OLED_write(Set_Entire_Display_ON_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #164
BL	_OLED_write+0
;ssd1306.c,34 :: 		OLED_write(Set_Normal_or_Inverse_Display_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #166
BL	_OLED_write+0
;ssd1306.c,35 :: 		OLED_write(Set_Display_Clock_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #213
BL	_OLED_write+0
;ssd1306.c,36 :: 		OLED_write(0x80, CMD);
MOVS	R1, #0
MOVS	R0, #128
BL	_OLED_write+0
;ssd1306.c,37 :: 		OLED_write(Set_Pre_charge_Period_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #217
BL	_OLED_write+0
;ssd1306.c,38 :: 		OLED_write(0x25, CMD);
MOVS	R1, #0
MOVS	R0, #37
BL	_OLED_write+0
;ssd1306.c,39 :: 		OLED_write(Set_VCOMH_Level_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #219
BL	_OLED_write+0
;ssd1306.c,40 :: 		OLED_write(0x20, CMD);
MOVS	R1, #0
MOVS	R0, #32
BL	_OLED_write+0
;ssd1306.c,41 :: 		OLED_write(Set_Page_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #34
BL	_OLED_write+0
;ssd1306.c,42 :: 		OLED_write(0x00, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1306.c,43 :: 		OLED_write(0x07, CMD);
MOVS	R1, #0
MOVS	R0, #7
BL	_OLED_write+0
;ssd1306.c,44 :: 		OLED_write(Set_Page_Start_Address_CMD , CMD);
MOVS	R1, #0
MOVS	R0, #176
BL	_OLED_write+0
;ssd1306.c,45 :: 		OLED_write(Set_Higher_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #16
BL	_OLED_write+0
;ssd1306.c,46 :: 		OLED_write(Set_Lower_Column_Start_Address_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_write+0
;ssd1306.c,47 :: 		OLED_write(Set_Memory_Addressing_Mode_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #32
BL	_OLED_write+0
;ssd1306.c,48 :: 		OLED_write(0x02, CMD);
MOVS	R1, #0
MOVS	R0, #2
BL	_OLED_write+0
;ssd1306.c,49 :: 		OLED_write(Set_Charge_Pump_CMD, CMD);
MOVS	R1, #0
MOVS	R0, #141
BL	_OLED_write+0
;ssd1306.c,50 :: 		OLED_write(0x14, CMD);
MOVS	R1, #0
MOVS	R0, #20
BL	_OLED_write+0
;ssd1306.c,51 :: 		OLED_write((Set_Display_ON_or_OFF_CMD | Display_ON), CMD);
MOVS	R1, #0
MOVS	R0, #175
BL	_OLED_write+0
;ssd1306.c,52 :: 		}
L_end_OLED_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_init
_OLED_reset_sequence:
;ssd1306.c,55 :: 		void OLED_reset_sequence()
;ssd1306.c,57 :: 		delay_ms(40);
MOVW	R7, #5886
MOVT	R7, #17
NOP
NOP
L_OLED_reset_sequence4:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence4
NOP
NOP
NOP
;ssd1306.c,58 :: 		OLED_RESET = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;ssd1306.c,59 :: 		delay_ms(1);
MOVW	R7, #27998
MOVT	R7, #0
NOP
NOP
L_OLED_reset_sequence6:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence6
NOP
NOP
NOP
;ssd1306.c,60 :: 		OLED_RESET = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;ssd1306.c,61 :: 		delay_ms(10);
MOVW	R7, #17854
MOVT	R7, #4
NOP
NOP
L_OLED_reset_sequence8:
SUBS	R7, R7, #1
BNE	L_OLED_reset_sequence8
NOP
NOP
NOP
;ssd1306.c,62 :: 		}
L_end_OLED_reset_sequence:
BX	LR
; end of _OLED_reset_sequence
_OLED_write:
;ssd1306.c,66 :: 		void OLED_write(unsigned char value, unsigned char control_byte)
; control_byte start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; control_byte end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; control_byte start address is: 4 (R1)
;ssd1306.c,68 :: 		unsigned char data_value[2] = {0x00, 0x00};
MOVS	R2, #0
STRB	R2, [SP, #4]
MOVS	R2, #0
STRB	R2, [SP, #5]
;ssd1306.c,70 :: 		data_value[0] = control_byte;
ADD	R2, SP, #4
STRB	R1, [R2, #0]
; control_byte end address is: 4 (R1)
;ssd1306.c,71 :: 		data_value[1] = value;
ADDS	R2, R2, #1
STRB	R0, [R2, #0]
; value end address is: 0 (R0)
;ssd1306.c,73 :: 		I2C1_Start();
BL	_I2C1_Start+0
;ssd1306.c,74 :: 		I2C1_Write(SSD1306_I2C_Address, data_value, 2, END_MODE_STOP);
ADD	R2, SP, #4
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #2
MOVS	R0, #60
BL	_I2C1_Write+0
;ssd1306.c,75 :: 		}
L_end_OLED_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _OLED_write
_OLED_gotoxy:
;ssd1306.c,78 :: 		void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R10, R0
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 40 (R10)
; y_pos start address is: 4 (R1)
;ssd1306.c,80 :: 		OLED_write((Set_Page_Start_Address_CMD + y_pos), CMD);
ADDW	R2, R1, #176
; y_pos end address is: 4 (R1)
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,81 :: 		OLED_write(((x_pos & 0x0F) | Set_Lower_Column_Start_Address_CMD), CMD);
AND	R2, R10, #15
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,82 :: 		OLED_write((((x_pos & 0xF0) >> 0x04) | Set_Higher_Column_Start_Address_CMD), CMD);
AND	R2, R10, #240
UXTB	R2, R2
; x_pos end address is: 40 (R10)
LSRS	R2, R2, #4
UXTB	R2, R2
ORR	R2, R2, #16
MOVS	R1, #0
UXTB	R0, R2
BL	_OLED_write+0
;ssd1306.c,83 :: 		}
L_end_OLED_gotoxy:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_gotoxy
_OLED_fill:
;ssd1306.c,86 :: 		void OLED_fill(unsigned char bmp_data)
; bmp_data start address is: 0 (R0)
SUB	SP, SP, #136
STR	LR, [SP, #0]
; bmp_data end address is: 0 (R0)
; bmp_data start address is: 0 (R0)
;ssd1306.c,88 :: 		unsigned char page = 0x00;
;ssd1306.c,89 :: 		unsigned char x_value = 0x00;
;ssd1306.c,93 :: 		data_value[0] = DAT;
ADD	R2, SP, #4
MOVS	R1, #96
STRB	R1, [R2, #0]
;ssd1306.c,95 :: 		for(x_value = 1; x_value < (x_max + 1); x_value++)
; x_value start address is: 8 (R2)
MOVS	R2, #1
; x_value end address is: 8 (R2)
L_OLED_fill10:
; x_value start address is: 8 (R2)
; bmp_data start address is: 0 (R0)
; bmp_data end address is: 0 (R0)
CMP	R2, #129
IT	CS
BCS	L_OLED_fill11
; bmp_data end address is: 0 (R0)
;ssd1306.c,97 :: 		data_value[x_value] = bmp_data;
; bmp_data start address is: 0 (R0)
ADD	R1, SP, #4
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
;ssd1306.c,95 :: 		for(x_value = 1; x_value < (x_max + 1); x_value++)
ADDS	R2, R2, #1
UXTB	R2, R2
;ssd1306.c,98 :: 		}
; bmp_data end address is: 0 (R0)
; x_value end address is: 8 (R2)
IT	AL
BAL	L_OLED_fill10
L_OLED_fill11:
;ssd1306.c,100 :: 		for(page = 0; page < y_max; page++)
; page start address is: 44 (R11)
MOVW	R11, #0
; page end address is: 44 (R11)
L_OLED_fill13:
; page start address is: 44 (R11)
CMP	R11, #8
IT	CS
BCS	L_OLED_fill14
;ssd1306.c,102 :: 		OLED_gotoxy(x_min, page);
UXTB	R1, R11
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1306.c,104 :: 		I2C1_Start();
BL	_I2C1_Start+0
;ssd1306.c,105 :: 		I2C1_Write(SSD1306_I2C_Address, data_value, (1 + x_max), END_MODE_STOP);
ADD	R1, SP, #4
MOVW	R3, #1
MOVS	R2, #129
MOVS	R0, #60
BL	_I2C1_Write+0
;ssd1306.c,100 :: 		for(page = 0; page < y_max; page++)
ADD	R11, R11, #1
UXTB	R11, R11
;ssd1306.c,106 :: 		}
; page end address is: 44 (R11)
IT	AL
BAL	L_OLED_fill13
L_OLED_fill14:
;ssd1306.c,107 :: 		}
L_end_OLED_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #136
BX	LR
; end of _OLED_fill
_OLED_print_Image:
;ssd1306.c,110 :: 		void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
; pixel start address is: 4 (R1)
; bmp start address is: 0 (R0)
SUB	SP, SP, #140
STR	LR, [SP, #0]
; pixel end address is: 4 (R1)
; bmp end address is: 0 (R0)
; bmp start address is: 0 (R0)
; pixel start address is: 4 (R1)
;ssd1306.c,112 :: 		unsigned char page = 0;
;ssd1306.c,113 :: 		unsigned char x_value = 0x00;
;ssd1306.c,117 :: 		data_value[0] = DAT;
ADD	R3, SP, #8
MOVS	R2, #96
STRB	R2, [R3, #0]
;ssd1306.c,119 :: 		for(x_value = 1; x_value < (x_max + 1); x_value++)
; x_value start address is: 16 (R4)
MOVS	R4, #1
; bmp end address is: 0 (R0)
; pixel end address is: 4 (R1)
; x_value end address is: 16 (R4)
STRB	R1, [SP, #4]
MOV	R1, R0
LDRB	R0, [SP, #4]
L_OLED_print_Image16:
; x_value start address is: 16 (R4)
; bmp start address is: 4 (R1)
; pixel start address is: 0 (R0)
; bmp start address is: 4 (R1)
; bmp end address is: 4 (R1)
CMP	R4, #129
IT	CS
BCS	L_OLED_print_Image17
; bmp end address is: 4 (R1)
;ssd1306.c,121 :: 		data_value[x_value] = (bmp[(x_value - 1)] ^ pixel);
; bmp start address is: 4 (R1)
ADD	R2, SP, #8
ADDS	R3, R2, R4
SUBS	R2, R4, #1
SXTH	R2, R2
ADDS	R2, R1, R2
LDRB	R2, [R2, #0]
EORS	R2, R0
STRB	R2, [R3, #0]
;ssd1306.c,119 :: 		for(x_value = 1; x_value < (x_max + 1); x_value++)
ADDS	R4, R4, #1
UXTB	R4, R4
;ssd1306.c,122 :: 		}
; bmp end address is: 4 (R1)
; x_value end address is: 16 (R4)
IT	AL
BAL	L_OLED_print_Image16
L_OLED_print_Image17:
;ssd1306.c,124 :: 		if(pixel != OFF)
CMP	R0, #0
IT	EQ
BEQ	L_OLED_print_Image19
; pixel end address is: 0 (R0)
;ssd1306.c,127 :: 		}
IT	AL
BAL	L_OLED_print_Image20
L_OLED_print_Image19:
;ssd1306.c,131 :: 		}
L_OLED_print_Image20:
;ssd1306.c,133 :: 		for(page = 0; page < y_max; page++)
; page start address is: 44 (R11)
MOVW	R11, #0
; page end address is: 44 (R11)
L_OLED_print_Image21:
; page start address is: 44 (R11)
CMP	R11, #8
IT	CS
BCS	L_OLED_print_Image22
;ssd1306.c,135 :: 		OLED_gotoxy(x_min, page);
UXTB	R1, R11
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1306.c,137 :: 		I2C1_Start();
BL	_I2C1_Start+0
;ssd1306.c,138 :: 		I2C1_Write(SSD1306_I2C_Address, data_value, (1 + x_max), END_MODE_STOP);
ADD	R2, SP, #8
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #129
MOVS	R0, #60
BL	_I2C1_Write+0
;ssd1306.c,133 :: 		for(page = 0; page < y_max; page++)
ADD	R11, R11, #1
UXTB	R11, R11
;ssd1306.c,139 :: 		}
; page end address is: 44 (R11)
IT	AL
BAL	L_OLED_print_Image21
L_OLED_print_Image22:
;ssd1306.c,140 :: 		}
L_end_OLED_print_Image:
LDR	LR, [SP, #0]
ADD	SP, SP, #140
BX	LR
; end of _OLED_print_Image
_OLED_clear_screen:
;ssd1306.c,143 :: 		void OLED_clear_screen()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1306.c,145 :: 		OLED_fill(0x00);
MOVS	R0, #0
BL	_OLED_fill+0
;ssd1306.c,146 :: 		}
L_end_OLED_clear_screen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_clear_screen
_OLED_clear_buffer:
;ssd1306.c,149 :: 		void OLED_clear_buffer()
;ssd1306.c,151 :: 		unsigned int s = 0x0000;
;ssd1306.c,153 :: 		for(s = 0; s < buffer_size; s++)
; s start address is: 8 (R2)
MOVS	R2, #0
; s end address is: 8 (R2)
L_OLED_clear_buffer24:
; s start address is: 8 (R2)
CMP	R2, #1024
IT	CS
BCS	L_OLED_clear_buffer25
;ssd1306.c,155 :: 		buffer[s] = 0x00;
MOVW	R0, #lo_addr(_buffer+0)
MOVT	R0, #hi_addr(_buffer+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
;ssd1306.c,153 :: 		for(s = 0; s < buffer_size; s++)
ADDS	R2, R2, #1
UXTH	R2, R2
;ssd1306.c,156 :: 		}
; s end address is: 8 (R2)
IT	AL
BAL	L_OLED_clear_buffer24
L_OLED_clear_buffer25:
;ssd1306.c,157 :: 		}
L_end_OLED_clear_buffer:
BX	LR
; end of _OLED_clear_buffer
_OLED_cursor:
;ssd1306.c,160 :: 		void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 44 (R11)
;ssd1306.c,162 :: 		unsigned char s = 0x00;
;ssd1306.c,164 :: 		if(y_pos != 0x00)
CMP	R11, #0
IT	EQ
BEQ	L_OLED_cursor27
;ssd1306.c,166 :: 		if(x_pos == 1)
CMP	R0, #1
IT	NE
BNE	L_OLED_cursor28
; x_pos end address is: 0 (R0)
;ssd1306.c,168 :: 		OLED_gotoxy(0x00, (y_pos + 0x02));
ADD	R2, R11, #2
; y_pos end address is: 44 (R11)
UXTB	R1, R2
MOVS	R0, #0
BL	_OLED_gotoxy+0
;ssd1306.c,169 :: 		}
IT	AL
BAL	L_OLED_cursor29
L_OLED_cursor28:
;ssd1306.c,172 :: 		OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
; y_pos start address is: 44 (R11)
; x_pos start address is: 0 (R0)
ADD	R4, R11, #2
; y_pos end address is: 44 (R11)
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
;ssd1306.c,173 :: 		}
L_OLED_cursor29:
;ssd1306.c,175 :: 		for(s = 0x00; s < 0x06; s++)
; s start address is: 40 (R10)
MOVW	R10, #0
; s end address is: 40 (R10)
L_OLED_cursor30:
; s start address is: 40 (R10)
CMP	R10, #6
IT	CS
BCS	L_OLED_cursor31
;ssd1306.c,177 :: 		OLED_write(0xFF, DAT);
MOVS	R1, #96
MOVS	R0, #255
BL	_OLED_write+0
;ssd1306.c,175 :: 		for(s = 0x00; s < 0x06; s++)
ADD	R10, R10, #1
UXTB	R10, R10
;ssd1306.c,178 :: 		}
; s end address is: 40 (R10)
IT	AL
BAL	L_OLED_cursor30
L_OLED_cursor31:
;ssd1306.c,179 :: 		}
L_OLED_cursor27:
;ssd1306.c,180 :: 		}
L_end_OLED_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_cursor
_OLED_draw_bitmap:
;ssd1306.c,183 :: 		void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
; yb start address is: 4 (R1)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
STRB	R2, [SP, #12]
STRB	R3, [SP, #16]
; yb end address is: 4 (R1)
; yb start address is: 4 (R1)
LDR	R4, [SP, #20]
STR	R4, [SP, #20]
;ssd1306.c,185 :: 		unsigned int s = 0x00;
MOVW	R4, #0
STRH	R4, [SP, #4]
;ssd1306.c,186 :: 		unsigned char x_pos = 0x00;
;ssd1306.c,187 :: 		unsigned char y_pos = 0x00;
;ssd1306.c,189 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
; y_pos start address is: 44 (R11)
UXTB	R11, R1
; yb end address is: 4 (R1)
; y_pos end address is: 44 (R11)
L_OLED_draw_bitmap33:
; y_pos start address is: 44 (R11)
LDRB	R4, [SP, #16]
CMP	R11, R4
IT	HI
BHI	L_OLED_draw_bitmap34
;ssd1306.c,191 :: 		OLED_gotoxy(xb, y_pos);
UXTB	R1, R11
LDRB	R0, [SP, #8]
BL	_OLED_gotoxy+0
;ssd1306.c,192 :: 		for(x_pos = xb; x_pos <= xe; x_pos++)
LDRB	R4, [SP, #8]
STRB	R4, [SP, #6]
; y_pos end address is: 44 (R11)
L_OLED_draw_bitmap36:
; y_pos start address is: 44 (R11)
LDRB	R5, [SP, #12]
LDRB	R4, [SP, #6]
CMP	R4, R5
IT	HI
BHI	L_OLED_draw_bitmap37
;ssd1306.c,194 :: 		OLED_write(bmp_img[s++], DAT);
LDRH	R5, [SP, #4]
LDR	R4, [SP, #20]
ADDS	R4, R4, R5
LDRB	R4, [R4, #0]
MOVS	R1, #96
UXTB	R0, R4
BL	_OLED_write+0
LDRH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
;ssd1306.c,192 :: 		for(x_pos = xb; x_pos <= xe; x_pos++)
LDRB	R4, [SP, #6]
ADDS	R4, R4, #1
STRB	R4, [SP, #6]
;ssd1306.c,195 :: 		}
IT	AL
BAL	L_OLED_draw_bitmap36
L_OLED_draw_bitmap37:
;ssd1306.c,189 :: 		for(y_pos = yb; y_pos <= ye; y_pos++)
ADD	R11, R11, #1
UXTB	R11, R11
;ssd1306.c,196 :: 		}
; y_pos end address is: 44 (R11)
IT	AL
BAL	L_OLED_draw_bitmap33
L_OLED_draw_bitmap34:
;ssd1306.c,197 :: 		}
L_end_OLED_draw_bitmap:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _OLED_draw_bitmap
_OLED_print_char:
;ssd1306.c,200 :: 		void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
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
;ssd1306.c,202 :: 		unsigned char chr = 0x00;
;ssd1306.c,203 :: 		unsigned char s = 0x00;
;ssd1306.c,205 :: 		chr = (ch - 0x20);
SUBW	R3, R2, #32
; ch end address is: 8 (R2)
; chr start address is: 44 (R11)
UXTB	R11, R3
;ssd1306.c,207 :: 		if(x_pos > (x_max - 0x06))
CMP	R0, #122
IT	LS
BLS	L__OLED_print_char145
;ssd1306.c,209 :: 		x_pos = 0x00;
MOVS	R0, #0
;ssd1306.c,210 :: 		y_pos++;
ADDS	R1, R1, #1
UXTB	R1, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
;ssd1306.c,211 :: 		}
IT	AL
BAL	L_OLED_print_char39
L__OLED_print_char145:
;ssd1306.c,207 :: 		if(x_pos > (x_max - 0x06))
;ssd1306.c,211 :: 		}
L_OLED_print_char39:
;ssd1306.c,212 :: 		OLED_gotoxy(x_pos, y_pos);
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1306.c,214 :: 		for(s = 0x00; s < 0x06; s++)
; s start address is: 0 (R0)
MOVS	R0, #0
; chr end address is: 44 (R11)
; s end address is: 0 (R0)
UXTB	R10, R11
UXTB	R11, R0
L_OLED_print_char40:
; s start address is: 44 (R11)
; chr start address is: 40 (R10)
; chr start address is: 40 (R10)
; chr end address is: 40 (R10)
CMP	R11, #6
IT	CS
BCS	L_OLED_print_char41
; chr end address is: 40 (R10)
;ssd1306.c,216 :: 		OLED_write(font_regular[chr][s], DAT);
; chr start address is: 40 (R10)
MOVS	R3, #6
MUL	R4, R3, R10
MOVW	R3, #lo_addr(_font_regular+0)
MOVT	R3, #hi_addr(_font_regular+0)
ADDS	R3, R3, R4
ADD	R3, R3, R11, LSL #0
LDRB	R3, [R3, #0]
MOVS	R1, #96
UXTB	R0, R3
BL	_OLED_write+0
;ssd1306.c,214 :: 		for(s = 0x00; s < 0x06; s++)
ADD	R11, R11, #1
UXTB	R11, R11
;ssd1306.c,217 :: 		}
; chr end address is: 40 (R10)
; s end address is: 44 (R11)
IT	AL
BAL	L_OLED_print_char40
L_OLED_print_char41:
;ssd1306.c,218 :: 		}
L_end_OLED_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _OLED_print_char
_OLED_print_string:
;ssd1306.c,221 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
; s start address is: 8 (R2)
; ch start address is: 8 (R2)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
;ssd1306.c,223 :: 		unsigned char s = 0x00;
;ssd1306.c,221 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
STRB	R1, [SP, #12]
UXTB	R1, R0
;ssd1306.c,223 :: 		unsigned char s = 0x00;
;ssd1306.c,221 :: 		void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
MOV	R0, R2
; s end address is: 8 (R2)
; ch end address is: 8 (R2)
; x_pos end address is: 0 (R0)
; x_pos start address is: 4 (R1)
; ch start address is: 0 (R0)
;ssd1306.c,223 :: 		unsigned char s = 0x00;
; s start address is: 8 (R2)
; s start address is: 8 (R2)
MOVS	R2, #0
; ch end address is: 0 (R0)
; s end address is: 8 (R2)
UXTB	R12, R2
;ssd1306.c,225 :: 		do
L_OLED_print_string43:
;ssd1306.c,227 :: 		OLED_print_char(x_pos, y_pos, ch[s++]);
; s start address is: 48 (R12)
; ch start address is: 0 (R0)
; x_pos start address is: 4 (R1)
ADD	R3, R0, R12, LSL #0
LDRB	R3, [R3, #0]
STRB	R1, [SP, #4]
STR	R0, [SP, #8]
UXTB	R2, R3
UXTB	R0, R1
LDRB	R1, [SP, #12]
BL	_OLED_print_char+0
LDR	R0, [SP, #8]
LDRB	R1, [SP, #4]
ADD	R4, R12, #1
UXTB	R4, R4
; s end address is: 48 (R12)
; s start address is: 8 (R2)
UXTB	R2, R4
; s end address is: 8 (R2)
;ssd1306.c,228 :: 		x_pos += 0x06;
ADDS	R3, R1, #6
UXTB	R1, R3
; x_pos end address is: 4 (R1)
;ssd1306.c,229 :: 		}while((ch[s] >= 0x20) && (ch[s] <= 0x7F));
ADDS	R3, R0, R4
LDRB	R3, [R3, #0]
CMP	R3, #32
IT	CC
BCC	L__OLED_print_string148
; s end address is: 8 (R2)
; x_pos end address is: 4 (R1)
; x_pos start address is: 4 (R1)
; s start address is: 8 (R2)
ADDS	R3, R0, R2
LDRB	R3, [R3, #0]
CMP	R3, #127
IT	HI
BHI	L__OLED_print_string147
; ch end address is: 0 (R0)
; s end address is: 8 (R2)
; x_pos end address is: 4 (R1)
UXTB	R12, R2
IT	AL
BAL	L_OLED_print_string43
L__OLED_print_string148:
L__OLED_print_string147:
;ssd1306.c,230 :: 		}
L_end_OLED_print_string:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _OLED_print_string
_OLED_print_chr:
;ssd1306.c,233 :: 		void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R12, R0
UXTB	R0, R1
SXTH	R1, R2
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 48 (R12)
; y_pos start address is: 0 (R0)
; value start address is: 4 (R1)
;ssd1306.c,235 :: 		unsigned char ch = 0x00;
;ssd1306.c,237 :: 		if(value < 0x00)
CMP	R1, #0
IT	GE
BGE	L_OLED_print_chr48
;ssd1306.c,239 :: 		OLED_print_char(x_pos, y_pos, '-');
STRH	R1, [SP, #4]
STRB	R0, [SP, #8]
MOVS	R2, #45
UXTB	R1, R0
UXTB	R0, R12
BL	_OLED_print_char+0
LDRB	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1306.c,240 :: 		value = -value;
RSBS	R1, R1, #0
SXTH	R1, R1
;ssd1306.c,241 :: 		}
IT	AL
BAL	L_OLED_print_chr49
L_OLED_print_chr48:
;ssd1306.c,244 :: 		OLED_print_char(x_pos, y_pos,' ');
STRH	R1, [SP, #4]
STRB	R0, [SP, #8]
MOVS	R2, #32
UXTB	R1, R0
UXTB	R0, R12
BL	_OLED_print_char+0
; value end address is: 4 (R1)
LDRB	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1306.c,245 :: 		}
L_OLED_print_chr49:
;ssd1306.c,247 :: 		if((value > 99) && (value <= 999))
; value start address is: 4 (R1)
CMP	R1, #99
IT	LE
BLE	L__OLED_print_chr153
MOVW	R3, #999
CMP	R1, R3
IT	GT
BGT	L__OLED_print_chr152
L__OLED_print_chr151:
;ssd1306.c,249 :: 		ch = (value / 100);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R3, R1, R3
;ssd1306.c,250 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STRH	R1, [SP, #4]
STRB	R0, [SP, #8]
UXTB	R2, R4
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1306.c,251 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R4, R1, R3
MLS	R4, R3, R4, R1
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R3, R4, R3
;ssd1306.c,252 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
STRH	R1, [SP, #4]
STRB	R0, [SP, #8]
UXTB	R2, R4
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1306.c,253 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R1, R4
MLS	R3, R4, R3, R1
; value end address is: 4 (R1)
;ssd1306.c,254 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #18
; x_pos end address is: 48 (R12)
UXTB	R2, R4
UXTB	R1, R0
; y_pos end address is: 0 (R0)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,255 :: 		}
IT	AL
BAL	L_OLED_print_chr53
;ssd1306.c,247 :: 		if((value > 99) && (value <= 999))
L__OLED_print_chr153:
; value start address is: 4 (R1)
; y_pos start address is: 0 (R0)
; x_pos start address is: 48 (R12)
L__OLED_print_chr152:
;ssd1306.c,256 :: 		else if((value > 9) && (value <= 99))
CMP	R1, #9
IT	LE
BLE	L__OLED_print_chr155
CMP	R1, #99
IT	GT
BGT	L__OLED_print_chr154
L__OLED_print_chr150:
;ssd1306.c,258 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SXTH	R3, R3
SDIV	R4, R1, R3
MLS	R4, R3, R4, R1
SXTH	R4, R4
MOVS	R3, #10
SXTH	R3, R3
SDIV	R3, R4, R3
;ssd1306.c,259 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STRH	R1, [SP, #4]
STRB	R0, [SP, #8]
UXTB	R2, R4
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #8]
LDRSH	R1, [SP, #4]
;ssd1306.c,260 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R1, R4
MLS	R3, R4, R3, R1
; value end address is: 4 (R1)
;ssd1306.c,261 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
STRB	R0, [SP, #4]
UXTB	R2, R4
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #4]
;ssd1306.c,262 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
ADD	R3, R12, #18
; x_pos end address is: 48 (R12)
MOVS	R2, #32
UXTB	R1, R0
; y_pos end address is: 0 (R0)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,263 :: 		}
IT	AL
BAL	L_OLED_print_chr57
;ssd1306.c,256 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_chr155:
; value start address is: 4 (R1)
; y_pos start address is: 0 (R0)
; x_pos start address is: 48 (R12)
L__OLED_print_chr154:
;ssd1306.c,264 :: 		else if((value >= 0) && (value <= 9))
CMP	R1, #0
IT	LT
BLT	L__OLED_print_chr157
CMP	R1, #9
IT	GT
BGT	L__OLED_print_chr156
L__OLED_print_chr149:
;ssd1306.c,266 :: 		ch = (value % 10);
MOVS	R4, #10
SXTH	R4, R4
SDIV	R3, R1, R4
MLS	R3, R4, R3, R1
; value end address is: 4 (R1)
;ssd1306.c,267 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STRB	R0, [SP, #4]
UXTB	R2, R4
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #4]
;ssd1306.c,268 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
ADD	R3, R12, #12
STRB	R0, [SP, #4]
MOVS	R2, #32
UXTB	R1, R0
UXTB	R0, R3
BL	_OLED_print_char+0
LDRB	R0, [SP, #4]
;ssd1306.c,269 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
ADD	R3, R12, #18
; x_pos end address is: 48 (R12)
MOVS	R2, #32
UXTB	R1, R0
; y_pos end address is: 0 (R0)
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,264 :: 		else if((value >= 0) && (value <= 9))
L__OLED_print_chr157:
L__OLED_print_chr156:
;ssd1306.c,270 :: 		}
L_OLED_print_chr57:
L_OLED_print_chr53:
;ssd1306.c,271 :: 		}
L_end_OLED_print_chr:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OLED_print_chr
_OLED_print_int:
;ssd1306.c,274 :: 		void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
; value start address is: 8 (R2)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R12, R0
MOV	R0, R2
STRB	R1, [SP, #8]
; value end address is: 8 (R2)
; x_pos end address is: 0 (R0)
; x_pos start address is: 48 (R12)
; value start address is: 0 (R0)
;ssd1306.c,276 :: 		unsigned char ch = 0x00;
;ssd1306.c,278 :: 		if(value < 0)
CMP	R0, #0
IT	GE
BGE	L_OLED_print_int61
;ssd1306.c,280 :: 		OLED_print_char(x_pos, y_pos, '-');
STR	R0, [SP, #4]
MOVS	R2, #45
LDRB	R1, [SP, #8]
UXTB	R0, R12
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,281 :: 		value = -value;
RSBS	R3, R0, #0
; value end address is: 0 (R0)
; value start address is: 4 (R1)
MOV	R1, R3
;ssd1306.c,282 :: 		}
MOV	R0, R1
; value end address is: 4 (R1)
IT	AL
BAL	L_OLED_print_int62
L_OLED_print_int61:
;ssd1306.c,285 :: 		OLED_print_char(x_pos, y_pos,' ');
; value start address is: 0 (R0)
STR	R0, [SP, #4]
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R12
BL	_OLED_print_char+0
; value end address is: 0 (R0)
LDR	R0, [SP, #4]
;ssd1306.c,286 :: 		}
L_OLED_print_int62:
;ssd1306.c,288 :: 		if(value > 9999)
; value start address is: 0 (R0)
MOVW	R3, #9999
CMP	R0, R3
IT	LE
BLE	L_OLED_print_int63
;ssd1306.c,290 :: 		ch = (value / 10000);
MOVW	R3, #10000
SDIV	R3, R0, R3
;ssd1306.c,291 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,293 :: 		ch = ((value % 10000)/ 1000);
MOVW	R3, #10000
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVW	R3, #1000
SDIV	R3, R4, R3
;ssd1306.c,294 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,296 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1306.c,297 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #18
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,299 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1306.c,300 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #24
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,302 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R0, R4
MLS	R3, R4, R3, R0
; value end address is: 0 (R0)
;ssd1306.c,303 :: 		OLED_print_char((x_pos + 30), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #30
; x_pos end address is: 48 (R12)
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,304 :: 		}
IT	AL
BAL	L_OLED_print_int64
L_OLED_print_int63:
;ssd1306.c,306 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 0 (R0)
; x_pos start address is: 48 (R12)
MOVW	R3, #999
CMP	R0, R3
IT	LE
BLE	L__OLED_print_int162
MOVW	R3, #9999
CMP	R0, R3
IT	GT
BGT	L__OLED_print_int161
L__OLED_print_int160:
;ssd1306.c,308 :: 		ch = ((value % 10000)/ 1000);
MOVW	R3, #10000
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVW	R3, #1000
SDIV	R3, R4, R3
;ssd1306.c,309 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,311 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1306.c,312 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,314 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1306.c,315 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #18
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,317 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R0, R4
MLS	R3, R4, R3, R0
; value end address is: 0 (R0)
;ssd1306.c,318 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #24
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,319 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
ADD	R3, R12, #30
; x_pos end address is: 48 (R12)
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,320 :: 		}
IT	AL
BAL	L_OLED_print_int68
;ssd1306.c,306 :: 		else if((value > 999) && (value <= 9999))
L__OLED_print_int162:
; value start address is: 0 (R0)
; x_pos start address is: 48 (R12)
L__OLED_print_int161:
;ssd1306.c,321 :: 		else if((value > 99) && (value <= 999))
CMP	R0, #99
IT	LE
BLE	L__OLED_print_int164
MOVW	R3, #999
CMP	R0, R3
IT	GT
BGT	L__OLED_print_int163
L__OLED_print_int159:
;ssd1306.c,323 :: 		ch = ((value % 1000) / 100);
MOVW	R3, #1000
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #100
SDIV	R3, R4, R3
;ssd1306.c,324 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,326 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1306.c,327 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,329 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R0, R4
MLS	R3, R4, R3, R0
; value end address is: 0 (R0)
;ssd1306.c,330 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #18
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,331 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
ADD	R3, R12, #24
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,332 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
ADD	R3, R12, #30
; x_pos end address is: 48 (R12)
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,333 :: 		}
IT	AL
BAL	L_OLED_print_int72
;ssd1306.c,321 :: 		else if((value > 99) && (value <= 999))
L__OLED_print_int164:
; value start address is: 0 (R0)
; x_pos start address is: 48 (R12)
L__OLED_print_int163:
;ssd1306.c,334 :: 		else if((value > 9) && (value <= 99))
CMP	R0, #9
IT	LE
BLE	L__OLED_print_int166
CMP	R0, #99
IT	GT
BGT	L__OLED_print_int165
L__OLED_print_int158:
;ssd1306.c,336 :: 		ch = ((value % 100) / 10);
MOVS	R3, #100
SDIV	R4, R0, R3
MLS	R4, R3, R4, R0
MOVS	R3, #10
SDIV	R3, R4, R3
;ssd1306.c,337 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
STR	R0, [SP, #4]
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
LDR	R0, [SP, #4]
;ssd1306.c,339 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R0, R4
MLS	R3, R4, R3, R0
; value end address is: 0 (R0)
;ssd1306.c,340 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #12
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,342 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
ADD	R3, R12, #18
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,343 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
ADD	R3, R12, #24
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,344 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
ADD	R3, R12, #30
; x_pos end address is: 48 (R12)
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,345 :: 		}
IT	AL
BAL	L_OLED_print_int76
;ssd1306.c,334 :: 		else if((value > 9) && (value <= 99))
L__OLED_print_int166:
; value start address is: 0 (R0)
; x_pos start address is: 48 (R12)
L__OLED_print_int165:
;ssd1306.c,348 :: 		ch = (value % 10);
MOVS	R4, #10
SDIV	R3, R0, R4
MLS	R3, R4, R3, R0
; value end address is: 0 (R0)
;ssd1306.c,349 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R3, R3
ADDW	R4, R3, #48
ADD	R3, R12, #6
UXTB	R2, R4
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,350 :: 		OLED_print_char((x_pos + 12), y_pos , 32);
ADD	R3, R12, #12
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,351 :: 		OLED_print_char((x_pos + 18), y_pos , 32);
ADD	R3, R12, #18
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,352 :: 		OLED_print_char((x_pos + 24), y_pos , 32);
ADD	R3, R12, #24
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,353 :: 		OLED_print_char((x_pos + 30), y_pos , 32);
ADD	R3, R12, #30
; x_pos end address is: 48 (R12)
MOVS	R2, #32
LDRB	R1, [SP, #8]
UXTB	R0, R3
BL	_OLED_print_char+0
;ssd1306.c,354 :: 		}
L_OLED_print_int76:
L_OLED_print_int72:
L_OLED_print_int68:
L_OLED_print_int64:
;ssd1306.c,355 :: 		}
L_end_OLED_print_int:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _OLED_print_int
_OLED_print_decimal:
;ssd1306.c,358 :: 		void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
UXTB	R12, R0
STRB	R1, [SP, #4]
STRH	R2, [SP, #8]
STRB	R3, [SP, #12]
; x_pos end address is: 0 (R0)
; x_pos start address is: 48 (R12)
;ssd1306.c,360 :: 		unsigned char ch = 0x00;
;ssd1306.c,362 :: 		OLED_print_char(x_pos, y_pos, '.');
MOVS	R2, #46
LDRB	R1, [SP, #4]
UXTB	R0, R12
BL	_OLED_print_char+0
;ssd1306.c,364 :: 		ch = (value / 1000);
LDRH	R5, [SP, #8]
MOVW	R4, #1000
UDIV	R4, R5, R4
;ssd1306.c,365 :: 		OLED_print_char((x_pos + 6), y_pos , (48 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADD	R4, R12, #6
UXTB	R2, R5
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,367 :: 		if(points > 1)
LDRB	R4, [SP, #12]
CMP	R4, #1
IT	LS
BLS	L_OLED_print_decimal77
;ssd1306.c,369 :: 		ch = ((value % 1000) / 100);
LDRH	R6, [SP, #8]
MOVW	R4, #1000
UDIV	R5, R6, R4
MLS	R5, R4, R5, R6
UXTH	R5, R5
MOVS	R4, #100
UDIV	R4, R5, R4
;ssd1306.c,370 :: 		OLED_print_char((x_pos + 12), y_pos , (48 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADD	R4, R12, #12
UXTB	R2, R5
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,371 :: 		OLED_print_char((x_pos + 18), y_pos , 0x20);
ADD	R4, R12, #18
MOVS	R2, #32
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,373 :: 		if(points > 2)
LDRB	R4, [SP, #12]
CMP	R4, #2
IT	LS
BLS	L_OLED_print_decimal78
;ssd1306.c,375 :: 		ch = ((value % 100) / 10);
LDRH	R6, [SP, #8]
MOVS	R4, #100
UDIV	R5, R6, R4
MLS	R5, R4, R5, R6
UXTH	R5, R5
MOVS	R4, #10
UDIV	R4, R5, R4
;ssd1306.c,376 :: 		OLED_print_char((x_pos + 18), y_pos , (48 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADD	R4, R12, #18
UXTB	R2, R5
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,377 :: 		OLED_print_char((x_pos + 24), y_pos , 0x20);
ADD	R4, R12, #24
MOVS	R2, #32
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,379 :: 		if(points > 3)
LDRB	R4, [SP, #12]
CMP	R4, #3
IT	LS
BLS	L_OLED_print_decimal79
;ssd1306.c,381 :: 		ch = (value % 10);
LDRH	R6, [SP, #8]
MOVS	R5, #10
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
;ssd1306.c,382 :: 		OLED_print_char((x_pos + 24), y_pos , (48 + ch));
UXTB	R4, R4
ADDW	R5, R4, #48
ADD	R4, R12, #24
UXTB	R2, R5
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,383 :: 		OLED_print_char((x_pos + 30), y_pos , 0x20);
ADD	R4, R12, #30
; x_pos end address is: 48 (R12)
MOVS	R2, #32
LDRB	R1, [SP, #4]
UXTB	R0, R4
BL	_OLED_print_char+0
;ssd1306.c,384 :: 		}
L_OLED_print_decimal79:
;ssd1306.c,385 :: 		}
L_OLED_print_decimal78:
;ssd1306.c,386 :: 		}
L_OLED_print_decimal77:
;ssd1306.c,387 :: 		}
L_end_OLED_print_decimal:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _OLED_print_decimal
_OLED_print_float:
;ssd1306.c,390 :: 		void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
; points start address is: 8 (R2)
; value start address is: 0 (R0)
; y_pos start address is: 4 (R1)
SUB	SP, SP, #20
STR	LR, [SP, #0]
; x_pos start address is: 0 (R0)
VMOV.F32	S2, S0
; points end address is: 8 (R2)
; value end address is: 0 (R0)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; value start address is: 8 (R2)
; points start address is: 8 (R2)
;ssd1306.c,392 :: 		signed long tmp = 0x00;
;ssd1306.c,394 :: 		tmp = value;
VCVT	#1, .F32, S0, S2
VMOV	R3, S0
; tmp start address is: 16 (R4)
MOV	R4, R3
;ssd1306.c,395 :: 		OLED_print_int(x_pos, y_pos, tmp);
STR	R4, [SP, #4]
STRB	R2, [SP, #8]
STRB	R1, [SP, #12]
STRB	R0, [SP, #16]
MOV	R2, R3
BL	_OLED_print_int+0
LDRB	R0, [SP, #16]
LDRB	R1, [SP, #12]
LDRB	R2, [SP, #8]
LDR	R4, [SP, #4]
;ssd1306.c,396 :: 		tmp = ((value - tmp) * 10000);
VMOV	S0, R4
VCVT.F32	#1, S0, S0
; tmp end address is: 16 (R4)
VSUB.F32	S1, S2, S0
MOVW	R3, #16384
MOVT	R3, #17948
VMOV	S0, R3
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
; tmp start address is: 16 (R4)
MOV	R4, R3
;ssd1306.c,398 :: 		if(tmp < 0)
CMP	R3, #0
IT	GE
BGE	L__OLED_print_float179
;ssd1306.c,400 :: 		tmp = -tmp;
RSBS	R4, R4, #0
; tmp end address is: 16 (R4)
;ssd1306.c,401 :: 		}
IT	AL
BAL	L_OLED_print_float80
L__OLED_print_float179:
;ssd1306.c,398 :: 		if(tmp < 0)
;ssd1306.c,401 :: 		}
L_OLED_print_float80:
;ssd1306.c,403 :: 		if((value >= 10000) && (value < 100000))
; tmp start address is: 16 (R4)
MOVW	R3, #16384
MOVT	R3, #17948
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__OLED_print_float172
MOVW	R3, #20480
MOVT	R3, #18371
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__OLED_print_float171
; value end address is: 8 (R2)
L__OLED_print_float170:
;ssd1306.c,405 :: 		OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
ADDW	R3, R0, #36
; x_pos end address is: 0 (R0)
; points end address is: 8 (R2)
UXTB	R0, R3
; tmp end address is: 16 (R4)
UXTB	R3, R2
; y_pos end address is: 4 (R1)
UXTH	R2, R4
BL	_OLED_print_decimal+0
;ssd1306.c,406 :: 		}
IT	AL
BAL	L_OLED_print_float84
;ssd1306.c,403 :: 		if((value >= 10000) && (value < 100000))
L__OLED_print_float172:
; tmp start address is: 16 (R4)
; points start address is: 8 (R2)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__OLED_print_float171:
;ssd1306.c,407 :: 		else if((value >= 1000) && (value < 10000))
MOVW	R3, #0
MOVT	R3, #17530
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__OLED_print_float174
MOVW	R3, #16384
MOVT	R3, #17948
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__OLED_print_float173
; value end address is: 8 (R2)
L__OLED_print_float169:
;ssd1306.c,409 :: 		OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
ADDW	R3, R0, #30
; x_pos end address is: 0 (R0)
; points end address is: 8 (R2)
UXTB	R0, R3
; tmp end address is: 16 (R4)
UXTB	R3, R2
; y_pos end address is: 4 (R1)
UXTH	R2, R4
BL	_OLED_print_decimal+0
;ssd1306.c,410 :: 		}
IT	AL
BAL	L_OLED_print_float88
;ssd1306.c,407 :: 		else if((value >= 1000) && (value < 10000))
L__OLED_print_float174:
; tmp start address is: 16 (R4)
; points start address is: 8 (R2)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__OLED_print_float173:
;ssd1306.c,411 :: 		else if((value >= 100) && (value < 1000))
MOVW	R3, #0
MOVT	R3, #17096
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__OLED_print_float176
MOVW	R3, #0
MOVT	R3, #17530
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__OLED_print_float175
; value end address is: 8 (R2)
L__OLED_print_float168:
;ssd1306.c,413 :: 		OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
ADDW	R3, R0, #24
; x_pos end address is: 0 (R0)
; points end address is: 8 (R2)
UXTB	R0, R3
; tmp end address is: 16 (R4)
UXTB	R3, R2
; y_pos end address is: 4 (R1)
UXTH	R2, R4
BL	_OLED_print_decimal+0
;ssd1306.c,414 :: 		}
IT	AL
BAL	L_OLED_print_float92
;ssd1306.c,411 :: 		else if((value >= 100) && (value < 1000))
L__OLED_print_float176:
; tmp start address is: 16 (R4)
; points start address is: 8 (R2)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__OLED_print_float175:
;ssd1306.c,415 :: 		else if((value >= 10) && (value < 100))
VMOV.F32	S0, #10
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__OLED_print_float178
MOVW	R3, #0
MOVT	R3, #17096
VMOV	S0, R3
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__OLED_print_float177
; value end address is: 8 (R2)
L__OLED_print_float167:
;ssd1306.c,417 :: 		OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
ADDW	R3, R0, #18
; x_pos end address is: 0 (R0)
; points end address is: 8 (R2)
UXTB	R0, R3
; tmp end address is: 16 (R4)
UXTB	R3, R2
; y_pos end address is: 4 (R1)
UXTH	R2, R4
BL	_OLED_print_decimal+0
;ssd1306.c,418 :: 		}
IT	AL
BAL	L_OLED_print_float96
;ssd1306.c,415 :: 		else if((value >= 10) && (value < 100))
L__OLED_print_float178:
; tmp start address is: 16 (R4)
; points start address is: 8 (R2)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__OLED_print_float177:
;ssd1306.c,419 :: 		else if(value < 10)
VMOV.F32	S0, #10
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_OLED_print_float97
;ssd1306.c,421 :: 		OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
ADDW	R3, R0, #12
STRB	R1, [SP, #4]
; points end address is: 8 (R2)
STRB	R0, [SP, #8]
UXTB	R0, R3
; tmp end address is: 16 (R4)
UXTB	R3, R2
UXTH	R2, R4
BL	_OLED_print_decimal+0
LDRB	R0, [SP, #8]
LDRB	R1, [SP, #4]
;ssd1306.c,422 :: 		if(value < 0)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_OLED_print_float98
; value end address is: 8 (R2)
;ssd1306.c,424 :: 		OLED_print_char(x_pos, y_pos, '-');
MOVS	R2, #45
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_print_char+0
;ssd1306.c,425 :: 		}
IT	AL
BAL	L_OLED_print_float99
L_OLED_print_float98:
;ssd1306.c,428 :: 		OLED_print_char(x_pos, y_pos, ' ');
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
MOVS	R2, #32
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_print_char+0
;ssd1306.c,429 :: 		}
L_OLED_print_float99:
;ssd1306.c,430 :: 		}
L_OLED_print_float97:
L_OLED_print_float96:
L_OLED_print_float92:
L_OLED_print_float88:
L_OLED_print_float84:
;ssd1306.c,431 :: 		}
L_end_OLED_print_float:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _OLED_print_float
_Draw_Pixel:
;ssd1306.c,434 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
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
;ssd1306.c,436 :: 		unsigned char value = 0x00;
;ssd1306.c,437 :: 		unsigned char page = 0x00;
;ssd1306.c,438 :: 		unsigned char bit_pos = 0x00;
;ssd1306.c,440 :: 		page = (y_pos / y_max);
LSRS	R4, R5, #3
UXTB	R4, R4
; page start address is: 4 (R1)
UXTB	R1, R4
;ssd1306.c,441 :: 		bit_pos = (y_pos - (page * y_max));
LSLS	R3, R4, #3
SXTH	R3, R3
SUB	R3, R5, R3
; y_pos end address is: 20 (R5)
; bit_pos start address is: 20 (R5)
UXTB	R5, R3
;ssd1306.c,442 :: 		value = buffer[((page * x_max) + x_pos)];
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
;ssd1306.c,444 :: 		if((colour & YES) != NO)
AND	R3, R2, #1
UXTB	R3, R3
; colour end address is: 8 (R2)
CMP	R3, #0
IT	EQ
BEQ	L_Draw_Pixel100
;ssd1306.c,446 :: 		value |= (1 << bit_pos);
MOVS	R3, #1
SXTH	R3, R3
LSLS	R3, R5
SXTH	R3, R3
; bit_pos end address is: 20 (R5)
ORR	R3, R4, R3, LSL #0
; value end address is: 16 (R4)
; value start address is: 44 (R11)
UXTB	R11, R3
;ssd1306.c,447 :: 		}
; value end address is: 44 (R11)
IT	AL
BAL	L_Draw_Pixel101
L_Draw_Pixel100:
;ssd1306.c,450 :: 		value &= (~(1 << bit_pos));
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
; value start address is: 44 (R11)
UXTB	R11, R3
; value end address is: 44 (R11)
;ssd1306.c,451 :: 		}
L_Draw_Pixel101:
;ssd1306.c,453 :: 		buffer[((page * x_max) + x_pos)] = value;
; value start address is: 44 (R11)
LSLS	R3, R1, #7
SXTH	R3, R3
ADDS	R4, R3, R0
SXTH	R4, R4
MOVW	R3, #lo_addr(_buffer+0)
MOVT	R3, #hi_addr(_buffer+0)
ADDS	R3, R3, R4
STRB	R11, [R3, #0]
;ssd1306.c,454 :: 		OLED_gotoxy(x_pos, page);
; page end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_OLED_gotoxy+0
;ssd1306.c,455 :: 		OLED_write(value, DAT);
MOVS	R1, #96
UXTB	R0, R11
; value end address is: 44 (R11)
BL	_OLED_write+0
;ssd1306.c,456 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;ssd1306.c,459 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
; x1 start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
SXTH	R12, R0
STRH	R1, [SP, #16]
STRH	R2, [SP, #20]
STRH	R3, [SP, #24]
; x1 end address is: 0 (R0)
; x1 start address is: 48 (R12)
LDRB	R4, [SP, #28]
STRB	R4, [SP, #28]
;ssd1306.c,461 :: 		signed int dx = 0x0000;
;ssd1306.c,462 :: 		signed int dy = 0x0000;
;ssd1306.c,463 :: 		signed int stepx = 0x0000;
;ssd1306.c,464 :: 		signed int stepy = 0x0000;
;ssd1306.c,465 :: 		signed int fraction = 0x0000;
;ssd1306.c,467 :: 		dy = (y2 - y1);
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #24]
SUB	R5, R4, R5
SXTH	R5, R5
; dy start address is: 32 (R8)
SXTH	R8, R5
;ssd1306.c,468 :: 		dx = (x2 - x1);
LDRSH	R4, [SP, #20]
SUB	R4, R4, R12, LSL #0
STRH	R4, [SP, #8]
;ssd1306.c,470 :: 		if (dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line102
;ssd1306.c,472 :: 		dy = -dy;
RSB	R0, R8, #0
SXTH	R0, R0
; dy end address is: 32 (R8)
; dy start address is: 0 (R0)
;ssd1306.c,473 :: 		stepy = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #12]
;ssd1306.c,474 :: 		}
; dy end address is: 0 (R0)
IT	AL
BAL	L_Draw_Line103
L_Draw_Line102:
;ssd1306.c,477 :: 		stepy = 1;
; dy start address is: 32 (R8)
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #12]
; dy end address is: 32 (R8)
SXTH	R0, R8
;ssd1306.c,478 :: 		}
L_Draw_Line103:
;ssd1306.c,480 :: 		if (dx < 0)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #8]
CMP	R4, #0
IT	GE
BGE	L_Draw_Line104
;ssd1306.c,482 :: 		dx = -dx;
LDRSH	R4, [SP, #8]
RSBS	R4, R4, #0
STRH	R4, [SP, #8]
;ssd1306.c,483 :: 		stepx = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #10]
;ssd1306.c,484 :: 		}
IT	AL
BAL	L_Draw_Line105
L_Draw_Line104:
;ssd1306.c,487 :: 		stepx = 1;
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #10]
;ssd1306.c,488 :: 		}
L_Draw_Line105:
;ssd1306.c,490 :: 		dx <<= 1;
LDRSH	R4, [SP, #8]
LSLS	R4, R4, #1
STRH	R4, [SP, #8]
;ssd1306.c,491 :: 		dy <<= 1;
LSLS	R0, R0, #1
SXTH	R0, R0
;ssd1306.c,493 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
LDRB	R2, [SP, #28]
LDRSH	R1, [SP, #16]
UXTB	R0, R12
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ssd1306.c,495 :: 		if(dx > dy)
LDRSH	R4, [SP, #8]
CMP	R4, R0
IT	LE
BLE	L_Draw_Line106
;ssd1306.c,497 :: 		fraction = (dy - (dx >> 1));
LDRSH	R4, [SP, #8]
ASRS	R4, R4, #1
SXTH	R4, R4
SUB	R4, R0, R4
STRH	R4, [SP, #14]
; x1 end address is: 48 (R12)
SXTH	R1, R12
;ssd1306.c,498 :: 		while (x1 != x2)
L_Draw_Line107:
; dy start address is: 0 (R0)
; dy end address is: 0 (R0)
; x1 start address is: 4 (R1)
LDRSH	R4, [SP, #20]
CMP	R1, R4
IT	EQ
BEQ	L_Draw_Line108
; dy end address is: 0 (R0)
;ssd1306.c,500 :: 		if(fraction >= 0)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #14]
CMP	R4, #0
IT	LT
BLT	L_Draw_Line109
;ssd1306.c,502 :: 		y1 += stepy;
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #16]
ADDS	R4, R4, R5
STRH	R4, [SP, #16]
;ssd1306.c,503 :: 		fraction -= dx;
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #14]
SUB	R4, R4, R5
STRH	R4, [SP, #14]
;ssd1306.c,504 :: 		}
L_Draw_Line109:
;ssd1306.c,506 :: 		x1 += stepx;
LDRSH	R4, [SP, #10]
ADDS	R5, R1, R4
; x1 end address is: 4 (R1)
; x1 start address is: 48 (R12)
SXTH	R12, R5
;ssd1306.c,507 :: 		fraction += dy;
LDRSH	R4, [SP, #14]
ADDS	R4, R4, R0
STRH	R4, [SP, #14]
;ssd1306.c,509 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
LDRB	R2, [SP, #28]
LDRSH	R1, [SP, #16]
UXTB	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ssd1306.c,510 :: 		}
SXTH	R1, R12
; dy end address is: 0 (R0)
; x1 end address is: 48 (R12)
IT	AL
BAL	L_Draw_Line107
L_Draw_Line108:
;ssd1306.c,511 :: 		}
IT	AL
BAL	L_Draw_Line110
L_Draw_Line106:
;ssd1306.c,514 :: 		fraction = (dx - (dy >> 1));
; x1 start address is: 48 (R12)
; dy start address is: 0 (R0)
ASRS	R5, R0, #1
SXTH	R5, R5
LDRSH	R4, [SP, #8]
SUB	R4, R4, R5
STRH	R4, [SP, #14]
; x1 end address is: 48 (R12)
;ssd1306.c,515 :: 		while (y1 != y2)
L_Draw_Line111:
; dy start address is: 0 (R0)
; dy end address is: 0 (R0)
; x1 start address is: 48 (R12)
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #16]
CMP	R4, R5
IT	EQ
BEQ	L_Draw_Line112
; dy end address is: 0 (R0)
;ssd1306.c,517 :: 		if (fraction >= 0)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #14]
CMP	R4, #0
IT	LT
BLT	L__Draw_Line180
;ssd1306.c,519 :: 		x1 += stepx;
LDRSH	R4, [SP, #10]
ADD	R4, R12, R4, LSL #0
; x1 end address is: 48 (R12)
; x1 start address is: 36 (R9)
SXTH	R9, R4
;ssd1306.c,520 :: 		fraction -= dy;
LDRSH	R4, [SP, #14]
SUB	R4, R4, R0
STRH	R4, [SP, #14]
; x1 end address is: 36 (R9)
SXTH	R1, R9
;ssd1306.c,521 :: 		}
IT	AL
BAL	L_Draw_Line113
L__Draw_Line180:
;ssd1306.c,517 :: 		if (fraction >= 0)
SXTH	R1, R12
;ssd1306.c,521 :: 		}
L_Draw_Line113:
;ssd1306.c,523 :: 		y1 += stepy;
; x1 start address is: 4 (R1)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
STRH	R6, [SP, #16]
;ssd1306.c,524 :: 		fraction += dx;
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #14]
ADDS	R4, R4, R5
STRH	R4, [SP, #14]
;ssd1306.c,526 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #6]
LDRB	R2, [SP, #28]
UXTB	R0, R1
UXTB	R1, R6
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R1, [SP, #4]
;ssd1306.c,527 :: 		}
SXTH	R12, R1
; dy end address is: 0 (R0)
; x1 end address is: 4 (R1)
IT	AL
BAL	L_Draw_Line111
L_Draw_Line112:
;ssd1306.c,528 :: 		}
L_Draw_Line110:
;ssd1306.c,529 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _Draw_Line
_Draw_Rectangle:
;ssd1306.c,532 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
STRH	R2, [SP, #16]
STRH	R3, [SP, #20]
; fill start address is: 0 (R0)
LDRB	R0, [SP, #24]
LDRB	R4, [SP, #28]
STRB	R4, [SP, #28]
LDRB	R4, [SP, #32]
STRB	R4, [SP, #32]
;ssd1306.c,534 :: 		unsigned short i = 0x00;
;ssd1306.c,535 :: 		unsigned short xmin = 0x00;
;ssd1306.c,536 :: 		unsigned short xmax = 0x00;
;ssd1306.c,537 :: 		unsigned short ymin = 0x00;
;ssd1306.c,538 :: 		unsigned short ymax = 0x00;
;ssd1306.c,540 :: 		if(fill != NO)
CMP	R0, #0
IT	EQ
BEQ	L_Draw_Rectangle114
; fill end address is: 0 (R0)
;ssd1306.c,542 :: 		if(x1 < x2)
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle115
;ssd1306.c,544 :: 		xmin = x1;
LDRSH	R4, [SP, #8]
STRB	R4, [SP, #4]
;ssd1306.c,545 :: 		xmax = x2;
LDRSH	R4, [SP, #16]
STRB	R4, [SP, #5]
;ssd1306.c,546 :: 		}
IT	AL
BAL	L_Draw_Rectangle116
L_Draw_Rectangle115:
;ssd1306.c,549 :: 		xmin = x2;
LDRSH	R4, [SP, #16]
STRB	R4, [SP, #4]
;ssd1306.c,550 :: 		xmax = x1;
LDRSH	R4, [SP, #8]
STRB	R4, [SP, #5]
;ssd1306.c,551 :: 		}
L_Draw_Rectangle116:
;ssd1306.c,553 :: 		if(y1 < y2)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle117
;ssd1306.c,555 :: 		ymin = y1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #6]
;ssd1306.c,556 :: 		ymax = y2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #7]
;ssd1306.c,557 :: 		}
IT	AL
BAL	L_Draw_Rectangle118
L_Draw_Rectangle117:
;ssd1306.c,560 :: 		ymin = y2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #6]
;ssd1306.c,561 :: 		ymax = y1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #7]
;ssd1306.c,562 :: 		}
L_Draw_Rectangle118:
;ssd1306.c,564 :: 		for(; xmin <= xmax; ++xmin)
L_Draw_Rectangle119:
LDRB	R5, [SP, #5]
LDRB	R4, [SP, #4]
CMP	R4, R5
IT	HI
BHI	L_Draw_Rectangle120
;ssd1306.c,566 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 48 (R12)
LDRB	R12, [SP, #6]
; i end address is: 48 (R12)
L_Draw_Rectangle122:
; i start address is: 48 (R12)
LDRB	R4, [SP, #7]
CMP	R12, R4
IT	HI
BHI	L_Draw_Rectangle123
;ssd1306.c,568 :: 		Draw_Pixel(xmin, i, colour);
LDRB	R2, [SP, #28]
UXTB	R1, R12
LDRB	R0, [SP, #4]
BL	_Draw_Pixel+0
;ssd1306.c,566 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R12, #1
; i end address is: 48 (R12)
; i start address is: 0 (R0)
UXTB	R0, R4
;ssd1306.c,569 :: 		}
UXTB	R12, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_Draw_Rectangle122
L_Draw_Rectangle123:
;ssd1306.c,564 :: 		for(; xmin <= xmax; ++xmin)
LDRB	R4, [SP, #4]
ADDS	R4, R4, #1
STRB	R4, [SP, #4]
;ssd1306.c,570 :: 		}
IT	AL
BAL	L_Draw_Rectangle119
L_Draw_Rectangle120:
;ssd1306.c,571 :: 		}
IT	AL
BAL	L_Draw_Rectangle125
L_Draw_Rectangle114:
;ssd1306.c,575 :: 		Draw_Line(x1, y1, x2, y1, colour);
LDRB	R4, [SP, #28]
LDRSH	R3, [SP, #12]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,576 :: 		Draw_Line(x1, y2, x2, y2, colour);
LDRB	R4, [SP, #28]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,577 :: 		Draw_Line(x1, y1, x1, y2, colour);
LDRB	R4, [SP, #28]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #8]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,578 :: 		Draw_Line(x2, y1, x2, y2, colour);
LDRB	R4, [SP, #28]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,579 :: 		}
L_Draw_Rectangle125:
;ssd1306.c,581 :: 		if(type != SQUARE)
LDRB	R4, [SP, #32]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle126
;ssd1306.c,583 :: 		Draw_Pixel(x1, y1, ~colour);
LDRB	R4, [SP, #28]
MVN	R4, R4
UXTB	R2, R4
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;ssd1306.c,584 :: 		Draw_Pixel(x1, y2, ~colour);
LDRB	R4, [SP, #28]
MVN	R4, R4
UXTB	R2, R4
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;ssd1306.c,585 :: 		Draw_Pixel(x2, y1, ~colour);
LDRB	R4, [SP, #28]
MVN	R4, R4
UXTB	R2, R4
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;ssd1306.c,586 :: 		Draw_Pixel(x2, y2, ~colour);
LDRB	R4, [SP, #28]
MVN	R4, R4
UXTB	R2, R4
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;ssd1306.c,587 :: 		}
L_Draw_Rectangle126:
;ssd1306.c,588 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Rectangle
_Draw_Circle:
;ssd1306.c,591 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
; radius start address is: 8 (R2)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R0, [SP, #12]
SXTH	R0, R2
STRH	R1, [SP, #16]
STRB	R3, [SP, #20]
; radius end address is: 8 (R2)
; radius start address is: 0 (R0)
LDRB	R4, [SP, #24]
STRB	R4, [SP, #24]
;ssd1306.c,593 :: 		signed int a = 0x0000;
MOVW	R4, #0
STRH	R4, [SP, #4]
;ssd1306.c,594 :: 		signed int b = 0x0000;
;ssd1306.c,595 :: 		signed int P = 0x0000;
;ssd1306.c,597 :: 		b = radius;
STRH	R0, [SP, #6]
;ssd1306.c,598 :: 		P = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #8]
;ssd1306.c,600 :: 		do
L_Draw_Circle127:
;ssd1306.c,602 :: 		if(fill != NO)
LDRB	R4, [SP, #20]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Circle130
;ssd1306.c,604 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R7, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,605 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R7, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,606 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R7, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,607 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
LDRB	R8, [SP, #24]
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R7, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1306.c,608 :: 		}
IT	AL
BAL	L_Draw_Circle131
L_Draw_Circle130:
;ssd1306.c,611 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,612 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,613 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,614 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,615 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,616 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,617 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,618 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRB	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
;ssd1306.c,619 :: 		}
L_Draw_Circle131:
;ssd1306.c,621 :: 		if(P < 0)
LDRSH	R4, [SP, #8]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle132
;ssd1306.c,623 :: 		P += (3 + (2 * a++));
LDRSH	R4, [SP, #4]
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #3
SXTH	R5, R5
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
LDRSH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
;ssd1306.c,624 :: 		}
IT	AL
BAL	L_Draw_Circle133
L_Draw_Circle132:
;ssd1306.c,627 :: 		P += (5 + (2 * ((a++) - (b--))));
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
SUB	R4, R4, R5
SXTH	R4, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #5
SXTH	R5, R5
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
LDRSH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
LDRSH	R4, [SP, #6]
SUBS	R4, R4, #1
STRH	R4, [SP, #6]
;ssd1306.c,628 :: 		}
L_Draw_Circle133:
;ssd1306.c,629 :: 		}while(a <= b);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_Circle127
;ssd1306.c,630 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_main:
;Temp.c,13 :: 		void main()
SUB	SP, SP, #12
;Temp.c,15 :: 		float t_diff = 0.0;
;Temp.c,16 :: 		float t_new = 0.0;
;Temp.c,17 :: 		float t_old = 0.0;
; t_old start address is: 8 (R2)
MOV	R0, #0
VMOV	S2, R0
;Temp.c,19 :: 		setup_mcu();
BL	_setup_mcu+0
;Temp.c,20 :: 		background_layer();
BL	_background_layer+0
; t_old end address is: 8 (R2)
;Temp.c,22 :: 		while(1)
L_main134:
;Temp.c,24 :: 		t_new = get_temp();
; t_old start address is: 8 (R2)
BL	_get_temp+0
; t_new start address is: 12 (R3)
VMOV.F32	S3, S0
;Temp.c,26 :: 		if((t_new != t_old) && ((t_new >= 0) && (t_new <= 100)))
VCMPE.F32	S0, S2
VMRS	#60, FPSCR
IT	EQ
BEQ	L__main188
VCMPE.F32	S3, #0
VMRS	#60, FPSCR
IT	LT
BLT	L__main186
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VCMPE.F32	S3, S0
VMRS	#60, FPSCR
IT	GT
BGT	L__main187
L__main182:
L__main181:
;Temp.c,28 :: 		t_diff = (t_new - t_old);
VSUB.F32	S0, S3, S2
; t_diff start address is: 16 (R4)
VMOV.F32	S4, S0
;Temp.c,29 :: 		Draw_Line(20, 25, 122, 25, ON);
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #25
SXTH	R3, R3
MOVS	R2, #122
SXTH	R2, R2
MOVS	R1, #25
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;Temp.c,30 :: 		Draw_Line(20, 32, 122, 32, ON);
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #32
SXTH	R3, R3
MOVS	R2, #122
SXTH	R2, R2
MOVS	R1, #32
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;Temp.c,32 :: 		if(t_old <= t_new)
VCMPE.F32	S2, S3
VMRS	#60, FPSCR
IT	GT
BGT	L_main141
;Temp.c,34 :: 		Draw_Rectangle(bar_offset, 27, (t_old + t_diff + bar_offset - 1), 30, YES, ON, SQUARE);
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #1
VADD.F32	S1, S2, S4
VMOV.F32	S0, #20
VADD.F32	S1, S1, S0
VMOV.F32	S0, #1
VSUB.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #30
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #27
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
;Temp.c,35 :: 		Draw_Line((t_old + t_diff + bar_offset), 28, (t_old + t_diff + bar_offset), 29, ON);
MOVS	R2, #1
VADD.F32	S1, S2, S4
; t_diff end address is: 16 (R4)
; t_old end address is: 8 (R2)
VMOV.F32	S0, #20
VADD.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
VMOV.F32	S0, #20
VADD.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
PUSH	(R2)
MOVS	R3, #29
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #28
SXTH	R1, R1
BL	_Draw_Line+0
ADD	SP, SP, #4
;Temp.c,36 :: 		}
IT	AL
BAL	L_main142
L_main141:
;Temp.c,39 :: 		Draw_Rectangle((t_new + bar_offset), 27, (t_old + bar_offset + 2), 30, YES, OFF, SQUARE);
; t_old start address is: 8 (R2)
MOVS	R4, #0
MOVS	R3, #0
MOVS	R2, #1
VMOV.F32	S0, #20
VADD.F32	S1, S2, S0
; t_old end address is: 8 (R2)
VMOV.F32	S0, #2
VADD.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
VMOV.F32	S0, #20
VADD.F32	S0, S3, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #30
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #27
SXTH	R1, R1
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
;Temp.c,40 :: 		Draw_Line((t_new + bar_offset), 28, (t_new + bar_offset), 29, ON);
MOVS	R2, #1
VMOV.F32	S0, #20
VADD.F32	S0, S3, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
VMOV.F32	S0, #20
VADD.F32	S0, S3, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
PUSH	(R2)
MOVS	R3, #29
SXTH	R3, R3
SXTH	R2, R1
MOVS	R1, #28
SXTH	R1, R1
BL	_Draw_Line+0
ADD	SP, SP, #4
;Temp.c,41 :: 		}
L_main142:
;Temp.c,43 :: 		OLED_print_string(56, 7, "          ");
ADD	R11, SP, #0
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr1_Temp+0)
MOVT	R12, #hi_addr(?ICS?lstr1_Temp+0)
BL	___CC2DW+0
ADD	R0, SP, #0
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #56
BL	_OLED_print_string+0
;Temp.c,44 :: 		OLED_print_float(56, 7, t_new, 3);
MOVS	R2, #3
VMOV.F32	S0, S3
MOVS	R1, #7
MOVS	R0, #56
BL	_OLED_print_float+0
;Temp.c,45 :: 		t_old = t_new;
; t_old start address is: 0 (R0)
VMOV.F32	S0, S3
; t_new end address is: 12 (R3)
; t_old end address is: 0 (R0)
;Temp.c,26 :: 		if((t_new != t_old) && ((t_new >= 0) && (t_new <= 100)))
IT	AL
BAL	L__main185
L__main186:
VMOV.F32	S0, S2
L__main185:
; t_old start address is: 0 (R0)
; t_old end address is: 0 (R0)
IT	AL
BAL	L__main184
L__main187:
VMOV.F32	S0, S2
L__main184:
; t_old start address is: 0 (R0)
VMOV.F32	S2, S0
; t_old end address is: 0 (R0)
IT	AL
BAL	L__main183
L__main188:
L__main183:
;Temp.c,48 :: 		delay_ms(600);
; t_old start address is: 8 (R2)
MOVW	R7, #22782
MOVT	R7, #256
NOP
NOP
L_main143:
SUBS	R7, R7, #1
BNE	L_main143
NOP
NOP
NOP
;Temp.c,49 :: 		};
; t_old end address is: 8 (R2)
IT	AL
BAL	L_main134
;Temp.c,50 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_mcu:
;Temp.c,53 :: 		void setup_mcu()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temp.c,55 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;Temp.c,56 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;Temp.c,60 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;Temp.c,59 :: 		_GPIO_PINMASK_5,
MOVW	R1, #32
;Temp.c,58 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Temp.c,60 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;Temp.c,62 :: 		OLED_init();
BL	_OLED_init+0
;Temp.c,63 :: 		LM75_init();
BL	_LM75_init+0
;Temp.c,64 :: 		}
L_end_setup_mcu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_mcu
_background_layer:
;Temp.c,67 :: 		void background_layer()
SUB	SP, SP, #28
STR	LR, [SP, #0]
;Temp.c,69 :: 		OLED_draw_bitmap(0, 0, 127, 7, (unsigned char *)image);
MOVW	R0, #lo_addr(_image+0)
MOVT	R0, #hi_addr(_image+0)
PUSH	(R0)
MOVS	R3, #7
MOVS	R2, #127
MOVS	R1, #0
MOVS	R0, #0
BL	_OLED_draw_bitmap+0
ADD	SP, SP, #4
;Temp.c,70 :: 		OLED_print_string(15, 0, "LM75 Thermometer");
ADD	R11, SP, #4
ADD	R10, R11, #17
MOVW	R12, #lo_addr(?ICS?lstr2_Temp+0)
MOVT	R12, #hi_addr(?ICS?lstr2_Temp+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #0
MOVS	R0, #15
BL	_OLED_print_string+0
;Temp.c,71 :: 		OLED_print_string(24, 7, "T/'C: ");
MOVS	R0, #84
STRB	R0, [SP, #21]
MOVS	R0, #47
STRB	R0, [SP, #22]
MOVS	R0, #39
STRB	R0, [SP, #23]
MOVS	R0, #67
STRB	R0, [SP, #24]
MOVS	R0, #58
STRB	R0, [SP, #25]
MOVS	R0, #32
STRB	R0, [SP, #26]
MOVS	R0, #0
STRB	R0, [SP, #27]
ADD	R0, SP, #21
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #24
BL	_OLED_print_string+0
;Temp.c,72 :: 		}
L_end_background_layer:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _background_layer
_draw_bar:
;Temp.c,75 :: 		void draw_bar(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char on_off)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 0 (R0)
; y1 start address is: 4 (R1)
; x2 start address is: 8 (R2)
; y2 start address is: 12 (R3)
; on_off start address is: 16 (R4)
LDRB	R4, [SP, #8]
;Temp.c,77 :: 		Draw_Rectangle(x1, y1, x2, y2, YES, on_off, SQUARE);
MOVS	R6, #0
UXTB	R5, R4
; on_off end address is: 16 (R4)
MOVS	R4, #1
STRB	R0, [SP, #4]
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
PUSH	(R6)
PUSH	(R5)
PUSH	(R4)
BL	_Draw_Rectangle+0
ADD	SP, SP, #12
LDRB	R0, [SP, #4]
;Temp.c,78 :: 		Draw_Line(x1, 28, x1, 29, ON);
MOVS	R4, #1
MOVS	R3, #29
SXTH	R3, R3
UXTB	R2, R0
MOVS	R1, #28
SXTH	R1, R1
; x1 end address is: 0 (R0)
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;Temp.c,79 :: 		}
L_end_draw_bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _draw_bar
