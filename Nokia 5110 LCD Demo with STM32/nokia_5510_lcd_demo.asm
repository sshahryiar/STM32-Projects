_setup_LCD_GPIOs:
;pcd8544.c,4 :: 		void setup_LCD_GPIOs()
;pcd8544.c,6 :: 		enable_GPIOB(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;pcd8544.c,8 :: 		setup_GPIOB(BL_pin, (output_mode_high_speed | GPIO_PP_output));
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
L_setup_LCD_GPIOs9:
;pcd8544.c,9 :: 		setup_GPIOB(CE_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #50331648
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_setup_LCD_GPIOs22:
;pcd8544.c,10 :: 		setup_GPIOB(RST_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_setup_LCD_GPIOs35:
;pcd8544.c,11 :: 		setup_GPIOB(DC_pin, (output_mode_high_speed | GPIO_PP_output));
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #805306368
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
L_setup_LCD_GPIOs48:
;pcd8544.c,12 :: 		setup_GPIOB(SDO_pin, (output_mode_high_speed | GPIO_PP_output));
L_setup_LCD_GPIOs55:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;pcd8544.c,13 :: 		setup_GPIOB(SCK_pin, (output_mode_high_speed | GPIO_PP_output));
L_setup_LCD_GPIOs66:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;pcd8544.c,15 :: 		GPIOB_pin_high(BL_pin);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;pcd8544.c,16 :: 		GPIOB_pin_high(CE_pin);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;pcd8544.c,17 :: 		GPIOB_pin_high(DC_pin);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;pcd8544.c,18 :: 		GPIOB_pin_low(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;pcd8544.c,19 :: 		GPIOB_pin_low(SDO_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;pcd8544.c,20 :: 		GPIOB_pin_low(SCK_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;pcd8544.c,22 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_setup_LCD_GPIOs74:
SUBS	R7, R7, #1
BNE	L_setup_LCD_GPIOs74
NOP
NOP
NOP
;pcd8544.c,23 :: 		}
L_end_setup_LCD_GPIOs:
BX	LR
; end of _setup_LCD_GPIOs
_PCD8544_write:
;pcd8544.c,26 :: 		void PCD8544_write(unsigned char type, unsigned char value)
; value start address is: 4 (R1)
; type start address is: 0 (R0)
UXTB	R2, R0
; value end address is: 4 (R1)
; type end address is: 0 (R0)
; type start address is: 8 (R2)
; value start address is: 4 (R1)
;pcd8544.c,28 :: 		unsigned char s = 0x08;
; s start address is: 0 (R0)
MOVS	R0, #8
;pcd8544.c,30 :: 		if(type != 0)
CMP	R2, #0
IT	EQ
BEQ	L_PCD8544_write76
; type end address is: 8 (R2)
;pcd8544.c,32 :: 		GPIOB_pin_high(DC_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #128
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;pcd8544.c,33 :: 		}
IT	AL
BAL	L_PCD8544_write77
L_PCD8544_write76:
;pcd8544.c,36 :: 		GPIOB_pin_low(DC_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #128
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;pcd8544.c,37 :: 		}
L_PCD8544_write77:
;pcd8544.c,39 :: 		GPIOB_pin_low(CE_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #64
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
; value end address is: 4 (R1)
; s end address is: 0 (R0)
;pcd8544.c,41 :: 		while(s > 0)
L_PCD8544_write78:
; s start address is: 0 (R0)
; value start address is: 4 (R1)
CMP	R0, #0
IT	LS
BLS	L_PCD8544_write79
;pcd8544.c,43 :: 		GPIOB_pin_low(SCK_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #512
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;pcd8544.c,45 :: 		if((value & 0x80) == 0)
AND	R2, R1, #128
UXTB	R2, R2
CMP	R2, #0
IT	NE
BNE	L_PCD8544_write80
;pcd8544.c,47 :: 		GPIOB_pin_low(SDO_pin);
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #256
MOVW	R2, #lo_addr(GPIOB_BRR+0)
MOVT	R2, #hi_addr(GPIOB_BRR+0)
STR	R3, [R2, #0]
;pcd8544.c,48 :: 		}
IT	AL
BAL	L_PCD8544_write81
L_PCD8544_write80:
;pcd8544.c,51 :: 		GPIOB_pin_high(SDO_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #256
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;pcd8544.c,52 :: 		}
L_PCD8544_write81:
;pcd8544.c,54 :: 		value <<= 1;
LSLS	R2, R1, #1
UXTB	R1, R2
;pcd8544.c,55 :: 		GPIOB_pin_high(SCK_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #512
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;pcd8544.c,56 :: 		s--;
SUBS	R0, R0, #1
UXTB	R0, R0
;pcd8544.c,57 :: 		};
; value end address is: 4 (R1)
; s end address is: 0 (R0)
IT	AL
BAL	L_PCD8544_write78
L_PCD8544_write79:
;pcd8544.c,59 :: 		GPIOB_pin_high(CE_pin);
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #64
MOVW	R2, #lo_addr(GPIOB_BSRR+0)
MOVT	R2, #hi_addr(GPIOB_BSRR+0)
STR	R3, [R2, #0]
;pcd8544.c,60 :: 		}
L_end_PCD8544_write:
BX	LR
; end of _PCD8544_write
_PCD8544_reset:
;pcd8544.c,63 :: 		void PCD8544_reset()
;pcd8544.c,65 :: 		GPIOB_pin_low(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOB_BRR+0)
MOVT	R0, #hi_addr(GPIOB_BRR+0)
STR	R1, [R0, #0]
;pcd8544.c,66 :: 		delay_us(100);
MOVW	R7, #1199
MOVT	R7, #0
NOP
NOP
L_PCD8544_reset82:
SUBS	R7, R7, #1
BNE	L_PCD8544_reset82
NOP
NOP
NOP
;pcd8544.c,67 :: 		GPIOB_pin_high(RST_pin);
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOB_BSRR+0)
MOVT	R0, #hi_addr(GPIOB_BSRR+0)
STR	R1, [R0, #0]
;pcd8544.c,68 :: 		}
L_end_PCD8544_reset:
BX	LR
; end of _PCD8544_reset
_PCD8544_init:
;pcd8544.c,71 :: 		void PCD8544_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;pcd8544.c,73 :: 		setup_LCD_GPIOs();
BL	_setup_LCD_GPIOs+0
;pcd8544.c,74 :: 		PCD8544_reset();
BL	_PCD8544_reset+0
;pcd8544.c,75 :: 		PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
MOVS	R1, #33
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,76 :: 		PCD8544_write(CMD, (PCD8544_set_bias | 0x02));
MOVS	R1, #18
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,77 :: 		PCD8544_set_contrast(0x39);
MOVS	R0, #57
BL	_PCD8544_set_contrast+0
;pcd8544.c,78 :: 		PCD8544_write(CMD, PCD8544_set_temp);
MOVS	R1, #4
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,79 :: 		PCD8544_write(CMD, (PCD8544_display_normal | PCD8544_display_control));
MOVS	R1, #12
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,80 :: 		PCD8544_write(CMD, PCD8544_function_set);
MOVS	R1, #32
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,81 :: 		PCD8544_write(CMD, PCD8544_display_all_on);
MOVS	R1, #1
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,82 :: 		PCD8544_write(CMD, PCD8544_display_normal);
MOVS	R1, #4
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,83 :: 		PCD8544_clear_buffer(OFF);
MOVS	R0, #0
BL	_PCD8544_clear_buffer+0
;pcd8544.c,84 :: 		}
L_end_PCD8544_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_init
_PCD8544_backlight_state:
;pcd8544.c,87 :: 		void PCD8544_backlight_state(unsigned char value)
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;pcd8544.c,89 :: 		if(value != 0)
CMP	R0, #0
IT	EQ
BEQ	L_PCD8544_backlight_state84
; value end address is: 0 (R0)
;pcd8544.c,91 :: 		GPIOB_pin_low(BL_pin);
MOVW	R1, #lo_addr(GPIOB_BRR+0)
MOVT	R1, #hi_addr(GPIOB_BRR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(GPIOB_BRR+0)
MOVT	R1, #hi_addr(GPIOB_BRR+0)
STR	R2, [R1, #0]
;pcd8544.c,92 :: 		}
IT	AL
BAL	L_PCD8544_backlight_state85
L_PCD8544_backlight_state84:
;pcd8544.c,95 :: 		GPIOB_pin_high(BL_pin);
MOVW	R1, #lo_addr(GPIOB_BSRR+0)
MOVT	R1, #hi_addr(GPIOB_BSRR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(GPIOB_BSRR+0)
MOVT	R1, #hi_addr(GPIOB_BSRR+0)
STR	R2, [R1, #0]
;pcd8544.c,96 :: 		}
L_PCD8544_backlight_state85:
;pcd8544.c,97 :: 		}
L_end_PCD8544_backlight_state:
BX	LR
; end of _PCD8544_backlight_state
_PCD8544_set_contrast:
;pcd8544.c,100 :: 		void PCD8544_set_contrast(unsigned char value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;pcd8544.c,102 :: 		if(value >= 0x7F)
CMP	R0, #127
IT	CC
BCC	L__PCD8544_set_contrast246
; value end address is: 0 (R0)
;pcd8544.c,104 :: 		value = 0x7F;
; value start address is: 16 (R4)
MOVS	R4, #127
; value end address is: 16 (R4)
;pcd8544.c,105 :: 		}
IT	AL
BAL	L_PCD8544_set_contrast86
L__PCD8544_set_contrast246:
;pcd8544.c,102 :: 		if(value >= 0x7F)
UXTB	R4, R0
;pcd8544.c,105 :: 		}
L_PCD8544_set_contrast86:
;pcd8544.c,107 :: 		PCD8544_write(CMD, (PCD8544_extended_instruction | PCD8544_function_set));
; value start address is: 16 (R4)
MOVS	R1, #33
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,108 :: 		PCD8544_write(CMD, (PCD8544_set_VOP | value));
ORR	R1, R4, #128
; value end address is: 16 (R4)
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,109 :: 		PCD8544_write(CMD, PCD8544_function_set);
MOVS	R1, #32
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,110 :: 		}
L_end_PCD8544_set_contrast:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_set_contrast
_PCD8544_set_cursor:
;pcd8544.c,113 :: 		void PCD8544_set_cursor(unsigned char x_pos, unsigned char y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R1
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 16 (R4)
;pcd8544.c,115 :: 		PCD8544_write(CMD, (PCD8544_set_X_addr | x_pos));
ORR	R2, R0, #128
; x_pos end address is: 0 (R0)
UXTB	R1, R2
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,116 :: 		PCD8544_write(CMD, (PCD8544_set_Y_addr | y_pos));
ORR	R2, R4, #64
; y_pos end address is: 16 (R4)
UXTB	R1, R2
MOVS	R0, #0
BL	_PCD8544_write+0
;pcd8544.c,117 :: 		}
L_end_PCD8544_set_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_set_cursor
_PCD8544_print_char:
;pcd8544.c,120 :: 		void PCD8544_print_char(unsigned char ch, unsigned char colour)
; colour start address is: 4 (R1)
; ch start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; colour end address is: 4 (R1)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
; colour start address is: 4 (R1)
;pcd8544.c,122 :: 		unsigned char s = 0;
;pcd8544.c,123 :: 		unsigned char chr = 0;
;pcd8544.c,125 :: 		for(s = 0; s <= 4; s++)
; s start address is: 24 (R6)
MOVS	R6, #0
; ch end address is: 0 (R0)
; colour end address is: 4 (R1)
; s end address is: 24 (R6)
UXTB	R5, R0
UXTB	R4, R1
L_PCD8544_print_char87:
; s start address is: 24 (R6)
; ch start address is: 20 (R5)
; colour start address is: 16 (R4)
; colour start address is: 16 (R4)
; colour end address is: 16 (R4)
; ch start address is: 20 (R5)
; ch end address is: 20 (R5)
CMP	R6, #4
IT	HI
BHI	L_PCD8544_print_char88
; colour end address is: 16 (R4)
; ch end address is: 20 (R5)
;pcd8544.c,127 :: 		chr = font[(ch - 0x20)][s];
; ch start address is: 20 (R5)
; colour start address is: 16 (R4)
SUBW	R3, R5, #32
SXTH	R3, R3
MOVS	R2, #5
MULS	R3, R2, R3
MOVW	R2, #lo_addr(nokia_5510_lcd_demo_font+0)
MOVT	R2, #hi_addr(nokia_5510_lcd_demo_font+0)
ADDS	R2, R2, R3
ADDS	R2, R2, R6
LDRB	R0, [R2, #0]
; chr start address is: 0 (R0)
;pcd8544.c,128 :: 		if(colour == BLACK)
CMP	R4, #0
IT	NE
BNE	L__PCD8544_print_char247
;pcd8544.c,130 :: 		chr = ~chr;
MVN	R0, R0
UXTB	R0, R0
; chr end address is: 0 (R0)
;pcd8544.c,131 :: 		}
IT	AL
BAL	L_PCD8544_print_char90
L__PCD8544_print_char247:
;pcd8544.c,128 :: 		if(colour == BLACK)
;pcd8544.c,131 :: 		}
L_PCD8544_print_char90:
;pcd8544.c,132 :: 		PCD8544_write(DAT, chr);
; chr start address is: 0 (R0)
UXTB	R1, R0
; chr end address is: 0 (R0)
MOVS	R0, #1
BL	_PCD8544_write+0
;pcd8544.c,125 :: 		for(s = 0; s <= 4; s++)
ADDS	R6, R6, #1
UXTB	R6, R6
;pcd8544.c,133 :: 		}
; colour end address is: 16 (R4)
; ch end address is: 20 (R5)
; s end address is: 24 (R6)
IT	AL
BAL	L_PCD8544_print_char87
L_PCD8544_print_char88:
;pcd8544.c,134 :: 		}
L_end_PCD8544_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_print_char
_PCD8544_print_custom_char:
;pcd8544.c,137 :: 		void PCD8544_print_custom_char(unsigned char *map)
; map start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; map end address is: 0 (R0)
; map start address is: 0 (R0)
;pcd8544.c,139 :: 		unsigned char s = 0;
;pcd8544.c,141 :: 		for(s = 0; s <= 4; s++)
; s start address is: 16 (R4)
MOVS	R4, #0
; map end address is: 0 (R0)
; s end address is: 16 (R4)
MOV	R5, R0
L_PCD8544_print_custom_char91:
; s start address is: 16 (R4)
; map start address is: 20 (R5)
CMP	R4, #4
IT	HI
BHI	L_PCD8544_print_custom_char92
;pcd8544.c,143 :: 		PCD8544_write(DAT, *map++);
LDRB	R1, [R5, #0]
MOVS	R0, #1
BL	_PCD8544_write+0
ADDS	R5, R5, #1
;pcd8544.c,141 :: 		for(s = 0; s <= 4; s++)
ADDS	R4, R4, #1
UXTB	R4, R4
;pcd8544.c,144 :: 		}
; map end address is: 20 (R5)
; s end address is: 16 (R4)
IT	AL
BAL	L_PCD8544_print_custom_char91
L_PCD8544_print_custom_char92:
;pcd8544.c,145 :: 		}
L_end_PCD8544_print_custom_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_print_custom_char
_PCD8544_fill:
;pcd8544.c,148 :: 		void PCD8544_fill(unsigned char bufr)
; bufr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; bufr end address is: 0 (R0)
; bufr start address is: 20 (R5)
;pcd8544.c,150 :: 		unsigned int s = 0;
;pcd8544.c,152 :: 		PCD8544_set_cursor(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_PCD8544_set_cursor+0
;pcd8544.c,154 :: 		for(s = 0; s < buffer_size; s++)
; s start address is: 0 (R0)
MOVS	R0, #0
; bufr end address is: 20 (R5)
; s end address is: 0 (R0)
UXTB	R4, R5
UXTH	R5, R0
L_PCD8544_fill94:
; s start address is: 20 (R5)
; bufr start address is: 16 (R4)
; bufr start address is: 16 (R4)
; bufr end address is: 16 (R4)
CMP	R5, #504
IT	CS
BCS	L_PCD8544_fill95
; bufr end address is: 16 (R4)
;pcd8544.c,156 :: 		PCD8544_write(DAT, bufr);
; bufr start address is: 16 (R4)
UXTB	R1, R4
MOVS	R0, #1
BL	_PCD8544_write+0
;pcd8544.c,154 :: 		for(s = 0; s < buffer_size; s++)
ADDS	R5, R5, #1
UXTH	R5, R5
;pcd8544.c,157 :: 		}
; bufr end address is: 16 (R4)
; s end address is: 20 (R5)
IT	AL
BAL	L_PCD8544_fill94
L_PCD8544_fill95:
;pcd8544.c,158 :: 		}
L_end_PCD8544_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_fill
_PCD8544_clear_buffer:
;pcd8544.c,161 :: 		void PCD8544_clear_buffer(unsigned char colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;pcd8544.c,163 :: 		unsigned char x_pos = 0;
; x_pos start address is: 12 (R3)
MOVS	R3, #0
;pcd8544.c,164 :: 		unsigned char y_pos = 0;
; y_pos start address is: 16 (R4)
MOVS	R4, #0
; colour end address is: 0 (R0)
; y_pos end address is: 16 (R4)
; x_pos end address is: 12 (R3)
;pcd8544.c,166 :: 		for(x_pos; x_pos < X_max; x_pos++)
L_PCD8544_clear_buffer97:
; y_pos start address is: 16 (R4)
; x_pos start address is: 12 (R3)
; colour start address is: 0 (R0)
CMP	R3, #84
IT	CS
BCS	L_PCD8544_clear_buffer98
; colour end address is: 0 (R0)
; y_pos end address is: 16 (R4)
; x_pos end address is: 12 (R3)
;pcd8544.c,168 :: 		for(y_pos; y_pos < Rows; y_pos++)
L_PCD8544_clear_buffer100:
; colour start address is: 0 (R0)
; x_pos start address is: 12 (R3)
; y_pos start address is: 16 (R4)
CMP	R4, #6
IT	CS
BCS	L_PCD8544_clear_buffer101
;pcd8544.c,170 :: 		PCD8544_buffer[x_pos][y_pos] = colour;
MOVS	R1, #6
MUL	R2, R1, R3
MOVW	R1, #lo_addr(_PCD8544_buffer+0)
MOVT	R1, #hi_addr(_PCD8544_buffer+0)
ADDS	R1, R1, R2
ADDS	R1, R1, R4
STRB	R0, [R1, #0]
;pcd8544.c,168 :: 		for(y_pos; y_pos < Rows; y_pos++)
ADDS	R4, R4, #1
UXTB	R4, R4
;pcd8544.c,171 :: 		}
IT	AL
BAL	L_PCD8544_clear_buffer100
L_PCD8544_clear_buffer101:
;pcd8544.c,166 :: 		for(x_pos; x_pos < X_max; x_pos++)
ADDS	R3, R3, #1
UXTB	R3, R3
;pcd8544.c,172 :: 		}
; colour end address is: 0 (R0)
; y_pos end address is: 16 (R4)
; x_pos end address is: 12 (R3)
IT	AL
BAL	L_PCD8544_clear_buffer97
L_PCD8544_clear_buffer98:
;pcd8544.c,173 :: 		}
L_end_PCD8544_clear_buffer:
BX	LR
; end of _PCD8544_clear_buffer
_PCD8544_clear_screen:
;pcd8544.c,176 :: 		void PCD8544_clear_screen(unsigned char colour)
; colour start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;pcd8544.c,178 :: 		unsigned char x_pos = 0;
;pcd8544.c,179 :: 		unsigned char y_pos = 0;
;pcd8544.c,181 :: 		for(y_pos = 0; y_pos < Rows; y_pos++)
; y_pos start address is: 40 (R10)
MOVW	R10, #0
; colour end address is: 0 (R0)
; y_pos end address is: 40 (R10)
UXTB	R9, R0
L_PCD8544_clear_screen103:
; y_pos start address is: 40 (R10)
; colour start address is: 36 (R9)
CMP	R10, #6
IT	CS
BCS	L_PCD8544_clear_screen104
;pcd8544.c,183 :: 		for(x_pos = 0; x_pos < X_max; x_pos++)
; x_pos start address is: 44 (R11)
MOVW	R11, #0
; colour end address is: 36 (R9)
; x_pos end address is: 44 (R11)
; y_pos end address is: 40 (R10)
L_PCD8544_clear_screen106:
; x_pos start address is: 44 (R11)
; colour start address is: 36 (R9)
; y_pos start address is: 40 (R10)
CMP	R11, #84
IT	CS
BCS	L_PCD8544_clear_screen107
;pcd8544.c,185 :: 		PCD8544_print_string(x_pos, y_pos, " ", colour);
MOVW	R1, #lo_addr(?lstr1_nokia_5510_lcd_demo+0)
MOVT	R1, #hi_addr(?lstr1_nokia_5510_lcd_demo+0)
UXTB	R3, R9
MOV	R2, R1
UXTB	R1, R10
UXTB	R0, R11
BL	_PCD8544_print_string+0
;pcd8544.c,183 :: 		for(x_pos = 0; x_pos < X_max; x_pos++)
ADD	R11, R11, #1
UXTB	R11, R11
;pcd8544.c,186 :: 		}
; x_pos end address is: 44 (R11)
IT	AL
BAL	L_PCD8544_clear_screen106
L_PCD8544_clear_screen107:
;pcd8544.c,181 :: 		for(y_pos = 0; y_pos < Rows; y_pos++)
ADD	R10, R10, #1
UXTB	R10, R10
;pcd8544.c,187 :: 		}
; colour end address is: 36 (R9)
; y_pos end address is: 40 (R10)
IT	AL
BAL	L_PCD8544_clear_screen103
L_PCD8544_clear_screen104:
;pcd8544.c,188 :: 		}
L_end_PCD8544_clear_screen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_clear_screen
_PCD8544_print_image:
;pcd8544.c,191 :: 		void PCD8544_print_image(const unsigned char *bmp)
; bmp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; bmp end address is: 0 (R0)
; bmp start address is: 20 (R5)
;pcd8544.c,193 :: 		unsigned int s = 0;
;pcd8544.c,195 :: 		PCD8544_set_cursor(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_PCD8544_set_cursor+0
;pcd8544.c,197 :: 		for(s = 0; s < buffer_size; s++)
; s start address is: 0 (R0)
MOVS	R0, #0
; bmp end address is: 20 (R5)
; s end address is: 0 (R0)
MOV	R4, R5
UXTH	R5, R0
L_PCD8544_print_image109:
; s start address is: 20 (R5)
; bmp start address is: 16 (R4)
; bmp start address is: 16 (R4)
; bmp end address is: 16 (R4)
CMP	R5, #504
IT	CS
BCS	L_PCD8544_print_image110
; bmp end address is: 16 (R4)
;pcd8544.c,199 :: 		PCD8544_Write(DAT, bmp[s]);
; bmp start address is: 16 (R4)
ADDS	R1, R4, R5
LDRB	R1, [R1, #0]
MOVS	R0, #1
BL	_PCD8544_write+0
;pcd8544.c,197 :: 		for(s = 0; s < buffer_size; s++)
ADDS	R5, R5, #1
UXTH	R5, R5
;pcd8544.c,200 :: 		}
; bmp end address is: 16 (R4)
; s end address is: 20 (R5)
IT	AL
BAL	L_PCD8544_print_image109
L_PCD8544_print_image110:
;pcd8544.c,201 :: 		}
L_end_PCD8544_print_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCD8544_print_image
_PCD8544_print_string:
;pcd8544.c,204 :: 		void PCD8544_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour)
; ch start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R3, [SP, #8]
; ch end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; ch start address is: 8 (R2)
;pcd8544.c,206 :: 		PCD8544_set_cursor(x_pos, y_pos);
STR	R2, [SP, #4]
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_PCD8544_set_cursor+0
; ch end address is: 8 (R2)
LDR	R2, [SP, #4]
MOV	R7, R2
;pcd8544.c,208 :: 		do
L_PCD8544_print_string112:
;pcd8544.c,210 :: 		PCD8544_print_char(*ch++, colour);
; ch start address is: 32 (R8)
; ch start address is: 28 (R7)
LDRB	R4, [R7, #0]
LDRB	R1, [SP, #8]
UXTB	R0, R4
BL	_PCD8544_print_char+0
ADDS	R4, R7, #1
; ch end address is: 28 (R7)
; ch start address is: 32 (R8)
MOV	R8, R4
; ch end address is: 32 (R8)
;pcd8544.c,211 :: 		}while((*ch >= 0x20) && (*ch <= 0x7F));
LDRB	R4, [R4, #0]
CMP	R4, #32
IT	CC
BCC	L__PCD8544_print_string250
; ch end address is: 32 (R8)
; ch start address is: 32 (R8)
LDRB	R4, [R8, #0]
CMP	R4, #127
IT	HI
BHI	L__PCD8544_print_string249
MOV	R7, R8
; ch end address is: 32 (R8)
IT	AL
BAL	L_PCD8544_print_string112
L__PCD8544_print_string250:
L__PCD8544_print_string249:
;pcd8544.c,212 :: 		}
L_end_PCD8544_print_string:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _PCD8544_print_string
_print_chr:
;pcd8544.c,215 :: 		void print_chr(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char colour)
; colour start address is: 12 (R3)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
SXTH	R10, R2
UXTB	R9, R3
; colour end address is: 12 (R3)
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
;pcd8544.c,217 :: 		unsigned char ch = 0x00;
;pcd8544.c,219 :: 		if(value < 0)
CMP	R10, #0
IT	GE
BGE	L_print_chr117
;pcd8544.c,221 :: 		PCD8544_set_cursor(x_pos, y_pos);
UXTB	R1, R8
UXTB	R0, R7
BL	_PCD8544_set_cursor+0
;pcd8544.c,222 :: 		PCD8544_print_char(0x2D, colour);
UXTB	R1, R9
MOVS	R0, #45
BL	_PCD8544_print_char+0
;pcd8544.c,223 :: 		value = -value;
RSB	R10, R10, #0
SXTH	R10, R10
;pcd8544.c,224 :: 		}
IT	AL
BAL	L_print_chr118
L_print_chr117:
;pcd8544.c,227 :: 		PCD8544_set_cursor(x_pos, y_pos);
UXTB	R1, R8
UXTB	R0, R7
BL	_PCD8544_set_cursor+0
;pcd8544.c,228 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
; value end address is: 40 (R10)
;pcd8544.c,229 :: 		}
L_print_chr118:
;pcd8544.c,231 :: 		if((value > 99) && (value <= 999))
; value start address is: 40 (R10)
CMP	R10, #99
IT	LE
BLE	L__print_chr255
MOVW	R4, #999
CMP	R10, R4
IT	GT
BGT	L__print_chr254
L__print_chr253:
;pcd8544.c,233 :: 		ch = (value / 100);
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R10, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,234 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,235 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,237 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SXTH	R4, R4
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
SXTH	R5, R5
MOVS	R4, #10
SXTH	R4, R4
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,238 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,239 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,241 :: 		ch = (value % 10);
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,242 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,243 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
; colour end address is: 36 (R9)
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,244 :: 		}
IT	AL
BAL	L_print_chr122
;pcd8544.c,231 :: 		if((value > 99) && (value <= 999))
L__print_chr255:
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__print_chr254:
;pcd8544.c,245 :: 		else if((value > 9) && (value <= 99))
CMP	R10, #9
IT	LE
BLE	L__print_chr257
CMP	R10, #99
IT	GT
BGT	L__print_chr256
L__print_chr252:
;pcd8544.c,247 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SXTH	R4, R4
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
SXTH	R5, R5
MOVS	R4, #10
SXTH	R4, R4
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,248 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,249 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,251 :: 		ch = (value % 10);
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,252 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,253 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,255 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,256 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,257 :: 		}
IT	AL
BAL	L_print_chr126
;pcd8544.c,245 :: 		else if((value > 9) && (value <= 99))
L__print_chr257:
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__print_chr256:
;pcd8544.c,258 :: 		else if((value >= 0) && (value <= 9))
CMP	R10, #0
IT	LT
BLT	L__print_chr259
CMP	R10, #9
IT	GT
BGT	L__print_chr258
L__print_chr251:
;pcd8544.c,260 :: 		ch = (value % 10);
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,261 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,262 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,264 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,265 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,267 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,268 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,258 :: 		else if((value >= 0) && (value <= 9))
L__print_chr259:
L__print_chr258:
;pcd8544.c,269 :: 		}
L_print_chr126:
L_print_chr122:
;pcd8544.c,270 :: 		}
L_end_print_chr:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_chr
_print_int:
;pcd8544.c,273 :: 		void print_int(unsigned char x_pos, unsigned char y_pos, signed long value, unsigned char colour)
; colour start address is: 12 (R3)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
MOV	R10, R2
UXTB	R9, R3
; colour end address is: 12 (R3)
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
;pcd8544.c,275 :: 		unsigned char ch = 0x00;
;pcd8544.c,277 :: 		if(value < 0)
CMP	R10, #0
IT	GE
BGE	L_print_int130
;pcd8544.c,279 :: 		PCD8544_set_cursor(x_pos, y_pos);
UXTB	R1, R8
UXTB	R0, R7
BL	_PCD8544_set_cursor+0
;pcd8544.c,280 :: 		PCD8544_print_char(0x2D, colour);
UXTB	R1, R9
MOVS	R0, #45
BL	_PCD8544_print_char+0
;pcd8544.c,281 :: 		value = -value;
RSB	R10, R10, #0
;pcd8544.c,282 :: 		}
IT	AL
BAL	L_print_int131
L_print_int130:
;pcd8544.c,285 :: 		PCD8544_set_cursor(x_pos, y_pos);
UXTB	R1, R8
UXTB	R0, R7
BL	_PCD8544_set_cursor+0
;pcd8544.c,286 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
; value end address is: 40 (R10)
;pcd8544.c,287 :: 		}
L_print_int131:
;pcd8544.c,289 :: 		if(value > 9999)
; value start address is: 40 (R10)
MOVW	R4, #9999
CMP	R10, R4
IT	LE
BLE	L_print_int132
;pcd8544.c,291 :: 		ch = (value / 10000);
MOVW	R4, #10000
SDIV	R4, R10, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,292 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,293 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,295 :: 		ch = ((value % 10000)/ 1000);
MOVW	R4, #10000
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVW	R4, #1000
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,296 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,297 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,299 :: 		ch = ((value % 1000) / 100);
MOVW	R4, #1000
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #100
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,300 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,301 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,303 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #10
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,304 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,305 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,307 :: 		ch = (value % 10);
MOVS	R5, #10
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,308 :: 		PCD8544_set_cursor((x_pos + 30), y_pos);
ADDW	R4, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,309 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
; colour end address is: 36 (R9)
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,310 :: 		}
IT	AL
BAL	L_print_int133
L_print_int132:
;pcd8544.c,312 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
MOVW	R4, #999
CMP	R10, R4
IT	LE
BLE	L__print_int264
MOVW	R4, #9999
CMP	R10, R4
IT	GT
BGT	L__print_int263
L__print_int262:
;pcd8544.c,314 :: 		ch = ((value % 10000)/ 1000);
MOVW	R4, #10000
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVW	R4, #1000
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,315 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,316 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,318 :: 		ch = ((value % 1000) / 100);
MOVW	R4, #1000
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #100
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,319 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,320 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,322 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #10
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,323 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,324 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,326 :: 		ch = (value % 10);
MOVS	R5, #10
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,327 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,328 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,330 :: 		PCD8544_set_cursor((x_pos + 30), y_pos);
ADDW	R4, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,331 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,332 :: 		}
IT	AL
BAL	L_print_int137
;pcd8544.c,312 :: 		else if((value > 999) && (value <= 9999))
L__print_int264:
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__print_int263:
;pcd8544.c,333 :: 		else if((value > 99) && (value <= 999))
CMP	R10, #99
IT	LE
BLE	L__print_int266
MOVW	R4, #999
CMP	R10, R4
IT	GT
BGT	L__print_int265
L__print_int261:
;pcd8544.c,335 :: 		ch = ((value % 1000) / 100);
MOVW	R4, #1000
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #100
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,336 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,337 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,339 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #10
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,340 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,341 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,343 :: 		ch = (value % 10);
MOVS	R5, #10
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,344 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,345 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,347 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,348 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,350 :: 		PCD8544_set_cursor((x_pos + 30), y_pos);
ADDW	R4, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,351 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,352 :: 		}
IT	AL
BAL	L_print_int141
;pcd8544.c,333 :: 		else if((value > 99) && (value <= 999))
L__print_int266:
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__print_int265:
;pcd8544.c,353 :: 		else if((value > 9) && (value <= 99))
CMP	R10, #9
IT	LE
BLE	L__print_int268
CMP	R10, #99
IT	GT
BGT	L__print_int267
L__print_int260:
;pcd8544.c,355 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
SDIV	R5, R10, R4
MLS	R5, R4, R5, R10
MOVS	R4, #10
SDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,356 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,357 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,359 :: 		ch = (value % 10);
MOVS	R5, #10
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,360 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,361 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,363 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,364 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,366 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,367 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,369 :: 		PCD8544_set_cursor((x_pos + 30), y_pos);
ADDW	R4, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,370 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,371 :: 		}
IT	AL
BAL	L_print_int145
;pcd8544.c,353 :: 		else if((value > 9) && (value <= 99))
L__print_int268:
; value start address is: 40 (R10)
; colour start address is: 36 (R9)
; y_pos start address is: 32 (R8)
; x_pos start address is: 28 (R7)
L__print_int267:
;pcd8544.c,374 :: 		ch = (value % 10);
MOVS	R5, #10
SDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,375 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,376 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,378 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,379 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,381 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,382 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,384 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,385 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,387 :: 		PCD8544_set_cursor((x_pos + 30), y_pos);
ADDW	R4, R7, #30
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,388 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R9
; colour end address is: 36 (R9)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,389 :: 		}
L_print_int145:
L_print_int141:
L_print_int137:
L_print_int133:
;pcd8544.c,390 :: 		}
L_end_print_int:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_int
_print_decimal:
;pcd8544.c,393 :: 		void print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points, unsigned char colour)
; points start address is: 12 (R3)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
UXTH	R10, R2
UXTB	R11, R3
; points end address is: 12 (R3)
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 28 (R7)
; y_pos start address is: 32 (R8)
; value start address is: 40 (R10)
; points start address is: 44 (R11)
; colour start address is: 36 (R9)
LDRB	R9, [SP, #4]
;pcd8544.c,395 :: 		unsigned char ch = 0x00;
;pcd8544.c,397 :: 		PCD8544_set_cursor(x_pos, y_pos);
UXTB	R1, R8
UXTB	R0, R7
BL	_PCD8544_set_cursor+0
;pcd8544.c,398 :: 		PCD8544_print_char(0x2E, colour);
UXTB	R1, R9
MOVS	R0, #46
BL	_PCD8544_print_char+0
;pcd8544.c,400 :: 		ch = (value / 1000);
MOVW	R4, #1000
UDIV	R4, R10, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,401 :: 		PCD8544_set_cursor((x_pos + 6), y_pos);
ADDS	R4, R7, #6
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,402 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,404 :: 		if(points > 1)
CMP	R11, #1
IT	LS
BLS	L_print_decimal146
;pcd8544.c,406 :: 		ch = ((value % 1000) / 100);
MOVW	R4, #1000
UDIV	R5, R10, R4
MLS	R5, R4, R5, R10
UXTH	R5, R5
MOVS	R4, #100
UDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,407 :: 		PCD8544_set_cursor((x_pos + 12), y_pos);
ADDW	R4, R7, #12
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,408 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,411 :: 		if(points > 2)
CMP	R11, #2
IT	LS
BLS	L_print_decimal147
;pcd8544.c,413 :: 		ch = ((value % 100) / 10);
MOVS	R4, #100
UDIV	R5, R10, R4
MLS	R5, R4, R5, R10
UXTH	R5, R5
MOVS	R4, #10
UDIV	R4, R5, R4
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,414 :: 		PCD8544_set_cursor((x_pos + 18), y_pos);
ADDW	R4, R7, #18
UXTB	R1, R8
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,415 :: 		PCD8544_print_char((48 + ch), colour);
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,417 :: 		if(points > 3)
CMP	R11, #3
IT	LS
BLS	L_print_decimal148
; points end address is: 44 (R11)
;pcd8544.c,419 :: 		ch = (value % 10);
MOVS	R5, #10
UDIV	R4, R10, R5
MLS	R4, R5, R4, R10
; value end address is: 40 (R10)
; ch start address is: 20 (R5)
UXTB	R5, R4
;pcd8544.c,420 :: 		PCD8544_set_cursor((x_pos + 24), y_pos);
ADDW	R4, R7, #24
; x_pos end address is: 28 (R7)
UXTB	R1, R8
; y_pos end address is: 32 (R8)
UXTB	R0, R4
BL	_PCD8544_set_cursor+0
;pcd8544.c,421 :: 		PCD8544_print_char((48 + ch), colour);;
ADDW	R4, R5, #48
; ch end address is: 20 (R5)
UXTB	R1, R9
; colour end address is: 36 (R9)
UXTB	R0, R4
BL	_PCD8544_print_char+0
;pcd8544.c,422 :: 		}
L_print_decimal148:
;pcd8544.c,423 :: 		}
L_print_decimal147:
;pcd8544.c,424 :: 		}
L_print_decimal146:
;pcd8544.c,425 :: 		}
L_end_print_decimal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_decimal
_print_float:
;pcd8544.c,428 :: 		void print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points, unsigned char colour)
; value start address is: 8 (R2)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
UXTB	R12, R0
STRB	R1, [SP, #16]
MOV	R1, R2
STRB	R3, [SP, #20]
; value end address is: 8 (R2)
; x_pos end address is: 0 (R0)
; x_pos start address is: 48 (R12)
; value start address is: 4 (R1)
; colour start address is: 12 (R3)
LDRB	R3, [SP, #28]
;pcd8544.c,430 :: 		signed long tmp = 0x00;
;pcd8544.c,432 :: 		tmp = ((signed long)value);
STR	R1, [SP, #4]
MOV	R0, R1
BL	__FloatToSignedIntegral+0
LDR	R1, [SP, #4]
STR	R0, [SP, #12]
;pcd8544.c,433 :: 		print_int(x_pos, y_pos, tmp, colour);
STRB	R3, [SP, #4]
STR	R1, [SP, #8]
MOV	R2, R0
LDRB	R1, [SP, #16]
UXTB	R0, R12
BL	_print_int+0
LDR	R1, [SP, #8]
LDRB	R3, [SP, #4]
;pcd8544.c,434 :: 		tmp = ((value - tmp) * 10000);
STR	R1, [SP, #4]
LDR	R0, [SP, #12]
BL	__SignedIntegralToFloat+0
LDR	R1, [SP, #4]
STR	R0, [SP, #24]
STR	R0, [SP, #24]
LDR	R2, [SP, #24]
STRB	R3, [SP, #4]
STR	R1, [SP, #8]
MOV	R0, R1
BL	__Sub_FP+0
MOVW	R2, #16384
MOVT	R2, #17948
BL	__Mul_FP+0
LDR	R1, [SP, #8]
LDRB	R3, [SP, #4]
STR	R1, [SP, #4]
BL	__FloatToSignedIntegral+0
LDR	R1, [SP, #4]
STR	R0, [SP, #12]
;pcd8544.c,436 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BGE	L_print_float149
;pcd8544.c,438 :: 		tmp = -tmp;
LDR	R4, [SP, #12]
RSBS	R4, R4, #0
STR	R4, [SP, #12]
;pcd8544.c,439 :: 		}
L_print_float149:
;pcd8544.c,441 :: 		if((value >= 9999) && (value < 99999))
MOVW	R0, #15360
MOVT	R0, #17948
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_float307
MOVS	R0, #1
L__print_float307:
CMP	R0, #0
IT	EQ
BEQ	L__print_float274
MOVW	R0, #20352
MOVT	R0, #18371
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float308
MOVS	R0, #1
L__print_float308:
CMP	R0, #0
IT	EQ
BEQ	L__print_float273
; value end address is: 4 (R1)
L__print_float272:
;pcd8544.c,443 :: 		print_decimal((x_pos + 36), y_pos, tmp, points, colour);
UXTB	R5, R3
; colour end address is: 12 (R3)
ADD	R4, R12, #36
; x_pos end address is: 48 (R12)
LDRB	R3, [SP, #20]
LDR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R0, R4
PUSH	(R5)
BL	_print_decimal+0
ADD	SP, SP, #4
;pcd8544.c,444 :: 		}
IT	AL
BAL	L_print_float153
;pcd8544.c,441 :: 		if((value >= 9999) && (value < 99999))
L__print_float274:
; colour start address is: 12 (R3)
; value start address is: 4 (R1)
; x_pos start address is: 48 (R12)
L__print_float273:
;pcd8544.c,445 :: 		else if((value >= 999) && (value < 9999))
MOVW	R0, #49152
MOVT	R0, #17529
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_float309
MOVS	R0, #1
L__print_float309:
CMP	R0, #0
IT	EQ
BEQ	L__print_float276
MOVW	R0, #15360
MOVT	R0, #17948
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float310
MOVS	R0, #1
L__print_float310:
CMP	R0, #0
IT	EQ
BEQ	L__print_float275
; value end address is: 4 (R1)
L__print_float271:
;pcd8544.c,447 :: 		print_decimal((x_pos + 30), y_pos, tmp, points, colour);
UXTB	R5, R3
; colour end address is: 12 (R3)
ADD	R4, R12, #30
; x_pos end address is: 48 (R12)
LDRB	R3, [SP, #20]
LDR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R0, R4
PUSH	(R5)
BL	_print_decimal+0
ADD	SP, SP, #4
;pcd8544.c,448 :: 		}
IT	AL
BAL	L_print_float157
;pcd8544.c,445 :: 		else if((value >= 999) && (value < 9999))
L__print_float276:
; colour start address is: 12 (R3)
; value start address is: 4 (R1)
; x_pos start address is: 48 (R12)
L__print_float275:
;pcd8544.c,449 :: 		else if((value >= 99) && (value < 999))
MOVW	R0, #0
MOVT	R0, #17094
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_float311
MOVS	R0, #1
L__print_float311:
CMP	R0, #0
IT	EQ
BEQ	L__print_float278
MOVW	R0, #49152
MOVT	R0, #17529
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float312
MOVS	R0, #1
L__print_float312:
CMP	R0, #0
IT	EQ
BEQ	L__print_float277
; value end address is: 4 (R1)
L__print_float270:
;pcd8544.c,451 :: 		print_decimal((x_pos + 24), y_pos, tmp, points, colour);
UXTB	R5, R3
; colour end address is: 12 (R3)
ADD	R4, R12, #24
; x_pos end address is: 48 (R12)
LDRB	R3, [SP, #20]
LDR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R0, R4
PUSH	(R5)
BL	_print_decimal+0
ADD	SP, SP, #4
;pcd8544.c,452 :: 		}
IT	AL
BAL	L_print_float161
;pcd8544.c,449 :: 		else if((value >= 99) && (value < 999))
L__print_float278:
; colour start address is: 12 (R3)
; value start address is: 4 (R1)
; x_pos start address is: 48 (R12)
L__print_float277:
;pcd8544.c,453 :: 		else if((value >= 9) && (value < 99))
MOVW	R0, #0
MOVT	R0, #16656
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_float313
MOVS	R0, #1
L__print_float313:
CMP	R0, #0
IT	EQ
BEQ	L__print_float280
MOVW	R0, #0
MOVT	R0, #17094
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float314
MOVS	R0, #1
L__print_float314:
CMP	R0, #0
IT	EQ
BEQ	L__print_float279
; value end address is: 4 (R1)
L__print_float269:
;pcd8544.c,455 :: 		print_decimal((x_pos + 18), y_pos, tmp, points, colour);
UXTB	R5, R3
; colour end address is: 12 (R3)
ADD	R4, R12, #18
; x_pos end address is: 48 (R12)
LDRB	R3, [SP, #20]
LDR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R0, R4
PUSH	(R5)
BL	_print_decimal+0
ADD	SP, SP, #4
;pcd8544.c,456 :: 		}
IT	AL
BAL	L_print_float165
;pcd8544.c,453 :: 		else if((value >= 9) && (value < 99))
L__print_float280:
; colour start address is: 12 (R3)
; value start address is: 4 (R1)
; x_pos start address is: 48 (R12)
L__print_float279:
;pcd8544.c,457 :: 		else if(value < 9)
MOVW	R0, #0
MOVT	R0, #16656
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float315
MOVS	R0, #1
L__print_float315:
CMP	R0, #0
IT	EQ
BEQ	L_print_float166
;pcd8544.c,459 :: 		print_decimal((x_pos + 12), y_pos, tmp, points, colour);
UXTB	R5, R3
ADD	R4, R12, #12
STRB	R3, [SP, #4]
STR	R1, [SP, #8]
LDRB	R3, [SP, #20]
LDR	R2, [SP, #12]
LDRB	R1, [SP, #16]
UXTB	R0, R4
PUSH	(R5)
BL	_print_decimal+0
ADD	SP, SP, #4
LDR	R1, [SP, #8]
LDRB	R3, [SP, #4]
;pcd8544.c,460 :: 		if((value) < 0)
MOV	R0, #0
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_float316
MOVS	R0, #1
L__print_float316:
; value end address is: 4 (R1)
CMP	R0, #0
IT	EQ
BEQ	L_print_float167
;pcd8544.c,462 :: 		PCD8544_set_cursor(x_pos, y_pos);
STRB	R3, [SP, #4]
LDRB	R1, [SP, #16]
UXTB	R0, R12
; x_pos end address is: 48 (R12)
BL	_PCD8544_set_cursor+0
LDRB	R3, [SP, #4]
;pcd8544.c,463 :: 		PCD8544_print_char(0x2D, colour);
UXTB	R1, R3
; colour end address is: 12 (R3)
MOVS	R0, #45
BL	_PCD8544_print_char+0
;pcd8544.c,464 :: 		}
IT	AL
BAL	L_print_float168
L_print_float167:
;pcd8544.c,467 :: 		PCD8544_set_cursor(x_pos, y_pos);
; colour start address is: 12 (R3)
; x_pos start address is: 48 (R12)
STRB	R3, [SP, #4]
LDRB	R1, [SP, #16]
UXTB	R0, R12
; x_pos end address is: 48 (R12)
BL	_PCD8544_set_cursor+0
LDRB	R3, [SP, #4]
;pcd8544.c,468 :: 		PCD8544_print_char(0x20, colour);
UXTB	R1, R3
; colour end address is: 12 (R3)
MOVS	R0, #32
BL	_PCD8544_print_char+0
;pcd8544.c,469 :: 		}
L_print_float168:
;pcd8544.c,470 :: 		}
L_print_float166:
L_print_float165:
L_print_float161:
L_print_float157:
L_print_float153:
;pcd8544.c,471 :: 		}
L_end_print_float:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _print_float
_Draw_Pixel:
;pcd8544.c,474 :: 		void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R6, R2
UXTB	R2, R1
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 8 (R2)
; colour start address is: 24 (R6)
;pcd8544.c,476 :: 		unsigned char row = 0;
;pcd8544.c,477 :: 		unsigned char value = 0;
;pcd8544.c,479 :: 		if((x_pos < 0) || (x_pos >= X_max) || (y_pos < 0) || (y_pos >= Y_max))
CMP	R0, #0
IT	CC
BCC	L__Draw_Pixel285
CMP	R0, #84
IT	CS
BCS	L__Draw_Pixel284
CMP	R2, #0
IT	CC
BCC	L__Draw_Pixel283
CMP	R2, #48
IT	CS
BCS	L__Draw_Pixel282
IT	AL
BAL	L_Draw_Pixel171
; x_pos end address is: 0 (R0)
; y_pos end address is: 8 (R2)
; colour end address is: 24 (R6)
L__Draw_Pixel285:
L__Draw_Pixel284:
L__Draw_Pixel283:
L__Draw_Pixel282:
;pcd8544.c,481 :: 		return;
IT	AL
BAL	L_end_Draw_Pixel
;pcd8544.c,482 :: 		}
L_Draw_Pixel171:
;pcd8544.c,484 :: 		row = (y_pos >> 3);
; colour start address is: 24 (R6)
; y_pos start address is: 8 (R2)
; x_pos start address is: 0 (R0)
LSRS	R5, R2, #3
UXTB	R5, R5
; row start address is: 4 (R1)
UXTB	R1, R5
;pcd8544.c,486 :: 		value = PCD8544_buffer[x_pos][row];
MOVS	R3, #6
MUL	R4, R3, R0
MOVW	R3, #lo_addr(_PCD8544_buffer+0)
MOVT	R3, #hi_addr(_PCD8544_buffer+0)
ADDS	R3, R3, R4
ADDS	R3, R3, R5
LDRB	R5, [R3, #0]
; value start address is: 20 (R5)
;pcd8544.c,488 :: 		if(colour == BLACK)
CMP	R6, #0
IT	NE
BNE	L_Draw_Pixel172
; colour end address is: 24 (R6)
;pcd8544.c,490 :: 		value |= (1 << (y_pos % 8));
AND	R4, R2, #7
UXTB	R4, R4
; y_pos end address is: 8 (R2)
MOVS	R3, #1
LSLS	R3, R4
UXTH	R3, R3
ORR	R3, R5, R3, LSL #0
UXTB	R5, R3
;pcd8544.c,491 :: 		}
IT	AL
BAL	L_Draw_Pixel173
L_Draw_Pixel172:
;pcd8544.c,492 :: 		else if(colour == WHITE)
; colour start address is: 24 (R6)
; y_pos start address is: 8 (R2)
CMP	R6, #1
IT	NE
BNE	L_Draw_Pixel174
; colour end address is: 24 (R6)
;pcd8544.c,494 :: 		value &= (~(1 << (y_pos % 8)));
AND	R4, R2, #7
UXTB	R4, R4
; y_pos end address is: 8 (R2)
MOVS	R3, #1
LSLS	R3, R4
UXTH	R3, R3
MVN	R3, R3
UXTH	R3, R3
AND	R3, R5, R3, LSL #0
; value end address is: 20 (R5)
; value start address is: 8 (R2)
UXTB	R2, R3
;pcd8544.c,495 :: 		}
UXTB	R5, R2
; value end address is: 8 (R2)
IT	AL
BAL	L_Draw_Pixel175
L_Draw_Pixel174:
;pcd8544.c,496 :: 		else if(colour == PIXEL_XOR)
; value start address is: 20 (R5)
; colour start address is: 24 (R6)
; y_pos start address is: 8 (R2)
CMP	R6, #2
IT	NE
BNE	L__Draw_Pixel286
; colour end address is: 24 (R6)
;pcd8544.c,498 :: 		value ^= (1 << (y_pos % 8));
AND	R4, R2, #7
UXTB	R4, R4
; y_pos end address is: 8 (R2)
MOVS	R3, #1
LSLS	R3, R4
UXTH	R3, R3
EOR	R3, R5, R3, LSL #0
; value end address is: 20 (R5)
; value start address is: 8 (R2)
UXTB	R2, R3
; value end address is: 8 (R2)
;pcd8544.c,499 :: 		}
IT	AL
BAL	L_Draw_Pixel176
L__Draw_Pixel286:
;pcd8544.c,496 :: 		else if(colour == PIXEL_XOR)
UXTB	R2, R5
;pcd8544.c,499 :: 		}
L_Draw_Pixel176:
; value start address is: 8 (R2)
UXTB	R5, R2
; value end address is: 8 (R2)
L_Draw_Pixel175:
; value start address is: 20 (R5)
; value end address is: 20 (R5)
L_Draw_Pixel173:
;pcd8544.c,501 :: 		PCD8544_buffer[x_pos][row] = value;
; value start address is: 20 (R5)
MOVS	R3, #6
MUL	R4, R3, R0
MOVW	R3, #lo_addr(_PCD8544_buffer+0)
MOVT	R3, #hi_addr(_PCD8544_buffer+0)
ADDS	R3, R3, R4
ADDS	R3, R3, R1
STRB	R5, [R3, #0]
;pcd8544.c,503 :: 		PCD8544_set_cursor(x_pos, row);
; row end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_PCD8544_set_cursor+0
;pcd8544.c,504 :: 		PCD8544_write(DAT, value);
UXTB	R1, R5
; value end address is: 20 (R5)
MOVS	R0, #1
BL	_PCD8544_write+0
;pcd8544.c,505 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;pcd8544.c,508 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
SXTH	R7, R0
SXTH	R8, R1
SXTH	R11, R2
SXTH	R12, R3
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 28 (R7)
; y1 start address is: 32 (R8)
; x2 start address is: 44 (R11)
; y2 start address is: 48 (R12)
; colour start address is: 36 (R9)
LDRB	R9, [SP, #16]
;pcd8544.c,510 :: 		signed int dx = 0x0000;
;pcd8544.c,511 :: 		signed int dy = 0x0000;
;pcd8544.c,512 :: 		signed int stepx = 0x0000;
;pcd8544.c,513 :: 		signed int stepy = 0x0000;
;pcd8544.c,514 :: 		signed int fraction = 0x0000;
;pcd8544.c,516 :: 		dy = (y2 - y1);
SUB	R5, R12, R8, LSL #0
SXTH	R5, R5
; dy start address is: 8 (R2)
SXTH	R2, R5
;pcd8544.c,517 :: 		dx = (x2 - x1);
SUB	R0, R11, R7, LSL #0
SXTH	R0, R0
; dx start address is: 0 (R0)
;pcd8544.c,519 :: 		if (dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line177
;pcd8544.c,521 :: 		dy = -dy;
RSBS	R2, R2, #0
SXTH	R2, R2
;pcd8544.c,522 :: 		stepy = -1;
; stepy start address is: 40 (R10)
MOVW	R10, #65535
SXTH	R10, R10
;pcd8544.c,523 :: 		}
; stepy end address is: 40 (R10)
IT	AL
BAL	L_Draw_Line178
L_Draw_Line177:
;pcd8544.c,526 :: 		stepy = 1;
; stepy start address is: 40 (R10)
MOVW	R10, #1
SXTH	R10, R10
; dy end address is: 8 (R2)
; stepy end address is: 40 (R10)
;pcd8544.c,527 :: 		}
L_Draw_Line178:
;pcd8544.c,529 :: 		if (dx < 0)
; stepy start address is: 40 (R10)
; dy start address is: 8 (R2)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line179
;pcd8544.c,531 :: 		dx = -dx;
RSBS	R0, R0, #0
SXTH	R0, R0
;pcd8544.c,532 :: 		stepx = -1;
; stepx start address is: 4 (R1)
MOVW	R1, #65535
SXTH	R1, R1
;pcd8544.c,533 :: 		}
; stepx end address is: 4 (R1)
IT	AL
BAL	L_Draw_Line180
L_Draw_Line179:
;pcd8544.c,536 :: 		stepx = 1;
; stepx start address is: 4 (R1)
MOVS	R1, #1
SXTH	R1, R1
; stepx end address is: 4 (R1)
; dx end address is: 0 (R0)
;pcd8544.c,537 :: 		}
L_Draw_Line180:
;pcd8544.c,539 :: 		dx <<= 0x01;
; stepx start address is: 4 (R1)
; dx start address is: 0 (R0)
LSLS	R0, R0, #1
SXTH	R0, R0
;pcd8544.c,540 :: 		dy <<= 0x01;
LSLS	R4, R2, #1
; dy end address is: 8 (R2)
; dy start address is: 12 (R3)
SXTH	R3, R4
;pcd8544.c,542 :: 		Draw_Pixel(x1, y1, colour);
STRH	R3, [SP, #4]
STRH	R0, [SP, #6]
STRH	R1, [SP, #8]
UXTB	R2, R9
UXTB	R1, R8
UXTB	R0, R7
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #8]
LDRSH	R0, [SP, #6]
LDRSH	R3, [SP, #4]
;pcd8544.c,544 :: 		if (dx > dy)
CMP	R0, R3
IT	LE
BLE	L_Draw_Line181
; y2 end address is: 48 (R12)
;pcd8544.c,546 :: 		fraction = (dy - (dx >> 1));
ASRS	R4, R0, #1
SXTH	R4, R4
SUB	R2, R3, R4
SXTH	R2, R2
; fraction start address is: 8 (R2)
; x2 end address is: 44 (R11)
; stepx end address is: 4 (R1)
; dx end address is: 0 (R0)
; dy end address is: 12 (R3)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; fraction end address is: 8 (R2)
SXTH	R12, R0
SXTH	R0, R1
SXTH	R1, R11
SXTH	R11, R3
SXTH	R3, R7
;pcd8544.c,547 :: 		while (x1 != x2)
L_Draw_Line182:
; fraction start address is: 8 (R2)
; stepx start address is: 0 (R0)
; dx start address is: 48 (R12)
; dy start address is: 44 (R11)
; dy start address is: 44 (R11)
; dy end address is: 44 (R11)
; dx start address is: 48 (R12)
; dx end address is: 48 (R12)
; stepx start address is: 0 (R0)
; stepx end address is: 0 (R0)
; stepy start address is: 40 (R10)
; stepy end address is: 40 (R10)
; colour start address is: 36 (R9)
; colour end address is: 36 (R9)
; x2 start address is: 4 (R1)
; y1 start address is: 32 (R8)
; x1 start address is: 12 (R3)
CMP	R3, R1
IT	EQ
BEQ	L_Draw_Line183
; dy end address is: 44 (R11)
; dx end address is: 48 (R12)
; stepx end address is: 0 (R0)
; colour end address is: 36 (R9)
; stepy end address is: 40 (R10)
;pcd8544.c,549 :: 		if (fraction >= 0)
; stepy start address is: 40 (R10)
; colour start address is: 36 (R9)
; stepx start address is: 0 (R0)
; dx start address is: 48 (R12)
; dy start address is: 44 (R11)
CMP	R2, #0
IT	LT
BLT	L__Draw_Line287
;pcd8544.c,551 :: 		y1 += stepy;
ADD	R8, R8, R10, LSL #0
SXTH	R8, R8
;pcd8544.c,552 :: 		fraction -= dx;
SUB	R2, R2, R12, LSL #0
SXTH	R2, R2
; y1 end address is: 32 (R8)
; fraction end address is: 8 (R2)
;pcd8544.c,553 :: 		}
IT	AL
BAL	L_Draw_Line184
L__Draw_Line287:
;pcd8544.c,549 :: 		if (fraction >= 0)
;pcd8544.c,553 :: 		}
L_Draw_Line184:
;pcd8544.c,554 :: 		x1 += stepx;
; fraction start address is: 8 (R2)
; y1 start address is: 32 (R8)
ADDS	R5, R3, R0
; x1 end address is: 12 (R3)
; x1 start address is: 28 (R7)
SXTH	R7, R5
;pcd8544.c,555 :: 		fraction += dy;
ADD	R2, R2, R11, LSL #0
SXTH	R2, R2
;pcd8544.c,557 :: 		Draw_Pixel(x1, y1, colour);
STRH	R2, [SP, #4]
STRH	R1, [SP, #8]
STRH	R0, [SP, #10]
UXTB	R2, R9
UXTB	R1, R8
UXTB	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #10]
LDRSH	R1, [SP, #8]
LDRSH	R2, [SP, #4]
;pcd8544.c,558 :: 		}
SXTH	R3, R7
; dy end address is: 44 (R11)
; dx end address is: 48 (R12)
; stepx end address is: 0 (R0)
; colour end address is: 36 (R9)
; x2 end address is: 4 (R1)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; stepy end address is: 40 (R10)
; fraction end address is: 8 (R2)
IT	AL
BAL	L_Draw_Line182
L_Draw_Line183:
;pcd8544.c,559 :: 		}
IT	AL
BAL	L_Draw_Line185
L_Draw_Line181:
;pcd8544.c,562 :: 		fraction = (dx - (dy >> 1));
; y2 start address is: 48 (R12)
; stepy start address is: 40 (R10)
; x1 start address is: 28 (R7)
; y1 start address is: 32 (R8)
; colour start address is: 36 (R9)
; dy start address is: 12 (R3)
; dx start address is: 0 (R0)
; stepx start address is: 4 (R1)
ASRS	R4, R3, #1
SXTH	R4, R4
SUB	R2, R0, R4
SXTH	R2, R2
; fraction start address is: 8 (R2)
; stepx end address is: 4 (R1)
; dx end address is: 0 (R0)
; dy end address is: 12 (R3)
; colour end address is: 36 (R9)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; y2 end address is: 48 (R12)
; fraction end address is: 8 (R2)
STRH	R0, [SP, #4]
UXTB	R11, R9
SXTH	R9, R1
SXTH	R1, R7
SXTH	R7, R3
SXTH	R0, R8
LDRSH	R8, [SP, #4]
;pcd8544.c,564 :: 		while (y1 != y2)
L_Draw_Line186:
; fraction start address is: 8 (R2)
; colour start address is: 44 (R11)
; stepx start address is: 36 (R9)
; dx start address is: 32 (R8)
; dy start address is: 28 (R7)
; dy start address is: 28 (R7)
; dy end address is: 28 (R7)
; dx start address is: 32 (R8)
; dx end address is: 32 (R8)
; stepx start address is: 36 (R9)
; stepx end address is: 36 (R9)
; stepy start address is: 40 (R10)
; stepy end address is: 40 (R10)
; colour start address is: 44 (R11)
; colour end address is: 44 (R11)
; y2 start address is: 48 (R12)
; y1 start address is: 0 (R0)
; x1 start address is: 4 (R1)
CMP	R0, R12
IT	EQ
BEQ	L_Draw_Line187
; dy end address is: 28 (R7)
; dx end address is: 32 (R8)
; stepx end address is: 36 (R9)
; stepy end address is: 40 (R10)
; colour end address is: 44 (R11)
;pcd8544.c,566 :: 		if (fraction >= 0)
; colour start address is: 44 (R11)
; stepy start address is: 40 (R10)
; stepx start address is: 36 (R9)
; dx start address is: 32 (R8)
; dy start address is: 28 (R7)
CMP	R2, #0
IT	LT
BLT	L__Draw_Line288
;pcd8544.c,568 :: 		x1 += stepx;
ADD	R1, R1, R9, LSL #0
SXTH	R1, R1
;pcd8544.c,569 :: 		fraction -= dy;
SUB	R2, R2, R7
SXTH	R2, R2
; x1 end address is: 4 (R1)
; fraction end address is: 8 (R2)
;pcd8544.c,570 :: 		}
IT	AL
BAL	L_Draw_Line188
L__Draw_Line288:
;pcd8544.c,566 :: 		if (fraction >= 0)
;pcd8544.c,570 :: 		}
L_Draw_Line188:
;pcd8544.c,571 :: 		y1 += stepy;
; fraction start address is: 8 (R2)
; x1 start address is: 4 (R1)
ADD	R5, R0, R10, LSL #0
SXTH	R0, R5
;pcd8544.c,572 :: 		fraction += dx;
ADD	R2, R2, R8, LSL #0
SXTH	R2, R2
;pcd8544.c,573 :: 		Draw_Pixel(x1, y1, colour);
STRH	R2, [SP, #4]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
UXTB	R2, R11
UXTB	R0, R1
UXTB	R1, R5
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
LDRSH	R2, [SP, #4]
;pcd8544.c,574 :: 		}
; dy end address is: 28 (R7)
; dx end address is: 32 (R8)
; stepx end address is: 36 (R9)
; stepy end address is: 40 (R10)
; colour end address is: 44 (R11)
; y2 end address is: 48 (R12)
; x1 end address is: 4 (R1)
; y1 end address is: 0 (R0)
; fraction end address is: 8 (R2)
IT	AL
BAL	L_Draw_Line186
L_Draw_Line187:
;pcd8544.c,575 :: 		}
L_Draw_Line185:
;pcd8544.c,576 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_Line
_Draw_Rectangle:
;pcd8544.c,579 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STRH	R1, [SP, #4]
SXTH	R1, R3
SXTH	R3, R2
SXTH	R2, R0
LDRSH	R0, [SP, #4]
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 8 (R2)
; y1 start address is: 0 (R0)
; x2 start address is: 12 (R3)
; y2 start address is: 4 (R1)
; fill start address is: 20 (R5)
LDRB	R5, [SP, #24]
LDRB	R4, [SP, #28]
STRB	R4, [SP, #28]
;pcd8544.c,581 :: 		unsigned char i = 0x00;
;pcd8544.c,582 :: 		unsigned char xmin = 0x00;
;pcd8544.c,583 :: 		unsigned char xmax = 0x00;
;pcd8544.c,584 :: 		unsigned char ymin = 0x00;
;pcd8544.c,585 :: 		unsigned char ymax = 0x00;
;pcd8544.c,587 :: 		if(fill != NO)
CMP	R5, #0
IT	EQ
BEQ	L_Draw_Rectangle189
; fill end address is: 20 (R5)
;pcd8544.c,589 :: 		if(x1 < x2)
CMP	R2, R3
IT	GE
BGE	L_Draw_Rectangle190
;pcd8544.c,591 :: 		xmin = x1;
; xmin start address is: 16 (R4)
UXTB	R4, R2
; x1 end address is: 8 (R2)
;pcd8544.c,592 :: 		xmax = x2;
STRB	R3, [SP, #20]
; x2 end address is: 12 (R3)
;pcd8544.c,593 :: 		}
UXTB	R10, R4
; xmin end address is: 16 (R4)
IT	AL
BAL	L_Draw_Rectangle191
L_Draw_Rectangle190:
;pcd8544.c,596 :: 		xmin = x2;
; xmin start address is: 16 (R4)
; x2 start address is: 12 (R3)
; x1 start address is: 8 (R2)
UXTB	R4, R3
; x2 end address is: 12 (R3)
;pcd8544.c,597 :: 		xmax = x1;
STRB	R2, [SP, #20]
; x1 end address is: 8 (R2)
; xmin end address is: 16 (R4)
UXTB	R10, R4
;pcd8544.c,598 :: 		}
L_Draw_Rectangle191:
;pcd8544.c,600 :: 		if(y1 < y2)
; xmin start address is: 40 (R10)
CMP	R0, R1
IT	GE
BGE	L_Draw_Rectangle192
;pcd8544.c,602 :: 		ymin = y1;
STRB	R0, [SP, #21]
; y1 end address is: 0 (R0)
;pcd8544.c,603 :: 		ymax = y2;
STRB	R1, [SP, #22]
; y2 end address is: 4 (R1)
;pcd8544.c,604 :: 		}
IT	AL
BAL	L_Draw_Rectangle193
L_Draw_Rectangle192:
;pcd8544.c,607 :: 		ymin = y2;
; y2 start address is: 4 (R1)
; y1 start address is: 0 (R0)
STRB	R1, [SP, #21]
; y2 end address is: 4 (R1)
;pcd8544.c,608 :: 		ymax = y1;
STRB	R0, [SP, #22]
; y1 end address is: 0 (R0)
;pcd8544.c,609 :: 		}
L_Draw_Rectangle193:
;pcd8544.c,611 :: 		for(; xmin <= xmax; ++xmin)
; xmin end address is: 40 (R10)
L_Draw_Rectangle194:
; xmin start address is: 40 (R10)
LDRB	R4, [SP, #20]
CMP	R10, R4
IT	HI
BHI	L_Draw_Rectangle195
;pcd8544.c,613 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 48 (R12)
LDRB	R12, [SP, #21]
; i end address is: 48 (R12)
; xmin end address is: 40 (R10)
UXTB	R7, R12
L_Draw_Rectangle197:
; i start address is: 28 (R7)
; xmin start address is: 40 (R10)
LDRB	R4, [SP, #22]
CMP	R7, R4
IT	HI
BHI	L_Draw_Rectangle198
;pcd8544.c,615 :: 		Draw_Pixel(xmin, i, colour);
LDRB	R2, [SP, #28]
UXTB	R1, R7
UXTB	R0, R10
BL	_Draw_Pixel+0
;pcd8544.c,613 :: 		for(i = ymin; i <= ymax; ++i)
ADDS	R4, R7, #1
; i end address is: 28 (R7)
; i start address is: 48 (R12)
UXTB	R12, R4
;pcd8544.c,616 :: 		}
; i end address is: 48 (R12)
UXTB	R7, R12
IT	AL
BAL	L_Draw_Rectangle197
L_Draw_Rectangle198:
;pcd8544.c,611 :: 		for(; xmin <= xmax; ++xmin)
ADD	R10, R10, #1
UXTB	R10, R10
;pcd8544.c,617 :: 		}
; xmin end address is: 40 (R10)
IT	AL
BAL	L_Draw_Rectangle194
L_Draw_Rectangle195:
;pcd8544.c,618 :: 		}
IT	AL
BAL	L_Draw_Rectangle200
L_Draw_Rectangle189:
;pcd8544.c,622 :: 		Draw_Line(x1, y1, x2, y1, colour);
; y2 start address is: 4 (R1)
; x2 start address is: 12 (R3)
; y1 start address is: 0 (R0)
; x1 start address is: 8 (R2)
LDRB	R4, [SP, #28]
STRH	R1, [SP, #4]
STRH	R3, [SP, #8]
STRH	R0, [SP, #12]
STRH	R2, [SP, #16]
SXTH	R1, R0
SXTH	R0, R2
SXTH	R2, R3
SXTH	R3, R1
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R2, [SP, #16]
LDRSH	R0, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R1, [SP, #4]
;pcd8544.c,623 :: 		Draw_Line(x1, y2, x2, y2, colour);
LDRB	R4, [SP, #28]
STRH	R1, [SP, #4]
STRH	R3, [SP, #8]
STRH	R0, [SP, #12]
STRH	R2, [SP, #16]
SXTH	R0, R2
SXTH	R2, R3
SXTH	R3, R1
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R2, [SP, #16]
LDRSH	R0, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R1, [SP, #4]
;pcd8544.c,624 :: 		Draw_Line(x1, y1, x1, y2, colour);
LDRB	R4, [SP, #28]
STRH	R1, [SP, #4]
STRH	R3, [SP, #8]
STRH	R0, [SP, #12]
SXTH	R3, R1
SXTH	R1, R0
SXTH	R0, R2
; x1 end address is: 8 (R2)
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
LDRSH	R0, [SP, #12]
LDRSH	R3, [SP, #8]
LDRSH	R1, [SP, #4]
;pcd8544.c,625 :: 		Draw_Line(x2, y1, x2, y2, colour);
LDRB	R4, [SP, #28]
SXTH	R2, R3
; y2 end address is: 4 (R1)
SXTH	R3, R1
SXTH	R1, R0
; y1 end address is: 0 (R0)
SXTH	R0, R2
; x2 end address is: 12 (R3)
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;pcd8544.c,626 :: 		}
L_Draw_Rectangle200:
;pcd8544.c,627 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Rectangle
_Draw_Circle:
;pcd8544.c,630 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
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
;pcd8544.c,632 :: 		signed int a = 0x0000;
MOVW	R4, #0
STRH	R4, [SP, #4]
;pcd8544.c,633 :: 		signed int b = 0x0000;
;pcd8544.c,634 :: 		signed int p = 0x0000;
;pcd8544.c,636 :: 		b = radius;
STRH	R0, [SP, #6]
;pcd8544.c,637 :: 		p = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #8]
;pcd8544.c,639 :: 		do
L_Draw_Circle201:
;pcd8544.c,641 :: 		if(fill != NO)
LDRB	R4, [SP, #20]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Circle204
;pcd8544.c,643 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
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
;pcd8544.c,644 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
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
;pcd8544.c,645 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
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
;pcd8544.c,646 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
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
;pcd8544.c,647 :: 		}
IT	AL
BAL	L_Draw_Circle205
L_Draw_Circle204:
;pcd8544.c,650 :: 		Draw_Pixel((xc + a), (yc + b), colour);
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
;pcd8544.c,651 :: 		Draw_Pixel((xc + b), (yc + a), colour);
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
;pcd8544.c,652 :: 		Draw_Pixel((xc - a), (yc + b), colour);
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
;pcd8544.c,653 :: 		Draw_Pixel((xc - b), (yc + a), colour);
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
;pcd8544.c,654 :: 		Draw_Pixel((xc + b), (yc - a), colour);
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
;pcd8544.c,655 :: 		Draw_Pixel((xc + a), (yc - b), colour);
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
;pcd8544.c,656 :: 		Draw_Pixel((xc - a), (yc - b), colour);
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
;pcd8544.c,657 :: 		Draw_Pixel((xc - b), (yc - a), colour);
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
;pcd8544.c,658 :: 		}
L_Draw_Circle205:
;pcd8544.c,660 :: 		if(p < 0)
LDRSH	R4, [SP, #8]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle206
;pcd8544.c,662 :: 		p += (0x03 + (0x02 * a++));
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
;pcd8544.c,663 :: 		}
IT	AL
BAL	L_Draw_Circle207
L_Draw_Circle206:
;pcd8544.c,666 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
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
;pcd8544.c,667 :: 		}
L_Draw_Circle207:
;pcd8544.c,668 :: 		}while(a <= b);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_Circle201
;pcd8544.c,669 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_main:
;nokia_5510_lcd_demo.c,8 :: 		void main()
SUB	SP, SP, #12
;nokia_5510_lcd_demo.c,10 :: 		unsigned char g = 0;
;nokia_5510_lcd_demo.c,14 :: 		signed char c = -9;
ADD	R11, SP, #4
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmain_c_L0+0)
MOVT	R12, #hi_addr(?ICSmain_c_L0+0)
BL	___CC2DW+0
;nokia_5510_lcd_demo.c,15 :: 		signed int i = -66;
;nokia_5510_lcd_demo.c,16 :: 		float f = -0.04;
;nokia_5510_lcd_demo.c,18 :: 		setup();
BL	_setup+0
;nokia_5510_lcd_demo.c,20 :: 		PCD8544_backlight_state(ON);
MOVS	R0, #1
BL	_PCD8544_backlight_state+0
;nokia_5510_lcd_demo.c,21 :: 		PCD8544_print_image(mikro_bmp);
MOVW	R0, #lo_addr(_mikro_bmp+0)
MOVT	R0, #hi_addr(_mikro_bmp+0)
BL	_PCD8544_print_image+0
;nokia_5510_lcd_demo.c,22 :: 		delay_ms(2000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_main208:
SUBS	R7, R7, #1
BNE	L_main208
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,24 :: 		PCD8544_backlight_state(OFF);
MOVS	R0, #0
BL	_PCD8544_backlight_state+0
;nokia_5510_lcd_demo.c,25 :: 		delay_ms(2000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_main210:
SUBS	R7, R7, #1
BNE	L_main210
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,27 :: 		PCD8544_clear_screen(WHITE);
MOVS	R0, #1
BL	_PCD8544_clear_screen+0
;nokia_5510_lcd_demo.c,29 :: 		PCD8544_backlight_state(ON);
MOVS	R0, #1
BL	_PCD8544_backlight_state+0
;nokia_5510_lcd_demo.c,30 :: 		Draw_Rectangle(2, 2, 81, 45, OFF, BLACK);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #45
SXTH	R3, R3
MOVS	R2, #81
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_Draw_Rectangle+0
ADD	SP, SP, #8
;nokia_5510_lcd_demo.c,31 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main212:
SUBS	R7, R7, #1
BNE	L_main212
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,33 :: 		Draw_Circle(6, 6, 2, ON, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #2
SXTH	R2, R2
MOVS	R1, #6
SXTH	R1, R1
MOVS	R0, #6
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,34 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main214:
SUBS	R7, R7, #1
BNE	L_main214
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,35 :: 		Draw_Circle(77, 6, 2, ON, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #2
SXTH	R2, R2
MOVS	R1, #6
SXTH	R1, R1
MOVS	R0, #77
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,36 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main216:
SUBS	R7, R7, #1
BNE	L_main216
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,37 :: 		Draw_Circle(77, 41, 2, ON, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #2
SXTH	R2, R2
MOVS	R1, #41
SXTH	R1, R1
MOVS	R0, #77
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,38 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main218:
SUBS	R7, R7, #1
BNE	L_main218
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,39 :: 		Draw_Circle(6, 41, 2, ON, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #2
SXTH	R2, R2
MOVS	R1, #41
SXTH	R1, R1
MOVS	R0, #6
SXTH	R0, R0
BL	_Draw_Circle+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,40 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main220:
SUBS	R7, R7, #1
BNE	L_main220
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,42 :: 		Draw_Line(2, 11, 10, 11, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #11
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #11
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,43 :: 		Draw_Line(73, 11, 81, 11, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #11
SXTH	R3, R3
MOVS	R2, #81
SXTH	R2, R2
MOVS	R1, #11
SXTH	R1, R1
MOVS	R0, #73
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,44 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main222:
SUBS	R7, R7, #1
BNE	L_main222
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,45 :: 		Draw_Line(2, 36, 10, 36, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #36
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #36
SXTH	R1, R1
MOVS	R0, #2
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,46 :: 		Draw_Line(73, 36, 81, 36, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #36
SXTH	R3, R3
MOVS	R2, #81
SXTH	R2, R2
MOVS	R1, #36
SXTH	R1, R1
MOVS	R0, #73
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,47 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main224:
SUBS	R7, R7, #1
BNE	L_main224
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,48 :: 		Draw_Line(11, 45, 11, 2, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #2
SXTH	R3, R3
MOVS	R2, #11
SXTH	R2, R2
MOVS	R1, #45
SXTH	R1, R1
MOVS	R0, #11
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,49 :: 		Draw_Line(72, 45, 72, 2, BLACK);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #2
SXTH	R3, R3
MOVS	R2, #72
SXTH	R2, R2
MOVS	R1, #45
SXTH	R1, R1
MOVS	R0, #72
SXTH	R0, R0
BL	_Draw_Line+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,50 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_main226:
SUBS	R7, R7, #1
BNE	L_main226
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,52 :: 		PCD8544_backlight_state(OFF);
MOVS	R0, #0
BL	_PCD8544_backlight_state+0
;nokia_5510_lcd_demo.c,53 :: 		delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_main228:
SUBS	R7, R7, #1
BNE	L_main228
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,55 :: 		PCD8544_backlight_state(ON);
MOVS	R0, #1
BL	_PCD8544_backlight_state+0
;nokia_5510_lcd_demo.c,57 :: 		for(g = 0; g <= 9; g++)
; g start address is: 40 (R10)
MOVW	R10, #0
; g end address is: 40 (R10)
UXTB	R7, R10
L_main230:
; g start address is: 28 (R7)
CMP	R7, #9
IT	HI
BHI	L_main231
;nokia_5510_lcd_demo.c,59 :: 		PCD8544_set_cursor((18 + (g * 5)), 2);
MOVS	R0, #5
SXTH	R0, R0
MULS	R0, R7, R0
SXTH	R0, R0
ADDS	R0, #18
MOVS	R1, #2
UXTB	R0, R0
BL	_PCD8544_set_cursor+0
;nokia_5510_lcd_demo.c,60 :: 		PCD8544_print_char(txt1[g], WHITE);
MOVW	R0, #lo_addr(main_txt1_L0+0)
MOVT	R0, #hi_addr(main_txt1_L0+0)
ADDS	R0, R0, R7
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_PCD8544_print_char+0
;nokia_5510_lcd_demo.c,61 :: 		delay_ms(90);
STRB	R7, [SP, #0]
MOVW	R7, #31423
MOVT	R7, #16
NOP
NOP
L_main233:
SUBS	R7, R7, #1
BNE	L_main233
NOP
NOP
NOP
LDRB	R7, [SP, #0]
;nokia_5510_lcd_demo.c,57 :: 		for(g = 0; g <= 9; g++)
ADDS	R0, R7, #1
; g end address is: 28 (R7)
; g start address is: 40 (R10)
UXTB	R10, R0
;nokia_5510_lcd_demo.c,62 :: 		}
UXTB	R7, R10
; g end address is: 40 (R10)
IT	AL
BAL	L_main230
L_main231:
;nokia_5510_lcd_demo.c,64 :: 		for(g = 0; g <= 9; g++)
; g start address is: 28 (R7)
MOVS	R7, #0
; g end address is: 28 (R7)
L_main235:
; g start address is: 28 (R7)
CMP	R7, #9
IT	HI
BHI	L_main236
;nokia_5510_lcd_demo.c,66 :: 		PCD8544_set_cursor((18 + (g * 5)), 3);
MOVS	R0, #5
SXTH	R0, R0
MULS	R0, R7, R0
SXTH	R0, R0
ADDS	R0, #18
MOVS	R1, #3
UXTB	R0, R0
BL	_PCD8544_set_cursor+0
;nokia_5510_lcd_demo.c,67 :: 		PCD8544_print_char(txt2[g], WHITE);
MOVW	R0, #lo_addr(main_txt2_L0+0)
MOVT	R0, #hi_addr(main_txt2_L0+0)
ADDS	R0, R0, R7
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_PCD8544_print_char+0
;nokia_5510_lcd_demo.c,68 :: 		delay_ms(90);
STRB	R7, [SP, #0]
MOVW	R7, #31423
MOVT	R7, #16
NOP
NOP
L_main238:
SUBS	R7, R7, #1
BNE	L_main238
NOP
NOP
NOP
LDRB	R7, [SP, #0]
;nokia_5510_lcd_demo.c,64 :: 		for(g = 0; g <= 9; g++)
ADDS	R0, R7, #1
; g end address is: 28 (R7)
; g start address is: 0 (R0)
;nokia_5510_lcd_demo.c,69 :: 		}
UXTB	R7, R0
; g end address is: 0 (R0)
IT	AL
BAL	L_main235
L_main236:
;nokia_5510_lcd_demo.c,70 :: 		delay_ms(4000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_main240:
SUBS	R7, R7, #1
BNE	L_main240
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,72 :: 		PCD8544_clear_screen(WHITE);
MOVS	R0, #1
BL	_PCD8544_clear_screen+0
;nokia_5510_lcd_demo.c,74 :: 		PCD8544_print_string(1, 2, "CHR:", WHITE);
MOVW	R0, #lo_addr(?lstr2_nokia_5510_lcd_demo+0)
MOVT	R0, #hi_addr(?lstr2_nokia_5510_lcd_demo+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #2
MOVS	R0, #1
BL	_PCD8544_print_string+0
;nokia_5510_lcd_demo.c,75 :: 		PCD8544_print_string(1, 3, "INT:", WHITE);
MOVW	R0, #lo_addr(?lstr3_nokia_5510_lcd_demo+0)
MOVT	R0, #hi_addr(?lstr3_nokia_5510_lcd_demo+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #3
MOVS	R0, #1
BL	_PCD8544_print_string+0
;nokia_5510_lcd_demo.c,76 :: 		PCD8544_print_string(1, 4, "FLT:", WHITE);
MOVW	R0, #lo_addr(?lstr4_nokia_5510_lcd_demo+0)
MOVT	R0, #hi_addr(?lstr4_nokia_5510_lcd_demo+0)
MOVS	R3, #1
MOV	R2, R0
MOVS	R1, #4
MOVS	R0, #1
BL	_PCD8544_print_string+0
;nokia_5510_lcd_demo.c,78 :: 		while(1)
L_main242:
;nokia_5510_lcd_demo.c,80 :: 		print_chr(26, 2, c, WHITE);
MOVS	R3, #1
LDRSB	R2, [SP, #4]
MOVS	R1, #2
MOVS	R0, #26
BL	_print_chr+0
;nokia_5510_lcd_demo.c,81 :: 		print_int(26, 3, i, WHITE);
MOVS	R3, #1
LDRSH	R2, [SP, #6]
MOVS	R1, #3
MOVS	R0, #26
BL	_print_int+0
;nokia_5510_lcd_demo.c,82 :: 		print_float(26, 4, f, 2, WHITE);
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #2
LDR	R2, [SP, #12]
MOVS	R1, #4
MOVS	R0, #26
BL	_print_float+0
ADD	SP, SP, #4
;nokia_5510_lcd_demo.c,83 :: 		c++;
LDRSB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
;nokia_5510_lcd_demo.c,84 :: 		i++;
LDRSH	R0, [SP, #6]
ADDS	R0, R0, #1
STRH	R0, [SP, #6]
;nokia_5510_lcd_demo.c,85 :: 		f += 0.01;
LDR	R2, [SP, #8]
MOVW	R0, #55050
MOVT	R0, #15395
BL	__Add_FP+0
STR	R0, [SP, #8]
;nokia_5510_lcd_demo.c,86 :: 		delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_main244:
SUBS	R7, R7, #1
BNE	L_main244
NOP
NOP
NOP
;nokia_5510_lcd_demo.c,87 :: 		};
IT	AL
BAL	L_main242
;nokia_5510_lcd_demo.c,88 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;nokia_5510_lcd_demo.c,91 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;nokia_5510_lcd_demo.c,93 :: 		PCD8544_init();
BL	_PCD8544_init+0
;nokia_5510_lcd_demo.c,94 :: 		PCD8544_clear_screen(WHITE);
MOVS	R0, #1
BL	_PCD8544_clear_screen+0
;nokia_5510_lcd_demo.c,95 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
