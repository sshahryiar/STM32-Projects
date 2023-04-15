_TFT_init:
;ili932x.c,4 :: 		void TFT_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ili932x.c,8 :: 		TFT_GPIO_init();
BL	_TFT_GPIO_init+0
;ili932x.c,9 :: 		TFT_reset_sequence();
BL	_TFT_reset_sequence+0
;ili932x.c,11 :: 		TFT_write_reg(0x0000, 0x0001);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write_reg+0
;ili932x.c,12 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init0:
SUBS	R7, R7, #1
BNE	L_TFT_init0
NOP
NOP
NOP
;ili932x.c,14 :: 		device_code = TFT_read(0x0000, REG);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_read+0
MOVW	R1, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R1, #hi_addr(TFT_init_device_code_L0+0)
STRH	R0, [R1, #0]
;ili932x.c,17 :: 		if((device_code == 0x9325) || (device_code == 0x9328))
MOVW	R1, #37669
CMP	R0, R1
IT	EQ
BEQ	L__TFT_init260
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R1, [R0, #0]
MOVW	R0, #37672
CMP	R1, R0
IT	EQ
BEQ	L__TFT_init259
IT	AL
BAL	L_TFT_init4
L__TFT_init260:
L__TFT_init259:
;ili932x.c,19 :: 		TFT_write_reg(0x00E5, 0x78F0);
MOVW	R1, #30960
MOVS	R0, #229
BL	_TFT_write_reg+0
;ili932x.c,20 :: 		TFT_write_reg(0x0001, 0x0100);
MOVW	R1, #256
MOVS	R0, #1
BL	_TFT_write_reg+0
;ili932x.c,21 :: 		TFT_write_reg(0x0002, 0x0700);
MOVW	R1, #1792
MOVS	R0, #2
BL	_TFT_write_reg+0
;ili932x.c,22 :: 		TFT_write_reg(0x0003, 0x1030);
MOVW	R1, #4144
MOVS	R0, #3
BL	_TFT_write_reg+0
;ili932x.c,23 :: 		TFT_write_reg(0x0004, 0x0000);
MOVS	R1, #0
MOVS	R0, #4
BL	_TFT_write_reg+0
;ili932x.c,24 :: 		TFT_write_reg(0x0008, 0x0202);
MOVW	R1, #514
MOVS	R0, #8
BL	_TFT_write_reg+0
;ili932x.c,25 :: 		TFT_write_reg(0x0009, 0x0000);
MOVS	R1, #0
MOVS	R0, #9
BL	_TFT_write_reg+0
;ili932x.c,26 :: 		TFT_write_reg(0x000A, 0x0000);
MOVS	R1, #0
MOVS	R0, #10
BL	_TFT_write_reg+0
;ili932x.c,27 :: 		TFT_write_reg(0x000C, 0x0000); //0x0001
MOVS	R1, #0
MOVS	R0, #12
BL	_TFT_write_reg+0
;ili932x.c,28 :: 		TFT_write_reg(0x000D, 0x0000);
MOVS	R1, #0
MOVS	R0, #13
BL	_TFT_write_reg+0
;ili932x.c,29 :: 		TFT_write_reg(0x000F, 0x0000);
MOVS	R1, #0
MOVS	R0, #15
BL	_TFT_write_reg+0
;ili932x.c,31 :: 		TFT_write_reg(0x0010, 0x0000);
MOVS	R1, #0
MOVS	R0, #16
BL	_TFT_write_reg+0
;ili932x.c,32 :: 		TFT_write_reg(0x0011, 0x0007);
MOVS	R1, #7
MOVS	R0, #17
BL	_TFT_write_reg+0
;ili932x.c,33 :: 		TFT_write_reg(0x0012, 0x0000);
MOVS	R1, #0
MOVS	R0, #18
BL	_TFT_write_reg+0
;ili932x.c,34 :: 		TFT_write_reg(0x0013, 0x0000);
MOVS	R1, #0
MOVS	R0, #19
BL	_TFT_write_reg+0
;ili932x.c,35 :: 		TFT_write_reg(0x0007, 0x0001);
MOVS	R1, #1
MOVS	R0, #7
BL	_TFT_write_reg+0
;ili932x.c,36 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init5:
SUBS	R7, R7, #1
BNE	L_TFT_init5
NOP
NOP
NOP
;ili932x.c,38 :: 		TFT_write_reg(0x0010, 0x1090); //0x1690
MOVW	R1, #4240
MOVS	R0, #16
BL	_TFT_write_reg+0
;ili932x.c,39 :: 		TFT_write_reg(0x0011, 0x0227);
MOVW	R1, #551
MOVS	R0, #17
BL	_TFT_write_reg+0
;ili932x.c,40 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_init7:
SUBS	R7, R7, #1
BNE	L_TFT_init7
NOP
NOP
NOP
;ili932x.c,42 :: 		TFT_write_reg(0x0012, 0x001F); //0x009D
MOVS	R1, #31
MOVS	R0, #18
BL	_TFT_write_reg+0
;ili932x.c,43 :: 		delay_ms(50);
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
;ili932x.c,45 :: 		TFT_write_reg(0x0013, 0x1500); //0x1900
MOVW	R1, #5376
MOVS	R0, #19
BL	_TFT_write_reg+0
;ili932x.c,46 :: 		TFT_write_reg(0x0029, 0x0027); //0x0025
MOVS	R1, #39
MOVS	R0, #41
BL	_TFT_write_reg+0
;ili932x.c,47 :: 		TFT_write_reg(0x002B, 0x000D);
MOVS	R1, #13
MOVS	R0, #43
BL	_TFT_write_reg+0
;ili932x.c,48 :: 		delay_ms(50);
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
;ili932x.c,50 :: 		TFT_write_reg(0x0020, 0x0000);
MOVS	R1, #0
MOVS	R0, #32
BL	_TFT_write_reg+0
;ili932x.c,51 :: 		TFT_write_reg(0x0021, 0x0000);
MOVS	R1, #0
MOVS	R0, #33
BL	_TFT_write_reg+0
;ili932x.c,52 :: 		delay_ms(50);
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
;ili932x.c,54 :: 		TFT_write_reg(0x0030, 0x0000); //0x0007
MOVS	R1, #0
MOVS	R0, #48
BL	_TFT_write_reg+0
;ili932x.c,55 :: 		TFT_write_reg(0x0031, 0x0707); //0x0303
MOVW	R1, #1799
MOVS	R0, #49
BL	_TFT_write_reg+0
;ili932x.c,56 :: 		TFT_write_reg(0x0032, 0x0307); //0x0003
MOVW	R1, #775
MOVS	R0, #50
BL	_TFT_write_reg+0
;ili932x.c,57 :: 		TFT_write_reg(0x0035, 0x0200); //0x0206
MOVW	R1, #512
MOVS	R0, #53
BL	_TFT_write_reg+0
;ili932x.c,58 :: 		TFT_write_reg(0x0036, 0x0008);
MOVS	R1, #8
MOVS	R0, #54
BL	_TFT_write_reg+0
;ili932x.c,59 :: 		TFT_write_reg(0x0037, 0x0004); //0x0406
MOVS	R1, #4
MOVS	R0, #55
BL	_TFT_write_reg+0
;ili932x.c,60 :: 		TFT_write_reg(0x0038, 0x0000); //0x0304
MOVS	R1, #0
MOVS	R0, #56
BL	_TFT_write_reg+0
;ili932x.c,61 :: 		TFT_write_reg(0x0039, 0x0707); //0x0007
MOVW	R1, #1799
MOVS	R0, #57
BL	_TFT_write_reg+0
;ili932x.c,62 :: 		TFT_write_reg(0x003C, 0x0002); //0x0602
MOVS	R1, #2
MOVS	R0, #60
BL	_TFT_write_reg+0
;ili932x.c,63 :: 		TFT_write_reg(0x003D, 0x1D04); //0x0008
MOVW	R1, #7428
MOVS	R0, #61
BL	_TFT_write_reg+0
;ili932x.c,64 :: 		delay_ms(50);
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
;ili932x.c,66 :: 		TFT_write_reg(0x0050, 0x0000);
MOVS	R1, #0
MOVS	R0, #80
BL	_TFT_write_reg+0
;ili932x.c,67 :: 		TFT_write_reg(0x0051, 0x00EF);
MOVS	R1, #239
MOVS	R0, #81
BL	_TFT_write_reg+0
;ili932x.c,68 :: 		TFT_write_reg(0x0052, 0x0000);
MOVS	R1, #0
MOVS	R0, #82
BL	_TFT_write_reg+0
;ili932x.c,69 :: 		TFT_write_reg(0x0053, 0x013F);
MOVW	R1, #319
MOVS	R0, #83
BL	_TFT_write_reg+0
;ili932x.c,70 :: 		TFT_write_reg(0x0060, 0xA700);
MOVW	R1, #42752
MOVS	R0, #96
BL	_TFT_write_reg+0
;ili932x.c,71 :: 		TFT_write_reg(0x0061, 0x0001);
MOVS	R1, #1
MOVS	R0, #97
BL	_TFT_write_reg+0
;ili932x.c,72 :: 		TFT_write_reg(0x006A, 0x0000);
MOVS	R1, #0
MOVS	R0, #106
BL	_TFT_write_reg+0
;ili932x.c,74 :: 		TFT_write_reg(0x0080, 0x0000);
MOVS	R1, #0
MOVS	R0, #128
BL	_TFT_write_reg+0
;ili932x.c,75 :: 		TFT_write_reg(0x0081, 0x0000);
MOVS	R1, #0
MOVS	R0, #129
BL	_TFT_write_reg+0
;ili932x.c,76 :: 		TFT_write_reg(0x0082, 0x0000);
MOVS	R1, #0
MOVS	R0, #130
BL	_TFT_write_reg+0
;ili932x.c,77 :: 		TFT_write_reg(0x0083, 0x0000);
MOVS	R1, #0
MOVS	R0, #131
BL	_TFT_write_reg+0
;ili932x.c,78 :: 		TFT_write_reg(0x0084, 0x0000);
MOVS	R1, #0
MOVS	R0, #132
BL	_TFT_write_reg+0
;ili932x.c,79 :: 		TFT_write_reg(0x0085, 0x0000);
MOVS	R1, #0
MOVS	R0, #133
BL	_TFT_write_reg+0
;ili932x.c,81 :: 		TFT_write_reg(0x0090, 0x0010);
MOVS	R1, #16
MOVS	R0, #144
BL	_TFT_write_reg+0
;ili932x.c,82 :: 		TFT_write_reg(0x0092, 0x0600);
MOVW	R1, #1536
MOVS	R0, #146
BL	_TFT_write_reg+0
;ili932x.c,83 :: 		TFT_write_reg(0x0007, 0x0133);
MOVW	R1, #307
MOVS	R0, #7
BL	_TFT_write_reg+0
;ili932x.c,84 :: 		}
L_TFT_init4:
;ili932x.c,86 :: 		if((device_code == 0x9320) || (device_code == 0x9300))
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R1, [R0, #0]
MOVW	R0, #37664
CMP	R1, R0
IT	EQ
BEQ	L__TFT_init262
MOVW	R0, #lo_addr(TFT_init_device_code_L0+0)
MOVT	R0, #hi_addr(TFT_init_device_code_L0+0)
LDRH	R0, [R0, #0]
CMP	R0, #37632
IT	EQ
BEQ	L__TFT_init261
IT	AL
BAL	L_TFT_init19
L__TFT_init262:
L__TFT_init261:
;ili932x.c,88 :: 		TFT_write_reg(0x0000, 0x0000);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_write_reg+0
;ili932x.c,89 :: 		TFT_write_reg(0x0001, 0x0100);
MOVW	R1, #256
MOVS	R0, #1
BL	_TFT_write_reg+0
;ili932x.c,90 :: 		TFT_write_reg(0x0002, 0x0700);
MOVW	R1, #1792
MOVS	R0, #2
BL	_TFT_write_reg+0
;ili932x.c,91 :: 		TFT_write_reg(0x0003, 0x1030);
MOVW	R1, #4144
MOVS	R0, #3
BL	_TFT_write_reg+0
;ili932x.c,92 :: 		TFT_write_reg(0x0004, 0x0000);
MOVS	R1, #0
MOVS	R0, #4
BL	_TFT_write_reg+0
;ili932x.c,93 :: 		TFT_write_reg(0x0008, 0x0202);
MOVW	R1, #514
MOVS	R0, #8
BL	_TFT_write_reg+0
;ili932x.c,94 :: 		TFT_write_reg(0x0009, 0x0000);
MOVS	R1, #0
MOVS	R0, #9
BL	_TFT_write_reg+0
;ili932x.c,95 :: 		TFT_write_reg(0x000A, 0x0000);
MOVS	R1, #0
MOVS	R0, #10
BL	_TFT_write_reg+0
;ili932x.c,96 :: 		TFT_write_reg(0x000C, (1 << 0));
MOVS	R1, #1
MOVS	R0, #12
BL	_TFT_write_reg+0
;ili932x.c,97 :: 		TFT_write_reg(0x000D, 0x0000);
MOVS	R1, #0
MOVS	R0, #13
BL	_TFT_write_reg+0
;ili932x.c,98 :: 		TFT_write_reg(0x000F, 0x0000);
MOVS	R1, #0
MOVS	R0, #15
BL	_TFT_write_reg+0
;ili932x.c,99 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_TFT_init20:
SUBS	R7, R7, #1
BNE	L_TFT_init20
NOP
NOP
NOP
;ili932x.c,100 :: 		TFT_write_reg(0x0007, 0x0101);
MOVW	R1, #257
MOVS	R0, #7
BL	_TFT_write_reg+0
;ili932x.c,101 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_TFT_init22:
SUBS	R7, R7, #1
BNE	L_TFT_init22
NOP
NOP
NOP
;ili932x.c,102 :: 		TFT_write_reg(0x0010, ((1 << 12) | (0 << 8) | (1 << 7) | (1 << 6) | (0 << 4)));
MOVW	R1, #4288
MOVS	R0, #16
BL	_TFT_write_reg+0
;ili932x.c,103 :: 		TFT_write_reg(0x0011, 0x0007);
MOVS	R1, #7
MOVS	R0, #17
BL	_TFT_write_reg+0
;ili932x.c,104 :: 		TFT_write_reg(0x0012, (1 << 8) | (1 << 4)| (0 << 0));
MOVW	R1, #272
MOVS	R0, #18
BL	_TFT_write_reg+0
;ili932x.c,105 :: 		TFT_write_reg(0x0013, 0x0B00);
MOVW	R1, #2816
MOVS	R0, #19
BL	_TFT_write_reg+0
;ili932x.c,106 :: 		TFT_write_reg(0x0029, 0x0000);
MOVS	R1, #0
MOVS	R0, #41
BL	_TFT_write_reg+0
;ili932x.c,107 :: 		TFT_write_reg(0x002B, ((1 << 14) | (1 << 4)));
MOVW	R1, #16400
MOVS	R0, #43
BL	_TFT_write_reg+0
;ili932x.c,108 :: 		TFT_write_reg(0x0050, 0x0000);
MOVS	R1, #0
MOVS	R0, #80
BL	_TFT_write_reg+0
;ili932x.c,109 :: 		TFT_write_reg(0x0051, 0x00EF);
MOVS	R1, #239
MOVS	R0, #81
BL	_TFT_write_reg+0
;ili932x.c,110 :: 		TFT_write_reg(0x0052, 0x0000);
MOVS	R1, #0
MOVS	R0, #82
BL	_TFT_write_reg+0
;ili932x.c,111 :: 		TFT_write_reg(0x0053, 0x013F);
MOVW	R1, #319
MOVS	R0, #83
BL	_TFT_write_reg+0
;ili932x.c,112 :: 		TFT_write_reg(0x0060, 0x2700);
MOVW	R1, #9984
MOVS	R0, #96
BL	_TFT_write_reg+0
;ili932x.c,113 :: 		TFT_write_reg(0x0061, 0x0001);
MOVS	R1, #1
MOVS	R0, #97
BL	_TFT_write_reg+0
;ili932x.c,114 :: 		TFT_write_reg(0x006A, 0x0000);
MOVS	R1, #0
MOVS	R0, #106
BL	_TFT_write_reg+0
;ili932x.c,115 :: 		TFT_write_reg(0x0080, 0x0000);
MOVS	R1, #0
MOVS	R0, #128
BL	_TFT_write_reg+0
;ili932x.c,116 :: 		TFT_write_reg(0x0081, 0x0000);
MOVS	R1, #0
MOVS	R0, #129
BL	_TFT_write_reg+0
;ili932x.c,117 :: 		TFT_write_reg(0x0082, 0x0000);
MOVS	R1, #0
MOVS	R0, #130
BL	_TFT_write_reg+0
;ili932x.c,118 :: 		TFT_write_reg(0x0083, 0x0000);
MOVS	R1, #0
MOVS	R0, #131
BL	_TFT_write_reg+0
;ili932x.c,119 :: 		TFT_write_reg(0x0084, 0x0000);
MOVS	R1, #0
MOVS	R0, #132
BL	_TFT_write_reg+0
;ili932x.c,120 :: 		TFT_write_reg(0x0085, 0x0000);
MOVS	R1, #0
MOVS	R0, #133
BL	_TFT_write_reg+0
;ili932x.c,121 :: 		TFT_write_reg(0x0090, ((0 << 7) | (16 << 0)));
MOVS	R1, #16
MOVS	R0, #144
BL	_TFT_write_reg+0
;ili932x.c,122 :: 		TFT_write_reg(0x0092, 0x0000);
MOVS	R1, #0
MOVS	R0, #146
BL	_TFT_write_reg+0
;ili932x.c,123 :: 		TFT_write_reg(0x0093, 0x0001);
MOVS	R1, #1
MOVS	R0, #147
BL	_TFT_write_reg+0
;ili932x.c,124 :: 		TFT_write_reg(0x0095, 0x0110);
MOVW	R1, #272
MOVS	R0, #149
BL	_TFT_write_reg+0
;ili932x.c,125 :: 		TFT_write_reg(0x0097, (0 << 8));
MOVS	R1, #0
MOVS	R0, #151
BL	_TFT_write_reg+0
;ili932x.c,126 :: 		TFT_write_reg(0x0098, 0x0000);
MOVS	R1, #0
MOVS	R0, #152
BL	_TFT_write_reg+0
;ili932x.c,127 :: 		TFT_write_reg(0x0007, 0x0173);
MOVW	R1, #371
MOVS	R0, #7
BL	_TFT_write_reg+0
;ili932x.c,128 :: 		}
L_TFT_init19:
;ili932x.c,129 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_init24:
SUBS	R7, R7, #1
BNE	L_TFT_init24
NOP
NOP
NOP
;ili932x.c,131 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;ili932x.c,132 :: 		TFT_backlight_state(ON);
MOVS	R0, #1
BL	_TFT_backlight_state+0
;ili932x.c,133 :: 		}
L_end_TFT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_init
_TFT_GPIO_init:
;ili932x.c,136 :: 		void TFT_GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ili932x.c,138 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili932x.c,139 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_3, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;ili932x.c,141 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili932x.c,142 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);
MOVW	R0, #lo_addr(__GPIO_MODULE_SWJ_JTAGDISABLE+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_SWJ_JTAGDISABLE+0)
BL	_GPIO_Alternate_Function_Enable+0
;ili932x.c,143 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;ili932x.c,145 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili932x.c,146 :: 		GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVS	R1, #199
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;ili932x.c,147 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_GPIO_init26:
SUBS	R7, R7, #1
BNE	L_TFT_GPIO_init26
NOP
NOP
NOP
;ili932x.c,148 :: 		}
L_end_TFT_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_GPIO_init
_TFT_reset_sequence:
;ili932x.c,151 :: 		void TFT_reset_sequence()
;ili932x.c,153 :: 		TFT_RST_pin = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ili932x.c,154 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_TFT_reset_sequence28:
SUBS	R7, R7, #1
BNE	L_TFT_reset_sequence28
NOP
NOP
NOP
;ili932x.c,155 :: 		TFT_RST_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ili932x.c,156 :: 		delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_TFT_reset_sequence30:
SUBS	R7, R7, #1
BNE	L_TFT_reset_sequence30
NOP
NOP
NOP
;ili932x.c,157 :: 		}
L_end_TFT_reset_sequence:
BX	LR
; end of _TFT_reset_sequence
_TFT_backlight_state:
;ili932x.c,160 :: 		void TFT_backlight_state(unsigned char value)
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;ili932x.c,162 :: 		TFT_BL_pin = (value & 0x01);
AND	R2, R0, #1
; value end address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;ili932x.c,163 :: 		}
L_end_TFT_backlight_state:
BX	LR
; end of _TFT_backlight_state
_TFT_write:
;ili932x.c,166 :: 		void TFT_write(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ili932x.c,168 :: 		TFT_CS_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,169 :: 		TFT_RS_pin = mode;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R2, #0]
; mode end address is: 4 (R1)
;ili932x.c,170 :: 		TFT_data_out_port = value;
MOVW	R2, #lo_addr(GPIOB_ODR+0)
MOVT	R2, #hi_addr(GPIOB_ODR+0)
STR	R0, [R2, #0]
; value end address is: 0 (R0)
;ili932x.c,171 :: 		TFT_WR_pin = 0;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,172 :: 		TFT_WR_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,173 :: 		TFT_CS_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,174 :: 		}
L_end_TFT_write:
BX	LR
; end of _TFT_write
_TFT_read:
;ili932x.c,177 :: 		unsigned int TFT_read(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ili932x.c,179 :: 		unsigned int temp = 0x0000;
;ili932x.c,181 :: 		switch(mode)
IT	AL
BAL	L_TFT_read32
; mode end address is: 4 (R1)
;ili932x.c,183 :: 		case REG:
L_TFT_read34:
;ili932x.c,185 :: 		TFT_write(value, CMD);
MOVS	R1, #0
; value end address is: 0 (R0)
BL	_TFT_write+0
;ili932x.c,186 :: 		break;
IT	AL
BAL	L_TFT_read33
;ili932x.c,188 :: 		case DAT:
L_TFT_read35:
;ili932x.c,190 :: 		break;
IT	AL
BAL	L_TFT_read33
;ili932x.c,192 :: 		}
L_TFT_read32:
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_TFT_read34
; value end address is: 0 (R0)
CMP	R1, #1
IT	EQ
BEQ	L_TFT_read35
; mode end address is: 4 (R1)
L_TFT_read33:
;ili932x.c,194 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #130
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;ili932x.c,196 :: 		TFT_CS_pin = 0;
MOVS	R4, #0
SXTB	R4, R4
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R2, #0]
;ili932x.c,197 :: 		TFT_RS_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,198 :: 		TFT_RD_pin = 0;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R4, [R2, #0]
;ili932x.c,200 :: 		temp = GPIOB_IDR;
MOVW	R2, #lo_addr(GPIOB_IDR+0)
MOVT	R2, #hi_addr(GPIOB_IDR+0)
; temp start address is: 36 (R9)
LDR	R9, [R2, #0]
;ili932x.c,202 :: 		TFT_RD_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,203 :: 		TFT_CS_pin = 1;
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,205 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_ALL, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;ili932x.c,207 :: 		return temp;
UXTH	R0, R9
; temp end address is: 36 (R9)
;ili932x.c,208 :: 		}
L_end_TFT_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_read
_TFT_write_reg:
;ili932x.c,211 :: 		void TFT_write_reg(unsigned int reg_val, unsigned int data_val)
; data_val start address is: 4 (R1)
; reg_val start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R1
; data_val end address is: 4 (R1)
; reg_val end address is: 0 (R0)
; reg_val start address is: 0 (R0)
; data_val start address is: 16 (R4)
;ili932x.c,213 :: 		TFT_write(reg_val, CMD);
MOVS	R1, #0
; reg_val end address is: 0 (R0)
BL	_TFT_write+0
;ili932x.c,214 :: 		TFT_write(data_val, DAT);
MOVS	R1, #1
UXTH	R0, R4
; data_val end address is: 16 (R4)
BL	_TFT_write+0
;ili932x.c,215 :: 		}
L_end_TFT_write_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_reg
_TFT_write_RAM_prepare:
;ili932x.c,218 :: 		void TFT_write_RAM_prepare()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ili932x.c,220 :: 		TFT_write(0x0022, CMD);
MOVS	R1, #0
MOVS	R0, #34
BL	_TFT_write+0
;ili932x.c,221 :: 		}
L_end_TFT_write_RAM_prepare:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_RAM_prepare
_TFT_fill:
;ili932x.c,224 :: 		void TFT_fill(unsigned int colour)
; colour start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R6, R0
; colour end address is: 0 (R0)
; colour start address is: 24 (R6)
;ili932x.c,226 :: 		unsigned long index = (MAX_X * MAX_Y);
; index start address is: 28 (R7)
MOV	R7, #76800
;ili932x.c,228 :: 		TFT_set_cursor(0, 0);
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_set_cursor+0
;ili932x.c,229 :: 		TFT_CS_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ili932x.c,230 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
; colour end address is: 24 (R6)
; index end address is: 28 (R7)
UXTH	R4, R6
MOV	R5, R7
;ili932x.c,232 :: 		while(index)
L_TFT_fill36:
; index start address is: 20 (R5)
; colour start address is: 16 (R4)
; colour start address is: 16 (R4)
; colour end address is: 16 (R4)
CMP	R5, #0
IT	EQ
BEQ	L_TFT_fill37
; colour end address is: 16 (R4)
;ili932x.c,234 :: 		TFT_write(colour, DAT);
; colour start address is: 16 (R4)
MOVS	R1, #1
UXTH	R0, R4
BL	_TFT_write+0
;ili932x.c,235 :: 		index--;
SUBS	R5, R5, #1
;ili932x.c,236 :: 		}
; colour end address is: 16 (R4)
; index end address is: 20 (R5)
IT	AL
BAL	L_TFT_fill36
L_TFT_fill37:
;ili932x.c,237 :: 		TFT_CS_pin = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R1, #0]
;ili932x.c,238 :: 		}
L_end_TFT_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_fill
_TFT_BGR2RGB:
;ili932x.c,241 :: 		unsigned int TFT_BGR2RGB(unsigned int colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;ili932x.c,243 :: 		unsigned int r = 0x0000;
;ili932x.c,244 :: 		unsigned int g = 0x0000;
;ili932x.c,245 :: 		unsigned int b = 0x0000;
;ili932x.c,246 :: 		unsigned int rgb_colour = 0x0000;
;ili932x.c,248 :: 		b = ((colour >> 0)  & 0x1F);
AND	R2, R0, #31
UXTH	R2, R2
;ili932x.c,249 :: 		g = ((colour >> 5)  & 0x3F);
LSRS	R1, R0, #5
UXTH	R1, R1
AND	R4, R1, #63
UXTH	R4, R4
;ili932x.c,250 :: 		r = ((colour >> 11) & 0x1F);
LSRS	R1, R0, #11
UXTH	R1, R1
; colour end address is: 0 (R0)
AND	R3, R1, #31
UXTH	R3, R3
;ili932x.c,252 :: 		rgb_colour = ((b << 11) + (g << 5) + (r << 0));
LSLS	R2, R2, #11
UXTH	R2, R2
LSLS	R1, R4, #5
UXTH	R1, R1
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R1, R3
;ili932x.c,254 :: 		return rgb_colour;
UXTH	R0, R1
;ili932x.c,255 :: 		}
L_end_TFT_BGR2RGB:
BX	LR
; end of _TFT_BGR2RGB
_RGB565_converter:
;ili932x.c,258 :: 		unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
; b start address is: 8 (R2)
; g start address is: 4 (R1)
; r start address is: 0 (R0)
; b end address is: 8 (R2)
; g end address is: 4 (R1)
; r end address is: 0 (R0)
; r start address is: 0 (R0)
; g start address is: 4 (R1)
; b start address is: 8 (R2)
;ili932x.c,260 :: 		return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
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
;ili932x.c,261 :: 		}
L_end_RGB565_converter:
BX	LR
; end of _RGB565_converter
_swap:
;ili932x.c,264 :: 		void swap(signed int *a, signed int *b)
; b start address is: 4 (R1)
; a start address is: 0 (R0)
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 4 (R1)
;ili932x.c,266 :: 		signed int temp = 0x0000;
;ili932x.c,268 :: 		temp = *b;
LDRSH	R2, [R1, #0]
; temp start address is: 12 (R3)
SXTH	R3, R2
;ili932x.c,269 :: 		*b = *a;
LDRSH	R2, [R0, #0]
STRH	R2, [R1, #0]
; b end address is: 4 (R1)
;ili932x.c,270 :: 		*a = temp;
STRH	R3, [R0, #0]
; a end address is: 0 (R0)
; temp end address is: 12 (R3)
;ili932x.c,271 :: 		}
L_end_swap:
BX	LR
; end of _swap
_TFT_set_cursor:
;ili932x.c,274 :: 		void TFT_set_cursor(unsigned int x_pos, unsigned int y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R2, R1
UXTH	R1, R0
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 4 (R1)
; y_pos start address is: 8 (R2)
;ili932x.c,276 :: 		unsigned int temp = 0x0000;
;ili932x.c,293 :: 		temp = y_pos;
; temp start address is: 0 (R0)
UXTH	R0, R2
; y_pos end address is: 8 (R2)
;ili932x.c,294 :: 		y_pos = x_pos;
; y_pos start address is: 20 (R5)
UXTH	R5, R1
; x_pos end address is: 4 (R1)
;ili932x.c,295 :: 		x_pos = (MAX_Y - temp - 1);
RSB	R2, R0, #240
UXTH	R2, R2
; temp end address is: 0 (R0)
SUBS	R2, R2, #1
;ili932x.c,299 :: 		TFT_write_reg(0x0020, x_pos);
UXTH	R1, R2
MOVS	R0, #32
BL	_TFT_write_reg+0
;ili932x.c,300 :: 		TFT_write_reg(0x0021, y_pos);
UXTH	R1, R5
; y_pos end address is: 20 (R5)
MOVS	R0, #33
BL	_TFT_write_reg+0
;ili932x.c,301 :: 		}
L_end_TFT_set_cursor:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_cursor
_TFT_set_display_window:
;ili932x.c,304 :: 		void TFT_set_display_window(unsigned int x_pos, unsigned int y_pos, unsigned int w, unsigned int h)
; h start address is: 12 (R3)
; w start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R0
UXTH	R6, R1
UXTH	R7, R2
UXTH	R8, R3
; h end address is: 12 (R3)
; w end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 20 (R5)
; y_pos start address is: 24 (R6)
; w start address is: 28 (R7)
; h start address is: 32 (R8)
;ili932x.c,306 :: 		TFT_write_reg(0x0050, x_pos);
UXTH	R1, R5
MOVS	R0, #80
BL	_TFT_write_reg+0
;ili932x.c,307 :: 		TFT_write_reg(0x0051, (w + x_pos));
ADDS	R4, R7, R5
; w end address is: 28 (R7)
UXTH	R1, R4
MOVS	R0, #81
BL	_TFT_write_reg+0
;ili932x.c,308 :: 		TFT_write_reg(0x0052, y_pos);
UXTH	R1, R6
MOVS	R0, #82
BL	_TFT_write_reg+0
;ili932x.c,309 :: 		TFT_write_reg(0x0053, (h + y_pos));
ADD	R4, R8, R6, LSL #0
; h end address is: 32 (R8)
UXTH	R1, R4
MOVS	R0, #83
BL	_TFT_write_reg+0
;ili932x.c,310 :: 		TFT_set_cursor(x_pos, y_pos);
UXTH	R1, R6
; y_pos end address is: 24 (R6)
UXTH	R0, R5
; x_pos end address is: 20 (R5)
BL	_TFT_set_cursor+0
;ili932x.c,311 :: 		}
L_end_TFT_set_display_window:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_display_window
_Get_Pixel:
;ili932x.c,314 :: 		unsigned int Get_Pixel(unsigned int x_pos, unsigned int y_pos)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
;ili932x.c,316 :: 		unsigned int value = 0x0000;
;ili932x.c,318 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ili932x.c,319 :: 		TFT_CS_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,320 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ili932x.c,321 :: 		value = TFT_read(0x0000, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_read+0
;ili932x.c,322 :: 		value = TFT_read(0x0000, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_read+0
;ili932x.c,323 :: 		TFT_CS_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili932x.c,324 :: 		value = TFT_BGR2RGB(value);
BL	_TFT_BGR2RGB+0
;ili932x.c,326 :: 		return value;
;ili932x.c,327 :: 		}
L_end_Get_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Get_Pixel
_Draw_Pixel:
;ili932x.c,330 :: 		void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour)
; colour start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R6, R2
; colour end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; colour start address is: 24 (R6)
;ili932x.c,332 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ili932x.c,333 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ili932x.c,334 :: 		TFT_write(colour, DAT);
MOVS	R1, #1
UXTH	R0, R6
; colour end address is: 24 (R6)
BL	_TFT_write+0
;ili932x.c,335 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Line:
;ili932x.c,338 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
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
LDRH	R9, [SP, #16]
;ili932x.c,340 :: 		signed int dx = 0x0000;
;ili932x.c,341 :: 		signed int dy = 0x0000;
;ili932x.c,342 :: 		signed int stepx = 0x0000;
;ili932x.c,343 :: 		signed int stepy = 0x0000;
;ili932x.c,344 :: 		signed int fraction = 0x0000;
;ili932x.c,346 :: 		dy = (y2 - y1);
SUB	R5, R12, R8, LSL #0
SXTH	R5, R5
; dy start address is: 4 (R1)
SXTH	R1, R5
;ili932x.c,347 :: 		dx = (x2 - x1);
SUB	R0, R11, R7, LSL #0
SXTH	R0, R0
; dx start address is: 0 (R0)
;ili932x.c,349 :: 		if(dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line38
;ili932x.c,351 :: 		dy = -dy;
RSBS	R1, R1, #0
SXTH	R1, R1
;ili932x.c,352 :: 		stepy = -1;
; stepy start address is: 40 (R10)
MOVW	R10, #65535
SXTH	R10, R10
;ili932x.c,353 :: 		}
; stepy end address is: 40 (R10)
IT	AL
BAL	L_Draw_Line39
L_Draw_Line38:
;ili932x.c,356 :: 		stepy = 1;
; stepy start address is: 40 (R10)
MOVW	R10, #1
SXTH	R10, R10
; dy end address is: 4 (R1)
; stepy end address is: 40 (R10)
;ili932x.c,357 :: 		}
L_Draw_Line39:
;ili932x.c,359 :: 		if(dx < 0)
; stepy start address is: 40 (R10)
; dy start address is: 4 (R1)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line40
;ili932x.c,361 :: 		dx = -dx;
RSBS	R0, R0, #0
SXTH	R0, R0
;ili932x.c,362 :: 		stepx = -1;
; stepx start address is: 8 (R2)
MOVW	R2, #65535
SXTH	R2, R2
;ili932x.c,363 :: 		}
; stepx end address is: 8 (R2)
IT	AL
BAL	L_Draw_Line41
L_Draw_Line40:
;ili932x.c,366 :: 		stepx = 1;
; stepx start address is: 8 (R2)
MOVS	R2, #1
SXTH	R2, R2
; stepx end address is: 8 (R2)
; dx end address is: 0 (R0)
;ili932x.c,367 :: 		}
L_Draw_Line41:
;ili932x.c,369 :: 		dx <<= 0x01;
; stepx start address is: 8 (R2)
; dx start address is: 0 (R0)
LSLS	R0, R0, #1
SXTH	R0, R0
;ili932x.c,370 :: 		dy <<= 0x01;
LSLS	R4, R1, #1
; dy end address is: 4 (R1)
; dy start address is: 12 (R3)
SXTH	R3, R4
;ili932x.c,372 :: 		Draw_Pixel(x1, y1, colour);
STRH	R3, [SP, #4]
STRH	R0, [SP, #6]
STRH	R2, [SP, #8]
UXTH	R2, R9
UXTH	R1, R8
UXTH	R0, R7
BL	_Draw_Pixel+0
LDRSH	R2, [SP, #8]
LDRSH	R0, [SP, #6]
LDRSH	R3, [SP, #4]
;ili932x.c,374 :: 		if(dx > dy)
CMP	R0, R3
IT	LE
BLE	L_Draw_Line42
; y2 end address is: 48 (R12)
;ili932x.c,376 :: 		fraction = (dy - (dx >> 1));
ASRS	R4, R0, #1
SXTH	R4, R4
SUB	R1, R3, R4
SXTH	R1, R1
; fraction start address is: 4 (R1)
; x2 end address is: 44 (R11)
; stepx end address is: 8 (R2)
; dx end address is: 0 (R0)
; dy end address is: 12 (R3)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; fraction end address is: 4 (R1)
SXTH	R12, R0
SXTH	R0, R2
SXTH	R2, R11
SXTH	R11, R3
SXTH	R3, R7
;ili932x.c,377 :: 		while(x1 != x2)
L_Draw_Line43:
; fraction start address is: 4 (R1)
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
; x2 start address is: 8 (R2)
; y1 start address is: 32 (R8)
; x1 start address is: 12 (R3)
CMP	R3, R2
IT	EQ
BEQ	L_Draw_Line44
; dy end address is: 44 (R11)
; dx end address is: 48 (R12)
; stepx end address is: 0 (R0)
; colour end address is: 36 (R9)
; stepy end address is: 40 (R10)
;ili932x.c,379 :: 		if(fraction >= 0)
; stepy start address is: 40 (R10)
; colour start address is: 36 (R9)
; stepx start address is: 0 (R0)
; dx start address is: 48 (R12)
; dy start address is: 44 (R11)
CMP	R1, #0
IT	LT
BLT	L__Draw_Line263
;ili932x.c,381 :: 		y1 += stepy;
ADD	R8, R8, R10, LSL #0
SXTH	R8, R8
;ili932x.c,382 :: 		fraction -= dx;
SUB	R1, R1, R12, LSL #0
SXTH	R1, R1
; y1 end address is: 32 (R8)
; fraction end address is: 4 (R1)
;ili932x.c,383 :: 		}
IT	AL
BAL	L_Draw_Line45
L__Draw_Line263:
;ili932x.c,379 :: 		if(fraction >= 0)
;ili932x.c,383 :: 		}
L_Draw_Line45:
;ili932x.c,384 :: 		x1 += stepx;
; fraction start address is: 4 (R1)
; y1 start address is: 32 (R8)
ADDS	R5, R3, R0
; x1 end address is: 12 (R3)
; x1 start address is: 28 (R7)
SXTH	R7, R5
;ili932x.c,385 :: 		fraction += dy;
ADD	R1, R1, R11, LSL #0
SXTH	R1, R1
;ili932x.c,387 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R2, [SP, #8]
STRH	R0, [SP, #10]
UXTH	R2, R9
UXTH	R1, R8
UXTH	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #10]
LDRSH	R2, [SP, #8]
LDRSH	R1, [SP, #4]
;ili932x.c,388 :: 		}
SXTH	R3, R7
; dy end address is: 44 (R11)
; dx end address is: 48 (R12)
; stepx end address is: 0 (R0)
; colour end address is: 36 (R9)
; x2 end address is: 8 (R2)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; fraction end address is: 4 (R1)
; stepy end address is: 40 (R10)
IT	AL
BAL	L_Draw_Line43
L_Draw_Line44:
;ili932x.c,389 :: 		}
IT	AL
BAL	L_Draw_Line46
L_Draw_Line42:
;ili932x.c,392 :: 		fraction = (dx - (dy >> 1));
; y2 start address is: 48 (R12)
; stepy start address is: 40 (R10)
; x1 start address is: 28 (R7)
; y1 start address is: 32 (R8)
; colour start address is: 36 (R9)
; dy start address is: 12 (R3)
; dx start address is: 0 (R0)
; stepx start address is: 8 (R2)
ASRS	R4, R3, #1
SXTH	R4, R4
SUB	R4, R0, R4
; fraction start address is: 4 (R1)
SXTH	R1, R4
; stepx end address is: 8 (R2)
; dx end address is: 0 (R0)
; dy end address is: 12 (R3)
; colour end address is: 36 (R9)
; y1 end address is: 32 (R8)
; x1 end address is: 28 (R7)
; fraction end address is: 4 (R1)
; y2 end address is: 48 (R12)
STRH	R0, [SP, #4]
UXTH	R11, R9
SXTH	R9, R2
SXTH	R2, R1
SXTH	R1, R7
SXTH	R7, R3
SXTH	R0, R8
LDRSH	R8, [SP, #4]
;ili932x.c,394 :: 		while(y1 != y2)
L_Draw_Line47:
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
BEQ	L_Draw_Line48
; dy end address is: 28 (R7)
; dx end address is: 32 (R8)
; stepx end address is: 36 (R9)
; stepy end address is: 40 (R10)
; colour end address is: 44 (R11)
;ili932x.c,396 :: 		if (fraction >= 0)
; colour start address is: 44 (R11)
; stepy start address is: 40 (R10)
; stepx start address is: 36 (R9)
; dx start address is: 32 (R8)
; dy start address is: 28 (R7)
CMP	R2, #0
IT	LT
BLT	L__Draw_Line264
;ili932x.c,398 :: 		x1 += stepx;
ADD	R1, R1, R9, LSL #0
SXTH	R1, R1
;ili932x.c,399 :: 		fraction -= dy;
SUB	R2, R2, R7
SXTH	R2, R2
; x1 end address is: 4 (R1)
; fraction end address is: 8 (R2)
;ili932x.c,400 :: 		}
IT	AL
BAL	L_Draw_Line49
L__Draw_Line264:
;ili932x.c,396 :: 		if (fraction >= 0)
;ili932x.c,400 :: 		}
L_Draw_Line49:
;ili932x.c,401 :: 		y1 += stepy;
; fraction start address is: 8 (R2)
; x1 start address is: 4 (R1)
ADD	R5, R0, R10, LSL #0
SXTH	R0, R5
;ili932x.c,402 :: 		fraction += dx;
ADD	R2, R2, R8, LSL #0
SXTH	R2, R2
;ili932x.c,403 :: 		Draw_Pixel(x1, y1, colour);
STRH	R2, [SP, #4]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
UXTH	R2, R11
UXTH	R0, R1
UXTH	R1, R5
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #8]
LDRSH	R2, [SP, #4]
;ili932x.c,404 :: 		}
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
BAL	L_Draw_Line47
L_Draw_Line48:
;ili932x.c,405 :: 		}
L_Draw_Line46:
;ili932x.c,406 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Draw_Line
_Draw_V_Line:
;ili932x.c,409 :: 		void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
; colour start address is: 12 (R3)
; x1 start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
SXTH	R6, R0
STRH	R1, [SP, #4]
STRH	R2, [SP, #8]
UXTH	R7, R3
; colour end address is: 12 (R3)
; x1 end address is: 0 (R0)
; x1 start address is: 24 (R6)
; colour start address is: 28 (R7)
;ili932x.c,411 :: 		signed int pos = 0;
;ili932x.c,412 :: 		signed int temp = 0;
;ili932x.c,414 :: 		if(y1 > y2)
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line50
;ili932x.c,416 :: 		swap(&y1, &y2);
ADD	R5, SP, #8
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,417 :: 		}
L_Draw_V_Line50:
;ili932x.c,419 :: 		while(y2 > (y1 - 1))
SXTH	R8, R6
L_Draw_V_Line51:
; x1 end address is: 24 (R6)
; x1 start address is: 32 (R8)
; colour start address is: 28 (R7)
; colour end address is: 28 (R7)
; x1 start address is: 32 (R8)
; x1 end address is: 32 (R8)
LDRSH	R4, [SP, #4]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line52
; colour end address is: 28 (R7)
; x1 end address is: 32 (R8)
;ili932x.c,421 :: 		Draw_Pixel(x1, y2, colour);
; x1 start address is: 32 (R8)
; colour start address is: 28 (R7)
UXTH	R2, R7
LDRSH	R1, [SP, #8]
UXTH	R0, R8
BL	_Draw_Pixel+0
;ili932x.c,422 :: 		y2--;
LDRSH	R4, [SP, #8]
SUBS	R4, R4, #1
STRH	R4, [SP, #8]
;ili932x.c,423 :: 		}
; colour end address is: 28 (R7)
; x1 end address is: 32 (R8)
IT	AL
BAL	L_Draw_V_Line51
L_Draw_V_Line52:
;ili932x.c,424 :: 		}
L_end_Draw_V_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_V_Line
_Draw_H_Line:
;ili932x.c,427 :: 		void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
; colour start address is: 12 (R3)
; y1 start address is: 8 (R2)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
SXTH	R6, R2
UXTH	R7, R3
; colour end address is: 12 (R3)
; y1 end address is: 8 (R2)
; y1 start address is: 24 (R6)
; colour start address is: 28 (R7)
;ili932x.c,429 :: 		signed int pos = 0;
;ili932x.c,430 :: 		signed int temp = 0;
;ili932x.c,432 :: 		if(x1 > x2)
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line53
;ili932x.c,434 :: 		swap(&x1, &x2);
ADD	R5, SP, #8
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,435 :: 		}
L_Draw_H_Line53:
;ili932x.c,437 :: 		while(x2 > (x1 - 1))
SXTH	R8, R6
L_Draw_H_Line54:
; y1 end address is: 24 (R6)
; y1 start address is: 32 (R8)
; colour start address is: 28 (R7)
; colour end address is: 28 (R7)
; y1 start address is: 32 (R8)
; y1 end address is: 32 (R8)
LDRSH	R4, [SP, #4]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line55
; colour end address is: 28 (R7)
; y1 end address is: 32 (R8)
;ili932x.c,439 :: 		Draw_Pixel(x2, y1, colour);
; y1 start address is: 32 (R8)
; colour start address is: 28 (R7)
UXTH	R2, R7
UXTH	R1, R8
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;ili932x.c,440 :: 		x2--;
LDRSH	R4, [SP, #8]
SUBS	R4, R4, #1
STRH	R4, [SP, #8]
;ili932x.c,441 :: 		}
; colour end address is: 28 (R7)
; y1 end address is: 32 (R8)
IT	AL
BAL	L_Draw_H_Line54
L_Draw_H_Line55:
;ili932x.c,442 :: 		}
L_end_Draw_H_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_H_Line
_Draw_Triangle:
;ili932x.c,445 :: 		void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
SUB	SP, SP, #40
STR	LR, [SP, #0]
STRH	R0, [SP, #24]
STRH	R1, [SP, #28]
STRH	R2, [SP, #32]
STRH	R3, [SP, #36]
LDRSH	R4, [SP, #40]
STRH	R4, [SP, #40]
LDRSH	R4, [SP, #44]
STRH	R4, [SP, #44]
; fill start address is: 0 (R0)
LDRB	R0, [SP, #48]
LDRH	R4, [SP, #52]
STRH	R4, [SP, #52]
;ili932x.c,447 :: 		signed int a = 0;
MOVW	R4, #0
STRH	R4, [SP, #4]
MOVW	R4, #0
STRH	R4, [SP, #6]
;ili932x.c,448 :: 		signed int b = 0;
;ili932x.c,449 :: 		signed int sa = 0;
;ili932x.c,450 :: 		signed int sb = 0;
;ili932x.c,451 :: 		signed int yp = 0;
;ili932x.c,452 :: 		signed int last = 0;
;ili932x.c,453 :: 		signed int dx12 = 0;
;ili932x.c,454 :: 		signed int dx23 = 0;
;ili932x.c,455 :: 		signed int dx13 = 0;
;ili932x.c,456 :: 		signed int dy12 = 0;
;ili932x.c,457 :: 		signed int dy23 = 0;
;ili932x.c,458 :: 		signed int dy13 = 0;
;ili932x.c,460 :: 		switch(fill)
IT	AL
BAL	L_Draw_Triangle56
; fill end address is: 0 (R0)
;ili932x.c,462 :: 		case YES:
L_Draw_Triangle58:
;ili932x.c,464 :: 		if(y1 > y2)
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle59
;ili932x.c,466 :: 		swap(&y1, &y2);
ADD	R5, SP, #36
ADD	R4, SP, #28
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,467 :: 		swap(&x1, &x2);
ADD	R5, SP, #32
ADD	R4, SP, #24
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,468 :: 		}
L_Draw_Triangle59:
;ili932x.c,469 :: 		if(y2 > y3)
LDRSH	R5, [SP, #44]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle60
;ili932x.c,471 :: 		swap(&y3, &y2);
ADD	R5, SP, #36
ADD	R4, SP, #44
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,472 :: 		swap(&x3, &x2);
ADD	R5, SP, #32
ADD	R4, SP, #40
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,473 :: 		}
L_Draw_Triangle60:
;ili932x.c,474 :: 		if(y1 > y2)
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle61
;ili932x.c,476 :: 		swap(&y1, &y2);
ADD	R5, SP, #36
ADD	R4, SP, #28
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,477 :: 		swap(&x1, &x2);
ADD	R5, SP, #32
ADD	R4, SP, #24
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,478 :: 		}
L_Draw_Triangle61:
;ili932x.c,480 :: 		if(y1 == y3)
LDRSH	R5, [SP, #44]
LDRSH	R4, [SP, #28]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle62
;ili932x.c,482 :: 		a = b = x1;
LDRSH	R4, [SP, #24]
STRH	R4, [SP, #6]
LDRSH	R4, [SP, #24]
STRH	R4, [SP, #4]
;ili932x.c,484 :: 		if(x2 < a)
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle63
;ili932x.c,486 :: 		a = x2;
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #4]
;ili932x.c,487 :: 		}
IT	AL
BAL	L_Draw_Triangle64
L_Draw_Triangle63:
;ili932x.c,488 :: 		else if(x2 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle65
;ili932x.c,490 :: 		b = x2;
LDRSH	R4, [SP, #32]
STRH	R4, [SP, #6]
;ili932x.c,491 :: 		}
L_Draw_Triangle65:
L_Draw_Triangle64:
;ili932x.c,492 :: 		if(x2 < a)
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle66
;ili932x.c,494 :: 		a = x3;
LDRSH	R4, [SP, #40]
STRH	R4, [SP, #4]
;ili932x.c,495 :: 		}
IT	AL
BAL	L_Draw_Triangle67
L_Draw_Triangle66:
;ili932x.c,496 :: 		else if(x3 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #40]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle68
;ili932x.c,498 :: 		b = x3;
LDRSH	R4, [SP, #40]
STRH	R4, [SP, #6]
;ili932x.c,499 :: 		}
L_Draw_Triangle68:
L_Draw_Triangle67:
;ili932x.c,501 :: 		Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #52]
LDRSH	R2, [SP, #28]
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili932x.c,502 :: 		return;
IT	AL
BAL	L_end_Draw_Triangle
;ili932x.c,503 :: 		}
L_Draw_Triangle62:
;ili932x.c,505 :: 		dx12 = (x2 - x1);
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #32]
SUB	R4, R4, R5
STRH	R4, [SP, #14]
;ili932x.c,506 :: 		dy12 = (y2 - y1);
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #36]
SUB	R4, R4, R5
STRH	R4, [SP, #18]
;ili932x.c,507 :: 		dx13 = (x3 - x1);
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #40]
SUB	R4, R4, R5
STRH	R4, [SP, #16]
;ili932x.c,508 :: 		dy13 = (y3 - y1);
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #44]
SUB	R4, R4, R5
STRH	R4, [SP, #20]
;ili932x.c,509 :: 		dx23 = (x3 - x2);
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #40]
SUB	R10, R4, R5, LSL #0
SXTH	R10, R10
; dx23 start address is: 40 (R10)
;ili932x.c,510 :: 		dy23 = (y3 - y2);
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #44]
SUB	R12, R4, R5, LSL #0
SXTH	R12, R12
; dy23 start address is: 48 (R12)
;ili932x.c,511 :: 		sa = 0,
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #8]
;ili932x.c,512 :: 		sb = 0;
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #10]
;ili932x.c,514 :: 		if(y2 == y3)
LDRSH	R5, [SP, #44]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle69
;ili932x.c,516 :: 		last = y2;
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #12]
;ili932x.c,517 :: 		}
IT	AL
BAL	L_Draw_Triangle70
L_Draw_Triangle69:
;ili932x.c,520 :: 		last = (y2 - 1);
LDRSH	R4, [SP, #36]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ili932x.c,521 :: 		}
L_Draw_Triangle70:
;ili932x.c,523 :: 		for(yp = y1; yp <= last; yp++)
; yp start address is: 36 (R9)
LDRSH	R9, [SP, #28]
; dx23 end address is: 40 (R10)
; dy23 end address is: 48 (R12)
; yp end address is: 36 (R9)
L_Draw_Triangle71:
; yp start address is: 36 (R9)
; dy23 start address is: 48 (R12)
; dx23 start address is: 40 (R10)
LDRSH	R4, [SP, #12]
CMP	R9, R4
IT	GT
BGT	L_Draw_Triangle72
;ili932x.c,525 :: 		a = (x1 + (sa / dy12));
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #24]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ili932x.c,526 :: 		b = (x1 + (sb / dy13));
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #24]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ili932x.c,527 :: 		sa += dx12;
LDRSH	R5, [SP, #14]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
;ili932x.c,528 :: 		sb += dx13;
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ili932x.c,529 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle74
;ili932x.c,531 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,532 :: 		}
L_Draw_Triangle74:
;ili932x.c,533 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #52]
SXTH	R2, R9
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili932x.c,523 :: 		for(yp = y1; yp <= last; yp++)
ADD	R0, R9, #1
SXTH	R0, R0
; yp end address is: 36 (R9)
; yp start address is: 0 (R0)
;ili932x.c,534 :: 		}
; yp end address is: 0 (R0)
SXTH	R9, R0
IT	AL
BAL	L_Draw_Triangle71
L_Draw_Triangle72:
;ili932x.c,536 :: 		sa = (dx23 * (yp - y2));
; yp start address is: 36 (R9)
LDRSH	R4, [SP, #36]
SUB	R4, R9, R4, LSL #0
SXTH	R4, R4
MUL	R4, R10, R4
STRH	R4, [SP, #8]
;ili932x.c,537 :: 		sb = (dx13 * (yp - y1));
LDRSH	R4, [SP, #28]
SUB	R5, R9, R4, LSL #0
SXTH	R5, R5
LDRSH	R4, [SP, #16]
MULS	R4, R5, R4
STRH	R4, [SP, #10]
; yp end address is: 36 (R9)
;ili932x.c,538 :: 		for(; yp <= y3; yp++)
L_Draw_Triangle75:
; dx23 start address is: 40 (R10)
; dx23 end address is: 40 (R10)
; dy23 start address is: 48 (R12)
; dy23 end address is: 48 (R12)
; yp start address is: 36 (R9)
LDRSH	R4, [SP, #44]
CMP	R9, R4
IT	GT
BGT	L_Draw_Triangle76
; dx23 end address is: 40 (R10)
; dy23 end address is: 48 (R12)
;ili932x.c,540 :: 		a = (x2 + (sa / dy23));
; dy23 start address is: 48 (R12)
; dx23 start address is: 40 (R10)
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R12
SXTH	R5, R5
LDRSH	R4, [SP, #32]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ili932x.c,541 :: 		b = (x1 + (sb / dy13));
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #24]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ili932x.c,542 :: 		sa += dx23;
LDRSH	R4, [SP, #8]
ADD	R4, R4, R10, LSL #0
STRH	R4, [SP, #8]
;ili932x.c,543 :: 		sb += dx13;
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ili932x.c,545 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle78
;ili932x.c,547 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili932x.c,548 :: 		}
L_Draw_Triangle78:
;ili932x.c,549 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #52]
SXTH	R2, R9
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili932x.c,538 :: 		for(; yp <= y3; yp++)
ADD	R4, R9, #1
; yp end address is: 36 (R9)
; yp start address is: 0 (R0)
SXTH	R0, R4
;ili932x.c,550 :: 		}
SXTH	R9, R0
; dx23 end address is: 40 (R10)
; dy23 end address is: 48 (R12)
; yp end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle75
L_Draw_Triangle76:
;ili932x.c,553 :: 		break;
IT	AL
BAL	L_Draw_Triangle57
;ili932x.c,555 :: 		default:
L_Draw_Triangle79:
;ili932x.c,557 :: 		Draw_Line(x1, y1, x2, y2, colour);
LDRH	R4, [SP, #52]
LDRSH	R3, [SP, #36]
LDRSH	R2, [SP, #32]
LDRSH	R1, [SP, #28]
LDRSH	R0, [SP, #24]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili932x.c,558 :: 		Draw_Line(x2, y2, x3, y3, colour);
LDRH	R4, [SP, #52]
LDRSH	R3, [SP, #44]
LDRSH	R2, [SP, #40]
LDRSH	R1, [SP, #36]
LDRSH	R0, [SP, #32]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili932x.c,559 :: 		Draw_Line(x3, y3, x1, y1, colour);
LDRH	R4, [SP, #52]
LDRSH	R3, [SP, #28]
LDRSH	R2, [SP, #24]
LDRSH	R1, [SP, #44]
LDRSH	R0, [SP, #40]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili932x.c,560 :: 		break;
IT	AL
BAL	L_Draw_Triangle57
;ili932x.c,562 :: 		}
L_Draw_Triangle56:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Triangle58
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle79
L_Draw_Triangle57:
;ili932x.c,563 :: 		}
L_end_Draw_Triangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #40
BX	LR
; end of _Draw_Triangle
_Draw_Rectangle:
;ili932x.c,566 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
SXTH	R9, R0
SXTH	R10, R1
SXTH	R11, R2
SXTH	R12, R3
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 36 (R9)
; y1 start address is: 40 (R10)
; x2 start address is: 44 (R11)
; y2 start address is: 48 (R12)
; fill start address is: 0 (R0)
LDRB	R0, [SP, #12]
LDRB	R4, [SP, #16]
STRB	R4, [SP, #16]
LDRH	R4, [SP, #20]
STRH	R4, [SP, #20]
LDRH	R4, [SP, #24]
STRH	R4, [SP, #24]
;ili932x.c,568 :: 		signed int i = 0x0000;
;ili932x.c,569 :: 		signed int xmin = 0x0000;
;ili932x.c,570 :: 		signed int xmax = 0x0000;
;ili932x.c,571 :: 		signed int ymin = 0x0000;
;ili932x.c,572 :: 		signed int ymax = 0x0000;
;ili932x.c,574 :: 		switch(fill)
IT	AL
BAL	L_Draw_Rectangle80
; fill end address is: 0 (R0)
;ili932x.c,576 :: 		case YES:
L_Draw_Rectangle82:
;ili932x.c,578 :: 		if(x1 < x2)
CMP	R9, R11
IT	GE
BGE	L_Draw_Rectangle83
;ili932x.c,580 :: 		xmin = x1;
; xmin start address is: 20 (R5)
SXTH	R5, R9
;ili932x.c,581 :: 		xmax = x2;
STRH	R11, [SP, #4]
;ili932x.c,582 :: 		}
SXTH	R6, R5
; xmin end address is: 20 (R5)
IT	AL
BAL	L_Draw_Rectangle84
L_Draw_Rectangle83:
;ili932x.c,585 :: 		xmin = x2;
; xmin start address is: 20 (R5)
SXTH	R5, R11
;ili932x.c,586 :: 		xmax = x1;
STRH	R9, [SP, #4]
; xmin end address is: 20 (R5)
SXTH	R6, R5
;ili932x.c,587 :: 		}
L_Draw_Rectangle84:
;ili932x.c,589 :: 		if(y1 < y2)
; xmin start address is: 24 (R6)
CMP	R10, R12
IT	GE
BGE	L_Draw_Rectangle85
;ili932x.c,591 :: 		ymin = y1;
STRH	R10, [SP, #6]
;ili932x.c,592 :: 		ymax = y2;
STRH	R12, [SP, #8]
;ili932x.c,593 :: 		}
IT	AL
BAL	L_Draw_Rectangle86
L_Draw_Rectangle85:
;ili932x.c,596 :: 		ymin = y2;
STRH	R12, [SP, #6]
;ili932x.c,597 :: 		ymax = y1;
STRH	R10, [SP, #8]
;ili932x.c,598 :: 		}
L_Draw_Rectangle86:
;ili932x.c,600 :: 		for(; xmin <= xmax; ++xmin)
SXTH	R7, R9
; x1 end address is: 36 (R9)
; y2 end address is: 48 (R12)
; xmin end address is: 24 (R6)
; x2 end address is: 44 (R11)
; y1 end address is: 40 (R10)
SXTH	R0, R10
SXTH	R1, R11
SXTH	R2, R12
L_Draw_Rectangle87:
; xmin start address is: 24 (R6)
; y2 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; y1 start address is: 0 (R0)
; x1 start address is: 28 (R7)
LDRSH	R4, [SP, #4]
CMP	R6, R4
IT	GT
BGT	L_Draw_Rectangle88
;ili932x.c,602 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 32 (R8)
LDRSH	R8, [SP, #6]
; y2 end address is: 8 (R2)
; x2 end address is: 4 (R1)
; y1 end address is: 0 (R0)
; i end address is: 32 (R8)
; xmin end address is: 24 (R6)
; x1 end address is: 28 (R7)
SXTH	R9, R8
SXTH	R8, R7
SXTH	R7, R6
SXTH	R12, R2
SXTH	R11, R1
SXTH	R10, R0
L_Draw_Rectangle90:
; i start address is: 36 (R9)
; x1 start address is: 32 (R8)
; y1 start address is: 40 (R10)
; x2 start address is: 44 (R11)
; y2 start address is: 48 (R12)
; xmin start address is: 28 (R7)
LDRSH	R4, [SP, #8]
CMP	R9, R4
IT	GT
BGT	L_Draw_Rectangle91
;ili932x.c,604 :: 		Draw_Pixel(xmin, i, colour);
LDRH	R2, [SP, #20]
UXTH	R1, R9
UXTH	R0, R7
BL	_Draw_Pixel+0
;ili932x.c,602 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R9, #1
; i end address is: 36 (R9)
; i start address is: 12 (R3)
SXTH	R3, R4
;ili932x.c,605 :: 		}
; i end address is: 12 (R3)
SXTH	R9, R3
IT	AL
BAL	L_Draw_Rectangle90
L_Draw_Rectangle91:
;ili932x.c,600 :: 		for(; xmin <= xmax; ++xmin)
ADDS	R4, R7, #1
; xmin end address is: 28 (R7)
; xmin start address is: 24 (R6)
SXTH	R6, R4
;ili932x.c,606 :: 		}
SXTH	R7, R8
; x1 end address is: 32 (R8)
; y2 end address is: 48 (R12)
; xmin end address is: 24 (R6)
; x2 end address is: 44 (R11)
; y1 end address is: 40 (R10)
SXTH	R0, R10
SXTH	R1, R11
SXTH	R2, R12
IT	AL
BAL	L_Draw_Rectangle87
L_Draw_Rectangle88:
;ili932x.c,608 :: 		break;
; x1 start address is: 28 (R7)
; y1 start address is: 0 (R0)
; x2 start address is: 4 (R1)
; y2 start address is: 8 (R2)
; y2 end address is: 8 (R2)
; x2 end address is: 4 (R1)
; y1 end address is: 0 (R0)
; x1 end address is: 28 (R7)
SXTH	R10, R0
SXTH	R11, R1
SXTH	R8, R2
IT	AL
BAL	L_Draw_Rectangle81
;ili932x.c,610 :: 		default:
L_Draw_Rectangle93:
;ili932x.c,612 :: 		Draw_V_Line(x1, y1, y2, colour);
; y1 start address is: 40 (R10)
; x2 start address is: 44 (R11)
; y2 start address is: 48 (R12)
; x1 start address is: 36 (R9)
LDRH	R3, [SP, #20]
SXTH	R2, R12
SXTH	R1, R10
SXTH	R0, R9
BL	_Draw_V_Line+0
;ili932x.c,613 :: 		Draw_V_Line(x2, y1, y2, colour);
LDRH	R3, [SP, #20]
SXTH	R2, R12
SXTH	R1, R10
SXTH	R0, R11
BL	_Draw_V_Line+0
;ili932x.c,614 :: 		Draw_H_Line(x1, x2, y1, colour);
LDRH	R3, [SP, #20]
SXTH	R2, R10
SXTH	R1, R11
SXTH	R0, R9
BL	_Draw_H_Line+0
;ili932x.c,615 :: 		Draw_H_Line(x1, x2, y2, colour);
LDRH	R3, [SP, #20]
SXTH	R2, R12
SXTH	R1, R11
SXTH	R0, R9
BL	_Draw_H_Line+0
;ili932x.c,616 :: 		break;
SXTH	R7, R9
SXTH	R8, R12
IT	AL
BAL	L_Draw_Rectangle81
;ili932x.c,618 :: 		}
L_Draw_Rectangle80:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Rectangle82
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Rectangle93
; x1 end address is: 36 (R9)
; y2 end address is: 48 (R12)
; x2 end address is: 44 (R11)
; y1 end address is: 40 (R10)
L_Draw_Rectangle81:
;ili932x.c,620 :: 		if(type != SQUARE)
; y2 start address is: 32 (R8)
; x2 start address is: 44 (R11)
; y1 start address is: 40 (R10)
; x1 start address is: 28 (R7)
LDRB	R4, [SP, #16]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle94
;ili932x.c,622 :: 		Draw_Pixel(x1, y1, back_colour);
LDRH	R2, [SP, #24]
UXTH	R1, R10
UXTH	R0, R7
BL	_Draw_Pixel+0
;ili932x.c,623 :: 		Draw_Pixel(x1, y2, back_colour);
LDRH	R2, [SP, #24]
UXTH	R1, R8
UXTH	R0, R7
; x1 end address is: 28 (R7)
BL	_Draw_Pixel+0
;ili932x.c,624 :: 		Draw_Pixel(x2, y1, back_colour);
LDRH	R2, [SP, #24]
UXTH	R1, R10
; y1 end address is: 40 (R10)
UXTH	R0, R11
BL	_Draw_Pixel+0
;ili932x.c,625 :: 		Draw_Pixel(x2, y2, back_colour);
LDRH	R2, [SP, #24]
UXTH	R1, R8
; y2 end address is: 32 (R8)
UXTH	R0, R11
; x2 end address is: 44 (R11)
BL	_Draw_Pixel+0
;ili932x.c,626 :: 		}
L_Draw_Rectangle94:
;ili932x.c,627 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_Rectangle
_Draw_H_Bar:
;ili932x.c,630 :: 		void Draw_H_Bar(signed int x1, signed int x2, signed int y1, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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
;ili932x.c,632 :: 		switch(border)
IT	AL
BAL	L_Draw_H_Bar95
; border end address is: 16 (R4)
;ili932x.c,634 :: 		case YES:
L_Draw_H_Bar97:
;ili932x.c,636 :: 		Draw_Rectangle((x1 + 1), (y1 + 1), (x1 + bar_value), (y1 + bar_width - 1), YES, SQUARE, bar_colour, back_colour);
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
;ili932x.c,637 :: 		Draw_Rectangle((x2 - 1), (y1 + 1), (x1 + bar_value + 1), (y1 + bar_width - 1), YES, SQUARE, back_colour, back_colour);
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
;ili932x.c,638 :: 		Draw_Rectangle(x1, y1, x2, (y1 + bar_width), NO, SQUARE, border_colour, back_colour);
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
;ili932x.c,639 :: 		break;
IT	AL
BAL	L_Draw_H_Bar96
;ili932x.c,641 :: 		default:
L_Draw_H_Bar98:
;ili932x.c,643 :: 		Draw_Rectangle(x1, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, bar_colour, back_colour);
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
;ili932x.c,644 :: 		Draw_Rectangle(x2, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, back_colour, back_colour);
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
;ili932x.c,645 :: 		break;
IT	AL
BAL	L_Draw_H_Bar96
;ili932x.c,647 :: 		}
L_Draw_H_Bar95:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y1 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_H_Bar97
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_H_Bar98
; x1 end address is: 0 (R0)
; x2 end address is: 4 (R1)
; y1 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_H_Bar96:
;ili932x.c,648 :: 		}
L_end_Draw_H_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_H_Bar
_Draw_V_Bar:
;ili932x.c,651 :: 		void Draw_V_Bar(signed int x1, signed int y1, signed int y2, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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
;ili932x.c,653 :: 		switch(border)
IT	AL
BAL	L_Draw_V_Bar99
; border end address is: 16 (R4)
;ili932x.c,655 :: 		case YES:
L_Draw_V_Bar101:
;ili932x.c,657 :: 		Draw_Rectangle((x1 + 1), (y2 - 1), (x1 + bar_width - 1), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
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
;ili932x.c,658 :: 		Draw_Rectangle((x1 + 1), (y2 - bar_value - 1), (x1 + bar_width - 1), (y1 + 1), YES, SQUARE, back_colour, back_colour);
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
;ili932x.c,659 :: 		Draw_Rectangle(x1, y1, (x1 + bar_width), y2, NO, SQUARE, border_colour, back_colour);
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
;ili932x.c,660 :: 		break;
IT	AL
BAL	L_Draw_V_Bar100
;ili932x.c,662 :: 		default:
L_Draw_V_Bar102:
;ili932x.c,664 :: 		Draw_Rectangle(x1, y2, (x1 + bar_width), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
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
;ili932x.c,665 :: 		Draw_Rectangle(x1, (y2 - bar_value), (x1 + bar_width), y1, YES, SQUARE, back_colour, back_colour);
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
;ili932x.c,666 :: 		break;
IT	AL
BAL	L_Draw_V_Bar100
;ili932x.c,668 :: 		}
L_Draw_V_Bar99:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_V_Bar101
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_V_Bar102
; x1 end address is: 0 (R0)
; y1 end address is: 4 (R1)
; y2 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_V_Bar100:
;ili932x.c,669 :: 		}
L_end_Draw_V_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_V_Bar
_Draw_Circle:
;ili932x.c,672 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
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
;ili932x.c,674 :: 		signed int a = 0x0000;
MOVW	R4, #0
STRH	R4, [SP, #4]
;ili932x.c,675 :: 		signed int b = 0x0000;
;ili932x.c,676 :: 		signed int p = 0x0000;
;ili932x.c,678 :: 		b = radius;
STRH	R0, [SP, #6]
;ili932x.c,679 :: 		p = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #8]
;ili932x.c,681 :: 		do
L_Draw_Circle103:
;ili932x.c,683 :: 		switch(fill)
IT	AL
BAL	L_Draw_Circle106
;ili932x.c,685 :: 		case YES:
L_Draw_Circle108:
;ili932x.c,687 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
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
;ili932x.c,688 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
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
;ili932x.c,689 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
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
;ili932x.c,690 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
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
;ili932x.c,691 :: 		break;
IT	AL
BAL	L_Draw_Circle107
;ili932x.c,693 :: 		default:
L_Draw_Circle109:
;ili932x.c,695 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,696 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,697 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,698 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,699 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,700 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,701 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,702 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #16]
SUB	R6, R4, R5
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
;ili932x.c,703 :: 		break;
IT	AL
BAL	L_Draw_Circle107
;ili932x.c,705 :: 		}
L_Draw_Circle106:
LDRB	R4, [SP, #20]
CMP	R4, #1
IT	EQ
BEQ	L_Draw_Circle108
IT	AL
BAL	L_Draw_Circle109
L_Draw_Circle107:
;ili932x.c,707 :: 		if(p < 0)
LDRSH	R4, [SP, #8]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle110
;ili932x.c,709 :: 		p += (0x03 + (0x02 * a++));
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
;ili932x.c,710 :: 		}
IT	AL
BAL	L_Draw_Circle111
L_Draw_Circle110:
;ili932x.c,713 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
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
;ili932x.c,714 :: 		}
L_Draw_Circle111:
;ili932x.c,715 :: 		}while(a <= b);
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_Circle103
;ili932x.c,716 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_Draw_Font_Pixel:
;ili932x.c,720 :: 		void Draw_Font_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour, unsigned char pixel_size)
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
;ili932x.c,722 :: 		unsigned int i = 0x0000;
;ili932x.c,724 :: 		TFT_set_cursor(x_pos, y_pos);
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_cursor+0
;ili932x.c,725 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ili932x.c,727 :: 		for(i = 0x0000; i < (pixel_size * pixel_size); i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; pixel_size end address is: 28 (R7)
; i end address is: 0 (R0)
UXTB	R5, R7
UXTH	R7, R0
L_Draw_Font_Pixel112:
; i start address is: 28 (R7)
; pixel_size start address is: 20 (R5)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
MUL	R4, R5, R5
SXTH	R4, R4
CMP	R7, R4
IT	CS
BCS	L_Draw_Font_Pixel113
; colour end address is: 24 (R6)
;ili932x.c,729 :: 		TFT_write(colour, DAT);
; colour start address is: 24 (R6)
MOVS	R1, #1
UXTH	R0, R6
BL	_TFT_write+0
;ili932x.c,727 :: 		for(i = 0x0000; i < (pixel_size * pixel_size); i++)
ADDS	R7, R7, #1
UXTH	R7, R7
;ili932x.c,730 :: 		}
; pixel_size end address is: 20 (R5)
; colour end address is: 24 (R6)
; i end address is: 28 (R7)
IT	AL
BAL	L_Draw_Font_Pixel112
L_Draw_Font_Pixel113:
;ili932x.c,731 :: 		}
L_end_Draw_Font_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Font_Pixel
_print_char:
;ili932x.c,734 :: 		void print_char(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
; font_size start address is: 8 (R2)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
UXTB	R8, R2
STRH	R3, [SP, #16]
; font_size end address is: 8 (R2)
; font_size start address is: 32 (R8)
LDRH	R4, [SP, #20]
STRH	R4, [SP, #20]
LDRB	R4, [SP, #24]
STRB	R4, [SP, #24]
;ili932x.c,736 :: 		unsigned char i = 0x00;
;ili932x.c,737 :: 		unsigned char j = 0x00;
;ili932x.c,739 :: 		unsigned int value = 0x0000;
;ili932x.c,741 :: 		if(font_size <= 0)
CMP	R8, #0
IT	HI
BHI	L__print_char265
; font_size end address is: 32 (R8)
;ili932x.c,743 :: 		font_size = 1;
; font_size start address is: 20 (R5)
MOVS	R5, #1
; font_size end address is: 20 (R5)
UXTB	R8, R5
;ili932x.c,744 :: 		}
IT	AL
BAL	L_print_char115
L__print_char265:
;ili932x.c,741 :: 		if(font_size <= 0)
;ili932x.c,744 :: 		}
L_print_char115:
;ili932x.c,746 :: 		if(x_pos < font_size)
; font_size start address is: 32 (R8)
LDRH	R4, [SP, #8]
CMP	R4, R8
IT	CS
BCS	L_print_char116
;ili932x.c,748 :: 		x_pos = font_size;
STRH	R8, [SP, #8]
;ili932x.c,749 :: 		}
L_print_char116:
;ili932x.c,751 :: 		for(i = 0x00; i < 0x05; i++)
; i start address is: 48 (R12)
MOVW	R12, #0
; font_size end address is: 32 (R8)
; i end address is: 48 (R12)
UXTB	R0, R8
L_print_char117:
; i start address is: 48 (R12)
; font_size start address is: 0 (R0)
CMP	R12, #5
IT	CS
BCS	L_print_char118
;ili932x.c,753 :: 		for(j = 0x00; j < 0x08; j++)
MOVS	R4, #0
STRB	R4, [SP, #4]
; font_size end address is: 0 (R0)
; i end address is: 48 (R12)
UXTB	R8, R0
L_print_char120:
; font_size start address is: 32 (R8)
; i start address is: 48 (R12)
LDRB	R4, [SP, #4]
CMP	R4, #8
IT	CS
BCS	L_print_char121
;ili932x.c,756 :: 		value = ((font[((unsigned char)ch) - 0x20][i]));
LDRB	R4, [SP, #24]
SUBW	R5, R4, #32
SXTH	R5, R5
MOVS	R4, #5
MULS	R5, R4, R5
MOVW	R4, #lo_addr(tftdisp_font+0)
MOVT	R4, #hi_addr(tftdisp_font+0)
ADDS	R4, R4, R5
ADD	R4, R4, R12, LSL #0
LDRB	R4, [R4, #0]
; value start address is: 0 (R0)
UXTB	R0, R4
;ili932x.c,758 :: 		if(((value >> j) & 0x01) != 0x00)
LDRB	R4, [SP, #4]
LSR	R4, R0, R4
UXTH	R4, R4
; value end address is: 0 (R0)
AND	R4, R4, #1
UXTH	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_print_char123
;ili932x.c,760 :: 		Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
UXTB	R3, R8
LDRH	R2, [SP, #16]
LDRH	R1, [SP, #12]
LDRH	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;ili932x.c,761 :: 		}
IT	AL
BAL	L_print_char124
L_print_char123:
;ili932x.c,764 :: 		Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
UXTB	R3, R8
LDRH	R2, [SP, #20]
LDRH	R1, [SP, #12]
LDRH	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;ili932x.c,765 :: 		}
L_print_char124:
;ili932x.c,767 :: 		y_pos += font_size;
LDRH	R4, [SP, #12]
ADD	R4, R4, R8, LSL #0
STRH	R4, [SP, #12]
;ili932x.c,753 :: 		for(j = 0x00; j < 0x08; j++)
LDRB	R4, [SP, #4]
ADDS	R4, R4, #1
STRB	R4, [SP, #4]
;ili932x.c,768 :: 		}
IT	AL
BAL	L_print_char120
L_print_char121:
;ili932x.c,769 :: 		y_pos -= (font_size << 0x03);
LSL	R5, R8, #3
UXTH	R5, R5
LDRH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R4, [SP, #12]
;ili932x.c,770 :: 		x_pos++;
LDRH	R4, [SP, #8]
ADDS	R4, R4, #1
STRH	R4, [SP, #8]
;ili932x.c,751 :: 		for(i = 0x00; i < 0x05; i++)
ADD	R12, R12, #1
UXTB	R12, R12
;ili932x.c,771 :: 		}
UXTB	R0, R8
; font_size end address is: 32 (R8)
; i end address is: 48 (R12)
IT	AL
BAL	L_print_char117
L_print_char118:
;ili932x.c,772 :: 		}
L_end_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _print_char
_print_str:
;ili932x.c,775 :: 		void print_str(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
STRB	R1, [SP, #12]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 16 (R4)
LDRH	R4, [SP, #16]
; ch start address is: 0 (R0)
LDR	R0, [SP, #20]
UXTB	R11, R2
; font_size end address is: 8 (R2)
; colour end address is: 12 (R3)
; back_colour end address is: 16 (R4)
; ch end address is: 0 (R0)
UXTH	R10, R3
UXTH	R9, R4
;ili932x.c,777 :: 		do
L_print_str125:
;ili932x.c,779 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
; ch start address is: 8 (R2)
; ch start address is: 0 (R0)
; back_colour start address is: 36 (R9)
; colour start address is: 40 (R10)
; font_size start address is: 44 (R11)
LDRB	R4, [R0, #0]
UXTB	R5, R4
UXTH	R4, R9
STR	R0, [SP, #4]
UXTH	R3, R10
UXTB	R2, R11
LDRB	R1, [SP, #12]
LDRB	R0, [SP, #8]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
ADDS	R5, R0, #1
; ch end address is: 0 (R0)
; ch start address is: 8 (R2)
MOV	R2, R5
; ch end address is: 8 (R2)
;ili932x.c,780 :: 		x_pos += 0x06;
LDRB	R4, [SP, #8]
ADDS	R4, R4, #6
STRB	R4, [SP, #8]
;ili932x.c,781 :: 		}while((*ch >= 0x20) && (*ch <= 0x7F));
LDRB	R4, [R5, #0]
CMP	R4, #32
IT	CC
BCC	L__print_str268
; ch end address is: 8 (R2)
; ch start address is: 8 (R2)
LDRB	R4, [R2, #0]
CMP	R4, #127
IT	HI
BHI	L__print_str267
; back_colour end address is: 36 (R9)
; colour end address is: 40 (R10)
; font_size end address is: 44 (R11)
; ch end address is: 8 (R2)
MOV	R0, R2
IT	AL
BAL	L_print_str125
L__print_str268:
L__print_str267:
;ili932x.c,782 :: 		}
L_end_print_str:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _print_str
_print_C:
;ili932x.c,785 :: 		void print_C(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
;ili932x.c,787 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;ili932x.c,789 :: 		if(value < 0x00)
CMP	R6, #0
IT	GE
BGE	L_print_C130
;ili932x.c,791 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ili932x.c,792 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ili932x.c,793 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_C131
L_print_C130:
;ili932x.c,796 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;ili932x.c,797 :: 		}
L_print_C131:
;ili932x.c,799 :: 		if((value > 99) && (value <= 999))
; value start address is: 36 (R9)
CMP	R9, #99
IT	LE
BLE	L__print_C273
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_C272
L__print_C271:
;ili932x.c,801 :: 		ch[1] = ((value / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili932x.c,802 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,803 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,804 :: 		}
IT	AL
BAL	L_print_C135
;ili932x.c,799 :: 		if((value > 99) && (value <= 999))
L__print_C273:
; value start address is: 36 (R9)
L__print_C272:
;ili932x.c,805 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_C275
CMP	R9, #99
IT	GT
BGT	L__print_C274
L__print_C270:
;ili932x.c,807 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,808 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,809 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,810 :: 		}
IT	AL
BAL	L_print_C139
;ili932x.c,805 :: 		else if((value > 9) && (value <= 99))
L__print_C275:
; value start address is: 36 (R9)
L__print_C274:
;ili932x.c,811 :: 		else if((value >= 0) && (value <= 9))
CMP	R9, #0
IT	LT
BLT	L__print_C277
CMP	R9, #9
IT	GT
BGT	L__print_C276
L__print_C269:
;ili932x.c,813 :: 		ch[1] = ((value % 10) + 0x30);
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
;ili932x.c,814 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,815 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,811 :: 		else if((value >= 0) && (value <= 9))
L__print_C277:
L__print_C276:
;ili932x.c,816 :: 		}
L_print_C139:
L_print_C135:
;ili932x.c,818 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili932x.c,819 :: 		}
L_end_print_C:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_C
_print_I:
;ili932x.c,822 :: 		void print_I(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
;ili932x.c,824 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;ili932x.c,826 :: 		if(value < 0)
CMP	R6, #0
IT	GE
BGE	L_print_I143
;ili932x.c,828 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ili932x.c,829 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ili932x.c,830 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_I144
L_print_I143:
;ili932x.c,833 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;ili932x.c,834 :: 		}
L_print_I144:
;ili932x.c,836 :: 		if(value > 9999)
; value start address is: 36 (R9)
MOVW	R4, #9999
CMP	R9, R4
IT	LE
BLE	L_print_I145
;ili932x.c,838 :: 		ch[1] = ((value / 10000) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVW	R4, #10000
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili932x.c,839 :: 		ch[2] = (((value % 10000)/ 1000) + 0x30);
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
;ili932x.c,840 :: 		ch[3] = (((value % 1000) / 100) + 0x30);
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
;ili932x.c,841 :: 		ch[4] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,842 :: 		ch[5] = ((value % 10) + 0x30);
ADDS	R6, R7, #5
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,843 :: 		}
IT	AL
BAL	L_print_I146
L_print_I145:
;ili932x.c,845 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 36 (R9)
MOVW	R4, #999
CMP	R9, R4
IT	LE
BLE	L__print_I282
MOVW	R4, #9999
CMP	R9, R4
IT	GT
BGT	L__print_I281
L__print_I280:
;ili932x.c,847 :: 		ch[1] = (((value % 10000)/ 1000) + 0x30);
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
;ili932x.c,848 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
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
;ili932x.c,849 :: 		ch[3] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,850 :: 		ch[4] = ((value % 10) + 0x30);
ADDS	R6, R7, #4
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,851 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,852 :: 		}
IT	AL
BAL	L_print_I150
;ili932x.c,845 :: 		else if((value > 999) && (value <= 9999))
L__print_I282:
; value start address is: 36 (R9)
L__print_I281:
;ili932x.c,853 :: 		else if((value > 99) && (value <= 999))
CMP	R9, #99
IT	LE
BLE	L__print_I284
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_I283
L__print_I279:
;ili932x.c,855 :: 		ch[1] = (((value % 1000) / 100) + 0x30);
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
;ili932x.c,856 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,857 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,858 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,859 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,860 :: 		}
IT	AL
BAL	L_print_I154
;ili932x.c,853 :: 		else if((value > 99) && (value <= 999))
L__print_I284:
; value start address is: 36 (R9)
L__print_I283:
;ili932x.c,861 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_I286
CMP	R9, #99
IT	GT
BGT	L__print_I285
L__print_I278:
;ili932x.c,863 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,864 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,865 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,866 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,867 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,868 :: 		}
IT	AL
BAL	L_print_I158
;ili932x.c,861 :: 		else if((value > 9) && (value <= 99))
L__print_I286:
; value start address is: 36 (R9)
L__print_I285:
;ili932x.c,871 :: 		ch[1] = ((value % 10) + 0x30);
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
;ili932x.c,872 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,873 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,874 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,875 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili932x.c,876 :: 		}
L_print_I158:
L_print_I154:
L_print_I150:
L_print_I146:
;ili932x.c,878 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili932x.c,879 :: 		}
L_end_print_I:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_I
_print_D:
;ili932x.c,882 :: 		void print_D(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
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
;ili932x.c,884 :: 		unsigned char ch[6] = {0x2E, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;ili932x.c,886 :: 		ch[1] = ((value / 1000) + 0x30);
ADD	R4, SP, #4
ADDS	R5, R4, #1
MOVW	R4, #1000
UDIV	R4, R8, R4
UXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili932x.c,888 :: 		if(points > 1)
CMP	R9, #1
IT	LS
BLS	L_print_D159
;ili932x.c,890 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
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
;ili932x.c,892 :: 		if(points > 2)
CMP	R9, #2
IT	LS
BLS	L_print_D160
;ili932x.c,894 :: 		ch[3] = (((value % 100) / 10) + 0x30);
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
;ili932x.c,896 :: 		if(points > 3)
CMP	R9, #3
IT	LS
BLS	L_print_D161
; points end address is: 36 (R9)
;ili932x.c,898 :: 		ch[4] = ((value % 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #4
MOVS	R5, #10
UDIV	R4, R8, R5
MLS	R4, R5, R4, R8
UXTH	R4, R4
; value end address is: 32 (R8)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili932x.c,899 :: 		}
L_print_D161:
;ili932x.c,900 :: 		}
L_print_D160:
;ili932x.c,901 :: 		}
L_print_D159:
;ili932x.c,903 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili932x.c,904 :: 		}
L_end_print_D:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_D
_print_F:
;ili932x.c,907 :: 		void print_F(unsigned char x_pos, unsigned char y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
SUB	SP, SP, #36
STR	LR, [SP, #0]
STRB	R0, [SP, #28]
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
;ili932x.c,909 :: 		signed long tmp = 0x0000;
;ili932x.c,911 :: 		tmp = value;
STRB	R1, [SP, #4]
MOV	R0, R10
BL	__FloatToSignedIntegral+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #24]
;ili932x.c,912 :: 		print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
SXTH	R5, R0
UXTH	R4, R9
STR	R10, [SP, #4]
STRH	R9, [SP, #8]
STRH	R8, [SP, #12]
STRB	R3, [SP, #16]
STRB	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R8
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_I+0
ADD	SP, SP, #8
LDRB	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R8, [SP, #12]
LDRH	R9, [SP, #8]
LDR	R10, [SP, #4]
;ili932x.c,913 :: 		tmp = ((value - tmp) * 10000);
STRB	R1, [SP, #4]
LDR	R0, [SP, #24]
BL	__SignedIntegralToFloat+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #32]
LDR	R2, [SP, #32]
STRH	R8, [SP, #4]
STRB	R3, [SP, #8]
STRB	R1, [SP, #12]
MOV	R0, R10
BL	__Sub_FP+0
LDRB	R1, [SP, #12]
LDRB	R3, [SP, #8]
LDRH	R8, [SP, #4]
MOVW	R2, #16384
MOVT	R2, #17948
STRB	R3, [SP, #4]
STRB	R1, [SP, #8]
BL	__Mul_FP+0
LDRB	R1, [SP, #8]
LDRB	R3, [SP, #4]
STRB	R1, [SP, #4]
BL	__FloatToSignedIntegral+0
LDRB	R1, [SP, #4]
STR	R0, [SP, #24]
;ili932x.c,915 :: 		if(tmp < 0)
CMP	R0, #0
IT	GE
BGE	L_print_F162
;ili932x.c,917 :: 		tmp = -tmp;
LDR	R4, [SP, #24]
RSBS	R4, R4, #0
STR	R4, [SP, #24]
;ili932x.c,918 :: 		}
L_print_F162:
;ili932x.c,920 :: 		if((value >= 10000) && (value < 100000))
MOVW	R0, #16384
MOVT	R0, #17948
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F331
MOVS	R0, #1
L__print_F331:
CMP	R0, #0
IT	EQ
BEQ	L__print_F292
MOVW	R0, #20480
MOVT	R0, #18371
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F332
MOVS	R0, #1
L__print_F332:
CMP	R0, #0
IT	EQ
BEQ	L__print_F291
; value end address is: 40 (R10)
L__print_F290:
;ili932x.c,922 :: 		print_D((x_pos + 36), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRB	R4, [SP, #28]
ADDS	R4, #36
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili932x.c,923 :: 		}
IT	AL
BAL	L_print_F166
;ili932x.c,920 :: 		if((value >= 10000) && (value < 100000))
L__print_F292:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F291:
;ili932x.c,924 :: 		else if((value >= 1000) && (value < 10000))
MOVW	R0, #0
MOVT	R0, #17530
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F333
MOVS	R0, #1
L__print_F333:
CMP	R0, #0
IT	EQ
BEQ	L__print_F294
MOVW	R0, #16384
MOVT	R0, #17948
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F334
MOVS	R0, #1
L__print_F334:
CMP	R0, #0
IT	EQ
BEQ	L__print_F293
; value end address is: 40 (R10)
L__print_F289:
;ili932x.c,926 :: 		print_D((x_pos + 30), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRB	R4, [SP, #28]
ADDS	R4, #30
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili932x.c,927 :: 		}
IT	AL
BAL	L_print_F170
;ili932x.c,924 :: 		else if((value >= 1000) && (value < 10000))
L__print_F294:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F293:
;ili932x.c,928 :: 		else if((value >= 100) && (value < 1000))
MOVW	R0, #0
MOVT	R0, #17096
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F335
MOVS	R0, #1
L__print_F335:
CMP	R0, #0
IT	EQ
BEQ	L__print_F296
MOVW	R0, #0
MOVT	R0, #17530
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F336
MOVS	R0, #1
L__print_F336:
CMP	R0, #0
IT	EQ
BEQ	L__print_F295
; value end address is: 40 (R10)
L__print_F288:
;ili932x.c,930 :: 		print_D((x_pos + 24), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRB	R4, [SP, #28]
ADDS	R4, #24
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili932x.c,931 :: 		}
IT	AL
BAL	L_print_F174
;ili932x.c,928 :: 		else if((value >= 100) && (value < 1000))
L__print_F296:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F295:
;ili932x.c,932 :: 		else if((value >= 10) && (value < 100))
MOVW	R0, #0
MOVT	R0, #16672
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__print_F337
MOVS	R0, #1
L__print_F337:
CMP	R0, #0
IT	EQ
BEQ	L__print_F298
MOVW	R0, #0
MOVT	R0, #17096
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F338
MOVS	R0, #1
L__print_F338:
CMP	R0, #0
IT	EQ
BEQ	L__print_F297
; value end address is: 40 (R10)
L__print_F287:
;ili932x.c,934 :: 		print_D((x_pos + 18), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
; back_colour end address is: 36 (R9)
LDRB	R4, [SP, #28]
ADDS	R4, #18
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili932x.c,935 :: 		}
IT	AL
BAL	L_print_F178
;ili932x.c,932 :: 		else if((value >= 10) && (value < 100))
L__print_F298:
; value start address is: 40 (R10)
; back_colour start address is: 36 (R9)
; colour start address is: 32 (R8)
; font_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
L__print_F297:
;ili932x.c,936 :: 		else if(value < 10)
MOVW	R0, #0
MOVT	R0, #16672
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F339
MOVS	R0, #1
L__print_F339:
CMP	R0, #0
IT	EQ
BEQ	L_print_F179
;ili932x.c,938 :: 		print_D((x_pos + 12), y_pos, font_size, colour, back_colour, tmp, points);
LDRB	R7, [SP, #44]
LDR	R6, [SP, #24]
UXTH	R5, R9
LDRB	R4, [SP, #28]
ADDS	R4, #12
STR	R10, [SP, #4]
STRH	R9, [SP, #8]
STRH	R8, [SP, #12]
STRB	R3, [SP, #16]
STRB	R1, [SP, #20]
UXTB	R2, R3
UXTH	R3, R8
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
LDRB	R1, [SP, #20]
LDRB	R3, [SP, #16]
LDRH	R8, [SP, #12]
LDRH	R9, [SP, #8]
LDR	R10, [SP, #4]
;ili932x.c,940 :: 		if((value) < 0)
MOV	R0, #0
MOV	R2, R10
BL	__Compare_FP+0
MOVW	R0, #0
BLE	L__print_F340
MOVS	R0, #1
L__print_F340:
; value end address is: 40 (R10)
CMP	R0, #0
IT	EQ
BEQ	L_print_F180
;ili932x.c,942 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
MOVS	R5, #45
UXTH	R4, R9
; back_colour end address is: 36 (R9)
UXTB	R2, R3
; colour end address is: 32 (R8)
UXTH	R3, R8
; font_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ili932x.c,943 :: 		}
IT	AL
BAL	L_print_F181
L_print_F180:
;ili932x.c,946 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
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
LDRB	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ili932x.c,947 :: 		}
L_print_F181:
;ili932x.c,948 :: 		}
L_print_F179:
L_print_F178:
L_print_F174:
L_print_F170:
L_print_F166:
;ili932x.c,949 :: 		}
L_end_print_F:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_F
_Draw_BMP:
;ili932x.c,951 :: 		void Draw_BMP(unsigned int x_pos, unsigned int y_pos, unsigned int H, unsigned int W, unsigned char *bitmap)
; W start address is: 12 (R3)
; H start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; W end address is: 12 (R3)
; H end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; H start address is: 8 (R2)
; W start address is: 12 (R3)
; bitmap start address is: 20 (R5)
LDR	R5, [SP, #4]
;ili932x.c,953 :: 		unsigned long index = 0;
;ili932x.c,954 :: 		unsigned long size = (W * H);
MUL	R4, R3, R2
UXTH	R4, R4
; size start address is: 36 (R9)
UXTH	R9, R4
;ili932x.c,955 :: 		unsigned int *bitmap_ptr = (unsigned int*)bitmap;
; bitmap_ptr start address is: 40 (R10)
MOV	R10, R5
; bitmap end address is: 20 (R5)
;ili932x.c,957 :: 		TFT_set_display_window(x_pos, y_pos, (W - 1), (H - 1));
SUBS	R5, R2, #1
; H end address is: 8 (R2)
SUBS	R4, R3, #1
; W end address is: 12 (R3)
UXTH	R3, R5
UXTH	R2, R4
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_display_window+0
;ili932x.c,958 :: 		TFT_write_RAM_prepare();
BL	_TFT_write_RAM_prepare+0
;ili932x.c,960 :: 		for(index = 0; index < size; index++)
; index start address is: 24 (R6)
MOVS	R6, #0
; size end address is: 36 (R9)
; bitmap_ptr end address is: 40 (R10)
; index end address is: 24 (R6)
MOV	R5, R9
MOV	R7, R10
L_Draw_BMP182:
; index start address is: 24 (R6)
; bitmap_ptr start address is: 28 (R7)
; size start address is: 20 (R5)
CMP	R6, R5
IT	CS
BCS	L_Draw_BMP183
;ili932x.c,962 :: 		TFT_write(*bitmap_ptr++, DAT);
LDRH	R4, [R7, #0]
MOVS	R1, #1
UXTH	R0, R4
BL	_TFT_write+0
ADDS	R4, R7, #2
; bitmap_ptr end address is: 28 (R7)
; bitmap_ptr start address is: 0 (R0)
MOV	R0, R4
;ili932x.c,960 :: 		for(index = 0; index < size; index++)
ADDS	R6, R6, #1
;ili932x.c,963 :: 		}
; size end address is: 20 (R5)
; bitmap_ptr end address is: 0 (R0)
; index end address is: 24 (R6)
MOV	R7, R0
IT	AL
BAL	L_Draw_BMP182
L_Draw_BMP183:
;ili932x.c,965 :: 		TFT_write_reg(0x0050, 0x0000);
MOVS	R1, #0
MOVS	R0, #80
BL	_TFT_write_reg+0
;ili932x.c,966 :: 		TFT_write_reg(0x0051, 0x00EF);
MOVS	R1, #239
MOVS	R0, #81
BL	_TFT_write_reg+0
;ili932x.c,967 :: 		TFT_write_reg(0x0052, 0x0000);
MOVS	R1, #0
MOVS	R0, #82
BL	_TFT_write_reg+0
;ili932x.c,968 :: 		TFT_write_reg(0x0053, 0x013F);
MOVW	R1, #319
MOVS	R0, #83
BL	_TFT_write_reg+0
;ili932x.c,969 :: 		}
L_end_Draw_BMP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_BMP
_tp_init:
;touch.c,4 :: 		void tp_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,6 :: 		tp_GPIO_init();
BL	_tp_GPIO_init+0
;touch.c,7 :: 		TP_CS_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,8 :: 		MOSI_pin = 1;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,9 :: 		SCK_pin = 1;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,10 :: 		}
L_end_tp_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tp_init
_tp_GPIO_init:
;touch.c,13 :: 		void tp_GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,15 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;touch.c,16 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_6), (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #130
MOVS	R1, #80
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;touch.c,17 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_2 | _GPIO_PINMASK_5 | _GPIO_PINMASK_7), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;touch.c,18 :: 		}
L_end_tp_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _tp_GPIO_init
_TP_read:
;touch.c,21 :: 		unsigned int TP_read()
;touch.c,23 :: 		unsigned char i = 0x0C;
; i start address is: 8 (R2)
MOVS	R2, #12
;touch.c,24 :: 		unsigned int value = 0x0000;
; value start address is: 4 (R1)
MOVW	R1, #0
; value end address is: 4 (R1)
; i end address is: 8 (R2)
;touch.c,26 :: 		while(i > 0x00)
L_TP_read185:
; value start address is: 4 (R1)
; i start address is: 8 (R2)
CMP	R2, #0
IT	LS
BLS	L_TP_read186
;touch.c,28 :: 		value <<= 1;
LSLS	R0, R1, #1
; value end address is: 4 (R1)
; value start address is: 12 (R3)
UXTH	R3, R0
;touch.c,30 :: 		SCK_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,31 :: 		SCK_pin = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R1, [R0, #0]
;touch.c,33 :: 		if(MISO_pin == 1)
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__TP_read299
;touch.c,35 :: 		value++;
ADDS	R1, R3, #1
UXTH	R1, R1
; value end address is: 12 (R3)
; value start address is: 4 (R1)
; value end address is: 4 (R1)
;touch.c,36 :: 		}
IT	AL
BAL	L_TP_read187
L__TP_read299:
;touch.c,33 :: 		if(MISO_pin == 1)
UXTH	R1, R3
;touch.c,36 :: 		}
L_TP_read187:
;touch.c,38 :: 		i--;
; value start address is: 4 (R1)
SUBS	R2, R2, #1
UXTB	R2, R2
;touch.c,39 :: 		};
; i end address is: 8 (R2)
IT	AL
BAL	L_TP_read185
L_TP_read186:
;touch.c,41 :: 		return value;
UXTH	R0, R1
; value end address is: 4 (R1)
;touch.c,42 :: 		}
L_end_TP_read:
BX	LR
; end of _TP_read
_tp_write:
;touch.c,45 :: 		void tp_write(unsigned char value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
; value end address is: 0 (R0)
; value start address is: 0 (R0)
;touch.c,47 :: 		unsigned char i = 0x08;
; i start address is: 12 (R3)
MOVS	R3, #8
;touch.c,49 :: 		SCK_pin = 0;
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
;touch.c,51 :: 		while(i > 0)
L_tp_write188:
; i start address is: 0 (R0)
; value start address is: 12 (R3)
CMP	R0, #0
IT	LS
BLS	L_tp_write189
;touch.c,53 :: 		if((value & 0x80) != 0x00)
AND	R1, R3, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_tp_write190
;touch.c,55 :: 		MOSI_pin = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,56 :: 		}
IT	AL
BAL	L_tp_write191
L_tp_write190:
;touch.c,59 :: 		MOSI_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,60 :: 		}
L_tp_write191:
;touch.c,62 :: 		value <<= 1;
LSLS	R1, R3, #1
UXTB	R3, R1
;touch.c,64 :: 		SCK_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,65 :: 		SCK_pin = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOA_ODRbits+0)
MOVT	R1, #hi_addr(GPIOA_ODRbits+0)
STR	R2, [R1, #0]
;touch.c,67 :: 		i--;
SUBS	R0, R0, #1
UXTB	R0, R0
;touch.c,68 :: 		};
; value end address is: 12 (R3)
; i end address is: 0 (R0)
IT	AL
BAL	L_tp_write188
L_tp_write189:
;touch.c,69 :: 		}
L_end_tp_write:
ADD	SP, SP, #4
BX	LR
; end of _tp_write
_TP_read_coordinates:
;touch.c,72 :: 		void TP_read_coordinates(unsigned int *x_pos, unsigned int *y_pos)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STR	R1, [SP, #12]
;touch.c,74 :: 		unsigned int temp = 0x0000;
;touch.c,75 :: 		unsigned int avg_x = 0x0000;
MOVW	R2, #0
STRH	R2, [SP, #4]
MOVW	R2, #0
STRH	R2, [SP, #6]
;touch.c,76 :: 		unsigned int avg_y = 0x0000;
;touch.c,78 :: 		unsigned char samples = 0x10;
; samples start address is: 20 (R5)
MOVS	R5, #16
;touch.c,80 :: 		TP_CS_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
; samples end address is: 20 (R5)
UXTB	R4, R5
;touch.c,81 :: 		while(samples > 0)
L_TP_read_coordinates192:
; samples start address is: 16 (R4)
CMP	R4, #0
IT	LS
BLS	L_TP_read_coordinates193
;touch.c,83 :: 		tp_write(CMD_RDY);
MOVS	R0, #144
BL	_tp_write+0
;touch.c,84 :: 		SCK_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,85 :: 		SCK_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,86 :: 		avg_x += TP_read();
BL	_TP_read+0
LDRH	R2, [SP, #4]
ADDS	R2, R2, R0
STRH	R2, [SP, #4]
;touch.c,88 :: 		tp_write(CMD_RDX);
MOVS	R0, #208
BL	_tp_write+0
;touch.c,89 :: 		SCK_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,90 :: 		SCK_pin = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,91 :: 		avg_y += TP_read();
BL	_TP_read+0
LDRH	R2, [SP, #6]
ADDS	R2, R2, R0
STRH	R2, [SP, #6]
;touch.c,93 :: 		samples--;
SUBS	R2, R4, #1
; samples end address is: 16 (R4)
; samples start address is: 0 (R0)
UXTB	R0, R2
;touch.c,94 :: 		};
UXTB	R4, R0
; samples end address is: 0 (R0)
IT	AL
BAL	L_TP_read_coordinates192
L_TP_read_coordinates193:
;touch.c,95 :: 		TP_CS_pin = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOA_ODRbits+0)
MOVT	R2, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R2, #0]
;touch.c,97 :: 		temp = (avg_x >> 4);
LDRH	R2, [SP, #4]
LSRS	R2, R2, #4
;touch.c,98 :: 		temp = filter_data(temp, 1);
MOVS	R1, #1
UXTH	R0, R2
BL	_filter_data+0
;touch.c,99 :: 		*x_pos = temp;
LDR	R2, [SP, #8]
STRH	R0, [R2, #0]
;touch.c,101 :: 		temp = (avg_y >> 4);
LDRH	R2, [SP, #6]
LSRS	R2, R2, #4
;touch.c,102 :: 		temp = filter_data(temp, 0);
MOVS	R1, #0
UXTH	R0, R2
BL	_filter_data+0
;touch.c,103 :: 		*y_pos = temp;
LDR	R2, [SP, #12]
STRH	R0, [R2, #0]
;touch.c,104 :: 		}
L_end_TP_read_coordinates:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _TP_read_coordinates
_filter_data:
;touch.c,107 :: 		unsigned int filter_data(unsigned int value, unsigned char axis)
; axis start address is: 4 (R1)
SUB	SP, SP, #60
STR	LR, [SP, #0]
STRH	R0, [SP, #32]
UXTB	R0, R1
; axis end address is: 4 (R1)
; axis start address is: 0 (R0)
;touch.c,111 :: 		float sum = 0.0;
MOV	R2, #0
STR	R2, [SP, #16]
;touch.c,112 :: 		float min_R = 0.0;
;touch.c,113 :: 		float max_R = 0.0;
;touch.c,114 :: 		float axis_max = 0.0;
;touch.c,116 :: 		unsigned int res = 0x0000;
;touch.c,118 :: 		unsigned char i = 0x00;
;touch.c,120 :: 		switch(axis)
IT	AL
BAL	L_filter_data194
; axis end address is: 0 (R0)
;touch.c,122 :: 		case 1:
L_filter_data196:
;touch.c,124 :: 		min_R = RL_min;
MOVW	R2, #0
MOVT	R2, #17302
STR	R2, [SP, #20]
;touch.c,125 :: 		max_R = RL_max;
MOVW	R2, #32768
MOVT	R2, #17773
STR	R2, [SP, #24]
;touch.c,126 :: 		axis_max = res_l;
MOVW	R2, #32768
MOVT	R2, #17311
STR	R2, [SP, #28]
;touch.c,127 :: 		break;
IT	AL
BAL	L_filter_data195
;touch.c,129 :: 		default:
L_filter_data197:
;touch.c,131 :: 		min_R = RW_min;
MOVW	R2, #32768
MOVT	R2, #17773
STR	R2, [SP, #20]
;touch.c,132 :: 		max_R = RW_max;
MOVW	R2, #0
MOVT	R2, #17302
STR	R2, [SP, #24]
;touch.c,133 :: 		axis_max = res_w;
MOVW	R2, #0
MOVT	R2, #17263
STR	R2, [SP, #28]
;touch.c,134 :: 		break;
IT	AL
BAL	L_filter_data195
;touch.c,136 :: 		}
L_filter_data194:
; axis start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_filter_data196
; axis end address is: 0 (R0)
IT	AL
BAL	L_filter_data197
L_filter_data195:
;touch.c,138 :: 		temp[0] = map((((float)value) - error), min_R, max_R, 0.0, axis_max);
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
;touch.c,139 :: 		temp[1] = map((((float)value) + error), min_R, max_R, 0.0, axis_max);
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
;touch.c,140 :: 		temp[2] = map(((float)value), min_R, max_R, 0.0, axis_max);
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
;touch.c,142 :: 		for(i = 0; i < 3; i++)
; i start address is: 36 (R9)
MOVW	R9, #0
; i end address is: 36 (R9)
L_filter_data198:
; i start address is: 36 (R9)
CMP	R9, #3
IT	CS
BCS	L_filter_data199
;touch.c,144 :: 		sum += temp[i];
ADD	R3, SP, #4
LSL	R2, R9, #2
ADDS	R2, R3, R2
LDR	R2, [R2, #0]
LDR	R0, [SP, #16]
BL	__Add_FP+0
STR	R0, [SP, #16]
;touch.c,142 :: 		for(i = 0; i < 3; i++)
ADD	R2, R9, #1
; i end address is: 36 (R9)
; i start address is: 0 (R0)
UXTB	R0, R2
;touch.c,145 :: 		}
UXTB	R9, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_filter_data198
L_filter_data199:
;touch.c,147 :: 		sum /= 3.0;
LDR	R0, [SP, #16]
MOVW	R2, #0
MOVT	R2, #16448
BL	__Div_FP+0
;touch.c,148 :: 		res = constrain(sum, 0.0, axis_max);
LDR	R2, [SP, #28]
MOV	R1, #0
MOV	R0, R0
BL	_constrain+0
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
;touch.c,150 :: 		return res;
;touch.c,151 :: 		}
L_end_filter_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #60
BX	LR
; end of _filter_data
_map:
;touch.c,154 :: 		float map(float value, float x_min, float x_max, float y_min, float y_max)
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
;touch.c,156 :: 		return (y_min + (((y_max - y_min) / (x_max - x_min)) * (value - x_min)));
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
;touch.c,157 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
_constrain:
;touch.c,160 :: 		float constrain(float value, float value_min, float value_max)
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
;touch.c,162 :: 		if(value >= value_max)
MOV	R0, R1
MOV	R2, R5
BL	__Compare_FP+0
MOVW	R0, #0
BLT	L__constrain350
MOVS	R0, #1
L__constrain350:
CMP	R0, #0
IT	EQ
BEQ	L_constrain201
; value end address is: 4 (R1)
; value_min end address is: 12 (R3)
;touch.c,164 :: 		return value_max;
MOV	R0, R5
; value_max end address is: 20 (R5)
IT	AL
BAL	L_end_constrain
;touch.c,165 :: 		}
L_constrain201:
;touch.c,166 :: 		else if(value <= value_min)
; value_min start address is: 12 (R3)
; value start address is: 4 (R1)
MOV	R0, R1
MOV	R2, R3
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__constrain351
MOVS	R0, #1
L__constrain351:
CMP	R0, #0
IT	EQ
BEQ	L_constrain203
; value end address is: 4 (R1)
;touch.c,168 :: 		return value_min;
MOV	R0, R3
; value_min end address is: 12 (R3)
IT	AL
BAL	L_end_constrain
;touch.c,169 :: 		}
L_constrain203:
;touch.c,172 :: 		return value;
; value start address is: 4 (R1)
MOV	R0, R1
; value end address is: 4 (R1)
;touch.c,174 :: 		}
L_end_constrain:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _constrain
_main:
;tftdisp.c,15 :: 		void main()
SUB	SP, SP, #12
;tftdisp.c,17 :: 		setup_MCU();
BL	_setup_MCU+0
;tftdisp.c,19 :: 		test_RGB();
BL	_test_RGB+0
;tftdisp.c,20 :: 		test_colours();
BL	_test_colours+0
;tftdisp.c,21 :: 		test_2D_graphics();
BL	_test_2D_graphics+0
;tftdisp.c,22 :: 		draw_flag();
BL	_draw_flag+0
;tftdisp.c,23 :: 		print_test_data();
BL	_print_test_data+0
;tftdisp.c,24 :: 		print_image();
BL	_print_image+0
;tftdisp.c,25 :: 		print_str(10, 10, 2, White, Black, "Draw Check");
ADD	R11, SP, #0
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr1_tftdisp+0)
MOVT	R12, #hi_addr(?ICS?lstr1_tftdisp+0)
BL	___CC2DW+0
ADD	R0, SP, #0
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #65535
MOVS	R2, #2
MOVS	R1, #10
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tftdisp.c,27 :: 		while(1)
L_main205:
;tftdisp.c,29 :: 		if(TP_INT_pin == 0)
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main207
;tftdisp.c,31 :: 		TP_read_coordinates(&tpx, &tpy);
MOVW	R1, #lo_addr(_tpy+0)
MOVT	R1, #hi_addr(_tpy+0)
MOVW	R0, #lo_addr(_tpx+0)
MOVT	R0, #hi_addr(_tpx+0)
BL	_TP_read_coordinates+0
;tftdisp.c,32 :: 		Draw_Pixel(tpx, tpy, White);
MOVW	R0, #lo_addr(_tpy+0)
MOVT	R0, #hi_addr(_tpy+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_tpx+0)
MOVT	R0, #hi_addr(_tpx+0)
LDRH	R0, [R0, #0]
MOVW	R2, #65535
BL	_Draw_Pixel+0
;tftdisp.c,33 :: 		}
L_main207:
;tftdisp.c,34 :: 		};
IT	AL
BAL	L_main205
;tftdisp.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_MCU:
;tftdisp.c,38 :: 		void setup_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tftdisp.c,40 :: 		tp_init();
BL	_tp_init+0
;tftdisp.c,41 :: 		TFT_init();
BL	_TFT_init+0
;tftdisp.c,42 :: 		}
L_end_setup_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_MCU
_draw_flag:
;tftdisp.c,45 :: 		void draw_flag()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tftdisp.c,47 :: 		Draw_Rectangle(20, 20, 299, 219, YES, SQUARE, Green, Green);
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
;tftdisp.c,48 :: 		Draw_Circle(160, 120, 60, YES, Red);
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
;tftdisp.c,49 :: 		delay_ms(4000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_draw_flag208:
SUBS	R7, R7, #1
BNE	L_draw_flag208
NOP
NOP
NOP
;tftdisp.c,50 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,51 :: 		}
L_end_draw_flag:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _draw_flag
_test_RGB:
;tftdisp.c,54 :: 		void test_RGB()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tftdisp.c,56 :: 		TFT_fill(Red);
MOVW	R0, #63488
BL	_TFT_fill+0
;tftdisp.c,57 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB210:
SUBS	R7, R7, #1
BNE	L_test_RGB210
NOP
NOP
NOP
;tftdisp.c,58 :: 		TFT_fill(Green);
MOVW	R0, #2016
BL	_TFT_fill+0
;tftdisp.c,59 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB212:
SUBS	R7, R7, #1
BNE	L_test_RGB212
NOP
NOP
NOP
;tftdisp.c,60 :: 		TFT_fill(Blue);
MOVS	R0, #31
BL	_TFT_fill+0
;tftdisp.c,61 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_test_RGB214:
SUBS	R7, R7, #1
BNE	L_test_RGB214
NOP
NOP
NOP
;tftdisp.c,62 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,63 :: 		}
L_end_test_RGB:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_RGB
_test_colours:
;tftdisp.c,66 :: 		void test_colours()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tftdisp.c,68 :: 		Draw_Rectangle(0, 0, 319, 23, YES, SQUARE, Grey, Grey);
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
;tftdisp.c,69 :: 		Draw_Rectangle(0, 23, 319, 47, YES, SQUARE, White, White);
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
;tftdisp.c,70 :: 		Draw_Rectangle(0, 47, 319, 71, YES, SQUARE, Cyan, Cyan);
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
;tftdisp.c,71 :: 		Draw_Rectangle(0, 71, 319, 95, YES, SQUARE, Light_Blue, Light_Blue);
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
;tftdisp.c,72 :: 		Draw_Rectangle(0, 95, 319, 119, YES, SQUARE, Blue, Blue);
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
;tftdisp.c,73 :: 		Draw_Rectangle(0, 119, 319, 143, YES, SQUARE, Green, Green);
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
;tftdisp.c,74 :: 		Draw_Rectangle(0, 143, 319, 167, YES, SQUARE, Yellow, Yellow);
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
;tftdisp.c,75 :: 		Draw_Rectangle(0, 167, 319, 191, YES, SQUARE, Magenta, Magenta);
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
;tftdisp.c,76 :: 		Draw_Rectangle(0, 191, 319, 215, YES, SQUARE, Red, Red);
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
;tftdisp.c,77 :: 		Draw_Rectangle(0, 215, 319, 239, YES, SQUARE, Black, Black);
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
;tftdisp.c,78 :: 		delay_ms(2600);
MOVW	R7, #4863
MOVT	R7, #476
NOP
NOP
L_test_colours216:
SUBS	R7, R7, #1
BNE	L_test_colours216
NOP
NOP
NOP
;tftdisp.c,79 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,80 :: 		}
L_end_test_colours:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_colours
_test_2D_graphics:
;tftdisp.c,83 :: 		void test_2D_graphics()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;tftdisp.c,85 :: 		signed int i = 0;
;tftdisp.c,87 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,89 :: 		for(i = 10; i <= 310; i += 10)
; i start address is: 36 (R9)
MOVW	R9, #10
SXTH	R9, R9
; i end address is: 36 (R9)
L_test_2D_graphics218:
; i start address is: 36 (R9)
CMP	R9, #310
IT	GT
BGT	L_test_2D_graphics219
;tftdisp.c,91 :: 		Draw_V_Line(i, 20, 220, White);
MOVW	R3, #65535
MOVS	R2, #220
SXTH	R2, R2
MOVS	R1, #20
SXTH	R1, R1
SXTH	R0, R9
BL	_Draw_V_Line+0
;tftdisp.c,89 :: 		for(i = 10; i <= 310; i += 10)
ADD	R9, R9, #10
SXTH	R9, R9
;tftdisp.c,92 :: 		}
; i end address is: 36 (R9)
IT	AL
BAL	L_test_2D_graphics218
L_test_2D_graphics219:
;tftdisp.c,93 :: 		for(i = 20; i <= 220; i += 10)
; i start address is: 36 (R9)
MOVW	R9, #20
SXTH	R9, R9
; i end address is: 36 (R9)
L_test_2D_graphics221:
; i start address is: 36 (R9)
CMP	R9, #220
IT	GT
BGT	L_test_2D_graphics222
;tftdisp.c,95 :: 		Draw_H_Line(10, 310, i, White);
MOVW	R3, #65535
SXTH	R2, R9
MOVW	R1, #310
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Line+0
;tftdisp.c,93 :: 		for(i = 20; i <= 220; i += 10)
ADD	R9, R9, #10
SXTH	R9, R9
;tftdisp.c,96 :: 		}
; i end address is: 36 (R9)
IT	AL
BAL	L_test_2D_graphics221
L_test_2D_graphics222:
;tftdisp.c,98 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics224:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics224
NOP
NOP
NOP
;tftdisp.c,100 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,101 :: 		for(i = 0; i < 240; i += 5)
; i start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics226:
; i start address is: 4 (R1)
CMP	R1, #240
IT	GE
BGE	L_test_2D_graphics227
;tftdisp.c,103 :: 		Draw_Line(0, 0, 319, i, Light_Blue);
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
;tftdisp.c,101 :: 		for(i = 0; i < 240; i += 5)
ADDS	R1, R1, #5
SXTH	R1, R1
;tftdisp.c,104 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics226
L_test_2D_graphics227:
;tftdisp.c,106 :: 		for(i = 239; i > -1; i -= 5)
; i start address is: 4 (R1)
MOVS	R1, #239
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics229:
; i start address is: 4 (R1)
CMP	R1, #-1
IT	LE
BLE	L_test_2D_graphics230
;tftdisp.c,108 :: 		Draw_Line(319, 240, 0, i, Blue);
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
;tftdisp.c,106 :: 		for(i = 239; i > -1; i -= 5)
SUBS	R1, R1, #5
SXTH	R1, R1
;tftdisp.c,109 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics229
L_test_2D_graphics230:
;tftdisp.c,111 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics232:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics232
NOP
NOP
NOP
;tftdisp.c,113 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,115 :: 		Draw_Rectangle(9, 19, 309, 199, NO, ROUND, Magenta, Black);
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
;tftdisp.c,116 :: 		Draw_Rectangle(19, 29, 299, 189, YES, SQUARE, Cyan, Black);
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
;tftdisp.c,118 :: 		delay_ms(4000);
MOVW	R7, #27647
MOVT	R7, #732
NOP
NOP
L_test_2D_graphics234:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics234
NOP
NOP
NOP
;tftdisp.c,120 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,122 :: 		Draw_Circle(159, 119, 80, NO, Red);
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
;tftdisp.c,123 :: 		Draw_Circle(159, 119, 40, YES, Yellow);
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
;tftdisp.c,126 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics236:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics236
NOP
NOP
NOP
;tftdisp.c,128 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,130 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, NO, Green);
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
;tftdisp.c,131 :: 		delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_test_2D_graphics238:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics238
NOP
NOP
NOP
;tftdisp.c,132 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, YES, Grey);
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
;tftdisp.c,134 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics240:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics240
NOP
NOP
NOP
;tftdisp.c,136 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,138 :: 		for(i = 0; i < 100; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics242:
; i start address is: 20 (R5)
CMP	R5, #100
IT	GE
BGE	L_test_2D_graphics243
;tftdisp.c,140 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
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
;tftdisp.c,141 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
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
;tftdisp.c,138 :: 		for(i = 0; i < 100; i++)
ADDS	R5, R5, #1
SXTH	R5, R5
;tftdisp.c,142 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics242
L_test_2D_graphics243:
;tftdisp.c,144 :: 		for(i = 100; i > -1; i--)
; i start address is: 20 (R5)
MOVS	R5, #100
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics245:
; i start address is: 20 (R5)
CMP	R5, #-1
IT	LE
BLE	L_test_2D_graphics246
;tftdisp.c,146 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
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
;tftdisp.c,147 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
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
;tftdisp.c,144 :: 		for(i = 100; i > -1; i--)
SUBS	R5, R5, #1
SXTH	R5, R5
;tftdisp.c,148 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics245
L_test_2D_graphics246:
;tftdisp.c,149 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_test_2D_graphics248:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics248
NOP
NOP
NOP
;tftdisp.c,151 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,152 :: 		}
L_end_test_2D_graphics:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _test_2D_graphics
_print_test_data:
;tftdisp.c,155 :: 		void print_test_data()
SUB	SP, SP, #84
STR	LR, [SP, #0]
;tftdisp.c,157 :: 		unsigned char s = 0;
;tftdisp.c,158 :: 		signed char c = -9;
MVN	R0, #8
STRB	R0, [SP, #74]
MVN	R0, #8
STRH	R0, [SP, #76]
;tftdisp.c,160 :: 		signed int i = -9;
;tftdisp.c,162 :: 		float f = -9.0;
MOVW	R0, #0
MOVT	R0, #49424
STR	R0, [SP, #80]
;tftdisp.c,165 :: 		print_str(10, 10, 1, Red, Black, "MicroArena");
ADD	R11, SP, #4
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr2_tftdisp+0)
MOVT	R12, #hi_addr(?ICS?lstr2_tftdisp+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #1
MOVS	R1, #10
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tftdisp.c,166 :: 		print_str(10, 30, 2, Green, Black, "MicroArena");
ADD	R11, SP, #15
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr3_tftdisp+0)
MOVT	R12, #hi_addr(?ICS?lstr3_tftdisp+0)
BL	___CC2DW+0
ADD	R0, SP, #15
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #30
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tftdisp.c,167 :: 		print_str(10, 60, 3, Blue, Black, "MicroArena");
ADD	R11, SP, #26
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr4_tftdisp+0)
MOVT	R12, #hi_addr(?ICS?lstr4_tftdisp+0)
BL	___CC2DW+0
ADD	R0, SP, #26
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #3
MOVS	R1, #60
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tftdisp.c,169 :: 		print_str(10, 90, 3, White, Black, "https://www.facebook.com/MicroArena");
ADD	R11, SP, #37
ADD	R10, R11, #36
MOVW	R12, #lo_addr(?ICS?lstr5_tftdisp+0)
MOVT	R12, #hi_addr(?ICS?lstr5_tftdisp+0)
BL	___CC2DW+0
ADD	R0, SP, #37
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #65535
MOVS	R2, #3
MOVS	R1, #90
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tftdisp.c,171 :: 		for(s = 0; s < 250; s++)
MOVS	R0, #0
STRB	R0, [SP, #73]
L_print_test_data250:
LDRB	R0, [SP, #73]
CMP	R0, #250
IT	CS
BCS	L_print_test_data251
;tftdisp.c,173 :: 		print_C(10, 160, 1, Red, Black, c);
LDRSB	R1, [SP, #74]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #1
MOVS	R1, #160
MOVS	R0, #10
BL	_print_C+0
ADD	SP, SP, #8
;tftdisp.c,174 :: 		print_I(10, 180, 1, Green, Black, i);
LDRSH	R1, [SP, #76]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #1
MOVS	R1, #180
MOVS	R0, #10
BL	_print_I+0
ADD	SP, SP, #8
;tftdisp.c,175 :: 		print_F(10, 200, 1, Blue, Black, f, 1);
MOVS	R2, #1
LDR	R1, [SP, #80]
MOVS	R0, #0
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #1
MOVS	R1, #200
MOVS	R0, #10
BL	_print_F+0
ADD	SP, SP, #12
;tftdisp.c,177 :: 		print_C(60, 160, 2, Red, Black, c);
LDRSB	R1, [SP, #74]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #2
MOVS	R1, #160
MOVS	R0, #60
BL	_print_C+0
ADD	SP, SP, #8
;tftdisp.c,178 :: 		print_I(60, 180, 2, Green, Black, i);
LDRSH	R1, [SP, #76]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #180
MOVS	R0, #60
BL	_print_I+0
ADD	SP, SP, #8
;tftdisp.c,179 :: 		print_F(60, 200, 2, Blue, Black, f, 1);
MOVS	R2, #1
LDR	R1, [SP, #80]
MOVS	R0, #0
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #2
MOVS	R1, #200
MOVS	R0, #60
BL	_print_F+0
ADD	SP, SP, #12
;tftdisp.c,181 :: 		print_C(120, 140, 3, Red, Black, c);
LDRSB	R1, [SP, #74]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #3
MOVS	R1, #140
MOVS	R0, #120
BL	_print_C+0
ADD	SP, SP, #8
;tftdisp.c,182 :: 		print_I(120, 174, 3, Green, Black, i);
LDRSH	R1, [SP, #76]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #3
MOVS	R1, #174
MOVS	R0, #120
BL	_print_I+0
ADD	SP, SP, #8
;tftdisp.c,183 :: 		print_F(120, 210, 3, Blue, Black, f, 1);
MOVS	R2, #1
LDR	R1, [SP, #80]
MOVS	R0, #0
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #31
MOVS	R2, #3
MOVS	R1, #210
MOVS	R0, #120
BL	_print_F+0
ADD	SP, SP, #12
;tftdisp.c,185 :: 		c++;
LDRSB	R0, [SP, #74]
ADDS	R0, R0, #1
STRB	R0, [SP, #74]
;tftdisp.c,186 :: 		i++;
LDRSH	R0, [SP, #76]
ADDS	R0, R0, #1
STRH	R0, [SP, #76]
;tftdisp.c,187 :: 		f += 0.1;
LDR	R2, [SP, #80]
MOVW	R0, #52429
MOVT	R0, #15820
BL	__Add_FP+0
STR	R0, [SP, #80]
;tftdisp.c,189 :: 		delay_ms(45);
MOVW	R7, #15711
MOVT	R7, #8
NOP
NOP
L_print_test_data253:
SUBS	R7, R7, #1
BNE	L_print_test_data253
NOP
NOP
NOP
;tftdisp.c,171 :: 		for(s = 0; s < 250; s++)
LDRB	R0, [SP, #73]
ADDS	R0, R0, #1
STRB	R0, [SP, #73]
;tftdisp.c,190 :: 		}
IT	AL
BAL	L_print_test_data250
L_print_test_data251:
;tftdisp.c,191 :: 		TFT_fill(White);
MOVW	R0, #65535
BL	_TFT_fill+0
;tftdisp.c,192 :: 		}
L_end_print_test_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #84
BX	LR
; end of _print_test_data
_print_image:
;tftdisp.c,195 :: 		void print_image()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tftdisp.c,197 :: 		Draw_BMP(16, 20, 285, 200, gImage_test);
MOVW	R0, #lo_addr(_gImage_test+0)
MOVT	R0, #hi_addr(_gImage_test+0)
PUSH	(R0)
MOVS	R3, #200
MOVW	R2, #285
MOVS	R1, #20
MOVS	R0, #16
BL	_Draw_BMP+0
ADD	SP, SP, #4
;tftdisp.c,198 :: 		delay_ms(6000);
MOVW	R7, #41471
MOVT	R7, #1098
NOP
NOP
L_print_image255:
SUBS	R7, R7, #1
BNE	L_print_image255
NOP
NOP
NOP
;tftdisp.c,199 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tftdisp.c,200 :: 		}
L_end_print_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_image
