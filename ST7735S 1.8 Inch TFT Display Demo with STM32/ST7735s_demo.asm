_Configure_GPIOs:
;st7735.c,4 :: 		void Configure_GPIOs()
;st7735.c,6 :: 		enable_GPIOB(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;st7735.c,8 :: 		setup_GPIOB(CS_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_Configure_GPIOs9:
;st7735.c,9 :: 		setup_GPIOB(RST_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_Configure_GPIOs22:
;st7735.c,10 :: 		setup_GPIOB(RS_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #768
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_Configure_GPIOs35:
;st7735.c,11 :: 		setup_GPIOB(SDA_pin, (output_mode_high_speed | GPIO_PP_output));
L_Configure_GPIOs42:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #768
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;st7735.c,12 :: 		setup_GPIOB(SCK_pin, (output_mode_high_speed | GPIO_PP_output));
L_Configure_GPIOs53:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;st7735.c,14 :: 		GPIOB_pin_low(CS_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,15 :: 		GPIOB_pin_low(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,16 :: 		GPIOB_pin_low(RS_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,17 :: 		GPIOB_pin_low(SDA_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,18 :: 		GPIOB_pin_low(SCK_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,20 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_Configure_GPIOs61:
SUBS	R7, R7, #1
BNE	L_Configure_GPIOs61
NOP
NOP
NOP
;st7735.c,21 :: 		}
L_end_Configure_GPIOs:
BX	LR
; end of _Configure_GPIOs
_ST7735_Write:
;st7735.c,24 :: 		void ST7735_Write(unsigned char value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;st7735.c,26 :: 		unsigned char i = 0x08;
; i start address is: 16 (R4)
MOVS	R4, #8
;st7735.c,28 :: 		GPIOB_pin_low(CS_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #1
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;st7735.c,30 :: 		if(mode)
CMP	R1, #0
IT	EQ
BEQ	L_ST7735_Write63
; mode end address is: 4 (R1)
;st7735.c,32 :: 		GPIOB_pin_high(RS_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #4
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;st7735.c,33 :: 		}
IT	AL
BAL	L_ST7735_Write64
L_ST7735_Write63:
;st7735.c,36 :: 		GPIOB_pin_low(RS_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #4
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;st7735.c,37 :: 		}
L_ST7735_Write64:
;st7735.c,39 :: 		while(i > 0)
UXTB	R1, R0
; i end address is: 16 (R4)
UXTB	R0, R4
L_ST7735_Write65:
; value end address is: 0 (R0)
; i start address is: 0 (R0)
; value start address is: 4 (R1)
CMP	R0, #0
IT	LS
BLS	L_ST7735_Write66
;st7735.c,41 :: 		GPIOB_pin_low(SCK_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #4096
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;st7735.c,43 :: 		if((value & 0x80) != 0)
AND	R2, R1, #128
UXTB	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_ST7735_Write67
;st7735.c,45 :: 		GPIOB_pin_high(SDA_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #1024
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;st7735.c,46 :: 		}
IT	AL
BAL	L_ST7735_Write68
L_ST7735_Write67:
;st7735.c,49 :: 		GPIOB_pin_low(SDA_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #1024
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;st7735.c,50 :: 		}
L_ST7735_Write68:
;st7735.c,52 :: 		GPIOB_pin_high(SCK_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #4096
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;st7735.c,54 :: 		value <<= 1;
LSLS	R2, R1, #1
UXTB	R1, R2
;st7735.c,55 :: 		i--;
SUBS	R0, R0, #1
UXTB	R0, R0
;st7735.c,56 :: 		};
; value end address is: 4 (R1)
; i end address is: 0 (R0)
IT	AL
BAL	L_ST7735_Write65
L_ST7735_Write66:
;st7735.c,58 :: 		GPIOB_pin_high(CS_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #1
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;st7735.c,59 :: 		}
L_end_ST7735_Write:
BX	LR
; end of _ST7735_Write
_ST7735_Reset:
;st7735.c,62 :: 		void ST7735_Reset()
;st7735.c,64 :: 		GPIOB_pin_low(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;st7735.c,65 :: 		delay_ms(2);
MOVW	R7, #23999
MOVT	R7, #0
NOP
NOP
L_ST7735_Reset69:
SUBS	R7, R7, #1
BNE	L_ST7735_Reset69
NOP
NOP
NOP
;st7735.c,66 :: 		GPIOB_pin_high(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;st7735.c,67 :: 		delay_ms(2);
MOVW	R7, #23999
MOVT	R7, #0
NOP
NOP
L_ST7735_Reset71:
SUBS	R7, R7, #1
BNE	L_ST7735_Reset71
NOP
NOP
NOP
;st7735.c,68 :: 		}
L_end_ST7735_Reset:
BX	LR
; end of _ST7735_Reset
_ST7735_init:
;st7735.c,71 :: 		void ST7735_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;st7735.c,73 :: 		Configure_GPIOs();
BL	_Configure_GPIOs+0
;st7735.c,75 :: 		ST7735_Reset();
BL	_ST7735_Reset+0
;st7735.c,77 :: 		ST7735_Write(ST7735_SWRESET, CMD);
MOVS	R1, #0
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,78 :: 		delay_us(150);
MOVW	R7, #1799
MOVT	R7, #0
NOP
NOP
L_ST7735_init73:
SUBS	R7, R7, #1
BNE	L_ST7735_init73
NOP
NOP
NOP
;st7735.c,79 :: 		ST7735_Write(ST7735_SLPOUT, CMD);
MOVS	R1, #0
MOVS	R0, #17
BL	_ST7735_Write+0
;st7735.c,80 :: 		delay_us(150);
MOVW	R7, #1799
MOVT	R7, #0
NOP
NOP
L_ST7735_init75:
SUBS	R7, R7, #1
BNE	L_ST7735_init75
NOP
NOP
NOP
;st7735.c,82 :: 		ST7735_Write(ST7735_FRMCTR1, CMD);
MOVS	R1, #0
MOVS	R0, #177
BL	_ST7735_Write+0
;st7735.c,83 :: 		ST7735_Write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,84 :: 		ST7735_Write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,85 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,87 :: 		ST7735_Write(ST7735_FRMCTR2, CMD);
MOVS	R1, #0
MOVS	R0, #178
BL	_ST7735_Write+0
;st7735.c,88 :: 		ST7735_Write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,89 :: 		ST7735_Write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,90 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,92 :: 		ST7735_Write(ST7735_FRMCTR3, CMD);
MOVS	R1, #0
MOVS	R0, #179
BL	_ST7735_Write+0
;st7735.c,93 :: 		ST7735_Write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,94 :: 		ST7735_Write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,95 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,96 :: 		ST7735_Write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,97 :: 		ST7735_Write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,98 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,100 :: 		ST7735_Write(ST7735_INVCTR, CMD);
MOVS	R1, #0
MOVS	R0, #180
BL	_ST7735_Write+0
;st7735.c,101 :: 		ST7735_Write(0x07, DAT);
MOVS	R1, #1
MOVS	R0, #7
BL	_ST7735_Write+0
;st7735.c,103 :: 		ST7735_Write(ST7735_PWCTR1, CMD);
MOVS	R1, #0
MOVS	R0, #192
BL	_ST7735_Write+0
;st7735.c,104 :: 		ST7735_Write(0xA2, DAT);
MOVS	R1, #1
MOVS	R0, #162
BL	_ST7735_Write+0
;st7735.c,105 :: 		ST7735_Write(0x02, DAT);
MOVS	R1, #1
MOVS	R0, #2
BL	_ST7735_Write+0
;st7735.c,106 :: 		ST7735_Write(0x84, DAT);
MOVS	R1, #1
MOVS	R0, #132
BL	_ST7735_Write+0
;st7735.c,108 :: 		ST7735_Write(ST7735_PWCTR1, CMD);
MOVS	R1, #0
MOVS	R0, #192
BL	_ST7735_Write+0
;st7735.c,109 :: 		ST7735_Write(0xC5, DAT);
MOVS	R1, #1
MOVS	R0, #197
BL	_ST7735_Write+0
;st7735.c,111 :: 		ST7735_Write(ST7735_PWCTR2, CMD);
MOVS	R1, #0
MOVS	R0, #193
BL	_ST7735_Write+0
;st7735.c,112 :: 		ST7735_Write(0x0A, DAT);
MOVS	R1, #1
MOVS	R0, #10
BL	_ST7735_Write+0
;st7735.c,113 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,115 :: 		ST7735_Write(ST7735_PWCTR3, CMD);
MOVS	R1, #0
MOVS	R0, #194
BL	_ST7735_Write+0
;st7735.c,116 :: 		ST7735_Write(0x8A, DAT);
MOVS	R1, #1
MOVS	R0, #138
BL	_ST7735_Write+0
;st7735.c,117 :: 		ST7735_Write(0x2A, DAT);
MOVS	R1, #1
MOVS	R0, #42
BL	_ST7735_Write+0
;st7735.c,119 :: 		ST7735_Write(ST7735_PWCTR4, CMD);
MOVS	R1, #0
MOVS	R0, #195
BL	_ST7735_Write+0
;st7735.c,120 :: 		ST7735_Write(0x8A, DAT);
MOVS	R1, #1
MOVS	R0, #138
BL	_ST7735_Write+0
;st7735.c,121 :: 		ST7735_Write(0xEE, DAT);
MOVS	R1, #1
MOVS	R0, #238
BL	_ST7735_Write+0
;st7735.c,123 :: 		ST7735_Write(ST7735_PWCTR5, CMD);
MOVS	R1, #0
MOVS	R0, #196
BL	_ST7735_Write+0
;st7735.c,124 :: 		ST7735_Write(0x0E, DAT);
MOVS	R1, #1
MOVS	R0, #14
BL	_ST7735_Write+0
;st7735.c,126 :: 		ST7735_Write(ST7735_VMCTR1, CMD);
MOVS	R1, #0
MOVS	R0, #197
BL	_ST7735_Write+0
;st7735.c,127 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,129 :: 		ST7735_Write(ST7735_COLMOD, CMD);
MOVS	R1, #0
MOVS	R0, #58
BL	_ST7735_Write+0
;st7735.c,130 :: 		ST7735_Write(0x05, DAT);
MOVS	R1, #1
MOVS	R0, #5
BL	_ST7735_Write+0
;st7735.c,132 :: 		ST7735_Write(ST7735_MADCTL, CMD);
MOVS	R1, #0
MOVS	R0, #54
BL	_ST7735_Write+0
;st7735.c,133 :: 		ST7735_Write(0xC8, DAT);
MOVS	R1, #1
MOVS	R0, #200
BL	_ST7735_Write+0
;st7735.c,135 :: 		RAM_Address_Set();
BL	_RAM_Address_Set+0
;st7735.c,137 :: 		ST7735_Write(ST7735_GMCTRP1, CMD);
MOVS	R1, #0
MOVS	R0, #224
BL	_ST7735_Write+0
;st7735.c,138 :: 		ST7735_Write(0x02, DAT);
MOVS	R1, #1
MOVS	R0, #2
BL	_ST7735_Write+0
;st7735.c,139 :: 		ST7735_Write(0x1C, DAT);
MOVS	R1, #1
MOVS	R0, #28
BL	_ST7735_Write+0
;st7735.c,140 :: 		ST7735_Write(0x07, DAT);
MOVS	R1, #1
MOVS	R0, #7
BL	_ST7735_Write+0
;st7735.c,141 :: 		ST7735_Write(0x12, DAT);
MOVS	R1, #1
MOVS	R0, #18
BL	_ST7735_Write+0
;st7735.c,142 :: 		ST7735_Write(0x37, DAT);
MOVS	R1, #1
MOVS	R0, #55
BL	_ST7735_Write+0
;st7735.c,143 :: 		ST7735_Write(0x32, DAT);
MOVS	R1, #1
MOVS	R0, #50
BL	_ST7735_Write+0
;st7735.c,144 :: 		ST7735_Write(0x29, DAT);
MOVS	R1, #1
MOVS	R0, #41
BL	_ST7735_Write+0
;st7735.c,145 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,146 :: 		ST7735_Write(0x29, DAT);
MOVS	R1, #1
MOVS	R0, #41
BL	_ST7735_Write+0
;st7735.c,147 :: 		ST7735_Write(0x25, DAT);
MOVS	R1, #1
MOVS	R0, #37
BL	_ST7735_Write+0
;st7735.c,148 :: 		ST7735_Write(0x2B, DAT);
MOVS	R1, #1
MOVS	R0, #43
BL	_ST7735_Write+0
;st7735.c,149 :: 		ST7735_Write(0x39, DAT);
MOVS	R1, #1
MOVS	R0, #57
BL	_ST7735_Write+0
;st7735.c,150 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,151 :: 		ST7735_Write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_ST7735_Write+0
;st7735.c,152 :: 		ST7735_Write(0x03, DAT);
MOVS	R1, #1
MOVS	R0, #3
BL	_ST7735_Write+0
;st7735.c,153 :: 		ST7735_Write(0x10, DAT);
MOVS	R1, #1
MOVS	R0, #16
BL	_ST7735_Write+0
;st7735.c,155 :: 		ST7735_Write(ST7735_GMCTRN1, CMD);
MOVS	R1, #0
MOVS	R0, #225
BL	_ST7735_Write+0
;st7735.c,156 :: 		ST7735_Write(0x03, DAT);
MOVS	R1, #1
MOVS	R0, #3
BL	_ST7735_Write+0
;st7735.c,157 :: 		ST7735_Write(0x1D, DAT);
MOVS	R1, #1
MOVS	R0, #29
BL	_ST7735_Write+0
;st7735.c,158 :: 		ST7735_Write(0x07, DAT);
MOVS	R1, #1
MOVS	R0, #7
BL	_ST7735_Write+0
;st7735.c,159 :: 		ST7735_Write(0x06, DAT);
MOVS	R1, #1
MOVS	R0, #6
BL	_ST7735_Write+0
;st7735.c,160 :: 		ST7735_Write(0x2E, DAT);
MOVS	R1, #1
MOVS	R0, #46
BL	_ST7735_Write+0
;st7735.c,161 :: 		ST7735_Write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,162 :: 		ST7735_Write(0x29, DAT);
MOVS	R1, #1
MOVS	R0, #41
BL	_ST7735_Write+0
;st7735.c,163 :: 		ST7735_Write(0x2D, DAT);
MOVS	R1, #1
MOVS	R0, #45
BL	_ST7735_Write+0
;st7735.c,164 :: 		ST7735_Write(0x2E, DAT);
MOVS	R1, #1
MOVS	R0, #46
BL	_ST7735_Write+0
;st7735.c,165 :: 		ST7735_Write(0x2E, DAT);
MOVS	R1, #1
MOVS	R0, #46
BL	_ST7735_Write+0
;st7735.c,166 :: 		ST7735_Write(0x37, DAT);
MOVS	R1, #1
MOVS	R0, #55
BL	_ST7735_Write+0
;st7735.c,167 :: 		ST7735_Write(0x3F, DAT);
MOVS	R1, #1
MOVS	R0, #63
BL	_ST7735_Write+0
;st7735.c,168 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,169 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,170 :: 		ST7735_Write(0x02, DAT);
MOVS	R1, #1
MOVS	R0, #2
BL	_ST7735_Write+0
;st7735.c,171 :: 		ST7735_Write(0x10, DAT);
MOVS	R1, #1
MOVS	R0, #16
BL	_ST7735_Write+0
;st7735.c,173 :: 		ST7735_Write(ST7735_NORON, CMD);
MOVS	R1, #0
MOVS	R0, #19
BL	_ST7735_Write+0
;st7735.c,174 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_ST7735_init77:
SUBS	R7, R7, #1
BNE	L_ST7735_init77
NOP
NOP
NOP
;st7735.c,176 :: 		ST7735_Write(ST7735_DISPON, CMD);
MOVS	R1, #0
MOVS	R0, #41
BL	_ST7735_Write+0
;st7735.c,177 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_ST7735_init79:
SUBS	R7, R7, #1
BNE	L_ST7735_init79
NOP
NOP
NOP
;st7735.c,179 :: 		ST7735_Write(ST7735_RAMWR, CMD);
MOVS	R1, #0
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,180 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_ST7735_init81:
SUBS	R7, R7, #1
BNE	L_ST7735_init81
NOP
NOP
NOP
;st7735.c,181 :: 		}
L_end_ST7735_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ST7735_init
_ST7735_Word_Write:
;st7735.c,184 :: 		void ST7735_Word_Write(unsigned int value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R0
; value end address is: 0 (R0)
; value start address is: 20 (R5)
;st7735.c,186 :: 		ST7735_Write(((value & 0xFF00) >> 0x08), DAT);
AND	R1, R5, #65280
UXTH	R1, R1
LSRS	R1, R1, #8
UXTB	R0, R1
MOVS	R1, #1
BL	_ST7735_Write+0
;st7735.c,187 :: 		ST7735_Write((value & 0x00FF), DAT);
AND	R1, R5, #255
; value end address is: 20 (R5)
UXTB	R0, R1
MOVS	R1, #1
BL	_ST7735_Write+0
;st7735.c,188 :: 		}
L_end_ST7735_Word_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ST7735_Word_Write
_ST7735_Data_Write:
;st7735.c,191 :: 		void ST7735_Data_Write(unsigned char DataH, unsigned char DataL)
; DataL start address is: 4 (R1)
; DataH start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R1
; DataL end address is: 4 (R1)
; DataH end address is: 0 (R0)
; DataH start address is: 0 (R0)
; DataL start address is: 20 (R5)
;st7735.c,193 :: 		ST7735_Write(DataH, DAT);
MOVS	R1, #1
; DataH end address is: 0 (R0)
BL	_ST7735_Write+0
;st7735.c,194 :: 		ST7735_Write(DataL, DAT);
MOVS	R1, #1
UXTB	R0, R5
; DataL end address is: 20 (R5)
BL	_ST7735_Write+0
;st7735.c,195 :: 		}
L_end_ST7735_Data_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ST7735_Data_Write
_ST7735_Data_Write_4k:
;st7735.c,198 :: 		void ST7735_Data_Write_4k(unsigned char DataH, unsigned char DataM, unsigned char DataL)
; DataL start address is: 8 (R2)
; DataM start address is: 4 (R1)
; DataH start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R1
UXTB	R6, R2
; DataL end address is: 8 (R2)
; DataM end address is: 4 (R1)
; DataH end address is: 0 (R0)
; DataH start address is: 0 (R0)
; DataM start address is: 20 (R5)
; DataL start address is: 24 (R6)
;st7735.c,200 :: 		ST7735_Write(DataH, DAT);
MOVS	R1, #1
; DataH end address is: 0 (R0)
BL	_ST7735_Write+0
;st7735.c,201 :: 		ST7735_Write(DataM, DAT);
MOVS	R1, #1
UXTB	R0, R5
; DataM end address is: 20 (R5)
BL	_ST7735_Write+0
;st7735.c,202 :: 		ST7735_Write(DataL, DAT);
MOVS	R1, #1
UXTB	R0, R6
; DataL end address is: 24 (R6)
BL	_ST7735_Write+0
;st7735.c,203 :: 		}
L_end_ST7735_Data_Write_4k:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ST7735_Data_Write_4k
_Set_Addr_Window:
;st7735.c,206 :: 		void Set_Addr_Window(unsigned char xs, unsigned char ys, unsigned char xe, unsigned char ye)
; ye start address is: 12 (R3)
; xe start address is: 8 (R2)
; ys start address is: 4 (R1)
; xs start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
UXTB	R6, R1
UXTB	R7, R2
UXTB	R8, R3
; ye end address is: 12 (R3)
; xe end address is: 8 (R2)
; ys end address is: 4 (R1)
; xs end address is: 0 (R0)
; xs start address is: 20 (R5)
; ys start address is: 24 (R6)
; xe start address is: 28 (R7)
; ye start address is: 32 (R8)
;st7735.c,208 :: 		ST7735_Write(ST7735_CASET, CMD);
MOVS	R1, #0
MOVS	R0, #42
BL	_ST7735_Write+0
;st7735.c,209 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,210 :: 		ST7735_Write(xs, DAT);
MOVS	R1, #1
UXTB	R0, R5
; xs end address is: 20 (R5)
BL	_ST7735_Write+0
;st7735.c,211 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,212 :: 		ST7735_Write(xe, DAT);
MOVS	R1, #1
UXTB	R0, R7
; xe end address is: 28 (R7)
BL	_ST7735_Write+0
;st7735.c,214 :: 		ST7735_Write(ST7735_RASET, CMD);
MOVS	R1, #0
MOVS	R0, #43
BL	_ST7735_Write+0
;st7735.c,215 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,216 :: 		ST7735_Write(ys, DAT);
MOVS	R1, #1
UXTB	R0, R6
; ys end address is: 24 (R6)
BL	_ST7735_Write+0
;st7735.c,217 :: 		ST7735_Write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_ST7735_Write+0
;st7735.c,218 :: 		ST7735_Write(ye, DAT);
MOVS	R1, #1
UXTB	R0, R8
; ye end address is: 32 (R8)
BL	_ST7735_Write+0
;st7735.c,220 :: 		ST7735_Write(ST7735_RAMWR, CMD);
MOVS	R1, #0
MOVS	R0, #44
BL	_ST7735_Write+0
;st7735.c,221 :: 		}
L_end_Set_Addr_Window:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Addr_Window
_RAM_Address_Set:
;st7735.c,224 :: 		void RAM_Address_Set()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;st7735.c,226 :: 		Set_Addr_Window(0x00, 0x00, 0x7F, 0x9F);
MOVS	R3, #159
MOVS	R2, #127
MOVS	R1, #0
MOVS	R0, #0
BL	_Set_Addr_Window+0
;st7735.c,227 :: 		}
L_end_RAM_Address_Set:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RAM_Address_Set
_Invert_Display:
;st7735.c,230 :: 		void Invert_Display(unsigned char i)
; i start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; i end address is: 0 (R0)
; i start address is: 0 (R0)
;st7735.c,232 :: 		if(i == ST7735_INVON)
CMP	R0, #33
IT	NE
BNE	L_Invert_Display83
; i end address is: 0 (R0)
;st7735.c,234 :: 		ST7735_Write(ST7735_INVON, CMD);
MOVS	R1, #0
MOVS	R0, #33
BL	_ST7735_Write+0
;st7735.c,235 :: 		}
IT	AL
BAL	L_Invert_Display84
L_Invert_Display83:
;st7735.c,238 :: 		ST7735_Write(ST7735_INVOFF, CMD);
MOVS	R1, #0
MOVS	R0, #32
BL	_ST7735_Write+0
;st7735.c,239 :: 		}
L_Invert_Display84:
;st7735.c,240 :: 		}
L_end_Invert_Display:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Invert_Display
_Swap_Colour:
;st7735.c,243 :: 		unsigned int Swap_Colour(unsigned int colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;st7735.c,245 :: 		return ((colour << 0x000B) | (colour & 0x07E0) | (colour >> 0x000B));
LSLS	R2, R0, #11
UXTH	R2, R2
AND	R1, R0, #2016
UXTH	R1, R1
ORRS	R2, R1
UXTH	R2, R2
LSRS	R1, R0, #11
UXTH	R1, R1
; colour end address is: 0 (R0)
ORR	R1, R2, R1, LSL #0
UXTH	R0, R1
;st7735.c,246 :: 		}
L_end_Swap_Colour:
BX	LR
; end of _Swap_Colour
_Color565:
;st7735.c,249 :: 		unsigned int Color565(unsigned char r, unsigned char g, unsigned char b)
; b start address is: 8 (R2)
; g start address is: 4 (R1)
; r start address is: 0 (R0)
; b end address is: 8 (R2)
; g end address is: 4 (R1)
; r end address is: 0 (R0)
; r start address is: 0 (R0)
; g start address is: 4 (R1)
; b start address is: 8 (R2)
;st7735.c,251 :: 		return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
AND	R3, R0, #248
UXTB	R3, R3
; r end address is: 0 (R0)
LSLS	R4, R3, #8
UXTH	R4, R4
AND	R3, R1, #252
UXTB	R3, R3
; g end address is: 4 (R1)
LSLS	R3, R3, #3
UXTH	R3, R3
ORRS	R4, R3
UXTH	R4, R4
LSRS	R3, R2, #3
UXTB	R3, R3
; b end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
UXTH	R0, R3
;st7735.c,252 :: 		}
L_end_Color565:
BX	LR
; end of _Color565
_Set_Rotation:
;st7735.c,255 :: 		void Set_Rotation(unsigned char m)
; m start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; m end address is: 0 (R0)
; m start address is: 20 (R5)
;st7735.c,257 :: 		unsigned char rotation = 0x00;
;st7735.c,259 :: 		ST7735_Write(ST7735_MADCTL, CMD);
MOVS	R1, #0
MOVS	R0, #54
BL	_ST7735_Write+0
;st7735.c,260 :: 		rotation = (m % 4);
AND	R1, R5, #3
; m end address is: 20 (R5)
; rotation start address is: 0 (R0)
UXTB	R0, R1
;st7735.c,262 :: 		switch(rotation)
IT	AL
BAL	L_Set_Rotation85
; rotation end address is: 0 (R0)
;st7735.c,264 :: 		case 0:
L_Set_Rotation87:
;st7735.c,266 :: 		ST7735_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
MOVS	R1, #1
MOVS	R0, #200
BL	_ST7735_Write+0
;st7735.c,267 :: 		w = ST7735_TFTWIDTH;
MOVS	R2, #128
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
STRB	R2, [R1, #0]
;st7735.c,268 :: 		l = ST7735_TFTLENGTH;
MOVS	R2, #160
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
STRB	R2, [R1, #0]
;st7735.c,269 :: 		break;
IT	AL
BAL	L_Set_Rotation86
;st7735.c,271 :: 		case 1:
L_Set_Rotation88:
;st7735.c,273 :: 		ST7735_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
MOVS	R1, #1
MOVS	R0, #168
BL	_ST7735_Write+0
;st7735.c,274 :: 		w = ST7735_TFTLENGTH;
MOVS	R2, #160
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
STRB	R2, [R1, #0]
;st7735.c,275 :: 		l = ST7735_TFTWIDTH;
MOVS	R2, #128
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
STRB	R2, [R1, #0]
;st7735.c,276 :: 		break;
IT	AL
BAL	L_Set_Rotation86
;st7735.c,278 :: 		case 2:
L_Set_Rotation89:
;st7735.c,280 :: 		ST7735_Write((MADCTL_RGB), DAT);
MOVS	R1, #1
MOVS	R0, #8
BL	_ST7735_Write+0
;st7735.c,281 :: 		w = ST7735_TFTWIDTH;
MOVS	R2, #128
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
STRB	R2, [R1, #0]
;st7735.c,282 :: 		l = ST7735_TFTLENGTH;
MOVS	R2, #160
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
STRB	R2, [R1, #0]
;st7735.c,283 :: 		break;
IT	AL
BAL	L_Set_Rotation86
;st7735.c,285 :: 		case 3:
L_Set_Rotation90:
;st7735.c,287 :: 		ST7735_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
MOVS	R1, #1
MOVS	R0, #104
BL	_ST7735_Write+0
;st7735.c,288 :: 		w = ST7735_TFTLENGTH;
MOVS	R2, #160
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
STRB	R2, [R1, #0]
;st7735.c,289 :: 		l = ST7735_TFTWIDTH;
MOVS	R2, #128
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
STRB	R2, [R1, #0]
;st7735.c,290 :: 		break;
IT	AL
BAL	L_Set_Rotation86
;st7735.c,292 :: 		}
L_Set_Rotation85:
; rotation start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_Set_Rotation87
CMP	R0, #1
IT	EQ
BEQ	L_Set_Rotation88
CMP	R0, #2
IT	EQ
BEQ	L_Set_Rotation89
CMP	R0, #3
IT	EQ
BEQ	L_Set_Rotation90
; rotation end address is: 0 (R0)
L_Set_Rotation86:
;st7735.c,293 :: 		}
L_end_Set_Rotation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Rotation
_TFT_fill:
;st7735.c,296 :: 		void TFT_fill(unsigned int colour)
; colour start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R9, R0
; colour end address is: 0 (R0)
; colour start address is: 36 (R9)
;st7735.c,298 :: 		unsigned char i = 0x00;
;st7735.c,299 :: 		unsigned char j = 0x00;
;st7735.c,301 :: 		Set_Addr_Window(0, 0, (w - 1), (l - 1));
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
LDRB	R1, [R1, #0]
SUBS	R2, R1, #1
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
LDRB	R1, [R1, #0]
SUBS	R1, R1, #1
UXTB	R3, R2
UXTB	R2, R1
MOVS	R1, #0
MOVS	R0, #0
BL	_Set_Addr_Window+0
;st7735.c,303 :: 		for(j = l; j > 0; j--)
MOVW	R1, #lo_addr(_l+0)
MOVT	R1, #hi_addr(_l+0)
; j start address is: 28 (R7)
LDRB	R7, [R1, #0]
; colour end address is: 36 (R9)
; j end address is: 28 (R7)
UXTH	R6, R9
L_TFT_fill91:
; j start address is: 28 (R7)
; colour start address is: 24 (R6)
CMP	R7, #0
IT	LS
BLS	L_TFT_fill92
;st7735.c,305 :: 		for(i = w; i > 0; i--)
MOVW	R1, #lo_addr(_w+0)
MOVT	R1, #hi_addr(_w+0)
; i start address is: 0 (R0)
LDRB	R0, [R1, #0]
; i end address is: 0 (R0)
; colour end address is: 24 (R6)
; j end address is: 28 (R7)
UXTB	R8, R0
L_TFT_fill94:
; i start address is: 32 (R8)
; colour start address is: 24 (R6)
; j start address is: 28 (R7)
CMP	R8, #0
IT	LS
BLS	L_TFT_fill95
;st7735.c,307 :: 		ST7735_Word_Write(colour);
UXTH	R0, R6
BL	_ST7735_Word_Write+0
;st7735.c,305 :: 		for(i = w; i > 0; i--)
SUB	R8, R8, #1
UXTB	R8, R8
;st7735.c,308 :: 		}
; i end address is: 32 (R8)
IT	AL
BAL	L_TFT_fill94
L_TFT_fill95:
;st7735.c,303 :: 		for(j = l; j > 0; j--)
SUBS	R7, R7, #1
UXTB	R7, R7
;st7735.c,309 :: 		}
; colour end address is: 24 (R6)
; j end address is: 28 (R7)
IT	AL
BAL	L_TFT_fill91
L_TFT_fill92:
;st7735.c,310 :: 		}
L_end_TFT_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_fill
_Draw_Pixel:
;st7735.c,313 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R9, R2
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 36 (R9)
;st7735.c,315 :: 		Set_Addr_Window(x_pos, y_pos, (1 + x_pos), (1 + y_pos));
ADDS	R4, R1, #1
ADDS	R3, R0, #1
UXTB	R2, R3
UXTB	R3, R4
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_Set_Addr_Window+0
;st7735.c,316 :: 		ST7735_Word_Write(colour);
UXTH	R0, R9
; colour end address is: 36 (R9)
BL	_ST7735_Word_Write+0
;st7735.c,317 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;st7735.c,320 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
SXTH	R10, R0
SXTH	R11, R1
STRH	R2, [SP, #16]
STRH	R3, [SP, #20]
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 40 (R10)
; y1 start address is: 44 (R11)
; colour start address is: 48 (R12)
LDRH	R12, [SP, #24]
;st7735.c,322 :: 		signed int dx = 0x0000;
;st7735.c,323 :: 		signed int dy = 0x0000;
;st7735.c,324 :: 		signed int stepx = 0x0000;
;st7735.c,325 :: 		signed int stepy = 0x0000;
;st7735.c,326 :: 		signed int fraction = 0x0000;
;st7735.c,328 :: 		dy = (y2 - y1);
LDRSH	R4, [SP, #20]
SUB	R5, R4, R11, LSL #0
SXTH	R5, R5
; dy start address is: 8 (R2)
SXTH	R2, R5
;st7735.c,329 :: 		dx = (x2 - x1);
LDRSH	R4, [SP, #16]
SUB	R0, R4, R10, LSL #0
SXTH	R0, R0
; dx start address is: 0 (R0)
;st7735.c,331 :: 		if (dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line97
;st7735.c,333 :: 		dy = -dy;
RSBS	R4, R2, #0
; dy end address is: 8 (R2)
; dy start address is: 20 (R5)
SXTH	R5, R4
;st7735.c,334 :: 		stepy = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #10]
;st7735.c,335 :: 		}
SXTH	R2, R5
; dy end address is: 20 (R5)
IT	AL
BAL	L_Draw_Line98
L_Draw_Line97:
;st7735.c,338 :: 		stepy = 1;
; dy start address is: 8 (R2)
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #10]
; dy end address is: 8 (R2)
;st7735.c,339 :: 		}
L_Draw_Line98:
;st7735.c,341 :: 		if (dx < 0)
; dy start address is: 8 (R2)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line99
;st7735.c,343 :: 		dx = -dx;
RSBS	R4, R0, #0
; dx end address is: 0 (R0)
; dx start address is: 12 (R3)
SXTH	R3, R4
;st7735.c,344 :: 		stepx = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #8]
;st7735.c,345 :: 		}
SXTH	R0, R3
; dx end address is: 12 (R3)
IT	AL
BAL	L_Draw_Line100
L_Draw_Line99:
;st7735.c,348 :: 		stepx = 1;
; dx start address is: 0 (R0)
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #8]
; dx end address is: 0 (R0)
;st7735.c,349 :: 		}
L_Draw_Line100:
;st7735.c,351 :: 		dx <<= 0x01;
; dx start address is: 0 (R0)
LSLS	R1, R0, #1
SXTH	R1, R1
; dx end address is: 0 (R0)
; dx start address is: 4 (R1)
;st7735.c,352 :: 		dy <<= 0x01;
LSLS	R0, R2, #1
SXTH	R0, R0
; dy end address is: 8 (R2)
; dy start address is: 0 (R0)
;st7735.c,354 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
STRH	R1, [SP, #6]
UXTH	R2, R12
UXTB	R1, R11
UXTB	R0, R10
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #6]
LDRSH	R0, [SP, #4]
;st7735.c,356 :: 		if (dx > dy)
CMP	R1, R0
IT	LE
BLE	L_Draw_Line101
;st7735.c,358 :: 		fraction = (dy - (dx >> 1));
ASRS	R4, R1, #1
SXTH	R4, R4
SUB	R4, R0, R4
STRH	R4, [SP, #12]
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R3, R10
SXTH	R2, R11
;st7735.c,359 :: 		while (x1 != x2)
L_Draw_Line102:
; dy start address is: 0 (R0)
; dy end address is: 0 (R0)
; dx start address is: 4 (R1)
; dx end address is: 4 (R1)
; colour start address is: 48 (R12)
; colour end address is: 48 (R12)
; y1 start address is: 8 (R2)
; x1 start address is: 12 (R3)
LDRSH	R4, [SP, #16]
CMP	R3, R4
IT	EQ
BEQ	L_Draw_Line103
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
;st7735.c,361 :: 		if (fraction >= 0)
; colour start address is: 48 (R12)
; dx start address is: 4 (R1)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #12]
CMP	R4, #0
IT	LT
BLT	L__Draw_Line215
;st7735.c,363 :: 		y1 += stepy;
LDRSH	R4, [SP, #10]
ADD	R11, R2, R4, LSL #0
SXTH	R11, R11
; y1 end address is: 8 (R2)
; y1 start address is: 44 (R11)
;st7735.c,364 :: 		fraction -= dx;
LDRSH	R4, [SP, #12]
SUB	R4, R4, R1
STRH	R4, [SP, #12]
; y1 end address is: 44 (R11)
;st7735.c,365 :: 		}
IT	AL
BAL	L_Draw_Line104
L__Draw_Line215:
;st7735.c,361 :: 		if (fraction >= 0)
SXTH	R11, R2
;st7735.c,365 :: 		}
L_Draw_Line104:
;st7735.c,366 :: 		x1 += stepx;
; y1 start address is: 44 (R11)
LDRSH	R4, [SP, #8]
ADDS	R5, R3, R4
; x1 end address is: 12 (R3)
; x1 start address is: 40 (R10)
SXTH	R10, R5
;st7735.c,367 :: 		fraction += dy;
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R4, [SP, #12]
;st7735.c,369 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #6]
UXTH	R2, R12
UXTB	R1, R11
UXTB	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R1, [SP, #4]
;st7735.c,370 :: 		}
SXTH	R3, R10
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R2, R11
IT	AL
BAL	L_Draw_Line102
L_Draw_Line103:
;st7735.c,371 :: 		}
IT	AL
BAL	L_Draw_Line105
L_Draw_Line101:
;st7735.c,374 :: 		fraction = (dx - (dy >> 1));
; y1 start address is: 44 (R11)
; x1 start address is: 40 (R10)
; colour start address is: 48 (R12)
; dx start address is: 4 (R1)
; dy start address is: 0 (R0)
ASRS	R4, R0, #1
SXTH	R4, R4
SUB	R4, R1, R4
STRH	R4, [SP, #12]
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R3, R10
SXTH	R2, R11
;st7735.c,376 :: 		while (y1 != y2)
L_Draw_Line106:
; dy start address is: 0 (R0)
; dy end address is: 0 (R0)
; dx start address is: 4 (R1)
; dx end address is: 4 (R1)
; colour start address is: 48 (R12)
; colour end address is: 48 (R12)
; y1 start address is: 8 (R2)
; x1 start address is: 12 (R3)
LDRSH	R4, [SP, #20]
CMP	R2, R4
IT	EQ
BEQ	L_Draw_Line107
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
;st7735.c,378 :: 		if (fraction >= 0)
; colour start address is: 48 (R12)
; dx start address is: 4 (R1)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #12]
CMP	R4, #0
IT	LT
BLT	L__Draw_Line216
;st7735.c,380 :: 		x1 += stepx;
LDRSH	R4, [SP, #8]
ADDS	R4, R3, R4
; x1 end address is: 12 (R3)
; x1 start address is: 24 (R6)
SXTH	R6, R4
;st7735.c,381 :: 		fraction -= dy;
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R4, [SP, #12]
; x1 end address is: 24 (R6)
SXTH	R10, R6
;st7735.c,382 :: 		}
IT	AL
BAL	L_Draw_Line108
L__Draw_Line216:
;st7735.c,378 :: 		if (fraction >= 0)
SXTH	R10, R3
;st7735.c,382 :: 		}
L_Draw_Line108:
;st7735.c,383 :: 		y1 += stepy;
; x1 start address is: 40 (R10)
LDRSH	R4, [SP, #10]
ADDS	R5, R2, R4
; y1 end address is: 8 (R2)
; y1 start address is: 44 (R11)
SXTH	R11, R5
;st7735.c,384 :: 		fraction += dx;
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R1
STRH	R4, [SP, #12]
;st7735.c,385 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #6]
UXTH	R2, R12
UXTB	R1, R5
UXTB	R0, R10
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R1, [SP, #4]
;st7735.c,386 :: 		}
SXTH	R3, R10
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R2, R11
IT	AL
BAL	L_Draw_Line106
L_Draw_Line107:
;st7735.c,387 :: 		}
L_Draw_Line105:
;st7735.c,388 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Line
_Draw_Rectangle:
;st7735.c,391 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
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
LDRH	R4, [SP, #32]
STRH	R4, [SP, #32]
LDRH	R4, [SP, #36]
STRH	R4, [SP, #36]
;st7735.c,393 :: 		unsigned char i = 0x00;
;st7735.c,394 :: 		unsigned char xmin = 0x00;
;st7735.c,395 :: 		unsigned char xmax = 0x00;
;st7735.c,396 :: 		unsigned char ymin = 0x00;
;st7735.c,397 :: 		unsigned char ymax = 0x00;
;st7735.c,399 :: 		if(fill != NO)
CMP	R0, #0
IT	EQ
BEQ	L_Draw_Rectangle109
; fill end address is: 0 (R0)
;st7735.c,401 :: 		if(x1 < x2)
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle110
;st7735.c,403 :: 		xmin = x1;
; xmin start address is: 36 (R9)
LDRSH	R9, [SP, #8]
;st7735.c,404 :: 		xmax = x2;
LDRSH	R4, [SP, #16]
STRB	R4, [SP, #4]
;st7735.c,405 :: 		}
; xmin end address is: 36 (R9)
IT	AL
BAL	L_Draw_Rectangle111
L_Draw_Rectangle110:
;st7735.c,408 :: 		xmin = x2;
; xmin start address is: 36 (R9)
LDRSH	R9, [SP, #16]
;st7735.c,409 :: 		xmax = x1;
LDRSH	R4, [SP, #8]
STRB	R4, [SP, #4]
; xmin end address is: 36 (R9)
;st7735.c,410 :: 		}
L_Draw_Rectangle111:
;st7735.c,412 :: 		if(y1 < y2)
; xmin start address is: 36 (R9)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle112
;st7735.c,414 :: 		ymin = y1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #5]
;st7735.c,415 :: 		ymax = y2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #6]
;st7735.c,416 :: 		}
IT	AL
BAL	L_Draw_Rectangle113
L_Draw_Rectangle112:
;st7735.c,419 :: 		ymin = y2;
LDRSH	R4, [SP, #20]
STRB	R4, [SP, #5]
;st7735.c,420 :: 		ymax = y1;
LDRSH	R4, [SP, #12]
STRB	R4, [SP, #6]
;st7735.c,421 :: 		}
L_Draw_Rectangle113:
;st7735.c,423 :: 		for(; xmin <= xmax; ++xmin)
; xmin end address is: 36 (R9)
L_Draw_Rectangle114:
; xmin start address is: 36 (R9)
LDRB	R4, [SP, #4]
CMP	R9, R4
IT	HI
BHI	L_Draw_Rectangle115
;st7735.c,425 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 40 (R10)
LDRB	R10, [SP, #5]
; i end address is: 40 (R10)
; xmin end address is: 36 (R9)
UXTB	R11, R9
L_Draw_Rectangle117:
; i start address is: 40 (R10)
; xmin start address is: 44 (R11)
LDRB	R4, [SP, #6]
CMP	R10, R4
IT	HI
BHI	L_Draw_Rectangle118
;st7735.c,427 :: 		Draw_Pixel(xmin, i, colour);
LDRH	R2, [SP, #32]
UXTB	R1, R10
UXTB	R0, R11
BL	_Draw_Pixel+0
;st7735.c,425 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R10, #1
; i end address is: 40 (R10)
; i start address is: 0 (R0)
UXTB	R0, R4
;st7735.c,428 :: 		}
; i end address is: 0 (R0)
UXTB	R10, R0
IT	AL
BAL	L_Draw_Rectangle117
L_Draw_Rectangle118:
;st7735.c,423 :: 		for(; xmin <= xmax; ++xmin)
ADD	R4, R11, #1
; xmin end address is: 44 (R11)
; xmin start address is: 36 (R9)
UXTB	R9, R4
;st7735.c,429 :: 		}
; xmin end address is: 36 (R9)
IT	AL
BAL	L_Draw_Rectangle114
L_Draw_Rectangle115:
;st7735.c,430 :: 		}
IT	AL
BAL	L_Draw_Rectangle120
L_Draw_Rectangle109:
;st7735.c,434 :: 		Draw_Line(x1, y1, x2, y1, colour);
LDRH	R4, [SP, #32]
LDRSH	R3, [SP, #12]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;st7735.c,435 :: 		Draw_Line(x1, y2, x2, y2, colour);
LDRH	R4, [SP, #32]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;st7735.c,436 :: 		Draw_Line(x1, y1, x1, y2, colour);
LDRH	R4, [SP, #32]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #8]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;st7735.c,437 :: 		Draw_Line(x2, y1, x2, y2, colour);
LDRH	R4, [SP, #32]
LDRSH	R3, [SP, #20]
LDRSH	R2, [SP, #16]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;st7735.c,438 :: 		}
L_Draw_Rectangle120:
;st7735.c,440 :: 		if(type != SQUARE)
LDRB	R4, [SP, #28]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle121
;st7735.c,442 :: 		Draw_Pixel(x1, y1, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;st7735.c,443 :: 		Draw_Pixel(x1, y2, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;st7735.c,444 :: 		Draw_Pixel(x2, y1, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;st7735.c,445 :: 		Draw_Pixel(x2, y2, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;st7735.c,446 :: 		}
L_Draw_Rectangle121:
;st7735.c,447 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Rectangle
_Draw_Circle:
;st7735.c,450 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
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
;st7735.c,452 :: 		signed int a = 0x0000;
; a start address is: 40 (R10)
MOVW	R10, #0
SXTH	R10, R10
;st7735.c,453 :: 		signed int b = 0x0000;
;st7735.c,454 :: 		signed int p = 0x0000;
;st7735.c,456 :: 		b = radius;
STRH	R0, [SP, #8]
;st7735.c,457 :: 		p = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #10]
; a end address is: 40 (R10)
SXTH	R0, R10
;st7735.c,459 :: 		do
IT	AL
BAL	L_Draw_Circle122
L__Draw_Circle217:
;st7735.c,488 :: 		}while(a <= b);
SXTH	R0, R10
;st7735.c,459 :: 		do
L_Draw_Circle122:
;st7735.c,461 :: 		if(fill != NO)
; a start address is: 0 (R0)
LDRB	R4, [SP, #20]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Circle125
;st7735.c,463 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
LDRH	R7, [SP, #24]
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R5, R4, R0
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
SXTH	R3, R6
SXTH	R2, R5
SXTH	R1, R6
SXTH	R0, R4
PUSH	(R7)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #4]
;st7735.c,464 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
LDRH	R7, [SP, #24]
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R5, R4, R0
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
SXTH	R3, R6
SXTH	R2, R5
SXTH	R1, R6
SXTH	R0, R4
PUSH	(R7)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #4]
;st7735.c,465 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
LDRH	R8, [SP, #24]
LDRSH	R4, [SP, #16]
ADDS	R7, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #4]
;st7735.c,466 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
LDRH	R8, [SP, #24]
LDRSH	R4, [SP, #16]
SUB	R7, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R7
SXTH	R0, R4
PUSH	32
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #4]
;st7735.c,467 :: 		}
IT	AL
BAL	L_Draw_Circle126
L_Draw_Circle125:
;st7735.c,470 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
ADDS	R5, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R5
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,471 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,472 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
ADDS	R5, R4, R5
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R5
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,473 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,474 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R4, [SP, #16]
SUB	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,475 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R5, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R5
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,476 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R5, R4, R5
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R5
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,477 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R4, [SP, #16]
SUB	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTB	R1, R6
UXTB	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;st7735.c,478 :: 		}
L_Draw_Circle126:
;st7735.c,480 :: 		if(p < 0)
LDRSH	R4, [SP, #10]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle127
;st7735.c,482 :: 		p += (0x03 + (0x02 * a++));
LSLS	R4, R0, #1
SXTH	R4, R4
ADDS	R5, R4, #3
SXTH	R5, R5
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
ADD	R10, R0, #1
SXTH	R10, R10
; a end address is: 0 (R0)
; a start address is: 40 (R10)
;st7735.c,483 :: 		}
; a end address is: 40 (R10)
IT	AL
BAL	L_Draw_Circle128
L_Draw_Circle127:
;st7735.c,486 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
; a start address is: 0 (R0)
LDRSH	R4, [SP, #8]
SUB	R4, R0, R4
SXTH	R4, R4
LSLS	R4, R4, #1
SXTH	R4, R4
ADDS	R5, R4, #5
SXTH	R5, R5
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
ADD	R10, R0, #1
SXTH	R10, R10
; a end address is: 0 (R0)
; a start address is: 40 (R10)
LDRSH	R4, [SP, #8]
SUBS	R4, R4, #1
STRH	R4, [SP, #8]
; a end address is: 40 (R10)
;st7735.c,487 :: 		}
L_Draw_Circle128:
;st7735.c,488 :: 		}while(a <= b);
; a start address is: 40 (R10)
LDRSH	R4, [SP, #8]
CMP	R10, R4
IT	LE
BLE	L__Draw_Circle217
; a end address is: 40 (R10)
;st7735.c,489 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_Draw_Font_Pixel:
;st7735.c,492 :: 		void Draw_Font_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned int colour, unsigned char pixel_size)
; pixel_size start address is: 12 (R3)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R10, R2
UXTB	R9, R3
; pixel_size end address is: 12 (R3)
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 40 (R10)
; pixel_size start address is: 36 (R9)
;st7735.c,494 :: 		unsigned char i = 0x00;
;st7735.c,496 :: 		Set_Addr_Window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));
ADD	R4, R1, R9, LSL #0
SXTH	R4, R4
SUBS	R5, R4, #1
ADD	R4, R0, R9, LSL #0
SXTH	R4, R4
SUBS	R4, R4, #1
UXTB	R3, R5
UXTB	R2, R4
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_Set_Addr_Window+0
;st7735.c,498 :: 		for(i = 0x00; i < (pixel_size * pixel_size); i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; colour end address is: 40 (R10)
; pixel_size end address is: 36 (R9)
; i end address is: 24 (R6)
UXTH	R8, R10
UXTB	R7, R9
L_Draw_Font_Pixel129:
; i start address is: 24 (R6)
; colour start address is: 32 (R8)
; pixel_size start address is: 28 (R7)
; colour start address is: 32 (R8)
; colour end address is: 32 (R8)
MUL	R4, R7, R7
SXTH	R4, R4
CMP	R6, R4
IT	GE
BGE	L_Draw_Font_Pixel130
; colour end address is: 32 (R8)
;st7735.c,500 :: 		ST7735_Word_Write(colour);
; colour start address is: 32 (R8)
UXTH	R0, R8
BL	_ST7735_Word_Write+0
;st7735.c,498 :: 		for(i = 0x00; i < (pixel_size * pixel_size); i++)
ADDS	R6, R6, #1
UXTB	R6, R6
;st7735.c,501 :: 		}
; pixel_size end address is: 28 (R7)
; colour end address is: 32 (R8)
; i end address is: 24 (R6)
IT	AL
BAL	L_Draw_Font_Pixel129
L_Draw_Font_Pixel130:
;st7735.c,502 :: 		}
L_end_Draw_Font_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Font_Pixel
_print_char:
;st7735.c,505 :: 		void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
STRB	R1, [SP, #12]
UXTB	R11, R2
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; font_size start address is: 44 (R11)
; colour start address is: 12 (R3)
LDRH	R4, [SP, #16]
STRH	R4, [SP, #16]
LDRB	R4, [SP, #20]
STRB	R4, [SP, #20]
;st7735.c,507 :: 		unsigned char i = 0x00;
;st7735.c,508 :: 		unsigned char j = 0x00;
;st7735.c,510 :: 		unsigned char value = 0x00;
;st7735.c,512 :: 		if(font_size < 0)
CMP	R11, #0
IT	CS
BCS	L__print_char218
;st7735.c,514 :: 		font_size = 1;
MOVW	R11, #1
; font_size end address is: 44 (R11)
;st7735.c,515 :: 		}
IT	AL
BAL	L_print_char132
L__print_char218:
;st7735.c,512 :: 		if(font_size < 0)
;st7735.c,515 :: 		}
L_print_char132:
;st7735.c,517 :: 		if(x_pos < font_size)
; font_size start address is: 44 (R11)
LDRB	R4, [SP, #8]
CMP	R4, R11
IT	CS
BCS	L_print_char133
;st7735.c,519 :: 		x_pos = font_size;
STRB	R11, [SP, #8]
;st7735.c,520 :: 		}
L_print_char133:
;st7735.c,522 :: 		for (i = 0x00; i < 0x05; i++)
MOVS	R4, #0
STRB	R4, [SP, #4]
; colour end address is: 12 (R3)
; font_size end address is: 44 (R11)
UXTH	R1, R3
UXTB	R0, R11
L_print_char134:
; font_size start address is: 0 (R0)
; colour start address is: 4 (R1)
LDRB	R4, [SP, #4]
CMP	R4, #5
IT	CS
BCS	L_print_char135
;st7735.c,524 :: 		for (j = 0x00; j < 0x08; j++)
MOVS	R4, #0
STRB	R4, [SP, #5]
; font_size end address is: 0 (R0)
; colour end address is: 4 (R1)
UXTB	R11, R0
UXTH	R12, R1
L_print_char137:
; colour start address is: 48 (R12)
; font_size start address is: 44 (R11)
LDRB	R4, [SP, #5]
CMP	R4, #8
IT	CS
BCS	L_print_char138
;st7735.c,527 :: 		value = ((font[((unsigned char)ch) - 0x20][i]));
LDRB	R4, [SP, #20]
SUBW	R5, R4, #32
SXTH	R5, R5
MOVS	R4, #5
MULS	R5, R4, R5
MOVW	R4, #lo_addr(ST7735s_demo_font+0)
MOVT	R4, #hi_addr(ST7735s_demo_font+0)
ADDS	R5, R4, R5
LDRB	R4, [SP, #4]
ADDS	R4, R5, R4
LDRB	R5, [R4, #0]
;st7735.c,529 :: 		if((value >> j)  & 0x01)
LDRB	R4, [SP, #5]
LSR	R4, R5, R4
UXTB	R4, R4
AND	R4, R4, #1
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_print_char140
;st7735.c,531 :: 		Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
UXTB	R3, R11
UXTH	R2, R12
LDRB	R1, [SP, #12]
LDRB	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;st7735.c,532 :: 		}
IT	AL
BAL	L_print_char141
L_print_char140:
;st7735.c,535 :: 		Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
UXTB	R3, R11
LDRH	R2, [SP, #16]
LDRB	R1, [SP, #12]
LDRB	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;st7735.c,536 :: 		}
L_print_char141:
;st7735.c,538 :: 		y_pos = y_pos + font_size;
LDRB	R4, [SP, #12]
ADD	R4, R4, R11, LSL #0
STRB	R4, [SP, #12]
;st7735.c,524 :: 		for (j = 0x00; j < 0x08; j++)
LDRB	R4, [SP, #5]
ADDS	R4, R4, #1
STRB	R4, [SP, #5]
;st7735.c,539 :: 		}
IT	AL
BAL	L_print_char137
L_print_char138:
;st7735.c,540 :: 		y_pos -= (font_size << 0x03);
LSL	R5, R11, #3
UXTH	R5, R5
LDRB	R4, [SP, #12]
SUB	R4, R4, R5
STRB	R4, [SP, #12]
;st7735.c,541 :: 		x_pos += font_size;
LDRB	R4, [SP, #8]
ADD	R4, R4, R11, LSL #0
STRB	R4, [SP, #8]
;st7735.c,522 :: 		for (i = 0x00; i < 0x05; i++)
LDRB	R4, [SP, #4]
ADDS	R4, R4, #1
STRB	R4, [SP, #4]
;st7735.c,543 :: 		}
UXTH	R1, R12
; colour end address is: 48 (R12)
; font_size end address is: 44 (R11)
UXTB	R0, R11
IT	AL
BAL	L_print_char134
L_print_char135:
;st7735.c,544 :: 		x_pos += font_size;
; font_size start address is: 0 (R0)
LDRB	R4, [SP, #8]
ADDS	R6, R4, R0
; font_size end address is: 0 (R0)
;st7735.c,546 :: 		if(x_pos > w)
MOVW	R4, #lo_addr(_w+0)
MOVT	R4, #hi_addr(_w+0)
LDRB	R5, [R4, #0]
UXTB	R4, R6
CMP	R4, R5
IT	LS
BLS	L_print_char142
;st7735.c,550 :: 		}
L_print_char142:
;st7735.c,551 :: 		}
L_end_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _print_char
_print_str:
;st7735.c,554 :: 		void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
; font_size start address is: 8 (R2)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRB	R0, [SP, #12]
STRB	R1, [SP, #16]
STRH	R3, [SP, #20]
; font_size end address is: 8 (R2)
; font_size start address is: 8 (R2)
LDRH	R4, [SP, #24]
STRH	R4, [SP, #24]
; ch start address is: 4 (R1)
LDR	R1, [SP, #28]
UXTB	R0, R2
; font_size end address is: 8 (R2)
; ch end address is: 4 (R1)
;st7735.c,556 :: 		do
L_print_str143:
;st7735.c,558 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
; ch start address is: 28 (R7)
; ch start address is: 4 (R1)
; font_size start address is: 0 (R0)
LDRB	R4, [R1, #0]
UXTB	R5, R4
LDRH	R4, [SP, #24]
STRB	R0, [SP, #4]
STR	R1, [SP, #8]
LDRH	R3, [SP, #20]
UXTB	R2, R0
LDRB	R1, [SP, #16]
LDRB	R0, [SP, #12]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
LDR	R1, [SP, #8]
LDRB	R0, [SP, #4]
ADDS	R6, R1, #1
; ch end address is: 4 (R1)
; ch start address is: 28 (R7)
MOV	R7, R6
; ch end address is: 28 (R7)
;st7735.c,559 :: 		x_pos += (font_size * 0x06);
MOVS	R4, #6
SXTH	R4, R4
MUL	R5, R0, R4
SXTH	R5, R5
LDRB	R4, [SP, #12]
ADDS	R4, R4, R5
STRB	R4, [SP, #12]
;st7735.c,560 :: 		}while((*ch >= 0x20) && (*ch <= 0x7F));
LDRB	R4, [R6, #0]
CMP	R4, #32
IT	CC
BCC	L__print_str221
; ch end address is: 28 (R7)
; ch start address is: 28 (R7)
LDRB	R4, [R7, #0]
CMP	R4, #127
IT	HI
BHI	L__print_str220
; font_size end address is: 0 (R0)
; ch end address is: 28 (R7)
MOV	R1, R7
IT	AL
BAL	L_print_str143
L__print_str221:
L__print_str220:
;st7735.c,561 :: 		}
L_end_print_str:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _print_str
_print_C:
;st7735.c,564 :: 		void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
LDRSH	R6, [SP, #16]
;st7735.c,566 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;st7735.c,568 :: 		if(value < 0x00)
CMP	R6, #0
IT	GE
BGE	L_print_C148
;st7735.c,571 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;st7735.c,572 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;st7735.c,573 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_C149
L_print_C148:
;st7735.c,576 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;st7735.c,577 :: 		}
L_print_C149:
;st7735.c,579 :: 		if((value > 99) && (value <= 999))
; value start address is: 36 (R9)
CMP	R9, #99
IT	LE
BLE	L__print_C226
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_C225
L__print_C224:
;st7735.c,581 :: 		ch[1] = ((value / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;st7735.c,582 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;st7735.c,583 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,584 :: 		}
IT	AL
BAL	L_print_C153
;st7735.c,579 :: 		if((value > 99) && (value <= 999))
L__print_C226:
; value start address is: 36 (R9)
L__print_C225:
;st7735.c,585 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_C228
CMP	R9, #99
IT	GT
BGT	L__print_C227
L__print_C223:
;st7735.c,587 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;st7735.c,588 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,589 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,590 :: 		}
IT	AL
BAL	L_print_C157
;st7735.c,585 :: 		else if((value > 9) && (value <= 99))
L__print_C228:
; value start address is: 36 (R9)
L__print_C227:
;st7735.c,591 :: 		else if((value >= 0) && (value <= 9))
CMP	R9, #0
IT	LT
BLT	L__print_C230
CMP	R9, #9
IT	GT
BGT	L__print_C229
L__print_C222:
;st7735.c,593 :: 		ch[1] = ((value % 10) + 0x30);
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
;st7735.c,594 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,595 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,591 :: 		else if((value >= 0) && (value <= 9))
L__print_C230:
L__print_C229:
;st7735.c,596 :: 		}
L_print_C157:
L_print_C153:
;st7735.c,598 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;st7735.c,599 :: 		}
L_end_print_C:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_C
_print_I:
;st7735.c,602 :: 		void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
LDRSH	R6, [SP, #16]
;st7735.c,604 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;st7735.c,606 :: 		if(value < 0)
CMP	R6, #0
IT	GE
BGE	L_print_I161
;st7735.c,608 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;st7735.c,609 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;st7735.c,610 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_I162
L_print_I161:
;st7735.c,613 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;st7735.c,614 :: 		}
L_print_I162:
;st7735.c,616 :: 		if(value > 9999)
; value start address is: 36 (R9)
MOVW	R4, #9999
CMP	R9, R4
IT	LE
BLE	L_print_I163
;st7735.c,618 :: 		ch[1] = ((value / 10000) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVW	R4, #10000
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;st7735.c,619 :: 		ch[2] = (((value % 10000)/ 1000) + 0x30);
ADDS	R6, R7, #2
MOVW	R4, #10000
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,620 :: 		ch[3] = (((value % 1000) / 100) + 0x30);
ADDS	R6, R7, #3
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,621 :: 		ch[4] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #4
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
;st7735.c,622 :: 		ch[5] = ((value % 10) + 0x30);
ADDS	R6, R7, #5
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,623 :: 		}
IT	AL
BAL	L_print_I164
L_print_I163:
;st7735.c,625 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 36 (R9)
MOVW	R4, #999
CMP	R9, R4
IT	LE
BLE	L__print_I235
MOVW	R4, #9999
CMP	R9, R4
IT	GT
BGT	L__print_I234
L__print_I233:
;st7735.c,627 :: 		ch[1] = (((value % 10000)/ 1000) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVW	R4, #10000
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,628 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
ADDS	R6, R7, #2
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,629 :: 		ch[3] = (((value % 100) / 10) + 0x30);
ADDS	R6, R7, #3
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
;st7735.c,630 :: 		ch[4] = ((value % 10) + 0x30);
ADDS	R6, R7, #4
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,631 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,632 :: 		}
IT	AL
BAL	L_print_I168
;st7735.c,625 :: 		else if((value > 999) && (value <= 9999))
L__print_I235:
; value start address is: 36 (R9)
L__print_I234:
;st7735.c,633 :: 		else if((value > 99) && (value <= 999))
CMP	R9, #99
IT	LE
BLE	L__print_I237
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_I236
L__print_I232:
;st7735.c,635 :: 		ch[1] = (((value % 1000) / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R6, R7, #1
MOVW	R4, #1000
SXTH	R4, R4
SDIV	R5, R9, R4
MLS	R5, R4, R5, R9
SXTH	R5, R5
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R5, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,636 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;st7735.c,637 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,638 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,639 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,640 :: 		}
IT	AL
BAL	L_print_I172
;st7735.c,633 :: 		else if((value > 99) && (value <= 999))
L__print_I237:
; value start address is: 36 (R9)
L__print_I236:
;st7735.c,641 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_I239
CMP	R9, #99
IT	GT
BGT	L__print_I238
L__print_I231:
;st7735.c,643 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;st7735.c,644 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,645 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,646 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,647 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,648 :: 		}
IT	AL
BAL	L_print_I176
;st7735.c,641 :: 		else if((value > 9) && (value <= 99))
L__print_I239:
; value start address is: 36 (R9)
L__print_I238:
;st7735.c,651 :: 		ch[1] = ((value % 10) + 0x30);
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
;st7735.c,652 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,653 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,654 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,655 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;st7735.c,656 :: 		}
L_print_I176:
L_print_I172:
L_print_I168:
L_print_I164:
;st7735.c,658 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;st7735.c,659 :: 		}
L_end_print_I:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_I
_print_D:
;st7735.c,662 :: 		void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
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
LDRH	R8, [SP, #16]
; points start address is: 36 (R9)
LDRB	R9, [SP, #20]
;st7735.c,664 :: 		unsigned char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, 0x20};
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
MOVS	R4, #32
STRB	R4, [SP, #9]
;st7735.c,666 :: 		ch[1] = ((value / 1000) + 0x30);
ADD	R4, SP, #4
ADDS	R5, R4, #1
MOVW	R4, #1000
UDIV	R4, R8, R4
UXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;st7735.c,668 :: 		if(points > 1)
CMP	R9, #1
IT	LS
BLS	L_print_D177
;st7735.c,670 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #2
MOVW	R4, #1000
UDIV	R5, R8, R4
MLS	R5, R4, R5, R8
UXTH	R5, R5
MOVS	R4, #100
UDIV	R4, R5, R4
UXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,672 :: 		if(points > 2)
CMP	R9, #2
IT	LS
BLS	L_print_D178
;st7735.c,674 :: 		ch[3] = (((value % 100) / 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #3
MOVS	R4, #100
UDIV	R5, R8, R4
MLS	R5, R4, R5, R8
UXTH	R5, R5
MOVS	R4, #10
UDIV	R4, R5, R4
UXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,676 :: 		if(points > 3)
CMP	R9, #3
IT	LS
BLS	L_print_D179
; points end address is: 36 (R9)
;st7735.c,678 :: 		ch[4] = ((value % 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #4
MOVS	R5, #10
UDIV	R4, R8, R5
MLS	R4, R5, R4, R8
UXTH	R4, R4
; value end address is: 32 (R8)
ADDS	R4, #48
STRB	R4, [R6, #0]
;st7735.c,679 :: 		}
L_print_D179:
;st7735.c,680 :: 		}
L_print_D178:
;st7735.c,681 :: 		}
L_print_D177:
;st7735.c,683 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;st7735.c,684 :: 		}
L_end_print_D:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_D
_print_F:
;st7735.c,687 :: 		void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
SUB	SP, SP, #36
STR	LR, [SP, #0]
STRB	R0, [SP, #28]
UXTH	R9, R3
UXTB	R3, R2
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; y_pos start address is: 4 (R1)
; font_size start address is: 12 (R3)
; colour start address is: 36 (R9)
; back_colour start address is: 40 (R10)
LDRH	R10, [SP, #36]
; value start address is: 44 (R11)
LDR	R11, [SP, #40]
LDRB	R4, [SP, #44]
STRB	R4, [SP, #44]
;st7735.c,689 :: 		signed long tmp = 0x0000;
;st7735.c,691 :: 		tmp = value;
STRB	R1, [SP, #4]
MOV	R0, R11
BL	__FloatToSignedIntegral+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #24]
;st7735.c,692 :: 		print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
SXTH	R5, R0
UXTH	R4, R10
STR	R11, [SP, #4]
STRH	R10, [SP, #8]
STRH	R9, [SP, #12]
STRB	R3, [SP, #16]
STRB	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R9
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_I+0
ADD	SP, SP, #8
LDRB	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R9, [SP, #12]
LDRH	R10, [SP, #8]
LDR	R11, [SP, #4]
;st7735.c,693 :: 		tmp = ((value - tmp) * 10000);
STRB	R1, [SP, #4]
LDR	R0, [SP, #24]
BL	__SignedIntegralToFloat+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #32]
STR	R0, [SP, #32]
LDR	R2, [SP, #32]
STRB	R3, [SP, #4]
STRB	R1, [SP, #8]
MOV	R0, R11
BL	__Sub_FP+0
MOVW	R2, #16384
MOVT	R2, #17948
BL	__Mul_FP+0
LDRB	R1, [SP, #8]
LDRB	R3, [SP, #4]
STRB	R1, [SP, #4]
BL	__FloatToSignedIntegral+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #24]
;st7735.c,695 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BGE	L_print_F180
;st7735.c,697 :: 		tmp = -tmp;
LDR	R4, [SP, #24]
RSBS	R4, R4, #0
STR	R4, [SP, #24]
;st7735.c,698 :: 		}
L_print_F180:
;st7735.c,700 :: 		if((value >= 9999) && (value < 99999))
MOVW	R0, #15360
MOVT	R0, #17948
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F277
MOVS	R0, #1
L__print_F277:
CMP	R0, #0
IT	EQ
BEQ	L__print_F245
MOVW	R0, #20352
MOVT	R0, #18371
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F278
MOVS	R0, #1
L__print_F278:
CMP	R0, #0
IT	EQ
BEQ	L__print_F244
; value end address is: 44 (R11)
L__print_F243:
;st7735.c,702 :: 		print_D((x_pos + (0x24 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R8, [SP, #44]
LDR	R7, [SP, #24]
UXTH	R6, R10
; back_colour end address is: 40 (R10)
MOVS	R4, #36
SXTH	R4, R4
MUL	R5, R4, R3
SXTH	R5, R5
LDRB	R4, [SP, #28]
ADDS	R4, R4, R5
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_print_D+0
ADD	SP, SP, #12
;st7735.c,703 :: 		}
IT	AL
BAL	L_print_F184
;st7735.c,700 :: 		if((value >= 9999) && (value < 99999))
L__print_F245:
; value start address is: 44 (R11)
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F244:
;st7735.c,704 :: 		else if((value >= 999) && (value < 9999))
MOVW	R0, #49152
MOVT	R0, #17529
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F279
MOVS	R0, #1
L__print_F279:
CMP	R0, #0
IT	EQ
BEQ	L__print_F247
MOVW	R0, #15360
MOVT	R0, #17948
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F280
MOVS	R0, #1
L__print_F280:
CMP	R0, #0
IT	EQ
BEQ	L__print_F246
; value end address is: 44 (R11)
L__print_F242:
;st7735.c,706 :: 		print_D((x_pos + (0x1E * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R8, [SP, #44]
LDR	R7, [SP, #24]
UXTH	R6, R10
; back_colour end address is: 40 (R10)
MOVS	R4, #30
SXTH	R4, R4
MUL	R5, R4, R3
SXTH	R5, R5
LDRB	R4, [SP, #28]
ADDS	R4, R4, R5
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_print_D+0
ADD	SP, SP, #12
;st7735.c,707 :: 		}
IT	AL
BAL	L_print_F188
;st7735.c,704 :: 		else if((value >= 999) && (value < 9999))
L__print_F247:
; value start address is: 44 (R11)
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F246:
;st7735.c,708 :: 		else if((value >= 99) && (value < 999))
MOVW	R0, #0
MOVT	R0, #17094
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F281
MOVS	R0, #1
L__print_F281:
CMP	R0, #0
IT	EQ
BEQ	L__print_F249
MOVW	R0, #49152
MOVT	R0, #17529
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F282
MOVS	R0, #1
L__print_F282:
CMP	R0, #0
IT	EQ
BEQ	L__print_F248
; value end address is: 44 (R11)
L__print_F241:
;st7735.c,710 :: 		print_D((x_pos + (0x18 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R8, [SP, #44]
LDR	R7, [SP, #24]
UXTH	R6, R10
; back_colour end address is: 40 (R10)
MOVS	R4, #24
SXTH	R4, R4
MUL	R5, R4, R3
SXTH	R5, R5
LDRB	R4, [SP, #28]
ADDS	R4, R4, R5
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_print_D+0
ADD	SP, SP, #12
;st7735.c,711 :: 		}
IT	AL
BAL	L_print_F192
;st7735.c,708 :: 		else if((value >= 99) && (value < 999))
L__print_F249:
; value start address is: 44 (R11)
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F248:
;st7735.c,712 :: 		else if((value >= 9) && (value < 99))
MOVW	R0, #0
MOVT	R0, #16656
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F283
MOVS	R0, #1
L__print_F283:
CMP	R0, #0
IT	EQ
BEQ	L__print_F251
MOVW	R0, #0
MOVT	R0, #17094
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F284
MOVS	R0, #1
L__print_F284:
CMP	R0, #0
IT	EQ
BEQ	L__print_F250
; value end address is: 44 (R11)
L__print_F240:
;st7735.c,714 :: 		print_D((x_pos + (0x12 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R8, [SP, #44]
LDR	R7, [SP, #24]
UXTH	R6, R10
; back_colour end address is: 40 (R10)
MOVS	R4, #18
SXTH	R4, R4
MUL	R5, R4, R3
SXTH	R5, R5
LDRB	R4, [SP, #28]
ADDS	R4, R4, R5
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_print_D+0
ADD	SP, SP, #12
;st7735.c,715 :: 		}
IT	AL
BAL	L_print_F196
;st7735.c,712 :: 		else if((value >= 9) && (value < 99))
L__print_F251:
; value start address is: 44 (R11)
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F250:
;st7735.c,716 :: 		else if(value < 9)
MOVW	R0, #0
MOVT	R0, #16656
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F285
MOVS	R0, #1
L__print_F285:
CMP	R0, #0
IT	EQ
BEQ	L_print_F197
;st7735.c,718 :: 		print_D((x_pos + (0x0C * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R8, [SP, #44]
LDR	R7, [SP, #24]
UXTH	R6, R10
MOVS	R4, #12
SXTH	R4, R4
MUL	R5, R4, R3
SXTH	R5, R5
LDRB	R4, [SP, #28]
ADDS	R4, R4, R5
STR	R11, [SP, #4]
STRH	R10, [SP, #8]
STRH	R9, [SP, #12]
STRB	R3, [SP, #16]
STRB	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R9
UXTB	R0, R4
PUSH	32
PUSH	(R7)
PUSH	(R6)
BL	_print_D+0
ADD	SP, SP, #12
LDRB	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R9, [SP, #12]
LDRH	R10, [SP, #8]
LDR	R11, [SP, #4]
;st7735.c,720 :: 		if((value) < 0)
MOV	R0, #0
MOV	R2, R11
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F286
MOVS	R0, #1
L__print_F286:
; value end address is: 44 (R11)
CMP	R0, #0
IT	EQ
BEQ	L_print_F198
;st7735.c,722 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
MOVS	R5, #45
UXTH	R4, R10
; back_colour end address is: 40 (R10)
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;st7735.c,723 :: 		}
IT	AL
BAL	L_print_F199
L_print_F198:
;st7735.c,726 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
; back_colour start address is: 40 (R10)
; colour start address is: 36 (R9)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
MOVS	R5, #32
UXTH	R4, R10
; back_colour end address is: 40 (R10)
UXTB	R2, R3
; colour end address is: 36 (R9)
UXTH	R3, R9
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;st7735.c,727 :: 		}
L_print_F199:
;st7735.c,728 :: 		}
L_print_F197:
L_print_F196:
L_print_F192:
L_print_F188:
L_print_F184:
;st7735.c,729 :: 		}
L_end_print_F:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_F
_main:
;ST7735s_demo.c,4 :: 		void main()
SUB	SP, SP, #32
;ST7735s_demo.c,6 :: 		float f = -0.09;
MOVW	R0, #20972
MOVT	R0, #48568
STR	R0, [SP, #0]
MVN	R0, #8
STRH	R0, [SP, #4]
MOVS	R0, #127
STRB	R0, [SP, #6]
;ST7735s_demo.c,7 :: 		signed int i = -9;
;ST7735s_demo.c,8 :: 		signed char c = 127;
;ST7735s_demo.c,10 :: 		ST7735_init();
BL	_ST7735_init+0
;ST7735s_demo.c,12 :: 		Set_Rotation(0x03);
MOVS	R0, #3
BL	_Set_Rotation+0
;ST7735s_demo.c,14 :: 		TFT_fill(Swap_Colour(GREEN));
MOVW	R0, #2016
BL	_Swap_Colour+0
BL	_TFT_fill+0
;ST7735s_demo.c,15 :: 		Draw_Circle(79, 63, 40, YES, Swap_Colour(RED));
MOVW	R0, #63488
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #40
SXTH	R2, R2
MOVS	R1, #63
SXTH	R1, R1
MOVS	R0, #79
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ST7735s_demo.c,16 :: 		delay_ms(6000);
MOVW	R7, #41471
MOVT	R7, #1098
NOP
NOP
L_main200:
SUBS	R7, R7, #1
BNE	L_main200
NOP
NOP
NOP
;ST7735s_demo.c,18 :: 		TFT_fill(Swap_Colour(WHITE));
MOVW	R0, #65535
BL	_Swap_Colour+0
BL	_TFT_fill+0
;ST7735s_demo.c,20 :: 		Draw_Circle(6, 6, 4, YES, Swap_Colour(RED));
MOVW	R0, #63488
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #6
SXTH	R1, R1
MOVS	R0, #6
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ST7735s_demo.c,21 :: 		Draw_Circle(153, 6, 4, YES, Swap_Colour(RED));
MOVW	R0, #63488
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #6
SXTH	R1, R1
MOVS	R0, #153
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ST7735s_demo.c,22 :: 		Draw_Circle(6, 121, 4, YES, Swap_Colour(RED));
MOVW	R0, #63488
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #121
SXTH	R1, R1
MOVS	R0, #6
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ST7735s_demo.c,23 :: 		Draw_Circle(153, 121, 4, YES, Swap_Colour(RED));
MOVW	R0, #63488
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #121
SXTH	R1, R1
MOVS	R0, #153
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ST7735s_demo.c,25 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main202:
SUBS	R7, R7, #1
BNE	L_main202
NOP
NOP
NOP
;ST7735s_demo.c,27 :: 		Draw_Line(14, 0, 14, 127, Swap_Colour(CYAN));
MOVW	R0, #2047
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #127
SXTH	R3, R3
MOVS	R2, #14
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #14
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;ST7735s_demo.c,28 :: 		Draw_Line(145, 0, 145, 127, Swap_Colour(CYAN));
MOVW	R0, #2047
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #127
SXTH	R3, R3
MOVS	R2, #145
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #145
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;ST7735s_demo.c,29 :: 		Draw_Line(0, 14, 159, 14, Swap_Colour(CYAN));
MOVW	R0, #2047
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #14
SXTH	R3, R3
MOVS	R2, #159
SXTH	R2, R2
MOVS	R1, #14
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;ST7735s_demo.c,30 :: 		Draw_Line(0, 113, 159, 113, Swap_Colour(CYAN));
MOVW	R0, #2047
BL	_Swap_Colour+0
PUSH	(R0)
MOVS	R3, #113
SXTH	R3, R3
MOVS	R2, #159
SXTH	R2, R2
MOVS	R1, #113
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;ST7735s_demo.c,32 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main204:
SUBS	R7, R7, #1
BNE	L_main204
NOP
NOP
NOP
;ST7735s_demo.c,34 :: 		Draw_Rectangle(17, 17, 142, 110, YES, ROUND, Swap_Colour(BLUE), Swap_Colour(WHITE));
MOVW	R0, #65535
BL	_Swap_Colour+0
STRH	R0, [SP, #20]
MOVS	R0, #31
BL	_Swap_Colour+0
MOVS	R3, #1
MOVS	R2, #1
LDRH	R1, [SP, #20]
PUSH	(R1)
PUSH	(R0)
PUSH	(R3)
PUSH	(R2)
MOVS	R3, #110
SXTH	R3, R3
MOVS	R2, #142
SXTH	R2, R2
MOVS	R1, #17
SXTH	R1, R1
MOVS	R0, #17
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #16
;ST7735s_demo.c,35 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main206:
SUBS	R7, R7, #1
BNE	L_main206
NOP
NOP
NOP
;ST7735s_demo.c,37 :: 		print_str(22, 58, 2, Swap_Colour(MAGENTA), Swap_Colour(BLUE), "MicroArena");
MOVW	R0, #lo_addr(?lstr1_ST7735s_demo+0)
MOVT	R0, #hi_addr(?lstr1_ST7735s_demo+0)
STR	R0, [SP, #24]
MOVS	R0, #31
BL	_Swap_Colour+0
STRH	R0, [SP, #20]
MOVW	R0, #63519
BL	_Swap_Colour+0
LDR	R2, [SP, #24]
LDRH	R1, [SP, #20]
PUSH	(R2)
PUSH	(R1)
UXTH	R3, R0
MOVS	R2, #2
MOVS	R1, #58
MOVS	R0, #22
BL	_print_str+0
ADD	SP, SP, #8
;ST7735s_demo.c,38 :: 		delay_ms(4000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_main208:
SUBS	R7, R7, #1
BNE	L_main208
NOP
NOP
NOP
;ST7735s_demo.c,40 :: 		TFT_fill(BLACK);
MOVS	R0, #0
BL	_TFT_fill+0
;ST7735s_demo.c,41 :: 		print_str(20, 90, 1, Swap_Colour(CYAN), BLACK, "www.fb.com/MicroArena");
MOVW	R0, #lo_addr(?lstr2_ST7735s_demo+0)
MOVT	R0, #hi_addr(?lstr2_ST7735s_demo+0)
STR	R0, [SP, #24]
MOVS	R0, #0
STRH	R0, [SP, #20]
MOVW	R0, #2047
BL	_Swap_Colour+0
LDR	R2, [SP, #24]
LDRH	R1, [SP, #20]
PUSH	(R2)
PUSH	(R1)
UXTH	R3, R0
MOVS	R2, #1
MOVS	R1, #90
MOVS	R0, #20
BL	_print_str+0
ADD	SP, SP, #8
;ST7735s_demo.c,43 :: 		while(1)
L_main210:
;ST7735s_demo.c,45 :: 		print_F(60, 20, 1, Swap_Colour(BLUE), BLACK, f, 2);
MOVS	R0, #2
STRB	R0, [SP, #28]
LDR	R0, [SP, #0]
STR	R0, [SP, #24]
MOVS	R0, #0
STRH	R0, [SP, #20]
MOVS	R0, #31
BL	_Swap_Colour+0
LDRB	R3, [SP, #28]
LDR	R2, [SP, #24]
LDRH	R1, [SP, #20]
PUSH	(R3)
PUSH	(R2)
PUSH	(R1)
UXTH	R3, R0
MOVS	R2, #1
MOVS	R1, #20
MOVS	R0, #60
BL	_print_F+0
ADD	SP, SP, #12
;ST7735s_demo.c,46 :: 		print_C(60, 40, 1, Swap_Colour(GREEN), BLACK, c);
LDRSB	R0, [SP, #6]
STRH	R0, [SP, #24]
MOVS	R0, #0
STRH	R0, [SP, #20]
MOVW	R0, #2016
BL	_Swap_Colour+0
LDRSH	R2, [SP, #24]
LDRH	R1, [SP, #20]
PUSH	(R2)
PUSH	(R1)
UXTH	R3, R0
MOVS	R2, #1
MOVS	R1, #40
MOVS	R0, #60
BL	_print_C+0
ADD	SP, SP, #8
;ST7735s_demo.c,47 :: 		print_I(60, 60, 1, Swap_Colour(RED), BLACK, i);
LDRSH	R0, [SP, #4]
STRH	R0, [SP, #24]
MOVS	R0, #0
STRH	R0, [SP, #20]
MOVW	R0, #63488
BL	_Swap_Colour+0
LDRSH	R2, [SP, #24]
LDRH	R1, [SP, #20]
PUSH	(R2)
PUSH	(R1)
UXTH	R3, R0
MOVS	R2, #1
MOVS	R1, #60
MOVS	R0, #60
BL	_print_I+0
ADD	SP, SP, #8
;ST7735s_demo.c,48 :: 		f += 0.01;
LDR	R2, [SP, #0]
MOVW	R0, #55050
MOVT	R0, #15395
BL	__Add_FP+0
STR	R0, [SP, #0]
;ST7735s_demo.c,49 :: 		c -= 1;
LDRSB	R0, [SP, #6]
SUBS	R1, R0, #1
STRB	R1, [SP, #6]
;ST7735s_demo.c,50 :: 		i += 1;
LDRSH	R0, [SP, #4]
ADDS	R0, R0, #1
STRH	R0, [SP, #4]
;ST7735s_demo.c,51 :: 		if(c < -128)
SXTB	R1, R1
MVN	R0, #127
CMP	R1, R0
IT	GE
BGE	L_main212
;ST7735s_demo.c,53 :: 		c = 127;
MOVS	R0, #127
SXTB	R0, R0
STRB	R0, [SP, #6]
;ST7735s_demo.c,54 :: 		}
L_main212:
;ST7735s_demo.c,55 :: 		delay_ms(60);
MOVW	R7, #64639
MOVT	R7, #10
NOP
NOP
L_main213:
SUBS	R7, R7, #1
BNE	L_main213
NOP
NOP
NOP
;ST7735s_demo.c,56 :: 		};
IT	AL
BAL	L_main210
;ST7735s_demo.c,57 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
