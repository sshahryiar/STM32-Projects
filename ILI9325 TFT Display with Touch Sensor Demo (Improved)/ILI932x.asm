_RGB565_converter:
;ILI932x.c,4 :: 		unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
; b start address is: 8 (R2)
; g start address is: 4 (R1)
; r start address is: 0 (R0)
; b end address is: 8 (R2)
; g end address is: 4 (R1)
; r end address is: 0 (R0)
; r start address is: 0 (R0)
; g start address is: 4 (R1)
; b start address is: 8 (R2)
;ILI932x.c,6 :: 		return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
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
;ILI932x.c,7 :: 		}
L_end_RGB565_converter:
BX	LR
; end of _RGB565_converter
_TFT_write_reg:
;ILI932x.c,10 :: 		void TFT_write_reg(unsigned int reg_val, unsigned int data_val)
; data_val start address is: 4 (R1)
; reg_val start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R1
; data_val end address is: 4 (R1)
; reg_val end address is: 0 (R0)
; reg_val start address is: 0 (R0)
; data_val start address is: 20 (R5)
;ILI932x.c,12 :: 		TFT_write(reg_val, CMD);
MOVS	R1, #0
; reg_val end address is: 0 (R0)
BL	_TFT_write+0
;ILI932x.c,13 :: 		TFT_write(data_val, DAT);
MOVS	R1, #1
UXTH	R0, R5
; data_val end address is: 20 (R5)
BL	_TFT_write+0
;ILI932x.c,14 :: 		}
L_end_TFT_write_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_reg
_TFT_write:
;ILI932x.c,17 :: 		void TFT_write(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ILI932x.c,19 :: 		TFT_CS_pin = 0;
MOVS	R4, #0
SXTB	R4, R4
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R2, #0]
;ILI932x.c,20 :: 		TFT_RS_pin = mode;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R2, #0]
; mode end address is: 4 (R1)
;ILI932x.c,21 :: 		TFT_data_out_port_low = ((TFT_data_out_port_low & 0xFF00) | (value & 0x00FF));
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, #65280
AND	R2, R0, #255
UXTH	R2, R2
ORRS	R3, R2
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;ILI932x.c,22 :: 		TFT_data_out_port_high = ((TFT_data_out_port_high & 0x00FF) | (value & 0xFF00));
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
LDR	R2, [R2, #0]
AND	R3, R2, #255
AND	R2, R0, #65280
UXTH	R2, R2
; value end address is: 0 (R0)
ORRS	R3, R2
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
STR	R3, [R2, #0]
;ILI932x.c,23 :: 		TFT_WR_pin = 0;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R2, #0]
;ILI932x.c,24 :: 		TFT_WR_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,25 :: 		TFT_CS_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,26 :: 		}
L_end_TFT_write:
BX	LR
; end of _TFT_write
_TFT_read:
;ILI932x.c,29 :: 		unsigned int TFT_read(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ILI932x.c,31 :: 		unsigned int temp = 0x0000;
;ILI932x.c,33 :: 		switch(mode)
IT	AL
BAL	L_TFT_read0
; mode end address is: 4 (R1)
;ILI932x.c,35 :: 		case REG:
L_TFT_read2:
;ILI932x.c,37 :: 		TFT_write(value, CMD);
MOVS	R1, #0
; value end address is: 0 (R0)
BL	_TFT_write+0
;ILI932x.c,38 :: 		break;
IT	AL
BAL	L_TFT_read1
;ILI932x.c,40 :: 		case DAT:
L_TFT_read3:
;ILI932x.c,42 :: 		break;
IT	AL
BAL	L_TFT_read1
;ILI932x.c,44 :: 		}
L_TFT_read0:
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_TFT_read2
; value end address is: 0 (R0)
CMP	R1, #1
IT	EQ
BEQ	L_TFT_read3
; mode end address is: 4 (R1)
L_TFT_read1:
;ILI932x.c,46 :: 		TFT_port_config_high = 0x44444444;
MOV	R3, #1145324612
MOVW	R2, #lo_addr(GPIOB_CRH+0)
MOVT	R2, #hi_addr(GPIOB_CRH+0)
STR	R3, [R2, #0]
;ILI932x.c,47 :: 		TFT_port_config_low = 0x44444444;
MOV	R3, #1145324612
MOVW	R2, #lo_addr(GPIOC_CRL+0)
MOVT	R2, #hi_addr(GPIOC_CRL+0)
STR	R3, [R2, #0]
;ILI932x.c,49 :: 		TFT_CS_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,50 :: 		TFT_RS_pin = 1;
MOVS	R5, #1
SXTB	R5, R5
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R2, #0]
;ILI932x.c,51 :: 		TFT_RD_pin = 0;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,53 :: 		temp = ((TFT_data_in_port_high & 0xFF00) | (TFT_data_in_port_low & 0x00FF));
MOVW	R2, #lo_addr(GPIOB_IDR+0)
MOVT	R2, #hi_addr(GPIOB_IDR+0)
LDR	R2, [R2, #0]
AND	R3, R2, #65280
MOVW	R2, #lo_addr(GPIOC_IDR+0)
MOVT	R2, #hi_addr(GPIOC_IDR+0)
LDR	R2, [R2, #0]
AND	R2, R2, #255
ORR	R4, R3, R2, LSL #0
;ILI932x.c,55 :: 		TFT_RD_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R2, #0]
;ILI932x.c,56 :: 		TFT_CS_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R5, [R2, #0]
;ILI932x.c,59 :: 		TFT_port_config_high = 0x33333333;
MOV	R3, #858993459
MOVW	R2, #lo_addr(GPIOB_CRH+0)
MOVT	R2, #hi_addr(GPIOB_CRH+0)
STR	R3, [R2, #0]
;ILI932x.c,60 :: 		TFT_port_config_low = 0x33333333;
MOV	R3, #858993459
MOVW	R2, #lo_addr(GPIOC_CRL+0)
MOVT	R2, #hi_addr(GPIOC_CRL+0)
STR	R3, [R2, #0]
;ILI932x.c,62 :: 		return temp;
UXTH	R0, R4
;ILI932x.c,63 :: 		}
L_end_TFT_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_read
_TFT_GPIO_init:
;ILI932x.c,66 :: 		void TFT_GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ILI932x.c,68 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;ILI932x.c,72 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;ILI932x.c,71 :: 		| _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15),
MOVW	R1, #65280
;ILI932x.c,69 :: 		GPIO_Config(&GPIOB_BASE,
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;ILI932x.c,72 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ILI932x.c,75 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;ILI932x.c,82 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;ILI932x.c,81 :: 		| _GPIO_PINMASK_12),
MOVW	R1, #8191
;ILI932x.c,76 :: 		GPIO_Config(&GPIOC_BASE,
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;ILI932x.c,82 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ILI932x.c,83 :: 		}
L_end_TFT_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_GPIO_init
_TFT_init:
;ILI932x.c,86 :: 		void TFT_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ILI932x.c,90 :: 		TFT_GPIO_init();
BL	_TFT_GPIO_init+0
;ILI932x.c,92 :: 		TFT_write_reg(0x0000, 0x0001);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write_reg+0
;ILI932x.c,93 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init4:
SUBS	R7, R7, #1
BNE	L_TFT_init4
NOP
NOP
NOP
;ILI932x.c,95 :: 		device_code = TFT_read(0x0000, REG);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_read+0
MOVW	R1, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R1, #hi_addr(TFT_init_device_code_L0+0)
STRH	R0, [R1, #0]
;ILI932x.c,98 :: 		if((device_code == 0x9325) || (device_code == 0x9328))
MOVW	R1, #37669
CMP	R0, R1
IT	EQ
BEQ	L__TFT_init36
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R1, [R0, #0]
MOVW	R0, #37672
CMP	R1, R0
IT	EQ
BEQ	L__TFT_init35
IT	AL
BAL	L_TFT_init8
L__TFT_init36:
L__TFT_init35:
;ILI932x.c,100 :: 		TFT_write_reg(0x00E5, 0x78F0);
MOVW	R1, #30960
MOVS	R0, #229
BL	_TFT_write_reg+0
;ILI932x.c,102 :: 		TFT_write_reg(0x0001, 0x0100);
MOVW	R1, #256
MOVS	R0, #1
BL	_TFT_write_reg+0
;ILI932x.c,103 :: 		TFT_write_reg(0x0002, 0x0700);
MOVW	R1, #1792
MOVS	R0, #2
BL	_TFT_write_reg+0
;ILI932x.c,104 :: 		TFT_write_reg(0x0003, 0x1030);
MOVW	R1, #4144
MOVS	R0, #3
BL	_TFT_write_reg+0
;ILI932x.c,105 :: 		TFT_write_reg(0x0004, 0x0000);
MOVS	R1, #0
MOVS	R0, #4
BL	_TFT_write_reg+0
;ILI932x.c,106 :: 		TFT_write_reg(0x0008, 0x0202);
MOVW	R1, #514
MOVS	R0, #8
BL	_TFT_write_reg+0
;ILI932x.c,107 :: 		TFT_write_reg(0x0009, 0x0000);
MOVS	R1, #0
MOVS	R0, #9
BL	_TFT_write_reg+0
;ILI932x.c,108 :: 		TFT_write_reg(0x000A, 0x0000);
MOVS	R1, #0
MOVS	R0, #10
BL	_TFT_write_reg+0
;ILI932x.c,109 :: 		TFT_write_reg(0x000C, 0x0001);
MOVS	R1, #1
MOVS	R0, #12
BL	_TFT_write_reg+0
;ILI932x.c,110 :: 		TFT_write_reg(0x000D, 0x0000);
MOVS	R1, #0
MOVS	R0, #13
BL	_TFT_write_reg+0
;ILI932x.c,111 :: 		TFT_write_reg(0x000F, 0x0000);
MOVS	R1, #0
MOVS	R0, #15
BL	_TFT_write_reg+0
;ILI932x.c,113 :: 		TFT_write_reg(0x0010, 0x0000);
MOVS	R1, #0
MOVS	R0, #16
BL	_TFT_write_reg+0
;ILI932x.c,114 :: 		TFT_write_reg(0x0011, 0x0007);
MOVS	R1, #7
MOVS	R0, #17
BL	_TFT_write_reg+0
;ILI932x.c,115 :: 		TFT_write_reg(0x0012, 0x0000);
MOVS	R1, #0
MOVS	R0, #18
BL	_TFT_write_reg+0
;ILI932x.c,116 :: 		TFT_write_reg(0x0013, 0x0000);
MOVS	R1, #0
MOVS	R0, #19
BL	_TFT_write_reg+0
;ILI932x.c,117 :: 		TFT_write_reg(0x0007, 0x0001);
MOVS	R1, #1
MOVS	R0, #7
BL	_TFT_write_reg+0
;ILI932x.c,118 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init9:
SUBS	R7, R7, #1
BNE	L_TFT_init9
NOP
NOP
NOP
;ILI932x.c,119 :: 		TFT_write_reg(0x0010, 0x1690);
MOVW	R1, #5776
MOVS	R0, #16
BL	_TFT_write_reg+0
;ILI932x.c,120 :: 		TFT_write_reg(0x0011, 0x0227);
MOVW	R1, #551
MOVS	R0, #17
BL	_TFT_write_reg+0
;ILI932x.c,121 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init11:
SUBS	R7, R7, #1
BNE	L_TFT_init11
NOP
NOP
NOP
;ILI932x.c,122 :: 		TFT_write_reg(0x0012, 0x009D);
MOVS	R1, #157
MOVS	R0, #18
BL	_TFT_write_reg+0
;ILI932x.c,123 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init13:
SUBS	R7, R7, #1
BNE	L_TFT_init13
NOP
NOP
NOP
;ILI932x.c,124 :: 		TFT_write_reg(0x0013, 0x1900);
MOVW	R1, #6400
MOVS	R0, #19
BL	_TFT_write_reg+0
;ILI932x.c,125 :: 		TFT_write_reg(0x0029, 0x0025);
MOVS	R1, #37
MOVS	R0, #41
BL	_TFT_write_reg+0
;ILI932x.c,126 :: 		TFT_write_reg(0x002B, 0x000D);
MOVS	R1, #13
MOVS	R0, #43
BL	_TFT_write_reg+0
;ILI932x.c,127 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init15:
SUBS	R7, R7, #1
BNE	L_TFT_init15
NOP
NOP
NOP
;ILI932x.c,128 :: 		TFT_write_reg(0x0020,0x0000);
MOVS	R1, #0
MOVS	R0, #32
BL	_TFT_write_reg+0
;ILI932x.c,129 :: 		TFT_write_reg(0x0021,0x0000);
MOVS	R1, #0
MOVS	R0, #33
BL	_TFT_write_reg+0
;ILI932x.c,130 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init17:
SUBS	R7, R7, #1
BNE	L_TFT_init17
NOP
NOP
NOP
;ILI932x.c,132 :: 		TFT_write_reg(0x0030, 0x0007);
MOVS	R1, #7
MOVS	R0, #48
BL	_TFT_write_reg+0
;ILI932x.c,133 :: 		TFT_write_reg(0x0031, 0x0303);
MOVW	R1, #771
MOVS	R0, #49
BL	_TFT_write_reg+0
;ILI932x.c,134 :: 		TFT_write_reg(0x0032, 0x0003);
MOVS	R1, #3
MOVS	R0, #50
BL	_TFT_write_reg+0
;ILI932x.c,135 :: 		TFT_write_reg(0x0035, 0x0206);
MOVW	R1, #518
MOVS	R0, #53
BL	_TFT_write_reg+0
;ILI932x.c,136 :: 		TFT_write_reg(0x0036, 0x0008);
MOVS	R1, #8
MOVS	R0, #54
BL	_TFT_write_reg+0
;ILI932x.c,137 :: 		TFT_write_reg(0x0037, 0x0406);
MOVW	R1, #1030
MOVS	R0, #55
BL	_TFT_write_reg+0
;ILI932x.c,138 :: 		TFT_write_reg(0x0038, 0x0304);
MOVW	R1, #772
MOVS	R0, #56
BL	_TFT_write_reg+0
;ILI932x.c,139 :: 		TFT_write_reg(0x0039, 0x0007);
MOVS	R1, #7
MOVS	R0, #57
BL	_TFT_write_reg+0
;ILI932x.c,140 :: 		TFT_write_reg(0x003C, 0x0602);
MOVW	R1, #1538
MOVS	R0, #60
BL	_TFT_write_reg+0
;ILI932x.c,141 :: 		TFT_write_reg(0x003D, 0x0008);
MOVS	R1, #8
MOVS	R0, #61
BL	_TFT_write_reg+0
;ILI932x.c,142 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init19:
SUBS	R7, R7, #1
BNE	L_TFT_init19
NOP
NOP
NOP
;ILI932x.c,143 :: 		TFT_write_reg(0x0050, 0x0000);
MOVS	R1, #0
MOVS	R0, #80
BL	_TFT_write_reg+0
;ILI932x.c,144 :: 		TFT_write_reg(0x0051, 0x00EF);
MOVS	R1, #239
MOVS	R0, #81
BL	_TFT_write_reg+0
;ILI932x.c,145 :: 		TFT_write_reg(0x0052, 0x0000);
MOVS	R1, #0
MOVS	R0, #82
BL	_TFT_write_reg+0
;ILI932x.c,146 :: 		TFT_write_reg(0x0053, 0x013F);
MOVW	R1, #319
MOVS	R0, #83
BL	_TFT_write_reg+0
;ILI932x.c,148 :: 		TFT_write_reg(0x0060, 0xA700);
MOVW	R1, #42752
MOVS	R0, #96
BL	_TFT_write_reg+0
;ILI932x.c,149 :: 		TFT_write_reg(0x0061, 0x0001);
MOVS	R1, #1
MOVS	R0, #97
BL	_TFT_write_reg+0
;ILI932x.c,150 :: 		TFT_write_reg(0x006A, 0x0000);
MOVS	R1, #0
MOVS	R0, #106
BL	_TFT_write_reg+0
;ILI932x.c,151 :: 		TFT_write_reg(0x0080, 0x0000);
MOVS	R1, #0
MOVS	R0, #128
BL	_TFT_write_reg+0
;ILI932x.c,152 :: 		TFT_write_reg(0x0081, 0x0000);
MOVS	R1, #0
MOVS	R0, #129
BL	_TFT_write_reg+0
;ILI932x.c,153 :: 		TFT_write_reg(0x0082, 0x0000);
MOVS	R1, #0
MOVS	R0, #130
BL	_TFT_write_reg+0
;ILI932x.c,154 :: 		TFT_write_reg(0x0083, 0x0000);
MOVS	R1, #0
MOVS	R0, #131
BL	_TFT_write_reg+0
;ILI932x.c,155 :: 		TFT_write_reg(0x0084, 0x0000);
MOVS	R1, #0
MOVS	R0, #132
BL	_TFT_write_reg+0
;ILI932x.c,156 :: 		TFT_write_reg(0x0085, 0x0000);
MOVS	R1, #0
MOVS	R0, #133
BL	_TFT_write_reg+0
;ILI932x.c,158 :: 		TFT_write_reg(0x0090, 0x0010);
MOVS	R1, #16
MOVS	R0, #144
BL	_TFT_write_reg+0
;ILI932x.c,159 :: 		TFT_write_reg(0x0092, 0x0600);
MOVW	R1, #1536
MOVS	R0, #146
BL	_TFT_write_reg+0
;ILI932x.c,161 :: 		TFT_write_reg(0x0007, 0x0133);
MOVW	R1, #307
MOVS	R0, #7
BL	_TFT_write_reg+0
;ILI932x.c,162 :: 		}
L_TFT_init8:
;ILI932x.c,164 :: 		if((device_code == 0x9320) || (device_code == 0x9300))
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R1, [R0, #0]
MOVW	R0, #37664
CMP	R1, R0
IT	EQ
BEQ	L__TFT_init38
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R0, [R0, #0]
CMP	R0, #37632
IT	EQ
BEQ	L__TFT_init37
IT	AL
BAL	L_TFT_init23
L__TFT_init38:
L__TFT_init37:
;ILI932x.c,166 :: 		TFT_write_reg(0x00, 0x0000);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_write_reg+0
;ILI932x.c,167 :: 		TFT_write_reg(0x01, 0x0100);   //Driver Output Contral.
MOVW	R1, #256
MOVS	R0, #1
BL	_TFT_write_reg+0
;ILI932x.c,168 :: 		TFT_write_reg(0x02, 0x0700);   //LCD Driver Waveform Contral.
MOVW	R1, #1792
MOVS	R0, #2
BL	_TFT_write_reg+0
;ILI932x.c,169 :: 		TFT_write_reg(0x03, 0x1030);//Entry Mode Set.
MOVW	R1, #4144
MOVS	R0, #3
BL	_TFT_write_reg+0
;ILI932x.c,172 :: 		TFT_write_reg(0x04, 0x0000);   //Scalling Contral.
MOVS	R1, #0
MOVS	R0, #4
BL	_TFT_write_reg+0
;ILI932x.c,173 :: 		TFT_write_reg(0x08, 0x0202);   //Display Contral 2.(0x0207)
MOVW	R1, #514
MOVS	R0, #8
BL	_TFT_write_reg+0
;ILI932x.c,174 :: 		TFT_write_reg(0x09, 0x0000);   //Display Contral 3.(0x0000)
MOVS	R1, #0
MOVS	R0, #9
BL	_TFT_write_reg+0
;ILI932x.c,175 :: 		TFT_write_reg(0x0A, 0x0000);   //Frame Cycle Contal.(0x0000)
MOVS	R1, #0
MOVS	R0, #10
BL	_TFT_write_reg+0
;ILI932x.c,176 :: 		TFT_write_reg(0x0C, (1 << 0));   //Extern Display Interface Contral 1.(0x0000)
MOVS	R1, #1
MOVS	R0, #12
BL	_TFT_write_reg+0
;ILI932x.c,177 :: 		TFT_write_reg(0x0D, 0x0000);   //Frame Maker Position.
MOVS	R1, #0
MOVS	R0, #13
BL	_TFT_write_reg+0
;ILI932x.c,178 :: 		TFT_write_reg(0x0F, 0x0000);   //Extern Display Interface Contral 2.
MOVS	R1, #0
MOVS	R0, #15
BL	_TFT_write_reg+0
;ILI932x.c,179 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_TFT_init24:
SUBS	R7, R7, #1
BNE	L_TFT_init24
NOP
NOP
NOP
;ILI932x.c,180 :: 		TFT_write_reg(0x07, 0x0101);   //Display Contral.
MOVW	R1, #257
MOVS	R0, #7
BL	_TFT_write_reg+0
;ILI932x.c,181 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_TFT_init26:
SUBS	R7, R7, #1
BNE	L_TFT_init26
NOP
NOP
NOP
;ILI932x.c,182 :: 		TFT_write_reg(0x10, (1 << 12) | (0 << 8)| (1 << 7)| (1 << 6)| (0 << 4));   //Power Control 1.(0x16b0)
MOVW	R1, #4288
MOVS	R0, #16
BL	_TFT_write_reg+0
;ILI932x.c,183 :: 		TFT_write_reg(0x11, 0x0007);                        //Power Control 2.(0x0001)
MOVS	R1, #7
MOVS	R0, #17
BL	_TFT_write_reg+0
;ILI932x.c,184 :: 		TFT_write_reg(0x12, (1 << 8) | (1 << 4)| (0 << 0));            //Power Control 3.(0x0138)
MOVW	R1, #272
MOVS	R0, #18
BL	_TFT_write_reg+0
;ILI932x.c,185 :: 		TFT_write_reg(0x13, 0x0B00);                        //Power Control 4.
MOVW	R1, #2816
MOVS	R0, #19
BL	_TFT_write_reg+0
;ILI932x.c,186 :: 		TFT_write_reg(0x29, 0x0000);                        //Power Control 7.
MOVS	R1, #0
MOVS	R0, #41
BL	_TFT_write_reg+0
;ILI932x.c,188 :: 		TFT_write_reg(0x2B, (1 << 14) | (1 << 4));
MOVW	R1, #16400
MOVS	R0, #43
BL	_TFT_write_reg+0
;ILI932x.c,189 :: 		TFT_write_reg(0x50, 0x00);   //Set X Star
MOVS	R1, #0
MOVS	R0, #80
BL	_TFT_write_reg+0
;ILI932x.c,191 :: 		TFT_write_reg(0x51, 239);   //Set Y Star
MOVS	R1, #239
MOVS	R0, #81
BL	_TFT_write_reg+0
;ILI932x.c,192 :: 		TFT_write_reg(0x52, 0x00);   //Set Y End.t.
MOVS	R1, #0
MOVS	R0, #82
BL	_TFT_write_reg+0
;ILI932x.c,193 :: 		TFT_write_reg(0x53, 319);   //
MOVW	R1, #319
MOVS	R0, #83
BL	_TFT_write_reg+0
;ILI932x.c,195 :: 		TFT_write_reg(0x60, 0x2700);   //Driver Output Control.
MOVW	R1, #9984
MOVS	R0, #96
BL	_TFT_write_reg+0
;ILI932x.c,196 :: 		TFT_write_reg(0x61, 0x0001);   //Driver Output Control.
MOVS	R1, #1
MOVS	R0, #97
BL	_TFT_write_reg+0
;ILI932x.c,197 :: 		TFT_write_reg(0x6A, 0x0000);   //Vertical Srcoll Control.
MOVS	R1, #0
MOVS	R0, #106
BL	_TFT_write_reg+0
;ILI932x.c,199 :: 		TFT_write_reg(0x80, 0x0000);   //Display Position? Partial Display 1.
MOVS	R1, #0
MOVS	R0, #128
BL	_TFT_write_reg+0
;ILI932x.c,200 :: 		TFT_write_reg(0x81, 0x0000);   //RAM Address Start? Partial Display 1.
MOVS	R1, #0
MOVS	R0, #129
BL	_TFT_write_reg+0
;ILI932x.c,201 :: 		TFT_write_reg(0x82, 0x0000);   //RAM Address End-Partial Display 1.
MOVS	R1, #0
MOVS	R0, #130
BL	_TFT_write_reg+0
;ILI932x.c,202 :: 		TFT_write_reg(0x83, 0x0000);   //Displsy Position? Partial Display 2.
MOVS	R1, #0
MOVS	R0, #131
BL	_TFT_write_reg+0
;ILI932x.c,203 :: 		TFT_write_reg(0x84, 0x0000);   //RAM Address Start? Partial Display 2.
MOVS	R1, #0
MOVS	R0, #132
BL	_TFT_write_reg+0
;ILI932x.c,204 :: 		TFT_write_reg(0x85, 0x0000);   //RAM Address End? Partial Display 2.
MOVS	R1, #0
MOVS	R0, #133
BL	_TFT_write_reg+0
;ILI932x.c,206 :: 		TFT_write_reg(0x90, (0 << 7)|(16 << 0));   //Frame Cycle Contral.(0x0013)
MOVS	R1, #16
MOVS	R0, #144
BL	_TFT_write_reg+0
;ILI932x.c,207 :: 		TFT_write_reg(0x92, 0x0000);   //Panel Interface Contral 2.(0x0000)
MOVS	R1, #0
MOVS	R0, #146
BL	_TFT_write_reg+0
;ILI932x.c,208 :: 		TFT_write_reg(0x93, 0x0001);   //Panel Interface Contral 3.
MOVS	R1, #1
MOVS	R0, #147
BL	_TFT_write_reg+0
;ILI932x.c,209 :: 		TFT_write_reg(0x95, 0x0110);   //Frame Cycle Contral.(0x0110)
MOVW	R1, #272
MOVS	R0, #149
BL	_TFT_write_reg+0
;ILI932x.c,210 :: 		TFT_write_reg(0x97, (0 << 8));   //
MOVS	R1, #0
MOVS	R0, #151
BL	_TFT_write_reg+0
;ILI932x.c,211 :: 		TFT_write_reg(0x98, 0x0000);   //Frame Cycle Contral.
MOVS	R1, #0
MOVS	R0, #152
BL	_TFT_write_reg+0
;ILI932x.c,212 :: 		TFT_write_reg(0x07, 0x0173);   //(0x0173)
MOVW	R1, #371
MOVS	R0, #7
BL	_TFT_write_reg+0
;ILI932x.c,213 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_init28:
SUBS	R7, R7, #1
BNE	L_TFT_init28
NOP
NOP
NOP
;ILI932x.c,214 :: 		}
L_TFT_init23:
;ILI932x.c,216 :: 		TFT_clear(Black);
MOVS	R0, #0
BL	_TFT_clear+0
;ILI932x.c,217 :: 		}
L_end_TFT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_init
_TFT_write_RAM_prepare:
;ILI932x.c,220 :: 		void TFT_write_RAM_prepare()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ILI932x.c,222 :: 		TFT_write(R34, CMD);
MOVS	R1, #0
MOVS	R0, #34
BL	_TFT_write+0
;ILI932x.c,223 :: 		}
L_end_TFT_write_RAM_prepare:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_RAM_prepare
_TFT_set_cursor:
;ILI932x.c,226 :: 		void TFT_set_cursor(unsigned int x_pos, unsigned int y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R6, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 24 (R6)
;ILI932x.c,228 :: 		TFT_write_reg(R32, x_pos);
UXTH	R1, R0
; x_pos end address is: 0 (R0)
MOVS	R0, #32
BL	_TFT_write_reg+0
;ILI932x.c,229 :: 		TFT_write_reg(R33, y_pos);
UXTH	R1, R6
; y_pos end address is: 24 (R6)
MOVS	R0, #33
BL	_TFT_write_reg+0
;ILI932x.c,230 :: 		}
L_end_TFT_set_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_cursor
_TFT_clear:
;ILI932x.c,233 :: 		void TFT_clear(unsigned int colour)
; colour start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R7, R0
; colour end address is: 0 (R0)
; colour start address is: 28 (R7)
;ILI932x.c,235 :: 		unsigned long index = 0;
;ILI932x.c,237 :: 		TFT_set_cursor(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_set_cursor+0
;ILI932x.c,238 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ILI932x.c,240 :: 		for(index = 0; index < 76800; index++)
; index start address is: 0 (R0)
MOVS	R0, #0
; colour end address is: 28 (R7)
; index end address is: 0 (R0)
UXTH	R6, R7
MOV	R7, R0
L_TFT_clear30:
; index start address is: 28 (R7)
; colour start address is: 24 (R6)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
CMP	R7, #76800
IT	CS
BCS	L_TFT_clear31
; colour end address is: 24 (R6)
;ILI932x.c,242 :: 		TFT_write_reg(colour, DAT);
; colour start address is: 24 (R6)
MOVS	R1, #1
UXTH	R0, R6
BL	_TFT_write_reg+0
;ILI932x.c,240 :: 		for(index = 0; index < 76800; index++)
ADDS	R7, R7, #1
;ILI932x.c,243 :: 		}
; colour end address is: 24 (R6)
; index end address is: 28 (R7)
IT	AL
BAL	L_TFT_clear30
L_TFT_clear31:
;ILI932x.c,244 :: 		}
L_end_TFT_clear:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_clear
_Draw_Pixel:
;ILI932x.c,247 :: 		void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R7, R2
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 28 (R7)
;ILI932x.c,249 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ILI932x.c,250 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ILI932x.c,251 :: 		TFT_write(colour, DAT);
MOVS	R1, #1
UXTH	R0, R7
; colour end address is: 28 (R7)
BL	_TFT_write+0
;ILI932x.c,252 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Get_Pixel:
;ILI932x.c,255 :: 		unsigned int Get_Pixel(unsigned int x_pos, unsigned int y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
;ILI932x.c,257 :: 		unsigned int value = 0x0000;
;ILI932x.c,259 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ILI932x.c,260 :: 		TFT_CS_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,261 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ILI932x.c,262 :: 		value = TFT_read(0x0000, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_read+0
;ILI932x.c,263 :: 		value = TFT_read(0x0000, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_read+0
;ILI932x.c,264 :: 		TFT_CS_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ILI932x.c,265 :: 		value = TFT_BGR2RGB(value);
BL	_TFT_BGR2RGB+0
;ILI932x.c,267 :: 		return value;
;ILI932x.c,268 :: 		}
L_end_Get_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Get_Pixel
_TFT_BGR2RGB:
;ILI932x.c,271 :: 		unsigned int TFT_BGR2RGB(unsigned int colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;ILI932x.c,273 :: 		unsigned int r = 0x0000;
;ILI932x.c,274 :: 		unsigned int g = 0x0000;
;ILI932x.c,275 :: 		unsigned int b = 0x0000;
;ILI932x.c,276 :: 		unsigned int rgb_colour = 0x0000;
;ILI932x.c,278 :: 		b = ((colour >> 0)  & 0x1F);
AND	R2, R0, #31
UXTH	R2, R2
;ILI932x.c,279 :: 		g = ((colour >> 5)  & 0x3F);
LSRS	R1, R0, #5
UXTH	R1, R1
AND	R4, R1, #63
UXTH	R4, R4
;ILI932x.c,280 :: 		r = ((colour >> 11) & 0x1F);
LSRS	R1, R0, #11
UXTH	R1, R1
; colour end address is: 0 (R0)
AND	R3, R1, #31
UXTH	R3, R3
;ILI932x.c,282 :: 		rgb_colour = ((b << 11) + (g << 5) + (r << 0));
LSLS	R2, R2, #11
UXTH	R2, R2
LSLS	R1, R4, #5
UXTH	R1, R1
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R1, R3
;ILI932x.c,284 :: 		return rgb_colour;
UXTH	R0, R1
;ILI932x.c,285 :: 		}
L_end_TFT_BGR2RGB:
BX	LR
; end of _TFT_BGR2RGB
