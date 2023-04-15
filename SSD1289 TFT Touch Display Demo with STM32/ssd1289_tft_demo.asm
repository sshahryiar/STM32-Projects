_tp_init:
;touch.c,4 :: 		void tp_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,6 :: 		tp_IO_init();
BL	_tp_IO_init+0
;touch.c,8 :: 		TP_CS_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,9 :: 		MOSI_pin = high;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,10 :: 		SCK_pin = high;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,11 :: 		}
L_end_tp_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tp_init
_tp_IO_init:
;touch.c,14 :: 		void tp_IO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,16 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;touch.c,17 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_6), (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #130
MOVS	R1, #80
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;touch.c,18 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_2 | _GPIO_PINMASK_5 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;touch.c,19 :: 		}
L_end_tp_IO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tp_IO_init
_TP_read:
;touch.c,22 :: 		unsigned int TP_read()
;touch.c,24 :: 		unsigned char i = 0x0C;
; i start address is: 8 (R2)
MOVS	R2, #12
;touch.c,25 :: 		unsigned int value = 0x0000;
; value start address is: 4 (R1)
MOVW	R1, #0
; value end address is: 4 (R1)
; i end address is: 8 (R2)
;touch.c,27 :: 		while(i > 0x00)
L_TP_read0:
; value start address is: 4 (R1)
; i start address is: 8 (R2)
CMP	R2, #0
IT	LS
BLS	L_TP_read1
;touch.c,29 :: 		value <<= 1;
LSLS	R0, R1, #1
; value end address is: 4 (R1)
; value start address is: 12 (R3)
UXTH	R3, R0
;touch.c,31 :: 		SCK_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,32 :: 		SCK_pin = low;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,34 :: 		if(MISO_pin == high)
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__TP_read236
;touch.c,36 :: 		value++;
ADDS	R1, R3, #1
UXTH	R1, R1
; value end address is: 12 (R3)
; value start address is: 4 (R1)
; value end address is: 4 (R1)
;touch.c,37 :: 		}
IT	AL
BAL	L_TP_read2
L__TP_read236:
;touch.c,34 :: 		if(MISO_pin == high)
UXTH	R1, R3
;touch.c,37 :: 		}
L_TP_read2:
;touch.c,39 :: 		i--;
; value start address is: 4 (R1)
SUBS	R2, R2, #1
UXTB	R2, R2
;touch.c,40 :: 		};
; i end address is: 8 (R2)
IT	AL
BAL	L_TP_read0
L_TP_read1:
;touch.c,42 :: 		return value;
UXTH	R0, R1
; value end address is: 4 (R1)
;touch.c,43 :: 		}
L_end_TP_read:
BX	LR
; end of _TP_read
_tp_write:
;touch.c,46 :: 		void tp_write(unsigned char value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;touch.c,48 :: 		unsigned char i = 0x08;
; i start address is: 12 (R3)
MOVS	R3, #8
;touch.c,50 :: 		SCK_pin = low;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
; value end address is: 0 (R0)
; i end address is: 12 (R3)
STRB	R3, [SP, #0]
UXTB	R3, R0
LDRB	R0, [SP, #0]
;touch.c,52 :: 		while(i > 0)
L_tp_write3:
; i start address is: 0 (R0)
; value start address is: 12 (R3)
CMP	R0, #0
IT	LS
BLS	L_tp_write4
;touch.c,54 :: 		if((value & 0x80) != 0x00)
AND	R1, R3, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_tp_write5
;touch.c,56 :: 		MOSI_pin = high;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,57 :: 		}
IT	AL
BAL	L_tp_write6
L_tp_write5:
;touch.c,60 :: 		MOSI_pin = low;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,61 :: 		}
L_tp_write6:
;touch.c,63 :: 		value <<= 1;
LSLS	R1, R3, #1
UXTB	R3, R1
;touch.c,65 :: 		SCK_pin = low;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,66 :: 		SCK_pin = high;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,68 :: 		i--;
SUBS	R0, R0, #1
UXTB	R0, R0
;touch.c,69 :: 		};
; value end address is: 12 (R3)
; i end address is: 0 (R0)
IT	AL
BAL	L_tp_write3
L_tp_write4:
;touch.c,70 :: 		}
L_end_tp_write:
ADD	SP, SP, #4
BX	LR
; end of _tp_write
_TP_read_coordinates:
;touch.c,73 :: 		void TP_read_coordinates(unsigned int *x_pos, unsigned int *y_pos)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STR	R1, [SP, #12]
;touch.c,75 :: 		unsigned int temp = 0x0000;
;touch.c,76 :: 		unsigned int avg_x = 0x0000;
MOVW	R2, #0
STRH	R2, [SP, #4]
MOVW	R2, #0
STRH	R2, [SP, #6]
;touch.c,77 :: 		unsigned int avg_y = 0x0000;
;touch.c,79 :: 		unsigned char samples = 0x10;
; samples start address is: 20 (R5)
MOVS	R5, #16
;touch.c,81 :: 		TP_CS_pin = low;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
; samples end address is: 20 (R5)
UXTB	R4, R5
;touch.c,82 :: 		while(samples > 0)
L_TP_read_coordinates7:
; samples start address is: 16 (R4)
CMP	R4, #0
IT	LS
BLS	L_TP_read_coordinates8
;touch.c,84 :: 		tp_write(CMD_RDY);
MOVS	R0, #144
BL	_tp_write+0
;touch.c,85 :: 		SCK_pin = high;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,86 :: 		SCK_pin = low;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,87 :: 		avg_x += TP_read();
BL	_TP_read+0
LDRH	R2, [SP, #4]
ADDS	R2, R2, R0
STRH	R2, [SP, #4]
;touch.c,89 :: 		tp_write(CMD_RDX);
MOVS	R0, #208
BL	_tp_write+0
;touch.c,90 :: 		SCK_pin = high;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,91 :: 		SCK_pin = low;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,92 :: 		avg_y += TP_read();
BL	_TP_read+0
LDRH	R2, [SP, #6]
ADDS	R2, R2, R0
STRH	R2, [SP, #6]
;touch.c,94 :: 		samples--;
SUBS	R2, R4, #1
; samples end address is: 16 (R4)
; samples start address is: 0 (R0)
UXTB	R0, R2
;touch.c,95 :: 		};
UXTB	R4, R0
; samples end address is: 0 (R0)
IT	AL
BAL	L_TP_read_coordinates7
L_TP_read_coordinates8:
;touch.c,96 :: 		TP_CS_pin = high;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,98 :: 		temp = (avg_x >> 4);
LDRH	R2, [SP, #4]
LSRS	R2, R2, #4
;touch.c,99 :: 		temp = filter_data(temp, 1);
MOVS	R1, #1
UXTH	R0, R2
BL	_filter_data+0
;touch.c,100 :: 		*x_pos = temp;
LDR	R2, [SP, #8]
STRH	R0, [R2, #0]
;touch.c,102 :: 		temp = (avg_y >> 4);
LDRH	R2, [SP, #6]
LSRS	R2, R2, #4
;touch.c,103 :: 		temp = filter_data(temp, 0);
MOVS	R1, #0
UXTH	R0, R2
BL	_filter_data+0
;touch.c,104 :: 		*y_pos = temp;
LDR	R2, [SP, #12]
STRH	R0, [R2, #0]
;touch.c,105 :: 		}
L_end_TP_read_coordinates:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _TP_read_coordinates
_filter_data:
;touch.c,108 :: 		unsigned int filter_data(unsigned int value, unsigned char axis)
; axis start address is: 4 (R1)
SUB	SP, SP, #60
STR	LR, [SP, #0]
STRH	R0, [SP, #32]
UXTB	R0, R1
; axis end address is: 4 (R1)
; axis start address is: 0 (R0)
;touch.c,112 :: 		float sum = 0.0;
MOV	R2, #0
STR	R2, [SP, #16]
;touch.c,113 :: 		float min_R = 0.0;
;touch.c,114 :: 		float max_R = 0.0;
;touch.c,115 :: 		float axis_max = 0.0;
;touch.c,117 :: 		unsigned int res = 0x0000;
;touch.c,119 :: 		unsigned char i = 0x00;
;touch.c,121 :: 		switch(axis)
IT	AL
BAL	L_filter_data9
; axis end address is: 0 (R0)
;touch.c,123 :: 		case 1:
L_filter_data11:
;touch.c,125 :: 		min_R = RL_min;
MOVW	R2, #0
MOVT	R2, #17274
STR	R2, [SP, #20]
;touch.c,126 :: 		max_R = RL_max;
MOVW	R2, #32768
MOVT	R2, #17773
STR	R2, [SP, #24]
;touch.c,127 :: 		axis_max = res_l;
MOVW	R2, #32768
MOVT	R2, #17311
STR	R2, [SP, #28]
;touch.c,128 :: 		break;
IT	AL
BAL	L_filter_data10
;touch.c,130 :: 		default:
L_filter_data12:
;touch.c,132 :: 		min_R = RW_min;
MOVW	R2, #0
MOVT	R2, #17352
STR	R2, [SP, #20]
;touch.c,133 :: 		max_R = RW_max;
MOVW	R2, #32768
MOVT	R2, #17773
STR	R2, [SP, #24]
;touch.c,134 :: 		axis_max = res_w;
MOVW	R2, #0
MOVT	R2, #17263
STR	R2, [SP, #28]
;touch.c,135 :: 		break;
IT	AL
BAL	L_filter_data10
;touch.c,137 :: 		}
L_filter_data9:
; axis start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_filter_data11
; axis end address is: 0 (R0)
IT	AL
BAL	L_filter_data12
L_filter_data10:
;touch.c,139 :: 		temp[0] = map((((float)value) - error), min_R, max_R, 0.0, axis_max);
ADD	R2, SP, #4
STR	R2, [SP, #56]
STR	R2, [SP, #52]
LDR	R2, [SP, #28]
STR	R2, [SP, #48]
LDRH	R0, [SP, #32]
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #0
MOVT	R2, #16968
BL	__Sub_FP+0
LDR	R2, [SP, #48]
PUSH	(R2)
MOV	R3, #0
LDR	R2, [SP, #28]
LDR	R1, [SP, #24]
BL	_map+0
ADD	SP, SP, #4
LDR	R2, [SP, #52]
STR	R0, [R2, #0]
;touch.c,140 :: 		temp[1] = map((((float)value) + error), min_R, max_R, 0.0, axis_max);
LDR	R2, [SP, #56]
ADDS	R2, R2, #4
STR	R2, [SP, #52]
LDR	R2, [SP, #28]
STR	R2, [SP, #48]
LDRH	R0, [SP, #32]
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #0
MOVT	R2, #16968
BL	__Add_FP+0
LDR	R2, [SP, #48]
PUSH	(R2)
MOV	R3, #0
LDR	R2, [SP, #28]
LDR	R1, [SP, #24]
BL	_map+0
ADD	SP, SP, #4
LDR	R2, [SP, #52]
STR	R0, [R2, #0]
;touch.c,141 :: 		temp[2] = map(((float)value), min_R, max_R, 0.0, axis_max);
LDR	R2, [SP, #56]
ADDS	R2, #8
STR	R2, [SP, #52]
LDR	R2, [SP, #28]
STR	R2, [SP, #48]
LDRH	R0, [SP, #32]
BL	__UnsignedIntegralToFloat+0
LDR	R2, [SP, #48]
PUSH	(R2)
MOV	R3, #0
LDR	R2, [SP, #28]
LDR	R1, [SP, #24]
BL	_map+0
ADD	SP, SP, #4
LDR	R2, [SP, #52]
STR	R0, [R2, #0]
;touch.c,143 :: 		for(i = 0; i < 3; i++)
; i start address is: 36 (R9)
MOVW	R9, #0
; i end address is: 36 (R9)
L_filter_data13:
; i start address is: 36 (R9)
CMP	R9, #3
IT	CS
BCS	L_filter_data14
;touch.c,145 :: 		sum += temp[i];
ADD	R3, SP, #4
LSL	R2, R9, #2
ADDS	R2, R3, R2
LDR	R2, [R2, #0]
LDR	R0, [SP, #16]
BL	__Add_FP+0
STR	R0, [SP, #16]
;touch.c,143 :: 		for(i = 0; i < 3; i++)
ADD	R2, R9, #1
; i end address is: 36 (R9)
; i start address is: 0 (R0)
UXTB	R0, R2
;touch.c,146 :: 		}
UXTB	R9, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_filter_data13
L_filter_data14:
;touch.c,148 :: 		sum /= 3.0;
LDR	R0, [SP, #16]
MOVW	R2, #0
MOVT	R2, #16448
BL	__Div_FP+0
;touch.c,149 :: 		res = constrain(sum, 0.0, axis_max);
LDR	R2, [SP, #28]
MOV	R1, #0
MOV	R0, R0
BL	_constrain+0
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
;touch.c,151 :: 		return res;
;touch.c,152 :: 		}
L_end_filter_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #60
BX	LR
; end of _filter_data
_map:
;touch.c,155 :: 		float map(float value, float x_min, float x_max, float y_min, float y_max)
; y_min start address is: 12 (R3)
; x_max start address is: 8 (R2)
; x_min start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOV	R10, R0
MOV	R11, R1
MOV	R12, R2
MOV	R9, R3
; y_min end address is: 12 (R3)
; x_max end address is: 8 (R2)
; x_min end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 40 (R10)
; x_min start address is: 44 (R11)
; x_max start address is: 48 (R12)
; y_min start address is: 36 (R9)
; y_max start address is: 16 (R4)
LDR	R4, [SP, #16]
;touch.c,157 :: 		return (y_min + (((y_max - y_min) / (x_max - x_min)) * (value - x_min)));
MOV	R2, R9
MOV	R0, R4
BL	__Sub_FP+0
; y_max end address is: 16 (R4)
STR	R0, [SP, #12]
MOV	R2, R11
MOV	R0, R12
BL	__Sub_FP+0
; x_max end address is: 48 (R12)
STR	R0, [SP, #8]
LDR	R0, [SP, #12]
STR	R1, [SP, #4]
LDR	R1, [SP, #8]
MOV	R2, R1
BL	__Div_FP+0
LDR	R1, [SP, #4]
STR	R0, [SP, #8]
MOV	R2, R11
MOV	R0, R10
BL	__Sub_FP+0
; value end address is: 40 (R10)
; x_min end address is: 44 (R11)
LDR	R2, [SP, #8]
BL	__Mul_FP+0
MOV	R2, R9
BL	__Add_FP+0
; y_min end address is: 36 (R9)
;touch.c,158 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
_constrain:
;touch.c,161 :: 		float constrain(float value, float value_min, float value_max)
; value_max start address is: 8 (R2)
; value_min start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R1
MOV	R1, R0
MOV	R5, R2
; value_max end address is: 8 (R2)
; value_min end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 4 (R1)
; value_min start address is: 12 (R3)
; value_max start address is: 20 (R5)
;touch.c,163 :: 		if(value >= value_max)
MOV	R0, R1
MOV	R2, R5
BL	__Compare_FP+0
MOVW	R0, #0
BLT	L__constrain289
MOVS	R0, #1
L__constrain289:
CMP	R0, #0
IT	EQ
BEQ	L_constrain16
; value end address is: 4 (R1)
; value_min end address is: 12 (R3)
;touch.c,165 :: 		return value_max;
MOV	R0, R5
; value_max end address is: 20 (R5)
IT	AL
BAL	L_end_constrain
;touch.c,166 :: 		}
L_constrain16:
;touch.c,167 :: 		else if(value <= value_min)
; value_min start address is: 12 (R3)
; value start address is: 4 (R1)
MOV	R0, R1
MOV	R2, R3
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__constrain290
MOVS	R0, #1
L__constrain290:
CMP	R0, #0
IT	EQ
BEQ	L_constrain18
; value end address is: 4 (R1)
;touch.c,169 :: 		return value_min;
MOV	R0, R3
; value_min end address is: 12 (R3)
IT	AL
BAL	L_end_constrain
;touch.c,170 :: 		}
L_constrain18:
;touch.c,173 :: 		return value;
; value start address is: 4 (R1)
MOV	R0, R1
; value end address is: 4 (R1)
;touch.c,175 :: 		}
L_end_constrain:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _constrain
_TFT_init:
;ssd1289.c,4 :: 		void TFT_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289.c,6 :: 		TFT_GPIO_init();
BL	_TFT_GPIO_init+0
;ssd1289.c,7 :: 		TFT_reset_sequence();
BL	_TFT_reset_sequence+0
;ssd1289.c,8 :: 		TFT_CS_pin = low;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,9 :: 		TFT_write_reg(0x0000, 0x0001);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write_reg+0
;ssd1289.c,10 :: 		TFT_write_reg(0x0003, 0xA8A4);
MOVW	R1, #43172
MOVS	R0, #3
BL	_TFT_write_reg+0
;ssd1289.c,11 :: 		TFT_write_reg(0x000C, 0x0000);
MOVS	R1, #0
MOVS	R0, #12
BL	_TFT_write_reg+0
;ssd1289.c,12 :: 		TFT_write_reg(0x000D, 0x080C);
MOVW	R1, #2060
MOVS	R0, #13
BL	_TFT_write_reg+0
;ssd1289.c,13 :: 		TFT_write_reg(0x000E, 0x2B00);
MOVW	R1, #11008
MOVS	R0, #14
BL	_TFT_write_reg+0
;ssd1289.c,14 :: 		TFT_write_reg(0x001E, 0x00B7);
MOVS	R1, #183
MOVS	R0, #30
BL	_TFT_write_reg+0
;ssd1289.c,15 :: 		TFT_write_reg(0x0001, 0x2B3F);
MOVW	R1, #11071
MOVS	R0, #1
BL	_TFT_write_reg+0
;ssd1289.c,16 :: 		TFT_write_reg(0x0002, 0x0600);
MOVW	R1, #1536
MOVS	R0, #2
BL	_TFT_write_reg+0
;ssd1289.c,17 :: 		TFT_write_reg(0x0010, 0x0000);
MOVS	R1, #0
MOVS	R0, #16
BL	_TFT_write_reg+0
;ssd1289.c,18 :: 		TFT_write_reg(0x0011, 0x6070);
MOVW	R1, #24688
MOVS	R0, #17
BL	_TFT_write_reg+0
;ssd1289.c,19 :: 		TFT_write_reg(0x0005, 0x0000);
MOVS	R1, #0
MOVS	R0, #5
BL	_TFT_write_reg+0
;ssd1289.c,20 :: 		TFT_write_reg(0x0006, 0x0000);
MOVS	R1, #0
MOVS	R0, #6
BL	_TFT_write_reg+0
;ssd1289.c,21 :: 		TFT_write_reg(0x0016, 0xEF1C);
MOVW	R1, #61212
MOVS	R0, #22
BL	_TFT_write_reg+0
;ssd1289.c,22 :: 		TFT_write_reg(0x0017, 0x0003);
MOVS	R1, #3
MOVS	R0, #23
BL	_TFT_write_reg+0
;ssd1289.c,23 :: 		TFT_write_reg(0x0007, 0x0233);
MOVW	R1, #563
MOVS	R0, #7
BL	_TFT_write_reg+0
;ssd1289.c,24 :: 		TFT_write_reg(0x000B, 0x0000);
MOVS	R1, #0
MOVS	R0, #11
BL	_TFT_write_reg+0
;ssd1289.c,25 :: 		TFT_write_reg(0x000F, 0x0000);
MOVS	R1, #0
MOVS	R0, #15
BL	_TFT_write_reg+0
;ssd1289.c,26 :: 		TFT_write_reg(0x0041, 0x0000);
MOVS	R1, #0
MOVS	R0, #65
BL	_TFT_write_reg+0
;ssd1289.c,27 :: 		TFT_write_reg(0x0042, 0x0000);
MOVS	R1, #0
MOVS	R0, #66
BL	_TFT_write_reg+0
;ssd1289.c,28 :: 		TFT_write_reg(0x0048, 0x0000);
MOVS	R1, #0
MOVS	R0, #72
BL	_TFT_write_reg+0
;ssd1289.c,29 :: 		TFT_write_reg(0x0049, 0x013F);
MOVW	R1, #319
MOVS	R0, #73
BL	_TFT_write_reg+0
;ssd1289.c,30 :: 		TFT_write_reg(0x004A, 0x0000);
MOVS	R1, #0
MOVS	R0, #74
BL	_TFT_write_reg+0
;ssd1289.c,31 :: 		TFT_write_reg(0x004B, 0x0000);
MOVS	R1, #0
MOVS	R0, #75
BL	_TFT_write_reg+0
;ssd1289.c,32 :: 		TFT_write_reg(0x0044, 0xEF95);
MOVW	R1, #61333
MOVS	R0, #68
BL	_TFT_write_reg+0
;ssd1289.c,33 :: 		TFT_write_reg(0x0045, 0x0000);
MOVS	R1, #0
MOVS	R0, #69
BL	_TFT_write_reg+0
;ssd1289.c,34 :: 		TFT_write_reg(0x0046, 0x013F);
MOVW	R1, #319
MOVS	R0, #70
BL	_TFT_write_reg+0
;ssd1289.c,35 :: 		TFT_write_reg(0x0030, 0x0707);
MOVW	R1, #1799
MOVS	R0, #48
BL	_TFT_write_reg+0
;ssd1289.c,36 :: 		TFT_write_reg(0x0031, 0x0204);
MOVW	R1, #516
MOVS	R0, #49
BL	_TFT_write_reg+0
;ssd1289.c,37 :: 		TFT_write_reg(0x0032, 0x0204);
MOVW	R1, #516
MOVS	R0, #50
BL	_TFT_write_reg+0
;ssd1289.c,38 :: 		TFT_write_reg(0x0033, 0x0502);
MOVW	R1, #1282
MOVS	R0, #51
BL	_TFT_write_reg+0
;ssd1289.c,39 :: 		TFT_write_reg(0x0034, 0x0507);
MOVW	R1, #1287
MOVS	R0, #52
BL	_TFT_write_reg+0
;ssd1289.c,40 :: 		TFT_write_reg(0x0035, 0x0204);
MOVW	R1, #516
MOVS	R0, #53
BL	_TFT_write_reg+0
;ssd1289.c,41 :: 		TFT_write_reg(0x0036, 0x0204);
MOVW	R1, #516
MOVS	R0, #54
BL	_TFT_write_reg+0
;ssd1289.c,42 :: 		TFT_write_reg(0x0037, 0x0502);
MOVW	R1, #1282
MOVS	R0, #55
BL	_TFT_write_reg+0
;ssd1289.c,43 :: 		TFT_write_reg(0x003A, 0x0302);
MOVW	R1, #770
MOVS	R0, #58
BL	_TFT_write_reg+0
;ssd1289.c,44 :: 		TFT_write_reg(0x003B, 0x0302);
MOVW	R1, #770
MOVS	R0, #59
BL	_TFT_write_reg+0
;ssd1289.c,45 :: 		TFT_write_reg(0x0023, 0x0000);
MOVS	R1, #0
MOVS	R0, #35
BL	_TFT_write_reg+0
;ssd1289.c,46 :: 		TFT_write_reg(0x0024, 0x0000);
MOVS	R1, #0
MOVS	R0, #36
BL	_TFT_write_reg+0
;ssd1289.c,47 :: 		TFT_write_reg(0x0025, 0x8000);
MOVW	R1, #32768
MOVS	R0, #37
BL	_TFT_write_reg+0
;ssd1289.c,48 :: 		TFT_write_reg(0x004F, 0x0000);
MOVS	R1, #0
MOVS	R0, #79
BL	_TFT_write_reg+0
;ssd1289.c,49 :: 		TFT_write_reg(0x004E, 0x0000);
MOVS	R1, #0
MOVS	R0, #78
BL	_TFT_write_reg+0
;ssd1289.c,50 :: 		TFT_write(0x0022, CMD);
MOVS	R1, #0
MOVS	R0, #34
BL	_TFT_write+0
;ssd1289.c,51 :: 		TFT_CS_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,52 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289.c,53 :: 		}
L_end_TFT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_init
_TFT_GPIO_init:
;ssd1289.c,56 :: 		void TFT_GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289.c,58 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1289.c,59 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_3, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;ssd1289.c,61 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1289.c,62 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);
MOVW	R0, #lo_addr(__GPIO_MODULE_SWJ_JTAGDISABLE+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_SWJ_JTAGDISABLE+0)
BL	_GPIO_Alternate_Function_Enable+0
;ssd1289.c,63 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;ssd1289.c,65 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;ssd1289.c,66 :: 		GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVS	R1, #199
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;ssd1289.c,68 :: 		TFT_RD_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,69 :: 		TFT_BL_pin = high;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,71 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_GPIO_init20:
SUBS	R7, R7, #1
BNE	L_TFT_GPIO_init20
NOP
NOP
NOP
;ssd1289.c,72 :: 		}
L_end_TFT_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_GPIO_init
_TFT_reset_sequence:
;ssd1289.c,75 :: 		void TFT_reset_sequence()
;ssd1289.c,77 :: 		TFT_RST_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,78 :: 		delay_ms(5);
MOVW	R7, #59999
MOVT	R7, #0
NOP
NOP
L_TFT_reset_sequence22:
SUBS	R7, R7, #1
BNE	L_TFT_reset_sequence22
NOP
NOP
NOP
;ssd1289.c,79 :: 		TFT_RST_pin = low;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,80 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_reset_sequence24:
SUBS	R7, R7, #1
BNE	L_TFT_reset_sequence24
NOP
NOP
NOP
;ssd1289.c,81 :: 		TFT_RST_pin = high;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ssd1289.c,82 :: 		delay_ms(15);
MOVW	R7, #48927
MOVT	R7, #2
NOP
NOP
L_TFT_reset_sequence26:
SUBS	R7, R7, #1
BNE	L_TFT_reset_sequence26
NOP
NOP
NOP
;ssd1289.c,83 :: 		}
L_end_TFT_reset_sequence:
BX	LR
; end of _TFT_reset_sequence
_TFT_write:
;ssd1289.c,86 :: 		void TFT_write(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ssd1289.c,88 :: 		TFT_RS_pin = (mode & 0x01);
AND	R3, R1, #1
; mode end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ssd1289.c,89 :: 		TFT_data_out_port = value;
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
STR	R0, [R2, #0]
; value end address is: 0 (R0)
;ssd1289.c,90 :: 		TFT_WR_pin = low;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ssd1289.c,91 :: 		TFT_WR_pin = high;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ssd1289.c,92 :: 		}
L_end_TFT_write:
BX	LR
; end of _TFT_write
_TFT_write_reg:
;ssd1289.c,95 :: 		void TFT_write_reg(unsigned int cmd_value, unsigned int data_value)
; data_value start address is: 4 (R1)
; cmd_value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R1
; data_value end address is: 4 (R1)
; cmd_value end address is: 0 (R0)
; cmd_value start address is: 0 (R0)
; data_value start address is: 16 (R4)
;ssd1289.c,97 :: 		TFT_write(cmd_value, CMD);
MOVS	R1, #0
; cmd_value end address is: 0 (R0)
BL	_TFT_write+0
;ssd1289.c,98 :: 		TFT_write(data_value, DAT);
MOVS	R1, #1
UXTH	R0, R4
; data_value end address is: 16 (R4)
BL	_TFT_write+0
;ssd1289.c,99 :: 		}
L_end_TFT_write_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_reg
_TFT_set_display_address_window:
;ssd1289.c,102 :: 		void TFT_set_display_address_window(signed int xs, signed int ys, signed int xe, signed int ye)
; ye start address is: 12 (R3)
; xe start address is: 8 (R2)
; ys start address is: 4 (R1)
; xs start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R5, R0
SXTH	R6, R1
SXTH	R7, R3
; ye end address is: 12 (R3)
; xe end address is: 8 (R2)
; ys end address is: 4 (R1)
; xs end address is: 0 (R0)
; xs start address is: 20 (R5)
; ys start address is: 24 (R6)
; xe start address is: 8 (R2)
; ye start address is: 28 (R7)
;ssd1289.c,104 :: 		TFT_write_reg(0x0044, (xs + (xe << 8)));
LSLS	R4, R2, #8
SXTH	R4, R4
; xe end address is: 8 (R2)
ADDS	R4, R5, R4
UXTH	R1, R4
MOVS	R0, #68
BL	_TFT_write_reg+0
;ssd1289.c,105 :: 		TFT_write_reg(0x0045, ys);
UXTH	R1, R6
MOVS	R0, #69
BL	_TFT_write_reg+0
;ssd1289.c,106 :: 		TFT_write_reg(0x0046, ye);
UXTH	R1, R7
; ye end address is: 28 (R7)
MOVS	R0, #70
BL	_TFT_write_reg+0
;ssd1289.c,107 :: 		TFT_set_cursor(xs, ys);
SXTH	R1, R6
; ys end address is: 24 (R6)
SXTH	R0, R5
; xs end address is: 20 (R5)
BL	_TFT_set_cursor+0
;ssd1289.c,108 :: 		}
L_end_TFT_set_display_address_window:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_display_address_window
_TFT_set_cursor:
;ssd1289.c,111 :: 		void TFT_set_cursor(signed int x_pos, signed int y_pos)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
;ssd1289.c,113 :: 		swap(&x_pos, &y_pos);
ADD	R3, SP, #8
ADD	R2, SP, #4
MOV	R1, R3
MOV	R0, R2
BL	_swap+0
;ssd1289.c,114 :: 		y_pos = (MAX_X - 1 - y_pos);
LDRSH	R3, [SP, #8]
MOVW	R2, #319
SXTH	R2, R2
SUB	R2, R2, R3
STRH	R2, [SP, #8]
;ssd1289.c,116 :: 		TFT_write_reg(0x004E, x_pos);
LDRSH	R1, [SP, #4]
MOVS	R0, #78
BL	_TFT_write_reg+0
;ssd1289.c,117 :: 		TFT_write_reg(0x004F, y_pos);
LDRSH	R1, [SP, #8]
MOVS	R0, #79
BL	_TFT_write_reg+0
;ssd1289.c,118 :: 		TFT_write(0x0022, CMD);
MOVS	R1, #0
MOVS	R0, #34
BL	_TFT_write+0
;ssd1289.c,119 :: 		}
L_end_TFT_set_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TFT_set_cursor
_TFT_fill:
;ssd1289.c,122 :: 		void TFT_fill(unsigned int colour)
; colour start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R8, R0
; colour end address is: 0 (R0)
; colour start address is: 32 (R8)
;ssd1289.c,124 :: 		unsigned long index = (MAX_X * MAX_Y);
; index start address is: 36 (R9)
MOV	R9, #76800
;ssd1289.c,126 :: 		TFT_CS_pin = low;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ssd1289.c,127 :: 		TFT_set_display_address_window(0, 0, 239, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #239
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_set_display_address_window+0
;ssd1289.c,128 :: 		TFT_write(colour, DAT);
MOVS	R1, #1
UXTH	R0, R8
; colour end address is: 32 (R8)
BL	_TFT_write+0
; index end address is: 36 (R9)
MOV	R0, R9
;ssd1289.c,130 :: 		while(index)
L_TFT_fill28:
; index start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_TFT_fill29
;ssd1289.c,132 :: 		TFT_WR_pin = low;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ssd1289.c,133 :: 		TFT_WR_pin = high;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ssd1289.c,134 :: 		index--;
SUBS	R0, R0, #1
;ssd1289.c,135 :: 		};
; index end address is: 0 (R0)
IT	AL
BAL	L_TFT_fill28
L_TFT_fill29:
;ssd1289.c,137 :: 		TFT_CS_pin = high;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ssd1289.c,138 :: 		}
L_end_TFT_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_fill
_TFT_BGR2RGB:
;ssd1289.c,141 :: 		unsigned int TFT_BGR2RGB(unsigned int colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;ssd1289.c,143 :: 		unsigned int r = 0x0000;
;ssd1289.c,144 :: 		unsigned int g = 0x0000;
;ssd1289.c,145 :: 		unsigned int b = 0x0000;
;ssd1289.c,146 :: 		unsigned int rgb_colour = 0x0000;
;ssd1289.c,148 :: 		b = ((colour >> 0)  & 0x1F);
AND	R2, R0, #31
UXTH	R2, R2
;ssd1289.c,149 :: 		g = ((colour >> 5)  & 0x3F);
LSRS	R1, R0, #5
UXTH	R1, R1
AND	R4, R1, #63
UXTH	R4, R4
;ssd1289.c,150 :: 		r = ((colour >> 11) & 0x1F);
LSRS	R1, R0, #11
UXTH	R1, R1
; colour end address is: 0 (R0)
AND	R3, R1, #31
UXTH	R3, R3
;ssd1289.c,152 :: 		rgb_colour = ((b << 11) + (g << 5) + r);
LSLS	R2, R2, #11
UXTH	R2, R2
LSLS	R1, R4, #5
UXTH	R1, R1
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R1, R3
;ssd1289.c,154 :: 		return rgb_colour;
UXTH	R0, R1
;ssd1289.c,155 :: 		}
L_end_TFT_BGR2RGB:
BX	LR
; end of _TFT_BGR2RGB
_RGB565_converter:
;ssd1289.c,158 :: 		unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
; b start address is: 8 (R2)
; g start address is: 4 (R1)
; r start address is: 0 (R0)
; b end address is: 8 (R2)
; g end address is: 4 (R1)
; r end address is: 0 (R0)
; r start address is: 0 (R0)
; g start address is: 4 (R1)
; b start address is: 8 (R2)
;ssd1289.c,160 :: 		return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
UXTB	R3, R0
; r end address is: 0 (R0)
LSRS	R3, R3, #3
UXTH	R3, R3
LSLS	R4, R3, #11
UXTH	R4, R4
UXTB	R3, R1
; g end address is: 4 (R1)
LSRS	R3, R3, #2
UXTH	R3, R3
LSLS	R3, R3, #5
UXTH	R3, R3
ORRS	R4, R3
UXTH	R4, R4
UXTB	R3, R2
; b end address is: 8 (R2)
LSRS	R3, R3, #3
UXTH	R3, R3
ORR	R3, R4, R3, LSL #0
UXTH	R0, R3
;ssd1289.c,161 :: 		}
L_end_RGB565_converter:
BX	LR
; end of _RGB565_converter
_swap:
;ssd1289.c,164 :: 		void swap(signed int *a, signed int *b)
; b start address is: 4 (R1)
; a start address is: 0 (R0)
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 4 (R1)
;ssd1289.c,166 :: 		signed int temp = 0x0000;
;ssd1289.c,168 :: 		temp = *b;
LDRSH	R2, [R1, #0]
; temp start address is: 12 (R3)
SXTH	R3, R2
;ssd1289.c,169 :: 		*b = *a;
LDRSH	R2, [R0, #0]
STRH	R2, [R1, #0]
; b end address is: 4 (R1)
;ssd1289.c,170 :: 		*a = temp;
STRH	R3, [R0, #0]
; a end address is: 0 (R0)
; temp end address is: 12 (R3)
;ssd1289.c,171 :: 		}
L_end_swap:
BX	LR
; end of _swap
_Draw_Pixel:
;ssd1289.c,174 :: 		void Draw_Pixel(signed int x_pos, signed int y_pos, unsigned int colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R2
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 20 (R5)
;ssd1289.c,176 :: 		if((x_pos >= MAX_X) || (y_pos >= MAX_Y) || (x_pos < 0) || (y_pos < 0))
CMP	R0, #320
IT	GE
BGE	L__Draw_Pixel241
CMP	R1, #240
IT	GE
BGE	L__Draw_Pixel240
CMP	R0, #0
IT	LT
BLT	L__Draw_Pixel239
CMP	R1, #0
IT	LT
BLT	L__Draw_Pixel238
IT	AL
BAL	L_Draw_Pixel32
; x_pos end address is: 0 (R0)
; y_pos end address is: 4 (R1)
; colour end address is: 20 (R5)
L__Draw_Pixel241:
L__Draw_Pixel240:
L__Draw_Pixel239:
L__Draw_Pixel238:
;ssd1289.c,178 :: 		return;
IT	AL
BAL	L_end_Draw_Pixel
;ssd1289.c,179 :: 		}
L_Draw_Pixel32:
;ssd1289.c,181 :: 		TFT_CS_pin = low;
; colour start address is: 20 (R5)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(GPIOC_ODRbits+0)
MOVT	R3, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R3, #0]
;ssd1289.c,182 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ssd1289.c,183 :: 		TFT_write(colour, DAT);
MOVS	R1, #1
UXTH	R0, R5
; colour end address is: 20 (R5)
BL	_TFT_write+0
;ssd1289.c,184 :: 		TFT_CS_pin = high;
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(GPIOC_ODRbits+0)
MOVT	R3, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R3, #0]
;ssd1289.c,185 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;ssd1289.c,188 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
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
LDRH	R8, [SP, #12]
;ssd1289.c,190 :: 		signed int dx = 0x0000;
;ssd1289.c,191 :: 		signed int dy = 0x0000;
;ssd1289.c,192 :: 		signed int stepx = 0x0000;
;ssd1289.c,193 :: 		signed int stepy = 0x0000;
;ssd1289.c,194 :: 		signed int fraction = 0x0000;
;ssd1289.c,196 :: 		dy = (y2 - y1);
SUB	R5, R11, R7, LSL #0
SXTH	R5, R5
; dy start address is: 8 (R2)
SXTH	R2, R5
;ssd1289.c,197 :: 		dx = (x2 - x1);
SUB	R0, R10, R6, LSL #0
SXTH	R0, R0
; dx start address is: 0 (R0)
;ssd1289.c,199 :: 		if(dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line33
;ssd1289.c,201 :: 		dy = -dy;
RSBS	R2, R2, #0
SXTH	R2, R2
;ssd1289.c,202 :: 		stepy = -1;
; stepy start address is: 36 (R9)
MOVW	R9, #65535
SXTH	R9, R9
;ssd1289.c,203 :: 		}
; stepy end address is: 36 (R9)
IT	AL
BAL	L_Draw_Line34
L_Draw_Line33:
;ssd1289.c,206 :: 		stepy = 1;
; stepy start address is: 36 (R9)
MOVW	R9, #1
SXTH	R9, R9
; dy end address is: 8 (R2)
; stepy end address is: 36 (R9)
;ssd1289.c,207 :: 		}
L_Draw_Line34:
;ssd1289.c,209 :: 		if(dx < 0)
; stepy start address is: 36 (R9)
; dy start address is: 8 (R2)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line35
;ssd1289.c,211 :: 		dx = -dx;
RSBS	R0, R0, #0
SXTH	R0, R0
;ssd1289.c,212 :: 		stepx = -1;
; stepx start address is: 4 (R1)
MOVW	R1, #65535
SXTH	R1, R1
;ssd1289.c,213 :: 		}
; stepx end address is: 4 (R1)
IT	AL
BAL	L_Draw_Line36
L_Draw_Line35:
;ssd1289.c,216 :: 		stepx = 1;
; stepx start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; stepx end address is: 4 (R1)
; dx end address is: 0 (R0)
;ssd1289.c,217 :: 		}
L_Draw_Line36:
;ssd1289.c,219 :: 		dx <<= 0x01;
; stepx start address is: 4 (R1)
; dx start address is: 0 (R0)
LSLS	R4, R0, #1
; dx end address is: 0 (R0)
; dx start address is: 48 (R12)
SXTH	R12, R4
;ssd1289.c,220 :: 		dy <<= 0x01;
LSLS	R2, R2, #1
SXTH	R2, R2
;ssd1289.c,222 :: 		Draw_Pixel(x1, y1, colour);
STRH	R2, [SP, #4]
STRH	R1, [SP, #6]
UXTH	R2, R8
SXTH	R1, R7
SXTH	R0, R6
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #6]
LDRSH	R2, [SP, #4]
;ssd1289.c,224 :: 		if(dx > dy)
CMP	R12, R2
IT	LE
BLE	L_Draw_Line37
; y2 end address is: 44 (R11)
;ssd1289.c,226 :: 		fraction = (dy - (dx >> 1));
ASR	R4, R12, #1
SXTH	R4, R4
SUB	R0, R2, R4
SXTH	R0, R0
; fraction start address is: 0 (R0)
; x2 end address is: 40 (R10)
; stepx end address is: 4 (R1)
; dx end address is: 48 (R12)
; dy end address is: 8 (R2)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; fraction end address is: 0 (R0)
SXTH	R11, R12
SXTH	R12, R1
SXTH	R1, R10
SXTH	R10, R2
SXTH	R2, R6
;ssd1289.c,227 :: 		while(x1 != x2)
L_Draw_Line38:
; fraction start address is: 0 (R0)
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
; x2 start address is: 4 (R1)
; y1 start address is: 28 (R7)
; x1 start address is: 8 (R2)
CMP	R2, R1
IT	EQ
BEQ	L_Draw_Line39
; dy end address is: 40 (R10)
; dx end address is: 44 (R11)
; stepx end address is: 48 (R12)
; colour end address is: 32 (R8)
; stepy end address is: 36 (R9)
;ssd1289.c,229 :: 		if(fraction >= 0)
; stepy start address is: 36 (R9)
; colour start address is: 32 (R8)
; stepx start address is: 48 (R12)
; dx start address is: 44 (R11)
; dy start address is: 40 (R10)
CMP	R0, #0
IT	LT
BLT	L__Draw_Line242
;ssd1289.c,231 :: 		y1 += stepy;
ADD	R7, R7, R9, LSL #0
SXTH	R7, R7
;ssd1289.c,232 :: 		fraction -= dx;
SUB	R0, R0, R11, LSL #0
SXTH	R0, R0
; y1 end address is: 28 (R7)
; fraction end address is: 0 (R0)
;ssd1289.c,233 :: 		}
IT	AL
BAL	L_Draw_Line40
L__Draw_Line242:
;ssd1289.c,229 :: 		if(fraction >= 0)
;ssd1289.c,233 :: 		}
L_Draw_Line40:
;ssd1289.c,234 :: 		x1 += stepx;
; fraction start address is: 0 (R0)
; y1 start address is: 28 (R7)
ADD	R5, R2, R12, LSL #0
; x1 end address is: 8 (R2)
; x1 start address is: 24 (R6)
SXTH	R6, R5
;ssd1289.c,235 :: 		fraction += dy;
ADD	R0, R0, R10, LSL #0
SXTH	R0, R0
;ssd1289.c,237 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
UXTH	R2, R8
SXTH	R1, R7
SXTH	R0, R5
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #8]
LDRSH	R0, [SP, #4]
;ssd1289.c,238 :: 		}
SXTH	R2, R6
; dy end address is: 40 (R10)
; dx end address is: 44 (R11)
; stepx end address is: 48 (R12)
; colour end address is: 32 (R8)
; x2 end address is: 4 (R1)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; stepy end address is: 36 (R9)
; fraction end address is: 0 (R0)
IT	AL
BAL	L_Draw_Line38
L_Draw_Line39:
;ssd1289.c,239 :: 		}
IT	AL
BAL	L_Draw_Line41
L_Draw_Line37:
;ssd1289.c,242 :: 		fraction = (dx - (dy >> 1));
; y2 start address is: 44 (R11)
; stepy start address is: 36 (R9)
; x1 start address is: 24 (R6)
; y1 start address is: 28 (R7)
; colour start address is: 32 (R8)
; dy start address is: 8 (R2)
; dx start address is: 48 (R12)
; stepx start address is: 4 (R1)
ASRS	R4, R2, #1
SXTH	R4, R4
SUB	R3, R12, R4, LSL #0
SXTH	R3, R3
; fraction start address is: 12 (R3)
; stepx end address is: 4 (R1)
; dx end address is: 48 (R12)
; dy end address is: 8 (R2)
; colour end address is: 32 (R8)
; y1 end address is: 28 (R7)
; x1 end address is: 24 (R6)
; fraction end address is: 12 (R3)
; y2 end address is: 44 (R11)
UXTH	R10, R8
SXTH	R8, R1
SXTH	R1, R6
SXTH	R6, R2
SXTH	R0, R7
SXTH	R7, R12
;ssd1289.c,244 :: 		while(y1 != y2)
L_Draw_Line42:
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
BEQ	L_Draw_Line43
; dy end address is: 24 (R6)
; dx end address is: 28 (R7)
; stepx end address is: 32 (R8)
; stepy end address is: 36 (R9)
; colour end address is: 40 (R10)
;ssd1289.c,246 :: 		if (fraction >= 0)
; colour start address is: 40 (R10)
; stepy start address is: 36 (R9)
; stepx start address is: 32 (R8)
; dx start address is: 28 (R7)
; dy start address is: 24 (R6)
CMP	R3, #0
IT	LT
BLT	L__Draw_Line243
;ssd1289.c,248 :: 		x1 += stepx;
ADD	R1, R1, R8, LSL #0
SXTH	R1, R1
;ssd1289.c,249 :: 		fraction -= dy;
SUB	R2, R3, R6
SXTH	R2, R2
; fraction end address is: 12 (R3)
; fraction start address is: 8 (R2)
; fraction end address is: 8 (R2)
; x1 end address is: 4 (R1)
;ssd1289.c,250 :: 		}
IT	AL
BAL	L_Draw_Line44
L__Draw_Line243:
;ssd1289.c,246 :: 		if (fraction >= 0)
SXTH	R2, R3
;ssd1289.c,250 :: 		}
L_Draw_Line44:
;ssd1289.c,251 :: 		y1 += stepy;
; fraction start address is: 8 (R2)
; x1 start address is: 4 (R1)
ADD	R5, R0, R9, LSL #0
; y1 end address is: 0 (R0)
; y1 start address is: 48 (R12)
SXTH	R12, R5
;ssd1289.c,252 :: 		fraction += dx;
ADDS	R4, R2, R7
; fraction end address is: 8 (R2)
; fraction start address is: 0 (R0)
SXTH	R0, R4
;ssd1289.c,253 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
UXTH	R2, R10
SXTH	R0, R1
SXTH	R1, R5
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #8]
LDRSH	R0, [SP, #4]
;ssd1289.c,254 :: 		}
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
BAL	L_Draw_Line42
L_Draw_Line43:
;ssd1289.c,255 :: 		}
L_Draw_Line41:
;ssd1289.c,256 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_Line
_Draw_V_Line:
;ssd1289.c,259 :: 		void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
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
;ssd1289.c,261 :: 		signed int pos = 0;
;ssd1289.c,262 :: 		signed int temp = 0;
;ssd1289.c,264 :: 		if(y1 > y2)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line45
;ssd1289.c,266 :: 		swap(&y1, &y2);
ADD	R5, SP, #12
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,267 :: 		}
L_Draw_V_Line45:
;ssd1289.c,269 :: 		while(y2 > (y1 - 1))
STRH	R7, [SP, #4]
; colour end address is: 28 (R7)
SXTH	R7, R6
LDRH	R6, [SP, #4]
L_Draw_V_Line46:
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
BLE	L_Draw_V_Line47
; colour end address is: 24 (R6)
; x1 end address is: 28 (R7)
;ssd1289.c,271 :: 		Draw_Pixel(x1, y2, colour);
; x1 start address is: 28 (R7)
; colour start address is: 24 (R6)
UXTH	R2, R6
LDRSH	R1, [SP, #12]
SXTH	R0, R7
BL	_Draw_Pixel+0
;ssd1289.c,272 :: 		y2--;
LDRSH	R4, [SP, #12]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ssd1289.c,273 :: 		}
; colour end address is: 24 (R6)
; x1 end address is: 28 (R7)
IT	AL
BAL	L_Draw_V_Line46
L_Draw_V_Line47:
;ssd1289.c,274 :: 		}
L_end_Draw_V_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_V_Line
_Draw_H_Line:
;ssd1289.c,277 :: 		void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
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
;ssd1289.c,279 :: 		signed int pos = 0;
;ssd1289.c,280 :: 		signed int temp = 0;
;ssd1289.c,282 :: 		if(x1 > x2)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line48
;ssd1289.c,284 :: 		swap(&x1, &x2);
ADD	R5, SP, #12
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,285 :: 		}
L_Draw_H_Line48:
;ssd1289.c,287 :: 		while(x2 > (x1 - 1))
STRH	R7, [SP, #4]
; colour end address is: 28 (R7)
SXTH	R7, R6
LDRH	R6, [SP, #4]
L_Draw_H_Line49:
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
BLE	L_Draw_H_Line50
; colour end address is: 24 (R6)
; y1 end address is: 28 (R7)
;ssd1289.c,289 :: 		Draw_Pixel(x2, y1, colour);
; y1 start address is: 28 (R7)
; colour start address is: 24 (R6)
UXTH	R2, R6
SXTH	R1, R7
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1289.c,290 :: 		x2--;
LDRSH	R4, [SP, #12]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ssd1289.c,291 :: 		}
; colour end address is: 24 (R6)
; y1 end address is: 28 (R7)
IT	AL
BAL	L_Draw_H_Line49
L_Draw_H_Line50:
;ssd1289.c,292 :: 		}
L_end_Draw_H_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_H_Line
_Draw_Triangle:
;ssd1289.c,295 :: 		void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
SUB	SP, SP, #36
STR	LR, [SP, #0]
STRH	R0, [SP, #20]
STRH	R1, [SP, #24]
STRH	R2, [SP, #28]
STRH	R3, [SP, #32]
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #36]
LDRSH	R4, [SP, #40]
STRH	R4, [SP, #40]
; fill start address is: 0 (R0)
LDRB	R0, [SP, #44]
LDRH	R4, [SP, #48]
STRH	R4, [SP, #48]
;ssd1289.c,297 :: 		signed int a = 0;
MOVW	R4, #0
STRH	R4, [SP, #4]
MOVW	R4, #0
STRH	R4, [SP, #6]
;ssd1289.c,298 :: 		signed int b = 0;
;ssd1289.c,299 :: 		signed int sa = 0;
;ssd1289.c,300 :: 		signed int sb = 0;
;ssd1289.c,301 :: 		signed int yp = 0;
;ssd1289.c,302 :: 		signed int last = 0;
;ssd1289.c,303 :: 		signed int dx12 = 0;
;ssd1289.c,304 :: 		signed int dx23 = 0;
;ssd1289.c,305 :: 		signed int dx13 = 0;
;ssd1289.c,306 :: 		signed int dy12 = 0;
;ssd1289.c,307 :: 		signed int dy23 = 0;
;ssd1289.c,308 :: 		signed int dy13 = 0;
;ssd1289.c,310 :: 		switch(fill)
IT	AL
BAL	L_Draw_Triangle51
; fill end address is: 0 (R0)
;ssd1289.c,312 :: 		case YES:
L_Draw_Triangle53:
;ssd1289.c,314 :: 		if(y1 > y2)
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #24]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle54
;ssd1289.c,316 :: 		swap(&y1, &y2);
ADD	R5, SP, #32
ADD	R4, SP, #24
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,317 :: 		swap(&x1, &x2);
ADD	R5, SP, #28
ADD	R4, SP, #20
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,318 :: 		}
L_Draw_Triangle54:
;ssd1289.c,319 :: 		if(y2 > y3)
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle55
;ssd1289.c,321 :: 		swap(&y3, &y2);
ADD	R5, SP, #32
ADD	R4, SP, #40
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,322 :: 		swap(&x3, &x2);
ADD	R5, SP, #28
ADD	R4, SP, #36
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,323 :: 		}
L_Draw_Triangle55:
;ssd1289.c,324 :: 		if(y1 > y2)
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #24]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle56
;ssd1289.c,326 :: 		swap(&y1, &y2);
ADD	R5, SP, #32
ADD	R4, SP, #24
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,327 :: 		swap(&x1, &x2);
ADD	R5, SP, #28
ADD	R4, SP, #20
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,328 :: 		}
L_Draw_Triangle56:
;ssd1289.c,330 :: 		if(y1 == y3)
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #24]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle57
;ssd1289.c,332 :: 		a = b = x1;
LDRSH	R4, [SP, #20]
STRH	R4, [SP, #6]
LDRSH	R4, [SP, #20]
STRH	R4, [SP, #4]
;ssd1289.c,334 :: 		if(x2 < a)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle58
;ssd1289.c,336 :: 		a = x2;
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #4]
;ssd1289.c,337 :: 		}
IT	AL
BAL	L_Draw_Triangle59
L_Draw_Triangle58:
;ssd1289.c,338 :: 		else if(x2 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle60
;ssd1289.c,340 :: 		b = x2;
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #6]
;ssd1289.c,341 :: 		}
L_Draw_Triangle60:
L_Draw_Triangle59:
;ssd1289.c,342 :: 		if(x2 < a)
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle61
;ssd1289.c,344 :: 		a = x3;
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #4]
;ssd1289.c,345 :: 		}
IT	AL
BAL	L_Draw_Triangle62
L_Draw_Triangle61:
;ssd1289.c,346 :: 		else if(x3 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle63
;ssd1289.c,348 :: 		b = x3;
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #6]
;ssd1289.c,349 :: 		}
L_Draw_Triangle63:
L_Draw_Triangle62:
;ssd1289.c,351 :: 		Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #48]
LDRSH	R2, [SP, #24]
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1289.c,352 :: 		return;
IT	AL
BAL	L_end_Draw_Triangle
;ssd1289.c,353 :: 		}
L_Draw_Triangle57:
;ssd1289.c,355 :: 		dx12 = (x2 - x1);
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #28]
SUB	R4, R4, R5
STRH	R4, [SP, #14]
;ssd1289.c,356 :: 		dy12 = (y2 - y1);
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #32]
SUB	R4, R4, R5
STRH	R4, [SP, #18]
;ssd1289.c,357 :: 		dx13 = (x3 - x1);
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #36]
SUB	R4, R4, R5
STRH	R4, [SP, #16]
;ssd1289.c,358 :: 		dy13 = (y3 - y1);
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #40]
SUB	R12, R4, R5, LSL #0
SXTH	R12, R12
; dy13 start address is: 48 (R12)
;ssd1289.c,359 :: 		dx23 = (x3 - x2);
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #36]
SUB	R9, R4, R5, LSL #0
SXTH	R9, R9
; dx23 start address is: 36 (R9)
;ssd1289.c,360 :: 		dy23 = (y3 - y2);
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #40]
SUB	R11, R4, R5, LSL #0
SXTH	R11, R11
; dy23 start address is: 44 (R11)
;ssd1289.c,361 :: 		sa = 0,
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #8]
;ssd1289.c,362 :: 		sb = 0;
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #10]
;ssd1289.c,364 :: 		if(y2 == y3)
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle64
;ssd1289.c,366 :: 		last = y2;
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #12]
;ssd1289.c,367 :: 		}
IT	AL
BAL	L_Draw_Triangle65
L_Draw_Triangle64:
;ssd1289.c,370 :: 		last = (y2 - 1);
LDRSH	R4, [SP, #32]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ssd1289.c,371 :: 		}
L_Draw_Triangle65:
;ssd1289.c,373 :: 		for(yp = y1; yp <= last; yp++)
; yp start address is: 32 (R8)
LDRSH	R8, [SP, #24]
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
; yp end address is: 32 (R8)
L_Draw_Triangle66:
; yp start address is: 32 (R8)
; dy23 start address is: 44 (R11)
; dx23 start address is: 36 (R9)
; dy13 start address is: 48 (R12)
LDRSH	R4, [SP, #12]
CMP	R8, R4
IT	GT
BGT	L_Draw_Triangle67
;ssd1289.c,375 :: 		a = (x1 + (sa / dy12));
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #20]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ssd1289.c,376 :: 		b = (x1 + (sb / dy13));
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R12
SXTH	R5, R5
LDRSH	R4, [SP, #20]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ssd1289.c,377 :: 		sa += dx12;
LDRSH	R5, [SP, #14]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
;ssd1289.c,378 :: 		sb += dx13;
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ssd1289.c,379 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle69
;ssd1289.c,381 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,382 :: 		}
L_Draw_Triangle69:
;ssd1289.c,383 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #48]
SXTH	R2, R8
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1289.c,373 :: 		for(yp = y1; yp <= last; yp++)
ADD	R0, R8, #1
SXTH	R0, R0
; yp end address is: 32 (R8)
; yp start address is: 0 (R0)
;ssd1289.c,384 :: 		}
; yp end address is: 0 (R0)
SXTH	R8, R0
IT	AL
BAL	L_Draw_Triangle66
L_Draw_Triangle67:
;ssd1289.c,386 :: 		sa = (dx23 * (yp - y2));
; yp start address is: 32 (R8)
LDRSH	R4, [SP, #32]
SUB	R4, R8, R4, LSL #0
SXTH	R4, R4
MUL	R4, R9, R4
STRH	R4, [SP, #8]
;ssd1289.c,387 :: 		sb = (dx13 * (yp - y1));
LDRSH	R4, [SP, #24]
SUB	R5, R8, R4, LSL #0
SXTH	R5, R5
LDRSH	R4, [SP, #16]
MULS	R4, R5, R4
STRH	R4, [SP, #10]
; yp end address is: 32 (R8)
;ssd1289.c,388 :: 		for(; yp <= y3; yp++)
L_Draw_Triangle70:
; dy13 start address is: 48 (R12)
; dy13 end address is: 48 (R12)
; dx23 start address is: 36 (R9)
; dx23 end address is: 36 (R9)
; dy23 start address is: 44 (R11)
; dy23 end address is: 44 (R11)
; yp start address is: 32 (R8)
LDRSH	R4, [SP, #40]
CMP	R8, R4
IT	GT
BGT	L_Draw_Triangle71
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
;ssd1289.c,390 :: 		a = (x2 + (sa / dy23));
; dy23 start address is: 44 (R11)
; dx23 start address is: 36 (R9)
; dy13 start address is: 48 (R12)
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R11
SXTH	R5, R5
LDRSH	R4, [SP, #28]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ssd1289.c,391 :: 		b = (x1 + (sb / dy13));
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R12
SXTH	R5, R5
LDRSH	R4, [SP, #20]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ssd1289.c,392 :: 		sa += dx23;
LDRSH	R4, [SP, #8]
ADD	R4, R4, R9, LSL #0
STRH	R4, [SP, #8]
;ssd1289.c,393 :: 		sb += dx13;
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ssd1289.c,395 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle73
;ssd1289.c,397 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ssd1289.c,398 :: 		}
L_Draw_Triangle73:
;ssd1289.c,399 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #48]
SXTH	R2, R8
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ssd1289.c,388 :: 		for(; yp <= y3; yp++)
ADD	R4, R8, #1
; yp end address is: 32 (R8)
; yp start address is: 0 (R0)
SXTH	R0, R4
;ssd1289.c,400 :: 		}
SXTH	R8, R0
; dy13 end address is: 48 (R12)
; dx23 end address is: 36 (R9)
; dy23 end address is: 44 (R11)
; yp end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle70
L_Draw_Triangle71:
;ssd1289.c,403 :: 		break;
IT	AL
BAL	L_Draw_Triangle52
;ssd1289.c,405 :: 		default:
L_Draw_Triangle74:
;ssd1289.c,407 :: 		Draw_Line(x1, y1, x2, y2, colour);
LDRH	R4, [SP, #48]
LDRSH	R3, [SP, #32]
LDRSH	R2, [SP, #28]
LDRSH	R1, [SP, #24]
LDRSH	R0, [SP, #20]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1289.c,408 :: 		Draw_Line(x2, y2, x3, y3, colour);
LDRH	R4, [SP, #48]
LDRSH	R3, [SP, #40]
LDRSH	R2, [SP, #36]
LDRSH	R1, [SP, #32]
LDRSH	R0, [SP, #28]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1289.c,409 :: 		Draw_Line(x3, y3, x1, y1, colour);
LDRH	R4, [SP, #48]
LDRSH	R3, [SP, #24]
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #40]
LDRSH	R0, [SP, #36]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ssd1289.c,410 :: 		break;
IT	AL
BAL	L_Draw_Triangle52
;ssd1289.c,412 :: 		}
L_Draw_Triangle51:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Triangle53
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle74
L_Draw_Triangle52:
;ssd1289.c,413 :: 		}
L_end_Draw_Triangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _Draw_Triangle
_Draw_Rectangle:
;ssd1289.c,416 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
SXTH	R9, R0
SXTH	R10, R1
STRH	R2, [SP, #12]
STRH	R3, [SP, #16]
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 36 (R9)
; y1 start address is: 40 (R10)
; fill start address is: 0 (R0)
LDRB	R0, [SP, #20]
LDRB	R4, [SP, #24]
STRB	R4, [SP, #24]
LDRH	R4, [SP, #28]
STRH	R4, [SP, #28]
LDRH	R4, [SP, #32]
STRH	R4, [SP, #32]
;ssd1289.c,418 :: 		signed int i = 0x0000;
;ssd1289.c,419 :: 		signed int xmin = 0x0000;
;ssd1289.c,420 :: 		signed int xmax = 0x0000;
;ssd1289.c,421 :: 		signed int ymin = 0x0000;
;ssd1289.c,422 :: 		signed int ymax = 0x0000;
;ssd1289.c,424 :: 		switch(fill)
IT	AL
BAL	L_Draw_Rectangle75
; fill end address is: 0 (R0)
;ssd1289.c,426 :: 		case YES:
L_Draw_Rectangle77:
;ssd1289.c,428 :: 		if(x1 < x2)
LDRSH	R4, [SP, #12]
CMP	R9, R4
IT	GE
BGE	L_Draw_Rectangle78
;ssd1289.c,430 :: 		xmin = x1;
STRH	R9, [SP, #4]
;ssd1289.c,431 :: 		xmax = x2;
LDRSH	R4, [SP, #12]
STRH	R4, [SP, #6]
;ssd1289.c,432 :: 		}
IT	AL
BAL	L_Draw_Rectangle79
L_Draw_Rectangle78:
;ssd1289.c,435 :: 		xmin = x2;
LDRSH	R4, [SP, #12]
STRH	R4, [SP, #4]
;ssd1289.c,436 :: 		xmax = x1;
STRH	R9, [SP, #6]
;ssd1289.c,437 :: 		}
L_Draw_Rectangle79:
;ssd1289.c,439 :: 		if(y1 < y2)
LDRSH	R4, [SP, #16]
CMP	R10, R4
IT	GE
BGE	L_Draw_Rectangle80
;ssd1289.c,441 :: 		ymin = y1;
STRH	R10, [SP, #8]
;ssd1289.c,442 :: 		ymax = y2;
LDRSH	R4, [SP, #16]
STRH	R4, [SP, #10]
;ssd1289.c,443 :: 		}
IT	AL
BAL	L_Draw_Rectangle81
L_Draw_Rectangle80:
;ssd1289.c,446 :: 		ymin = y2;
LDRSH	R4, [SP, #16]
STRH	R4, [SP, #8]
;ssd1289.c,447 :: 		ymax = y1;
STRH	R10, [SP, #10]
;ssd1289.c,448 :: 		}
L_Draw_Rectangle81:
;ssd1289.c,450 :: 		for(; xmin <= xmax; ++xmin)
SXTH	R6, R9
; x1 end address is: 36 (R9)
; y1 end address is: 40 (R10)
SXTH	R8, R10
L_Draw_Rectangle82:
; y1 start address is: 32 (R8)
; x1 start address is: 24 (R6)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	GT
BGT	L_Draw_Rectangle83
;ssd1289.c,452 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 28 (R7)
LDRSH	R7, [SP, #8]
; y1 end address is: 32 (R8)
; i end address is: 28 (R7)
; x1 end address is: 24 (R6)
SXTH	R12, R8
SXTH	R9, R7
SXTH	R7, R6
L_Draw_Rectangle85:
; i start address is: 36 (R9)
; x1 start address is: 28 (R7)
; y1 start address is: 48 (R12)
LDRSH	R4, [SP, #10]
CMP	R9, R4
IT	GT
BGT	L_Draw_Rectangle86
;ssd1289.c,454 :: 		Draw_Pixel(xmin, i, colour);
LDRH	R2, [SP, #28]
SXTH	R1, R9
LDRSH	R0, [SP, #4]
BL	_Draw_Pixel+0
;ssd1289.c,452 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R9, #1
; i end address is: 36 (R9)
; i start address is: 0 (R0)
SXTH	R0, R4
;ssd1289.c,455 :: 		}
; i end address is: 0 (R0)
SXTH	R9, R0
IT	AL
BAL	L_Draw_Rectangle85
L_Draw_Rectangle86:
;ssd1289.c,450 :: 		for(; xmin <= xmax; ++xmin)
LDRSH	R4, [SP, #4]
ADDS	R4, R4, #1
STRH	R4, [SP, #4]
;ssd1289.c,456 :: 		}
SXTH	R6, R7
; x1 end address is: 28 (R7)
; y1 end address is: 48 (R12)
SXTH	R8, R12
IT	AL
BAL	L_Draw_Rectangle82
L_Draw_Rectangle83:
;ssd1289.c,458 :: 		break;
; x1 start address is: 24 (R6)
; y1 start address is: 32 (R8)
; y1 end address is: 32 (R8)
; x1 end address is: 24 (R6)
SXTH	R7, R8
IT	AL
BAL	L_Draw_Rectangle76
;ssd1289.c,460 :: 		default:
L_Draw_Rectangle88:
;ssd1289.c,462 :: 		Draw_V_Line(x1, y1, y2, colour);
; y1 start address is: 40 (R10)
; x1 start address is: 36 (R9)
LDRH	R3, [SP, #28]
LDRSH	R2, [SP, #16]
SXTH	R1, R10
SXTH	R0, R9
BL	_Draw_V_Line+0
;ssd1289.c,463 :: 		Draw_V_Line(x2, y1, y2, colour);
LDRH	R3, [SP, #28]
LDRSH	R2, [SP, #16]
SXTH	R1, R10
LDRSH	R0, [SP, #12]
BL	_Draw_V_Line+0
;ssd1289.c,464 :: 		Draw_H_Line(x1, x2, y1, colour);
LDRH	R3, [SP, #28]
SXTH	R2, R10
LDRSH	R1, [SP, #12]
SXTH	R0, R9
BL	_Draw_H_Line+0
;ssd1289.c,465 :: 		Draw_H_Line(x1, x2, y2, colour);
LDRH	R3, [SP, #28]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
SXTH	R0, R9
BL	_Draw_H_Line+0
;ssd1289.c,466 :: 		break;
SXTH	R6, R9
SXTH	R7, R10
IT	AL
BAL	L_Draw_Rectangle76
;ssd1289.c,468 :: 		}
L_Draw_Rectangle75:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Rectangle77
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Rectangle88
; x1 end address is: 36 (R9)
; y1 end address is: 40 (R10)
L_Draw_Rectangle76:
;ssd1289.c,470 :: 		if(type != SQUARE)
; y1 start address is: 28 (R7)
; x1 start address is: 24 (R6)
LDRB	R4, [SP, #24]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle89
;ssd1289.c,472 :: 		Draw_Pixel(x1, y1, back_colour);
LDRH	R2, [SP, #32]
SXTH	R1, R7
SXTH	R0, R6
BL	_Draw_Pixel+0
;ssd1289.c,473 :: 		Draw_Pixel(x1, y2, back_colour);
LDRH	R2, [SP, #32]
LDRSH	R1, [SP, #16]
SXTH	R0, R6
; x1 end address is: 24 (R6)
BL	_Draw_Pixel+0
;ssd1289.c,474 :: 		Draw_Pixel(x2, y1, back_colour);
LDRH	R2, [SP, #32]
SXTH	R1, R7
; y1 end address is: 28 (R7)
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1289.c,475 :: 		Draw_Pixel(x2, y2, back_colour);
LDRH	R2, [SP, #32]
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #12]
BL	_Draw_Pixel+0
;ssd1289.c,476 :: 		}
L_Draw_Rectangle89:
;ssd1289.c,477 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Draw_Rectangle
_Draw_H_Bar:
;ssd1289.c,480 :: 		void Draw_H_Bar(signed int x1, signed int x2, signed int y1, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
; bar_width start address is: 12 (R3)
; y1 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; bar_width end address is: 12 (R3)
; y1 end address is: 8 (R2)
; x2 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 0 (R0)
; x2 start address is: 4 (R1)
; y1 start address is: 8 (R2)
; bar_width start address is: 12 (R3)
; bar_value start address is: 48 (R12)
LDRSH	R12, [SP, #24]
LDRH	R4, [SP, #28]
STRH	R4, [SP, #28]
; bar_colour start address is: 20 (R5)
LDRH	R5, [SP, #32]
LDRH	R4, [SP, #36]
STRH	R4, [SP, #36]
; border start address is: 16 (R4)
LDRB	R4, [SP, #40]
;ssd1289.c,482 :: 		switch(border)
IT	AL
BAL	L_Draw_H_Bar90
; border end address is: 16 (R4)
;ssd1289.c,484 :: 		case YES:
L_Draw_H_Bar92:
;ssd1289.c,486 :: 		Draw_Rectangle((x1 + 1), (y1 + 1), (x1 + bar_value), (y1 + bar_width - 1), YES, SQUARE, bar_colour, back_colour);
LDRH	R11, [SP, #36]
UXTH	R10, R5
; bar_colour end address is: 20 (R5)
MOVW	R9, #0
MOVW	R8, #1
ADDS	R4, R2, R3
SXTH	R4, R4
SUBS	R7, R4, #1
ADD	R6, R0, R12, LSL #0
ADDS	R5, R2, #1
ADDS	R4, R0, #1
STRH	R12, [SP, #4]
STRH	R3, [SP, #8]
STRH	R2, [SP, #12]
STRH	R1, [SP, #16]
STRH	R0, [SP, #20]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
PUSH	44
PUSH	40
PUSH	36
PUSH	32
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R2, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R12, [SP, #4]
;ssd1289.c,487 :: 		Draw_Rectangle((x2 - 1), (y1 + 1), (x1 + bar_value + 1), (y1 + bar_width - 1), YES, SQUARE, back_colour, back_colour);
LDRH	R11, [SP, #36]
LDRH	R10, [SP, #36]
MOVW	R9, #0
MOVW	R8, #1
ADDS	R4, R2, R3
SXTH	R4, R4
SUBS	R7, R4, #1
ADD	R4, R0, R12, LSL #0
SXTH	R4, R4
; bar_value end address is: 48 (R12)
ADDS	R6, R4, #1
ADDS	R5, R2, #1
SUBS	R4, R1, #1
STRH	R3, [SP, #4]
STRH	R2, [SP, #8]
STRH	R1, [SP, #12]
STRH	R0, [SP, #16]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
PUSH	44
PUSH	40
PUSH	36
PUSH	32
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R2, [SP, #8]
LDRSH	R3, [SP, #4]
;ssd1289.c,488 :: 		Draw_Rectangle(x1, y1, x2, (y1 + bar_width), NO, SQUARE, border_colour, back_colour);
LDRH	R8, [SP, #36]
LDRH	R7, [SP, #28]
MOVS	R6, #0
MOVS	R5, #0
ADDS	R4, R2, R3
; bar_width end address is: 12 (R3)
STRH	R2, [SP, #4]
SXTH	R3, R4
; x2 end address is: 4 (R1)
SXTH	R2, R1
; y1 end address is: 8 (R2)
LDRSH	R1, [SP, #4]
; x1 end address is: 0 (R0)
PUSH	32
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289.c,489 :: 		break;
IT	AL
BAL	L_Draw_H_Bar91
;ssd1289.c,491 :: 		default:
L_Draw_H_Bar93:
;ssd1289.c,493 :: 		Draw_Rectangle(x1, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, bar_colour, back_colour);
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y1 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; x1 start address is: 0 (R0)
LDRH	R9, [SP, #36]
UXTH	R8, R5
; bar_colour end address is: 20 (R5)
MOVS	R7, #0
MOVS	R6, #1
ADDS	R5, R2, R3
ADD	R4, R0, R12, LSL #0
STRH	R12, [SP, #4]
STRH	R3, [SP, #8]
STRH	R2, [SP, #12]
STRH	R1, [SP, #16]
STRH	R0, [SP, #20]
SXTH	R3, R5
SXTH	R1, R2
SXTH	R2, R4
PUSH	36
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R2, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R12, [SP, #4]
;ssd1289.c,494 :: 		Draw_Rectangle(x2, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, back_colour, back_colour);
LDRH	R9, [SP, #36]
LDRH	R8, [SP, #36]
MOVS	R7, #0
MOVS	R6, #1
ADDS	R5, R2, R3
; bar_width end address is: 12 (R3)
ADD	R4, R0, R12, LSL #0
; x1 end address is: 0 (R0)
; bar_value end address is: 48 (R12)
SXTH	R3, R5
SXTH	R0, R1
SXTH	R1, R2
; y1 end address is: 8 (R2)
SXTH	R2, R4
; x2 end address is: 4 (R1)
PUSH	36
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289.c,495 :: 		break;
IT	AL
BAL	L_Draw_H_Bar91
;ssd1289.c,497 :: 		}
L_Draw_H_Bar90:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y1 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_H_Bar92
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_H_Bar93
; x1 end address is: 0 (R0)
; x2 end address is: 4 (R1)
; y1 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_H_Bar91:
;ssd1289.c,498 :: 		}
L_end_Draw_H_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_H_Bar
_Draw_V_Bar:
;ssd1289.c,501 :: 		void Draw_V_Bar(signed int x1, signed int y1, signed int y2, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
; bar_width start address is: 12 (R3)
; y2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; bar_width end address is: 12 (R3)
; y2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 0 (R0)
; y1 start address is: 4 (R1)
; y2 start address is: 8 (R2)
; bar_width start address is: 12 (R3)
; bar_value start address is: 48 (R12)
LDRSH	R12, [SP, #24]
LDRH	R4, [SP, #28]
STRH	R4, [SP, #28]
; bar_colour start address is: 20 (R5)
LDRH	R5, [SP, #32]
LDRH	R4, [SP, #36]
STRH	R4, [SP, #36]
; border start address is: 16 (R4)
LDRB	R4, [SP, #40]
;ssd1289.c,503 :: 		switch(border)
IT	AL
BAL	L_Draw_V_Bar94
; border end address is: 16 (R4)
;ssd1289.c,505 :: 		case YES:
L_Draw_V_Bar96:
;ssd1289.c,507 :: 		Draw_Rectangle((x1 + 1), (y2 - 1), (x1 + bar_width - 1), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
LDRH	R11, [SP, #36]
UXTH	R10, R5
; bar_colour end address is: 20 (R5)
MOVW	R9, #0
MOVW	R8, #1
SUB	R7, R2, R12, LSL #0
ADDS	R4, R0, R3
SXTH	R4, R4
SUBS	R6, R4, #1
SUBS	R5, R2, #1
ADDS	R4, R0, #1
STRH	R12, [SP, #4]
STRH	R3, [SP, #8]
STRH	R2, [SP, #12]
STRH	R1, [SP, #16]
STRH	R0, [SP, #20]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
PUSH	44
PUSH	40
PUSH	36
PUSH	32
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R2, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R12, [SP, #4]
;ssd1289.c,508 :: 		Draw_Rectangle((x1 + 1), (y2 - bar_value - 1), (x1 + bar_width - 1), (y1 + 1), YES, SQUARE, back_colour, back_colour);
LDRH	R11, [SP, #36]
LDRH	R10, [SP, #36]
MOVW	R9, #0
MOVW	R8, #1
ADDS	R7, R1, #1
ADDS	R4, R0, R3
SXTH	R4, R4
SUBS	R6, R4, #1
SUB	R4, R2, R12, LSL #0
SXTH	R4, R4
; bar_value end address is: 48 (R12)
SUBS	R5, R4, #1
ADDS	R4, R0, #1
STRH	R3, [SP, #4]
STRH	R2, [SP, #8]
STRH	R1, [SP, #12]
STRH	R0, [SP, #16]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
PUSH	44
PUSH	40
PUSH	36
PUSH	32
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R2, [SP, #8]
LDRSH	R3, [SP, #4]
;ssd1289.c,509 :: 		Draw_Rectangle(x1, y1, (x1 + bar_width), y2, NO, SQUARE, border_colour, back_colour);
LDRH	R8, [SP, #36]
LDRH	R7, [SP, #28]
MOVS	R6, #0
MOVS	R5, #0
ADDS	R4, R0, R3
; bar_width end address is: 12 (R3)
SXTH	R3, R2
; y2 end address is: 8 (R2)
SXTH	R2, R4
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
PUSH	32
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289.c,510 :: 		break;
IT	AL
BAL	L_Draw_V_Bar95
;ssd1289.c,512 :: 		default:
L_Draw_V_Bar97:
;ssd1289.c,514 :: 		Draw_Rectangle(x1, y2, (x1 + bar_width), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
LDRH	R9, [SP, #36]
UXTH	R8, R5
; bar_colour end address is: 20 (R5)
MOVS	R7, #0
MOVS	R6, #1
SUB	R5, R2, R12, LSL #0
ADDS	R4, R0, R3
STRH	R12, [SP, #4]
STRH	R3, [SP, #8]
STRH	R2, [SP, #12]
STRH	R1, [SP, #16]
STRH	R0, [SP, #20]
SXTH	R3, R5
SXTH	R1, R2
SXTH	R2, R4
PUSH	36
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
LDRSH	R0, [SP, #20]
LDRSH	R1, [SP, #16]
LDRSH	R2, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R12, [SP, #4]
;ssd1289.c,515 :: 		Draw_Rectangle(x1, (y2 - bar_value), (x1 + bar_width), y1, YES, SQUARE, back_colour, back_colour);
LDRH	R9, [SP, #36]
LDRH	R8, [SP, #36]
MOVS	R7, #0
MOVS	R6, #1
ADDS	R5, R0, R3
; bar_width end address is: 12 (R3)
SUB	R4, R2, R12, LSL #0
; y2 end address is: 8 (R2)
; bar_value end address is: 48 (R12)
SXTH	R3, R1
; y1 end address is: 4 (R1)
SXTH	R2, R5
SXTH	R1, R4
; x1 end address is: 0 (R0)
PUSH	36
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289.c,516 :: 		break;
IT	AL
BAL	L_Draw_V_Bar95
;ssd1289.c,518 :: 		}
L_Draw_V_Bar94:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_V_Bar96
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_V_Bar97
; x1 end address is: 0 (R0)
; y1 end address is: 4 (R1)
; y2 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_V_Bar95:
;ssd1289.c,519 :: 		}
L_end_Draw_V_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_V_Bar
_Draw_Circle:
;ssd1289.c,522 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
; radius start address is: 8 (R2)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R0, [SP, #12]
SXTH	R0, R2
STRH	R1, [SP, #16]
STRB	R3, [SP, #20]
; radius end address is: 8 (R2)
; radius start address is: 0 (R0)
LDRH	R4, [SP, #24]
STRH	R4, [SP, #24]
;ssd1289.c,524 :: 		signed int a = 0x0000;
MOVW	R4, #0
STRH	R4, [SP, #4]
;ssd1289.c,525 :: 		signed int b = 0x0000;
;ssd1289.c,526 :: 		signed int p = 0x0000;
;ssd1289.c,528 :: 		b = radius;
STRH	R0, [SP, #6]
;ssd1289.c,529 :: 		p = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #8]
;ssd1289.c,531 :: 		do
L_Draw_Circle98:
;ssd1289.c,533 :: 		switch(fill)
IT	AL
BAL	L_Draw_Circle101
;ssd1289.c,535 :: 		case YES:
L_Draw_Circle103:
;ssd1289.c,537 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
LDRH	R8, [SP, #24]
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
;ssd1289.c,538 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
LDRH	R8, [SP, #24]
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
;ssd1289.c,539 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
LDRH	R8, [SP, #24]
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
;ssd1289.c,540 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
LDRH	R8, [SP, #24]
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
;ssd1289.c,541 :: 		break;
IT	AL
BAL	L_Draw_Circle102
;ssd1289.c,543 :: 		default:
L_Draw_Circle104:
;ssd1289.c,545 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,546 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,547 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,548 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,549 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,550 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,551 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,552 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
SXTH	R1, R6
SXTH	R0, R4
BL	_Draw_Pixel+0
;ssd1289.c,553 :: 		break;
IT	AL
BAL	L_Draw_Circle102
;ssd1289.c,555 :: 		}
L_Draw_Circle101:
LDRB	R4, [SP, #20]
CMP	R4, #1
IT	EQ
BEQ	L_Draw_Circle103
IT	AL
BAL	L_Draw_Circle104
L_Draw_Circle102:
;ssd1289.c,557 :: 		if(p < 0)
LDRSH	R4, [SP, #8]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle105
;ssd1289.c,559 :: 		p += (0x03 + (0x02 * a++));
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
;ssd1289.c,560 :: 		}
IT	AL
BAL	L_Draw_Circle106
L_Draw_Circle105:
;ssd1289.c,563 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
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
;ssd1289.c,564 :: 		}
L_Draw_Circle106:
;ssd1289.c,565 :: 		}while(a <= b);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_Circle98
;ssd1289.c,566 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_Draw_Font_Pixel:
;ssd1289.c,569 :: 		void Draw_Font_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour, unsigned char pixel_size)
; pixel_size start address is: 12 (R3)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R6, R2
UXTB	R7, R3
; pixel_size end address is: 12 (R3)
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 24 (R6)
; pixel_size start address is: 28 (R7)
;ssd1289.c,571 :: 		unsigned int i = 0x0000;
;ssd1289.c,573 :: 		TFT_CS_pin = low;
MOVS	R5, #0
SXTB	R5, R5
MOVW	R4, #lo_addr(GPIOC_ODRbits+0)
MOVT	R4, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R4, #0]
;ssd1289.c,574 :: 		TFT_set_cursor(x_pos, y_pos);
SXTH	R1, R1
; y_pos end address is: 4 (R1)
SXTH	R0, R0
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ssd1289.c,575 :: 		for(i = 0x0000; i < (pixel_size * pixel_size); i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; pixel_size end address is: 28 (R7)
; i end address is: 0 (R0)
UXTB	R5, R7
UXTH	R7, R0
L_Draw_Font_Pixel107:
; i start address is: 28 (R7)
; pixel_size start address is: 20 (R5)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
MUL	R4, R5, R5
SXTH	R4, R4
CMP	R7, R4
IT	CS
BCS	L_Draw_Font_Pixel108
; colour end address is: 24 (R6)
;ssd1289.c,577 :: 		TFT_write(colour, DAT);
; colour start address is: 24 (R6)
MOVS	R1, #1
UXTH	R0, R6
BL	_TFT_write+0
;ssd1289.c,575 :: 		for(i = 0x0000; i < (pixel_size * pixel_size); i++)
ADDS	R7, R7, #1
UXTH	R7, R7
;ssd1289.c,578 :: 		}
; pixel_size end address is: 20 (R5)
; colour end address is: 24 (R6)
; i end address is: 28 (R7)
IT	AL
BAL	L_Draw_Font_Pixel107
L_Draw_Font_Pixel108:
;ssd1289.c,580 :: 		TFT_CS_pin = high;
MOVS	R5, #1
SXTB	R5, R5
MOVW	R4, #lo_addr(GPIOC_ODRbits+0)
MOVT	R4, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R4, #0]
;ssd1289.c,581 :: 		}
L_end_Draw_Font_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Font_Pixel
_print_char:
;ssd1289.c,584 :: 		void print_char(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R2, [SP, #4]
UXTH	R2, R1
UXTH	R1, R0
LDRB	R0, [SP, #4]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 4 (R1)
; y_pos start address is: 8 (R2)
; font_size start address is: 0 (R0)
; colour start address is: 12 (R3)
; back_colour start address is: 20 (R5)
LDRH	R5, [SP, #12]
; ch start address is: 24 (R6)
LDRB	R6, [SP, #16]
;ssd1289.c,586 :: 		unsigned char i = 0x00;
;ssd1289.c,587 :: 		unsigned char j = 0x00;
;ssd1289.c,589 :: 		unsigned int value = 0x0000;
;ssd1289.c,591 :: 		if(font_size <= 0)
CMP	R0, #0
IT	HI
BHI	L__print_char247
;ssd1289.c,593 :: 		font_size = 1;
MOVS	R0, #1
; font_size end address is: 0 (R0)
UXTB	R8, R0
;ssd1289.c,594 :: 		}
IT	AL
BAL	L_print_char110
L__print_char247:
;ssd1289.c,591 :: 		if(font_size <= 0)
UXTB	R8, R0
;ssd1289.c,594 :: 		}
L_print_char110:
;ssd1289.c,596 :: 		if((x_pos >= MAX_X) || (y_pos > MAX_Y))
; font_size start address is: 32 (R8)
CMP	R1, #320
IT	CS
BCS	L__print_char246
CMP	R2, #240
IT	HI
BHI	L__print_char245
IT	AL
BAL	L_print_char113
L__print_char246:
L__print_char245:
;ssd1289.c,599 :: 		}
L_print_char113:
;ssd1289.c,601 :: 		for(i = 0x00; i < 0x05; i++)
; i start address is: 48 (R12)
MOVW	R12, #0
; x_pos end address is: 4 (R1)
; colour end address is: 12 (R3)
; back_colour end address is: 20 (R5)
; ch end address is: 24 (R6)
; font_size end address is: 32 (R8)
; y_pos end address is: 8 (R2)
; i end address is: 48 (R12)
UXTH	R0, R1
UXTH	R9, R3
UXTH	R10, R5
UXTB	R11, R6
L_print_char114:
; i start address is: 48 (R12)
; font_size start address is: 32 (R8)
; ch start address is: 44 (R11)
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 8 (R2)
; x_pos start address is: 0 (R0)
CMP	R12, #5
IT	CS
BCS	L_print_char115
;ssd1289.c,603 :: 		for(j = 0x00; j < 0x08; j++)
; j start address is: 4 (R1)
MOVS	R1, #0
; colour end address is: 36 (R9)
; back_colour end address is: 40 (R10)
; ch end address is: 44 (R11)
; font_size end address is: 32 (R8)
; j end address is: 4 (R1)
; y_pos end address is: 8 (R2)
; x_pos end address is: 0 (R0)
; i end address is: 48 (R12)
L_print_char117:
; j start address is: 4 (R1)
; x_pos start address is: 0 (R0)
; y_pos start address is: 8 (R2)
; colour start address is: 36 (R9)
; back_colour start address is: 40 (R10)
; ch start address is: 44 (R11)
; font_size start address is: 32 (R8)
; i start address is: 48 (R12)
CMP	R1, #8
IT	CS
BCS	L_print_char118
;ssd1289.c,606 :: 		value = ((font[((unsigned char)ch) - 0x20][i]));
SUB	R5, R11, #32
SXTH	R5, R5
MOVS	R4, #5
MULS	R5, R4, R5
MOVW	R4, #lo_addr(ssd1289_tft_demo_font+0)
MOVT	R4, #hi_addr(ssd1289_tft_demo_font+0)
ADDS	R4, R4, R5
ADD	R4, R4, R12, LSL #0
LDRB	R4, [R4, #0]
; value start address is: 12 (R3)
UXTB	R3, R4
;ssd1289.c,608 :: 		if(((value >> j) & 0x01) != 0x00)
LSR	R4, R3, R1
UXTH	R4, R4
; value end address is: 12 (R3)
AND	R4, R4, #1
UXTH	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_print_char120
;ssd1289.c,610 :: 		Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
STRH	R2, [SP, #4]
STRH	R0, [SP, #8]
STRB	R1, [SP, #10]
UXTB	R3, R8
UXTH	R1, R2
UXTH	R2, R9
BL	_Draw_Font_Pixel+0
LDRB	R1, [SP, #10]
LDRH	R0, [SP, #8]
LDRH	R2, [SP, #4]
;ssd1289.c,611 :: 		}
IT	AL
BAL	L_print_char121
L_print_char120:
;ssd1289.c,614 :: 		Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
STRH	R2, [SP, #4]
STRH	R0, [SP, #8]
STRB	R1, [SP, #10]
UXTB	R3, R8
UXTH	R1, R2
UXTH	R2, R10
BL	_Draw_Font_Pixel+0
LDRB	R1, [SP, #10]
LDRH	R0, [SP, #8]
LDRH	R2, [SP, #4]
;ssd1289.c,615 :: 		}
L_print_char121:
;ssd1289.c,617 :: 		y_pos += font_size;
ADD	R2, R2, R8, LSL #0
UXTH	R2, R2
;ssd1289.c,603 :: 		for(j = 0x00; j < 0x08; j++)
ADDS	R1, R1, #1
UXTB	R1, R1
;ssd1289.c,618 :: 		}
; j end address is: 4 (R1)
IT	AL
BAL	L_print_char117
L_print_char118:
;ssd1289.c,619 :: 		y_pos -= (font_size << 0x03);
LSL	R4, R8, #3
UXTH	R4, R4
SUB	R2, R2, R4
UXTH	R2, R2
;ssd1289.c,620 :: 		x_pos++;
ADDS	R0, R0, #1
UXTH	R0, R0
;ssd1289.c,601 :: 		for(i = 0x00; i < 0x05; i++)
ADD	R12, R12, #1
UXTB	R12, R12
;ssd1289.c,621 :: 		}
; colour end address is: 36 (R9)
; back_colour end address is: 40 (R10)
; ch end address is: 44 (R11)
; font_size end address is: 32 (R8)
; y_pos end address is: 8 (R2)
; x_pos end address is: 0 (R0)
; i end address is: 48 (R12)
IT	AL
BAL	L_print_char114
L_print_char115:
;ssd1289.c,622 :: 		}
L_end_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_char
_print_str:
;ssd1289.c,625 :: 		void print_str(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
STRB	R2, [SP, #16]
STRH	R3, [SP, #20]
LDRH	R4, [SP, #24]
STRH	R4, [SP, #24]
; ch start address is: 0 (R0)
LDR	R0, [SP, #28]
; ch end address is: 0 (R0)
;ssd1289.c,627 :: 		do
L_print_str122:
;ssd1289.c,629 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
; ch start address is: 28 (R7)
; ch start address is: 0 (R0)
LDRB	R4, [R0, #0]
UXTB	R5, R4
LDRH	R4, [SP, #24]
STR	R0, [SP, #4]
LDRH	R3, [SP, #20]
LDRB	R2, [SP, #16]
LDRH	R1, [SP, #12]
LDRH	R0, [SP, #8]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
ADDS	R5, R0, #1
; ch end address is: 0 (R0)
; ch start address is: 28 (R7)
MOV	R7, R5
; ch end address is: 28 (R7)
;ssd1289.c,630 :: 		x_pos += 0x06;
LDRH	R4, [SP, #8]
ADDS	R4, R4, #6
STRH	R4, [SP, #8]
;ssd1289.c,631 :: 		}while((*ch >= 0x20) && (*ch <= 0x7F));
LDRB	R4, [R5, #0]
CMP	R4, #32
IT	CC
BCC	L__print_str250
; ch end address is: 28 (R7)
; ch start address is: 28 (R7)
LDRB	R4, [R7, #0]
CMP	R4, #127
IT	HI
BHI	L__print_str249
MOV	R0, R7
; ch end address is: 28 (R7)
IT	AL
BAL	L_print_str122
L__print_str250:
L__print_str249:
;ssd1289.c,632 :: 		}
L_end_print_str:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _print_str
_print_C:
;ssd1289.c,635 :: 		void print_C(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 32 (R8)
LDRH	R8, [SP, #8]
; value start address is: 24 (R6)
LDRSH	R6, [SP, #12]
;ssd1289.c,637 :: 		unsigned char ch[4] = {0x20, 0x20, 0x20, 0x20};
MOVS	R4, #32
STRB	R4, [SP, #4]
MOVS	R4, #32
STRB	R4, [SP, #5]
MOVS	R4, #32
STRB	R4, [SP, #6]
MOVS	R4, #32
STRB	R4, [SP, #7]
;ssd1289.c,639 :: 		if(value < 0x00)
CMP	R6, #0
IT	GE
BGE	L_print_C127
;ssd1289.c,641 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ssd1289.c,642 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ssd1289.c,643 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_C128
L_print_C127:
;ssd1289.c,646 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;ssd1289.c,647 :: 		}
L_print_C128:
;ssd1289.c,649 :: 		if((value > 99) && (value <= 999))
; value start address is: 36 (R9)
CMP	R9, #99
IT	LE
BLE	L__print_C255
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_C254
L__print_C253:
;ssd1289.c,651 :: 		ch[1] = ((value / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ssd1289.c,652 :: 		ch[2] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R4, #100
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVS	R4, #10
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,653 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,654 :: 		}
IT	AL
BAL	L_print_C132
;ssd1289.c,649 :: 		if((value > 99) && (value <= 999))
L__print_C255:
; value start address is: 36 (R9)
L__print_C254:
;ssd1289.c,655 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_C257
CMP	R9, #99
IT	GT
BGT	L__print_C256
L__print_C252:
;ssd1289.c,657 :: 		ch[1] = (((value % 100) / 10) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVS	R4, #100
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVS	R4, #10
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,658 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,659 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,660 :: 		}
IT	AL
BAL	L_print_C136
;ssd1289.c,655 :: 		else if((value > 9) && (value <= 99))
L__print_C257:
; value start address is: 36 (R9)
L__print_C256:
;ssd1289.c,661 :: 		else if((value >= 0) && (value <= 9))
CMP	R9, #0
IT	LT
BLT	L__print_C259
CMP	R9, #9
IT	GT
BGT	L__print_C258
L__print_C251:
;ssd1289.c,663 :: 		ch[1] = ((value % 10) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,664 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,665 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,661 :: 		else if((value >= 0) && (value <= 9))
L__print_C259:
L__print_C258:
;ssd1289.c,666 :: 		}
L_print_C136:
L_print_C132:
;ssd1289.c,668 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
ADD	R5, SP, #4
UXTH	R4, R8
; back_colour end address is: 32 (R8)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
PUSH	(R5)
PUSH	(R4)
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289.c,669 :: 		}
L_end_print_C:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _print_C
_print_I:
;ssd1289.c,672 :: 		void print_I(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed long value)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 32 (R8)
LDRH	R8, [SP, #12]
; value start address is: 24 (R6)
LDR	R6, [SP, #16]
;ssd1289.c,674 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
MOVS	R4, #32
STRB	R4, [SP, #4]
MOVS	R4, #32
STRB	R4, [SP, #5]
MOVS	R4, #32
STRB	R4, [SP, #6]
MOVS	R4, #32
STRB	R4, [SP, #7]
MOVS	R4, #32
STRB	R4, [SP, #8]
MOVS	R4, #32
STRB	R4, [SP, #9]
;ssd1289.c,676 :: 		if(value < 0)
CMP	R6, #0
IT	GE
BGE	L_print_I140
;ssd1289.c,678 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ssd1289.c,679 :: 		value = -value;
RSB	R9, R6, #0
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ssd1289.c,680 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_I141
L_print_I140:
;ssd1289.c,683 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
MOV	R9, R6
;ssd1289.c,684 :: 		}
L_print_I141:
;ssd1289.c,686 :: 		if(value > 9999)
; value start address is: 36 (R9)
MOVW	R4, #9999
CMP	R9, R4
IT	LE
BLE	L_print_I142
;ssd1289.c,688 :: 		ch[1] = ((value / 10000) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVW	R4, #10000
SDIV	R4, R9, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ssd1289.c,689 :: 		ch[2] = (((value % 10000)/ 1000) + 0x30);
ADDS	R6, R7, #2
MOVW	R4, #10000
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVW	R4, #1000
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,690 :: 		ch[3] = (((value % 1000) / 100) + 0x30);
ADDS	R6, R7, #3
MOVW	R4, #1000
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #100
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,691 :: 		ch[4] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #4
MOVS	R4, #100
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #10
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,692 :: 		ch[5] = ((value % 10) + 0x30);
ADDS	R6, R7, #5
MOVS	R5, #10
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,693 :: 		}
IT	AL
BAL	L_print_I143
L_print_I142:
;ssd1289.c,695 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 36 (R9)
MOVW	R4, #999
CMP	R9, R4
IT	LE
BLE	L__print_I264
MOVW	R4, #9999
CMP	R9, R4
IT	GT
BGT	L__print_I263
L__print_I262:
;ssd1289.c,697 :: 		ch[1] = (((value % 10000)/ 1000) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVW	R4, #10000
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVW	R4, #1000
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,698 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
ADDS	R6, R7, #2
MOVW	R4, #1000
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #100
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,699 :: 		ch[3] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R4, #100
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #10
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,700 :: 		ch[4] = ((value % 10) + 0x30);
ADDS	R6, R7, #4
MOVS	R5, #10
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,701 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,702 :: 		}
IT	AL
BAL	L_print_I147
;ssd1289.c,695 :: 		else if((value > 999) && (value <= 9999))
L__print_I264:
; value start address is: 36 (R9)
L__print_I263:
;ssd1289.c,703 :: 		else if((value > 99) && (value <= 999))
CMP	R9, #99
IT	LE
BLE	L__print_I266
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_I265
L__print_I261:
;ssd1289.c,705 :: 		ch[1] = (((value % 1000) / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVW	R4, #1000
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #100
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,706 :: 		ch[2] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R4, #100
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #10
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,707 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,708 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,709 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,710 :: 		}
IT	AL
BAL	L_print_I151
;ssd1289.c,703 :: 		else if((value > 99) && (value <= 999))
L__print_I266:
; value start address is: 36 (R9)
L__print_I265:
;ssd1289.c,711 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_I268
CMP	R9, #99
IT	GT
BGT	L__print_I267
L__print_I260:
;ssd1289.c,713 :: 		ch[1] = (((value % 100) / 10) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVS	R4, #100
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
MOVS	R4, #10
SDIV	R4, R5, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,714 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,715 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,716 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,717 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,718 :: 		}
IT	AL
BAL	L_print_I155
;ssd1289.c,711 :: 		else if((value > 9) && (value <= 99))
L__print_I268:
; value start address is: 36 (R9)
L__print_I267:
;ssd1289.c,721 :: 		ch[1] = ((value % 10) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVS	R5, #10
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,722 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,723 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,724 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,725 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ssd1289.c,726 :: 		}
L_print_I155:
L_print_I151:
L_print_I147:
L_print_I143:
;ssd1289.c,728 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
ADD	R5, SP, #4
UXTH	R4, R8
; back_colour end address is: 32 (R8)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
PUSH	(R5)
PUSH	(R4)
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289.c,729 :: 		}
L_end_print_I:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_I
_print_D:
;ssd1289.c,732 :: 		void print_D(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value, unsigned char points)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 28 (R7)
LDRH	R7, [SP, #12]
; value start address is: 32 (R8)
LDRSH	R8, [SP, #16]
; points start address is: 36 (R9)
LDRB	R9, [SP, #20]
;ssd1289.c,734 :: 		char ch[5] = {0x2E, 0x20, 0x20, 0x20, 0x20};
MOVS	R4, #46
STRB	R4, [SP, #4]
MOVS	R4, #32
STRB	R4, [SP, #5]
MOVS	R4, #32
STRB	R4, [SP, #6]
MOVS	R4, #32
STRB	R4, [SP, #7]
MOVS	R4, #32
STRB	R4, [SP, #8]
;ssd1289.c,736 :: 		ch[1] = ((value / 1000) + 0x30);
ADD	R4, SP, #4
ADDS	R5, R4, #1
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R4, R8, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ssd1289.c,738 :: 		if(points > 1)
CMP	R9, #1
IT	LS
BLS	L_print_D156
;ssd1289.c,740 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #2
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R5, R8, R4
MLS	R5, R4, R5, R8
SXTH	R5, R5
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,742 :: 		if(points > 2)
CMP	R9, #2
IT	LS
BLS	L_print_D157
;ssd1289.c,744 :: 		ch[3] = (((value % 100) / 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #3
MOVS	R4, #100
SXTH	R4, R4
SDIV	R5, R8, R4
MLS	R5, R4, R5, R8
SXTH	R5, R5
MOVS	R4, #10
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,746 :: 		if(points > 3)
CMP	R9, #3
IT	LS
BLS	L_print_D158
; points end address is: 36 (R9)
;ssd1289.c,748 :: 		ch[4] = ((value % 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #4
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R8, R5
MLS	R4, R5, R4, R8
SXTH	R4, R4
; value end address is: 32 (R8)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ssd1289.c,749 :: 		}
L_print_D158:
;ssd1289.c,750 :: 		}
L_print_D157:
;ssd1289.c,751 :: 		}
L_print_D156:
;ssd1289.c,753 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
ADD	R5, SP, #4
UXTH	R4, R7
; back_colour end address is: 28 (R7)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
PUSH	(R5)
PUSH	(R4)
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289.c,754 :: 		}
L_end_print_D:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_D
_print_F:
;ssd1289.c,757 :: 		void print_F(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
SUB	SP, SP, #36
STR	LR, [SP, #0]
STRH	R0, [SP, #28]
UXTH	R8, R3
UXTB	R3, R2
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; y_pos start address is: 4 (R1)
; font_size start address is: 12 (R3)
; colour start address is: 32 (R8)
; back_colour start address is: 36 (R9)
LDRH	R9, [SP, #36]
; value start address is: 40 (R10)
LDR	R10, [SP, #40]
LDRB	R4, [SP, #44]
STRB	R4, [SP, #44]
;ssd1289.c,759 :: 		signed long tmp = 0x0000;
;ssd1289.c,761 :: 		tmp = value;
STRH	R1, [SP, #4]
MOV	R0, R10
BL	__FloatToSignedIntegral+0
LDRH	R1, [SP, #4]
STR	R0, [SP, #24]
;ssd1289.c,762 :: 		print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
MOV	R5, R0
UXTH	R4, R9
STR	R10, [SP, #4]
STRH	R9, [SP, #8]
STRH	R8, [SP, #12]
STRB	R3, [SP, #16]
STRH	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R8
LDRH	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_I+0
ADD	SP, SP, #8
LDRH	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R8, [SP, #12]
LDRH	R9, [SP, #8]
LDR	R10, [SP, #4]
;ssd1289.c,763 :: 		tmp = ((value - tmp) * 10000);
STRH	R1, [SP, #4]
LDR	R0, [SP, #24]
BL	__SignedIntegralToFloat+0
LDRH	R1, [SP, #4]
STR	R0, [SP, #32]
LDR	R2, [SP, #32]
STRH	R8, [SP, #4]
STRB	R3, [SP, #8]
STRH	R1, [SP, #12]
MOV	R0, R10
BL	__Sub_FP+0
LDRH	R1, [SP, #12]
LDRB	R3, [SP, #8]
LDRH	R8, [SP, #4]
MOVW	R2, #16384
MOVT	R2, #17948
STRB	R3, [SP, #4]
STRH	R1, [SP, #8]
BL	__Mul_FP+0
LDRH	R1, [SP, #8]
LDRB	R3, [SP, #4]
STRH	R1, [SP, #4]
BL	__FloatToSignedIntegral+0
LDRH	R1, [SP, #4]
STR	R0, [SP, #24]
;ssd1289.c,765 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BGE	L_print_F159
;ssd1289.c,767 :: 		tmp = -tmp;
LDR	R4, [SP, #24]
RSBS	R4, R4, #0
STR	R4, [SP, #24]
;ssd1289.c,768 :: 		}
L_print_F159:
;ssd1289.c,770 :: 		if((value >= 10000) && (value < 100000))
MOVW	R0, #16384
MOVT	R0, #17948
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F318
MOVS	R0, #1
L__print_F318:
CMP	R0, #0
IT	EQ
BEQ	L__print_F274
MOVW	R0, #20480
MOVT	R0, #18371
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F319
MOVS	R0, #1
L__print_F319:
CMP	R0, #0
IT	EQ
BEQ	L__print_F273
; value end address is: 40 (R10)
L__print_F272:
;ssd1289.c,772 :: 		print_D((x_pos + 36), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRH	R4, [SP, #28]
ADDS	R4, #36
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ssd1289.c,773 :: 		}
IT	AL
BAL	L_print_F163
;ssd1289.c,770 :: 		if((value >= 10000) && (value < 100000))
L__print_F274:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F273:
;ssd1289.c,774 :: 		else if((value >= 1000) && (value < 10000))
MOVW	R0, #0
MOVT	R0, #17530
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F320
MOVS	R0, #1
L__print_F320:
CMP	R0, #0
IT	EQ
BEQ	L__print_F276
MOVW	R0, #16384
MOVT	R0, #17948
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F321
MOVS	R0, #1
L__print_F321:
CMP	R0, #0
IT	EQ
BEQ	L__print_F275
; value end address is: 40 (R10)
L__print_F271:
;ssd1289.c,776 :: 		print_D((x_pos + 30), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRH	R4, [SP, #28]
ADDS	R4, #30
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ssd1289.c,777 :: 		}
IT	AL
BAL	L_print_F167
;ssd1289.c,774 :: 		else if((value >= 1000) && (value < 10000))
L__print_F276:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F275:
;ssd1289.c,778 :: 		else if((value >= 100) && (value < 1000))
MOVW	R0, #0
MOVT	R0, #17096
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F322
MOVS	R0, #1
L__print_F322:
CMP	R0, #0
IT	EQ
BEQ	L__print_F278
MOVW	R0, #0
MOVT	R0, #17530
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F323
MOVS	R0, #1
L__print_F323:
CMP	R0, #0
IT	EQ
BEQ	L__print_F277
; value end address is: 40 (R10)
L__print_F270:
;ssd1289.c,780 :: 		print_D((x_pos + 24), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRH	R4, [SP, #28]
ADDS	R4, #24
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ssd1289.c,781 :: 		}
IT	AL
BAL	L_print_F171
;ssd1289.c,778 :: 		else if((value >= 100) && (value < 1000))
L__print_F278:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F277:
;ssd1289.c,782 :: 		else if((value >= 10) && (value < 100))
MOVW	R0, #0
MOVT	R0, #16672
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F324
MOVS	R0, #1
L__print_F324:
CMP	R0, #0
IT	EQ
BEQ	L__print_F280
MOVW	R0, #0
MOVT	R0, #17096
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F325
MOVS	R0, #1
L__print_F325:
CMP	R0, #0
IT	EQ
BEQ	L__print_F279
; value end address is: 40 (R10)
L__print_F269:
;ssd1289.c,784 :: 		print_D((x_pos + 18), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRH	R4, [SP, #28]
ADDS	R4, #18
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ssd1289.c,785 :: 		}
IT	AL
BAL	L_print_F175
;ssd1289.c,782 :: 		else if((value >= 10) && (value < 100))
L__print_F280:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F279:
;ssd1289.c,786 :: 		else if(value < 10)
MOVW	R0, #0
MOVT	R0, #16672
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F326
MOVS	R0, #1
L__print_F326:
CMP	R0, #0
IT	EQ
BEQ	L_print_F176
;ssd1289.c,788 :: 		print_D((x_pos + 12), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
LDRH	R4, [SP, #28]
ADDS	R4, #12
STR	R10, [SP, #4]
STRH	R9, [SP, #8]
STRH	R8, [SP, #12]
STRB	R3, [SP, #16]
STRH	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R8
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
LDRH	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R8, [SP, #12]
LDRH	R9, [SP, #8]
LDR	R10, [SP, #4]
;ssd1289.c,790 :: 		if((value) < 0)
MOV	R0, #0
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F327
MOVS	R0, #1
L__print_F327:
; value end address is: 40 (R10)
CMP	R0, #0
IT	EQ
BEQ	L_print_F177
;ssd1289.c,792 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
MOVS	R5, #45
UXTH	R4, R9
; back_colour end address is: 36 (R9)
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
LDRH	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ssd1289.c,793 :: 		}
IT	AL
BAL	L_print_F178
L_print_F177:
;ssd1289.c,796 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
MOVS	R5, #32
UXTH	R4, R9
; back_colour end address is: 36 (R9)
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
LDRH	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ssd1289.c,797 :: 		}
L_print_F178:
;ssd1289.c,798 :: 		}
L_print_F176:
L_print_F175:
L_print_F171:
L_print_F167:
L_print_F163:
;ssd1289.c,799 :: 		}
L_end_print_F:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_F
_Draw_BMP:
;ssd1289.c,802 :: 		void Draw_BMP(unsigned int x_pos, unsigned int y_pos, signed int W, signed int H, const unsigned int *bitmap)
; H start address is: 12 (R3)
; W start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R5, R3
UXTH	R3, R1
; H end address is: 12 (R3)
; W end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 12 (R3)
; W start address is: 8 (R2)
; H start address is: 20 (R5)
; bitmap start address is: 4 (R1)
LDR	R1, [SP, #4]
;ssd1289.c,804 :: 		signed int xp = 0;
;ssd1289.c,805 :: 		signed int yp = (y_pos + H);
ADD	R10, R3, R5, LSL #0
SXTH	R10, R10
; y_pos end address is: 12 (R3)
; H end address is: 20 (R5)
; yp start address is: 40 (R10)
;ssd1289.c,806 :: 		unsigned long index = 0;
; index start address is: 44 (R11)
MOV	R11, #0
;ssd1289.c,808 :: 		TFT_CS_pin = low;
MOVS	R5, #0
SXTB	R5, R5
MOVW	R4, #lo_addr(GPIOC_ODRbits+0)
MOVT	R4, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R4, #0]
; x_pos end address is: 0 (R0)
; W end address is: 8 (R2)
; bitmap end address is: 4 (R1)
; index end address is: 44 (R11)
; yp end address is: 40 (R10)
UXTH	R6, R0
SXTH	R7, R2
MOV	R8, R1
;ssd1289.c,810 :: 		while(yp > 0)
L_Draw_BMP179:
; index start address is: 44 (R11)
; yp start address is: 40 (R10)
; bitmap start address is: 32 (R8)
; W start address is: 28 (R7)
; x_pos start address is: 24 (R6)
CMP	R10, #0
IT	LE
BLE	L_Draw_BMP180
;ssd1289.c,812 :: 		for(xp = x_pos; xp < (x_pos + W); xp++)
; xp start address is: 0 (R0)
SXTH	R0, R6
; xp end address is: 0 (R0)
; x_pos end address is: 24 (R6)
; W end address is: 28 (R7)
; bitmap end address is: 32 (R8)
; index end address is: 44 (R11)
; yp end address is: 40 (R10)
SXTH	R9, R0
L_Draw_BMP181:
; xp start address is: 36 (R9)
; x_pos start address is: 24 (R6)
; W start address is: 28 (R7)
; bitmap start address is: 32 (R8)
; yp start address is: 40 (R10)
; index start address is: 44 (R11)
ADDS	R4, R6, R7
UXTH	R4, R4
CMP	R9, R4
IT	CS
BCS	L_Draw_BMP182
;ssd1289.c,814 :: 		Draw_Pixel(xp, yp, bitmap[index++]);
LSL	R4, R11, #1
ADD	R4, R8, R4, LSL #0
LDRH	R4, [R4, #0]
UXTH	R2, R4
SXTH	R1, R10
SXTH	R0, R9
BL	_Draw_Pixel+0
ADD	R11, R11, #1
;ssd1289.c,812 :: 		for(xp = x_pos; xp < (x_pos + W); xp++)
ADD	R9, R9, #1
SXTH	R9, R9
;ssd1289.c,815 :: 		}
; xp end address is: 36 (R9)
IT	AL
BAL	L_Draw_BMP181
L_Draw_BMP182:
;ssd1289.c,816 :: 		yp--;
SUB	R10, R10, #1
SXTH	R10, R10
;ssd1289.c,817 :: 		}
; x_pos end address is: 24 (R6)
; W end address is: 28 (R7)
; bitmap end address is: 32 (R8)
; index end address is: 44 (R11)
; yp end address is: 40 (R10)
IT	AL
BAL	L_Draw_BMP179
L_Draw_BMP180:
;ssd1289.c,819 :: 		TFT_CS_pin = high;
MOVS	R5, #1
SXTB	R5, R5
MOVW	R4, #lo_addr(GPIOC_ODRbits+0)
MOVT	R4, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R4, #0]
;ssd1289.c,820 :: 		}
L_end_Draw_BMP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_BMP
_main:
;ssd1289_tft_demo.c,15 :: 		void main()
SUB	SP, SP, #12
;ssd1289_tft_demo.c,17 :: 		setup_MCU();
BL	_setup_MCU+0
;ssd1289_tft_demo.c,19 :: 		test_RGB();
BL	_test_RGB+0
;ssd1289_tft_demo.c,20 :: 		test_colours();
BL	_test_colours+0
;ssd1289_tft_demo.c,21 :: 		test_2D_graphics();
BL	_test_2D_graphics+0
;ssd1289_tft_demo.c,22 :: 		draw_flag();
BL	_draw_flag+0
;ssd1289_tft_demo.c,23 :: 		print_test_data();
BL	_print_test_data+0
;ssd1289_tft_demo.c,24 :: 		print_image();
BL	_print_image+0
;ssd1289_tft_demo.c,25 :: 		print_str(4, 0, 2, White, Black, "Draw Check");
ADD	R11, SP, #0
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr1_ssd1289_tft_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr1_ssd1289_tft_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #0
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #65535
MOVS	R2, #2
MOVS	R1, #0
MOVS	R0, #4
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,27 :: 		while(1)
L_main184:
;ssd1289_tft_demo.c,29 :: 		if(TP_INT_pin == low)
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main186
;ssd1289_tft_demo.c,31 :: 		TP_read_coordinates(&tpx, &tpy);
MOVW	R1, #lo_addr(_tpy+0)
MOVT	R1, #hi_addr(_tpy+0)
MOVW	R0, #lo_addr(_tpx+0)
MOVT	R0, #hi_addr(_tpx+0)
BL	_TP_read_coordinates+0
;ssd1289_tft_demo.c,32 :: 		Draw_Pixel(tpx, tpy, White);
MOVW	R0, #lo_addr(_tpy+0)
MOVT	R0, #hi_addr(_tpy+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_tpx+0)
MOVT	R0, #hi_addr(_tpx+0)
LDRH	R0, [R0, #0]
MOVW	R2, #65535
BL	_Draw_Pixel+0
;ssd1289_tft_demo.c,33 :: 		}
L_main186:
;ssd1289_tft_demo.c,34 :: 		};
IT	AL
BAL	L_main184
;ssd1289_tft_demo.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_MCU:
;ssd1289_tft_demo.c,38 :: 		void setup_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,40 :: 		tp_init();
BL	_tp_init+0
;ssd1289_tft_demo.c,41 :: 		TFT_init();
BL	_TFT_init+0
;ssd1289_tft_demo.c,42 :: 		}
L_end_setup_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_MCU
_test_RGB:
;ssd1289_tft_demo.c,45 :: 		void test_RGB()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,47 :: 		TFT_fill(Red);
MOVW	R0, #63488
BL	_TFT_fill+0
;ssd1289_tft_demo.c,48 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB187:
SUBS	R7, R7, #1
BNE	L_test_RGB187
NOP
NOP
NOP
;ssd1289_tft_demo.c,49 :: 		TFT_fill(Green);
MOVW	R0, #2016
BL	_TFT_fill+0
;ssd1289_tft_demo.c,50 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB189:
SUBS	R7, R7, #1
BNE	L_test_RGB189
NOP
NOP
NOP
;ssd1289_tft_demo.c,51 :: 		TFT_fill(Blue);
MOVS	R0, #31
BL	_TFT_fill+0
;ssd1289_tft_demo.c,52 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB191:
SUBS	R7, R7, #1
BNE	L_test_RGB191
NOP
NOP
NOP
;ssd1289_tft_demo.c,53 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,54 :: 		}
L_end_test_RGB:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_RGB
_test_colours:
;ssd1289_tft_demo.c,57 :: 		void test_colours()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,59 :: 		Draw_Rectangle(0, 0, 319, 23, YES, SQUARE, Grey, Grey);
MOVW	R3, #63454
MOVW	R2, #63454
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #23
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,60 :: 		Draw_Rectangle(0, 23, 319, 47, YES, SQUARE, White, White);
MOVW	R3, #65535
MOVW	R2, #65535
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #47
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #23
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,61 :: 		Draw_Rectangle(0, 47, 319, 71, YES, SQUARE, Cyan, Cyan);
MOVW	R3, #32767
MOVW	R2, #32767
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #71
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #47
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,62 :: 		Draw_Rectangle(0, 71, 319, 95, YES, SQUARE, Light_Blue, Light_Blue);
MOVW	R3, #1311
MOVW	R2, #1311
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #95
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #71
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,63 :: 		Draw_Rectangle(0, 95, 319, 119, YES, SQUARE, Blue, Blue);
MOVS	R3, #31
MOVS	R2, #31
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #119
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #95
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,64 :: 		Draw_Rectangle(0, 119, 319, 143, YES, SQUARE, Green, Green);
MOVW	R3, #2016
MOVW	R2, #2016
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #143
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #119
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,65 :: 		Draw_Rectangle(0, 143, 319, 167, YES, SQUARE, Yellow, Yellow);
MOVW	R3, #65504
MOVW	R2, #65504
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #167
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #143
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,66 :: 		Draw_Rectangle(0, 167, 319, 191, YES, SQUARE, Magenta, Magenta);
MOVW	R3, #63519
MOVW	R2, #63519
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #191
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #167
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,67 :: 		Draw_Rectangle(0, 191, 319, 215, YES, SQUARE, Red, Red);
MOVW	R3, #63488
MOVW	R2, #63488
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #215
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #191
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,68 :: 		Draw_Rectangle(0, 215, 319, 239, YES, SQUARE, Black, Black);
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #215
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,69 :: 		delay_ms(2600);
MOVW	R7, #4863
MOVT	R7, #476
NOP
NOP
L_test_colours193:
SUBS	R7, R7, #1
BNE	L_test_colours193
NOP
NOP
NOP
;ssd1289_tft_demo.c,70 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,71 :: 		}
L_end_test_colours:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_colours
_test_2D_graphics:
;ssd1289_tft_demo.c,74 :: 		void test_2D_graphics()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,76 :: 		signed int i = 0;
;ssd1289_tft_demo.c,78 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,80 :: 		for(i = 10; i <= 310; i += 10)
; i start address is: 32 (R8)
MOVW	R8, #10
SXTH	R8, R8
; i end address is: 32 (R8)
L_test_2D_graphics195:
; i start address is: 32 (R8)
CMP	R8, #310
IT	GT
BGT	L_test_2D_graphics196
;ssd1289_tft_demo.c,82 :: 		Draw_V_Line(i, 20, 220, White);
MOVW	R3, #65535
MOVS	R2, #220
SXTH	R2, R2
MOVS	R1, #20
SXTH	R1, R1
SXTH	R0, R8
BL	_Draw_V_Line+0
;ssd1289_tft_demo.c,80 :: 		for(i = 10; i <= 310; i += 10)
ADD	R8, R8, #10
SXTH	R8, R8
;ssd1289_tft_demo.c,83 :: 		}
; i end address is: 32 (R8)
IT	AL
BAL	L_test_2D_graphics195
L_test_2D_graphics196:
;ssd1289_tft_demo.c,84 :: 		for(i = 20; i <= 220; i += 10)
; i start address is: 32 (R8)
MOVW	R8, #20
SXTH	R8, R8
; i end address is: 32 (R8)
L_test_2D_graphics198:
; i start address is: 32 (R8)
CMP	R8, #220
IT	GT
BGT	L_test_2D_graphics199
;ssd1289_tft_demo.c,86 :: 		Draw_H_Line(10, 310, i, White);
MOVW	R3, #65535
SXTH	R2, R8
MOVW	R1, #310
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Line+0
;ssd1289_tft_demo.c,84 :: 		for(i = 20; i <= 220; i += 10)
ADD	R8, R8, #10
SXTH	R8, R8
;ssd1289_tft_demo.c,87 :: 		}
; i end address is: 32 (R8)
IT	AL
BAL	L_test_2D_graphics198
L_test_2D_graphics199:
;ssd1289_tft_demo.c,89 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics201:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics201
NOP
NOP
NOP
;ssd1289_tft_demo.c,91 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,92 :: 		for(i = 0; i < 240; i += 5)
; i start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics203:
; i start address is: 4 (R1)
CMP	R1, #240
IT	GE
BGE	L_test_2D_graphics204
;ssd1289_tft_demo.c,94 :: 		Draw_Line(0, 0, 319, i, Light_Blue);
MOVW	R0, #1311
STRH	R1, [SP, #4]
PUSH	(R0)
SXTH	R3, R1
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R1, [SP, #4]
;ssd1289_tft_demo.c,92 :: 		for(i = 0; i < 240; i += 5)
ADDS	R1, R1, #5
SXTH	R1, R1
;ssd1289_tft_demo.c,95 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics203
L_test_2D_graphics204:
;ssd1289_tft_demo.c,97 :: 		for(i = 239; i > -1; i -= 5)
; i start address is: 4 (R1)
MOVS	R1, #239
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics206:
; i start address is: 4 (R1)
CMP	R1, #-1
IT	LE
BLE	L_test_2D_graphics207
;ssd1289_tft_demo.c,99 :: 		Draw_Line(319, 240, 0, i, Blue);
MOVS	R0, #31
STRH	R1, [SP, #4]
PUSH	(R0)
SXTH	R3, R1
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #240
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R1, [SP, #4]
;ssd1289_tft_demo.c,97 :: 		for(i = 239; i > -1; i -= 5)
SUBS	R1, R1, #5
SXTH	R1, R1
;ssd1289_tft_demo.c,100 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics206
L_test_2D_graphics207:
;ssd1289_tft_demo.c,102 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics209:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics209
NOP
NOP
NOP
;ssd1289_tft_demo.c,104 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,106 :: 		Draw_Rectangle(9, 19, 309, 199, NO, ROUND, Magenta, Black);
MOVS	R3, #0
MOVW	R2, #63519
MOVS	R1, #1
MOVS	R0, #0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #199
SXTH	R3, R3
MOVW	R2, #309
SXTH	R2, R2
MOVS	R1, #19
SXTH	R1, R1
MOVS	R0, #9
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,107 :: 		Draw_Rectangle(19, 29, 299, 189, YES, SQUARE, Cyan, Black);
MOVS	R3, #0
MOVW	R2, #32767
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #189
SXTH	R3, R3
MOVW	R2, #299
SXTH	R2, R2
MOVS	R1, #29
SXTH	R1, R1
MOVS	R0, #19
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,109 :: 		delay_ms(4000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_test_2D_graphics211:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics211
NOP
NOP
NOP
;ssd1289_tft_demo.c,111 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,113 :: 		Draw_Circle(159, 119, 80, NO, Red);
MOVW	R0, #63488
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #80
SXTH	R2, R2
MOVS	R1, #119
SXTH	R1, R1
MOVS	R0, #159
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ssd1289_tft_demo.c,114 :: 		Draw_Circle(159, 119, 40, YES, Yellow);
MOVW	R0, #65504
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #40
SXTH	R2, R2
MOVS	R1, #119
SXTH	R1, R1
MOVS	R0, #159
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ssd1289_tft_demo.c,117 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics213:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics213
NOP
NOP
NOP
;ssd1289_tft_demo.c,119 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,121 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, NO, Green);
MOVW	R3, #2016
MOVS	R2, #0
MOVS	R1, #19
SXTH	R1, R1
MOVS	R0, #149
SXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #200
SXTH	R3, R3
MOVW	R2, #309
SXTH	R2, R2
MOVS	R1, #200
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_Triangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,122 :: 		delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_test_2D_graphics215:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics215
NOP
NOP
NOP
;ssd1289_tft_demo.c,123 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, YES, Grey);
MOVW	R3, #63454
MOVS	R2, #1
MOVS	R1, #19
SXTH	R1, R1
MOVS	R0, #149
SXTH	R0, R0
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #200
SXTH	R3, R3
MOVW	R2, #309
SXTH	R2, R2
MOVS	R1, #200
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_Triangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,125 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics217:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics217
NOP
NOP
NOP
;ssd1289_tft_demo.c,127 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,129 :: 		for(i = 0; i < 100; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics219:
; i start address is: 20 (R5)
CMP	R5, #100
IT	GE
BGE	L_test_2D_graphics220
;ssd1289_tft_demo.c,131 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
MOVS	R4, #1
MOVS	R3, #0
MOVW	R2, #65504
MOVW	R1, #2016
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #110
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,132 :: 		Draw_H_Bar(10, 110, 60, 20, i,  Green, Green, Black, NO);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #2016
MOVW	R1, #2016
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #60
SXTH	R2, R2
MOVS	R1, #110
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,133 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
MOVS	R4, #1
MOVS	R3, #0
MOVW	R2, #32767
MOVW	R1, #63488
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #230
SXTH	R2, R2
MOVS	R1, #130
SXTH	R1, R1
MOVW	R0, #280
SXTH	R0, R0
BL	_Draw_V_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,134 :: 		Draw_V_Bar(240, 130, 230, 20, i, Cyan, Cyan, Black, NO);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #32767
MOVW	R1, #32767
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #230
SXTH	R2, R2
MOVS	R1, #130
SXTH	R1, R1
MOVS	R0, #240
SXTH	R0, R0
BL	_Draw_V_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,129 :: 		for(i = 0; i < 100; i++)
ADDS	R5, R5, #1
SXTH	R5, R5
;ssd1289_tft_demo.c,135 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics219
L_test_2D_graphics220:
;ssd1289_tft_demo.c,137 :: 		for(i = 100; i > -1; i--)
; i start address is: 20 (R5)
MOVS	R5, #100
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics222:
; i start address is: 20 (R5)
CMP	R5, #-1
IT	LE
BLE	L_test_2D_graphics223
;ssd1289_tft_demo.c,139 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
MOVS	R4, #1
MOVS	R3, #0
MOVW	R2, #65504
MOVW	R1, #2016
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #110
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,140 :: 		Draw_H_Bar(10, 1100, 60, 20, i,  Green, Green, Black, NO);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #2016
MOVW	R1, #2016
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #60
SXTH	R2, R2
MOVW	R1, #1100
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,141 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
MOVS	R4, #1
MOVS	R3, #0
MOVW	R2, #32767
MOVW	R1, #63488
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #230
SXTH	R2, R2
MOVS	R1, #130
SXTH	R1, R1
MOVW	R0, #280
SXTH	R0, R0
BL	_Draw_V_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,142 :: 		Draw_V_Bar(240, 130, 230, 20, i, Cyan, Cyan, Black, NO);
MOVS	R4, #0
MOVS	R3, #0
MOVW	R2, #32767
MOVW	R1, #32767
SXTH	R0, R5
STRH	R5, [SP, #4]
PUSH	(R4)
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #230
SXTH	R2, R2
MOVS	R1, #130
SXTH	R1, R1
MOVS	R0, #240
SXTH	R0, R0
BL	_Draw_V_Bar+0
ADD	SP, SP, #20
LDRSH	R5, [SP, #4]
;ssd1289_tft_demo.c,137 :: 		for(i = 100; i > -1; i--)
SUBS	R5, R5, #1
SXTH	R5, R5
;ssd1289_tft_demo.c,143 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics222
L_test_2D_graphics223:
;ssd1289_tft_demo.c,145 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics225:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics225
NOP
NOP
NOP
;ssd1289_tft_demo.c,147 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,148 :: 		}
L_end_test_2D_graphics:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _test_2D_graphics
_draw_flag:
;ssd1289_tft_demo.c,151 :: 		void draw_flag()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,153 :: 		Draw_Rectangle(20, 20, 299, 219, YES, SQUARE, Green, Green);
MOVW	R3, #2016
MOVW	R2, #2016
MOVS	R1, #0
MOVS	R0, #1
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #219
SXTH	R3, R3
MOVW	R2, #299
SXTH	R2, R2
MOVS	R1, #20
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ssd1289_tft_demo.c,154 :: 		Draw_Circle(160, 120, 60, YES, Red);
MOVW	R0, #63488
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #60
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #160
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ssd1289_tft_demo.c,155 :: 		delay_ms(6000);
MOVW	R7, #41471
MOVT	R7, #1098
NOP
NOP
L_draw_flag227:
SUBS	R7, R7, #1
BNE	L_draw_flag227
NOP
NOP
NOP
;ssd1289_tft_demo.c,156 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,157 :: 		}
L_end_draw_flag:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _draw_flag
_print_test_data:
;ssd1289_tft_demo.c,160 :: 		void print_test_data()
SUB	SP, SP, #84
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,162 :: 		unsigned char s = 0;
;ssd1289_tft_demo.c,163 :: 		signed char c = -9;
MVN	R0, #8
STRB	R0, [SP, #74]
MVN	R0, #8
STRH	R0, [SP, #76]
;ssd1289_tft_demo.c,164 :: 		signed int i = -9;
;ssd1289_tft_demo.c,165 :: 		float f = -9.9;
MOVW	R0, #26214
MOVT	R0, #49438
STR	R0, [SP, #80]
;ssd1289_tft_demo.c,168 :: 		print_str(16, 10, 1, Red, Black, "MicroArena");
ADD	R11, SP, #4
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr2_ssd1289_tft_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr2_ssd1289_tft_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #1
MOVS	R1, #10
MOVS	R0, #16
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,169 :: 		print_str(16, 30, 2, Green, Black, "MicroArena");
ADD	R11, SP, #15
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr3_ssd1289_tft_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr3_ssd1289_tft_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #15
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #30
MOVS	R0, #16
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,170 :: 		print_str(16, 60, 3, Blue, Black, "MicroArena");
ADD	R11, SP, #26
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr4_ssd1289_tft_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr4_ssd1289_tft_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #26
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #3
MOVS	R1, #60
MOVS	R0, #16
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,171 :: 		print_str(16, 90, 3, White, Black, "https://www.facebook.com/MicroArena");
ADD	R11, SP, #37
ADD	R10, R11, #36
MOVW	R12, #lo_addr(?ICS?lstr5_ssd1289_tft_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr5_ssd1289_tft_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #37
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #65535
MOVS	R2, #3
MOVS	R1, #90
MOVS	R0, #16
BL	_print_str+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,173 :: 		for(s = 0; s < 250; s++)
MOVS	R0, #0
STRB	R0, [SP, #73]
L_print_test_data229:
LDRB	R0, [SP, #73]
CMP	R0, #250
IT	CS
BCS	L_print_test_data230
;ssd1289_tft_demo.c,175 :: 		print_I(22, 150, 2, Red, Black, i);
LDRSH	R1, [SP, #76]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #2
MOVS	R1, #150
MOVS	R0, #22
BL	_print_I+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,176 :: 		print_C(22, 180, 2, Green, Black, c);
LDRSB	R1, [SP, #74]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #180
MOVS	R0, #22
BL	_print_C+0
ADD	SP, SP, #8
;ssd1289_tft_demo.c,177 :: 		print_F(22, 210, 2, Blue, Black, f, 1);
MOVS	R2, #1
LDR	R1, [SP, #80]
MOVS	R0, #0
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #2
MOVS	R1, #210
MOVS	R0, #22
BL	_print_F+0
ADD	SP, SP, #12
;ssd1289_tft_demo.c,179 :: 		c++;
LDRSB	R0, [SP, #74]
ADDS	R0, R0, #1
STRB	R0, [SP, #74]
;ssd1289_tft_demo.c,180 :: 		i++;
LDRSH	R0, [SP, #76]
ADDS	R0, R0, #1
STRH	R0, [SP, #76]
;ssd1289_tft_demo.c,181 :: 		f += 0.1;
LDR	R2, [SP, #80]
MOVW	R0, #52429
MOVT	R0, #15820
BL	__Add_FP+0
STR	R0, [SP, #80]
;ssd1289_tft_demo.c,183 :: 		delay_ms(40);
MOVW	R7, #21247
MOVT	R7, #7
NOP
NOP
L_print_test_data232:
SUBS	R7, R7, #1
BNE	L_print_test_data232
NOP
NOP
NOP
;ssd1289_tft_demo.c,173 :: 		for(s = 0; s < 250; s++)
LDRB	R0, [SP, #73]
ADDS	R0, R0, #1
STRB	R0, [SP, #73]
;ssd1289_tft_demo.c,184 :: 		}
IT	AL
BAL	L_print_test_data229
L_print_test_data230:
;ssd1289_tft_demo.c,185 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,186 :: 		}
L_end_print_test_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #84
BX	LR
; end of _print_test_data
_print_image:
;ssd1289_tft_demo.c,189 :: 		void print_image()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ssd1289_tft_demo.c,191 :: 		Draw_BMP(0, 0, 180, 125, image);
MOVW	R0, #lo_addr(_image+0)
MOVT	R0, #hi_addr(_image+0)
PUSH	(R0)
MOVS	R3, #125
SXTH	R3, R3
MOVS	R2, #180
SXTH	R2, R2
MOVS	R1, #0
MOVS	R0, #0
BL	_Draw_BMP+0
ADD	SP, SP, #4
;ssd1289_tft_demo.c,192 :: 		delay_ms(6000);
MOVW	R7, #41471
MOVT	R7, #1098
NOP
NOP
L_print_image234:
SUBS	R7, R7, #1
BNE	L_print_image234
NOP
NOP
NOP
;ssd1289_tft_demo.c,193 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ssd1289_tft_demo.c,194 :: 		}
L_end_print_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_image
