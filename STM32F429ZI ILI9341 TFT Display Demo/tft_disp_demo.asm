_ILI9341_peripheral_setup:
;ili9341.c,4 :: 		void ILI9341_peripheral_setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ili9341.c,6 :: 		RCC_APB1ENRbits.PWREN = HIGH;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,7 :: 		RCC_APB1LPENRbits.PWRLPEN = HIGH;
MOVW	R0, #lo_addr(RCC_APB1LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1LPENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,8 :: 		RCC_APB2ENRbits.LTDCEN = LOW;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,9 :: 		RCC_APB2LPENRbits.LTDCLPEN = LOW;
MOVW	R0, #lo_addr(RCC_APB2LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2LPENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,11 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili9341.c,12 :: 		GPIO_Clk_Enable(&GPIOD_BASE);
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili9341.c,13 :: 		GPIO_Clk_Enable(&GPIOF_BASE);
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Clk_Enable+0
;ili9341.c,15 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SPI5_PF789);
MOVW	R0, #lo_addr(__GPIO_MODULE_SPI5_PF789+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_SPI5_PF789+0)
BL	_GPIO_Alternate_Function_Enable+0
;ili9341.c,19 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #20
MOVT	R2, #8
;ili9341.c,18 :: 		_GPIO_PINMASK_2,
MOVW	R1, #4
;ili9341.c,17 :: 		GPIO_Config(&GPIOC_BASE,
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;ili9341.c,19 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ili9341.c,23 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #20
MOVT	R2, #8
;ili9341.c,22 :: 		(_GPIO_PINMASK_12 | _GPIO_PINMASK_13),
MOVW	R1, #12288
;ili9341.c,21 :: 		GPIO_Config(&GPIOD_BASE,
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;ili9341.c,23 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ili9341.c,27 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #24
MOVT	R2, #8
;ili9341.c,26 :: 		(_GPIO_PINMASK_7 | _GPIO_PINMASK_9),
MOVW	R1, #640
;ili9341.c,25 :: 		GPIO_Config(&GPIOF_BASE,
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
;ili9341.c,27 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ili9341.c,31 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #40
MOVT	R2, #8
;ili9341.c,30 :: 		_GPIO_PINMASK_8,
MOVW	R1, #256
;ili9341.c,29 :: 		GPIO_Config(&GPIOF_BASE,
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
;ili9341.c,31 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;ili9341.c,33 :: 		delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_ILI9341_peripheral_setup0:
SUBS	R7, R7, #1
BNE	L_ILI9341_peripheral_setup0
NOP
NOP
NOP
;ili9341.c,35 :: 		RCC_APB2ENRbits.SPI5ENR = HIGH;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,36 :: 		RCC_APB2LPENRbits.SPI5LPEN = HIGH;
MOVW	R0, #lo_addr(RCC_APB2LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2LPENRbits+0)
STR	R1, [R0, #0]
;ili9341.c,41 :: 		&_GPIO_MODULE_SPI5_PF789);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI5_PF789+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI5_PF789+0)
;ili9341.c,40 :: 		| _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1),
MOVW	R1, #772
;ili9341.c,37 :: 		SPI5_Init_Advanced(_SPI_FPCLK_DIV4,
MOVS	R0, #1
;ili9341.c,41 :: 		&_GPIO_MODULE_SPI5_PF789);
BL	_SPI5_Init_Advanced+0
;ili9341.c,42 :: 		SPI_Set_Active(SPI5_Read, SPI5_Write);
MOVW	R1, #lo_addr(_SPI5_Write+0)
MOVT	R1, #hi_addr(_SPI5_Write+0)
MOVW	R0, #lo_addr(_SPI5_Read+0)
MOVT	R0, #hi_addr(_SPI5_Read+0)
BL	_SPI_Set_Active+0
;ili9341.c,43 :: 		delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_ILI9341_peripheral_setup2:
SUBS	R7, R7, #1
BNE	L_ILI9341_peripheral_setup2
NOP
NOP
NOP
;ili9341.c,44 :: 		}
L_end_ILI9341_peripheral_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ILI9341_peripheral_setup
_TFT_init:
;ili9341.c,47 :: 		void TFT_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ili9341.c,49 :: 		ILI9341_peripheral_setup();
BL	_ILI9341_peripheral_setup+0
;ili9341.c,51 :: 		TFT_reset();
BL	_TFT_reset+0
;ili9341.c,53 :: 		TFT_write(ILI9341_RESET, CMD);
MOVS	R1, #0
MOVS	R0, #1
BL	_TFT_write+0
;ili9341.c,54 :: 		delay_ms(60);
MOVW	R7, #17662
MOVT	R7, #51
NOP
NOP
L_TFT_init4:
SUBS	R7, R7, #1
BNE	L_TFT_init4
NOP
NOP
NOP
;ili9341.c,56 :: 		TFT_write(ILI9341_POWERA, CMD);
MOVS	R1, #0
MOVS	R0, #203
BL	_TFT_write+0
;ili9341.c,57 :: 		TFT_write(0x39, DAT);
MOVS	R1, #1
MOVS	R0, #57
BL	_TFT_write+0
;ili9341.c,58 :: 		TFT_write(0x2C, DAT);
MOVS	R1, #1
MOVS	R0, #44
BL	_TFT_write+0
;ili9341.c,59 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,60 :: 		TFT_write(0x34, DAT);
MOVS	R1, #1
MOVS	R0, #52
BL	_TFT_write+0
;ili9341.c,61 :: 		TFT_write(0x02, DAT);
MOVS	R1, #1
MOVS	R0, #2
BL	_TFT_write+0
;ili9341.c,63 :: 		TFT_write(ILI9341_POWERB, CMD);
MOVS	R1, #0
MOVS	R0, #207
BL	_TFT_write+0
;ili9341.c,64 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,65 :: 		TFT_write(0xC1, DAT);
MOVS	R1, #1
MOVS	R0, #193
BL	_TFT_write+0
;ili9341.c,66 :: 		TFT_write(0x30, DAT);
MOVS	R1, #1
MOVS	R0, #48
BL	_TFT_write+0
;ili9341.c,68 :: 		TFT_write(ILI9341_DTCA, CMD);
MOVS	R1, #0
MOVS	R0, #232
BL	_TFT_write+0
;ili9341.c,69 :: 		TFT_write(0x85, DAT);
MOVS	R1, #1
MOVS	R0, #133
BL	_TFT_write+0
;ili9341.c,70 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,71 :: 		TFT_write(0x78, DAT);
MOVS	R1, #1
MOVS	R0, #120
BL	_TFT_write+0
;ili9341.c,73 :: 		TFT_write(ILI9341_DTCB, CMD);
MOVS	R1, #0
MOVS	R0, #234
BL	_TFT_write+0
;ili9341.c,74 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,75 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,77 :: 		TFT_write(ILI9341_POWER_SEQ, CMD);
MOVS	R1, #0
MOVS	R0, #237
BL	_TFT_write+0
;ili9341.c,78 :: 		TFT_write(0x64, DAT);
MOVS	R1, #1
MOVS	R0, #100
BL	_TFT_write+0
;ili9341.c,79 :: 		TFT_write(0x03, DAT);
MOVS	R1, #1
MOVS	R0, #3
BL	_TFT_write+0
;ili9341.c,80 :: 		TFT_write(0x12, DAT);
MOVS	R1, #1
MOVS	R0, #18
BL	_TFT_write+0
;ili9341.c,81 :: 		TFT_write(0x81, DAT);
MOVS	R1, #1
MOVS	R0, #129
BL	_TFT_write+0
;ili9341.c,83 :: 		TFT_write(ILI9341_PRC, CMD);
MOVS	R1, #0
MOVS	R0, #247
BL	_TFT_write+0
;ili9341.c,84 :: 		TFT_write(0x20, DAT);
MOVS	R1, #1
MOVS	R0, #32
BL	_TFT_write+0
;ili9341.c,86 :: 		TFT_write(ILI9341_POWER1, CMD);
MOVS	R1, #0
MOVS	R0, #192
BL	_TFT_write+0
;ili9341.c,87 :: 		TFT_write(0x23, DAT);
MOVS	R1, #1
MOVS	R0, #35
BL	_TFT_write+0
;ili9341.c,89 :: 		TFT_write(ILI9341_POWER2, CMD);
MOVS	R1, #0
MOVS	R0, #193
BL	_TFT_write+0
;ili9341.c,90 :: 		TFT_write(0x10, DAT);
MOVS	R1, #1
MOVS	R0, #16
BL	_TFT_write+0
;ili9341.c,92 :: 		TFT_write(ILI9341_VCOM1, CMD);
MOVS	R1, #0
MOVS	R0, #197
BL	_TFT_write+0
;ili9341.c,93 :: 		TFT_write(0x3E, DAT);
MOVS	R1, #1
MOVS	R0, #62
BL	_TFT_write+0
;ili9341.c,94 :: 		TFT_write(0x28, DAT);
MOVS	R1, #1
MOVS	R0, #40
BL	_TFT_write+0
;ili9341.c,96 :: 		TFT_write(ILI9341_VCOM2, CMD);
MOVS	R1, #0
MOVS	R0, #199
BL	_TFT_write+0
;ili9341.c,97 :: 		TFT_write(0x86, DAT);
MOVS	R1, #1
MOVS	R0, #134
BL	_TFT_write+0
;ili9341.c,99 :: 		TFT_write(ILI9341_MAC, CMD);
MOVS	R1, #0
MOVS	R0, #54
BL	_TFT_write+0
;ili9341.c,100 :: 		TFT_write(0x48, DAT);
MOVS	R1, #1
MOVS	R0, #72
BL	_TFT_write+0
;ili9341.c,102 :: 		TFT_write(ILI9341_PIXEL_FORMAT, CMD);
MOVS	R1, #0
MOVS	R0, #58
BL	_TFT_write+0
;ili9341.c,103 :: 		TFT_write(0x55, DAT);
MOVS	R1, #1
MOVS	R0, #85
BL	_TFT_write+0
;ili9341.c,105 :: 		TFT_write(ILI9341_FRC, CMD);
MOVS	R1, #0
MOVS	R0, #177
BL	_TFT_write+0
;ili9341.c,106 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,107 :: 		TFT_write(0x18, DAT);
MOVS	R1, #1
MOVS	R0, #24
BL	_TFT_write+0
;ili9341.c,109 :: 		TFT_write(ILI9341_DFC, CMD);
MOVS	R1, #0
MOVS	R0, #182
BL	_TFT_write+0
;ili9341.c,110 :: 		TFT_write(0x08, DAT);
MOVS	R1, #1
MOVS	R0, #8
BL	_TFT_write+0
;ili9341.c,111 :: 		TFT_write(0x82, DAT);
MOVS	R1, #1
MOVS	R0, #130
BL	_TFT_write+0
;ili9341.c,112 :: 		TFT_write(0x27, DAT);
MOVS	R1, #1
MOVS	R0, #39
BL	_TFT_write+0
;ili9341.c,114 :: 		TFT_write(ILI9341_3GAMMA_EN, CMD);
MOVS	R1, #0
MOVS	R0, #242
BL	_TFT_write+0
;ili9341.c,115 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,117 :: 		TFT_write(ILI9341_COLUMN_ADDR, CMD);
MOVS	R1, #0
MOVS	R0, #42
BL	_TFT_write+0
;ili9341.c,118 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,119 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,120 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,121 :: 		TFT_write(0xEF, DAT);
MOVS	R1, #1
MOVS	R0, #239
BL	_TFT_write+0
;ili9341.c,123 :: 		TFT_write(ILI9341_PAGE_ADDR, CMD);
MOVS	R1, #0
MOVS	R0, #43
BL	_TFT_write+0
;ili9341.c,124 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,125 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,126 :: 		TFT_write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_TFT_write+0
;ili9341.c,127 :: 		TFT_write(0x3F, DAT);
MOVS	R1, #1
MOVS	R0, #63
BL	_TFT_write+0
;ili9341.c,129 :: 		TFT_write(ILI9341_GAMMA, CMD);
MOVS	R1, #0
MOVS	R0, #38
BL	_TFT_write+0
;ili9341.c,130 :: 		TFT_write(0x01, DAT);
MOVS	R1, #1
MOVS	R0, #1
BL	_TFT_write+0
;ili9341.c,132 :: 		TFT_write(ILI9341_PGAMMA, CMD);
MOVS	R1, #0
MOVS	R0, #224
BL	_TFT_write+0
;ili9341.c,133 :: 		TFT_write(0x0F, DAT);
MOVS	R1, #1
MOVS	R0, #15
BL	_TFT_write+0
;ili9341.c,134 :: 		TFT_write(0x31, DAT);
MOVS	R1, #1
MOVS	R0, #49
BL	_TFT_write+0
;ili9341.c,135 :: 		TFT_write(0x2B, DAT);
MOVS	R1, #1
MOVS	R0, #43
BL	_TFT_write+0
;ili9341.c,136 :: 		TFT_write(0x0C, DAT);
MOVS	R1, #1
MOVS	R0, #12
BL	_TFT_write+0
;ili9341.c,137 :: 		TFT_write(0x0E, DAT);
MOVS	R1, #1
MOVS	R0, #14
BL	_TFT_write+0
;ili9341.c,138 :: 		TFT_write(0x08, DAT);
MOVS	R1, #1
MOVS	R0, #8
BL	_TFT_write+0
;ili9341.c,139 :: 		TFT_write(0x4E, DAT);
MOVS	R1, #1
MOVS	R0, #78
BL	_TFT_write+0
;ili9341.c,140 :: 		TFT_write(0xF1, DAT);
MOVS	R1, #1
MOVS	R0, #241
BL	_TFT_write+0
;ili9341.c,141 :: 		TFT_write(0x37, DAT);
MOVS	R1, #1
MOVS	R0, #55
BL	_TFT_write+0
;ili9341.c,142 :: 		TFT_write(0x07, DAT);
MOVS	R1, #1
MOVS	R0, #7
BL	_TFT_write+0
;ili9341.c,143 :: 		TFT_write(0x10, DAT);
MOVS	R1, #1
MOVS	R0, #16
BL	_TFT_write+0
;ili9341.c,144 :: 		TFT_write(0x03, DAT);
MOVS	R1, #1
MOVS	R0, #3
BL	_TFT_write+0
;ili9341.c,145 :: 		TFT_write(0x0E, DAT);
MOVS	R1, #1
MOVS	R0, #14
BL	_TFT_write+0
;ili9341.c,146 :: 		TFT_write(0x09, DAT);
MOVS	R1, #1
MOVS	R0, #9
BL	_TFT_write+0
;ili9341.c,147 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,149 :: 		TFT_write(ILI9341_NGAMMA, CMD);
MOVS	R1, #0
MOVS	R0, #225
BL	_TFT_write+0
;ili9341.c,150 :: 		TFT_write(0x00, DAT);
MOVS	R1, #1
MOVS	R0, #0
BL	_TFT_write+0
;ili9341.c,151 :: 		TFT_write(0x0E, DAT);
MOVS	R1, #1
MOVS	R0, #14
BL	_TFT_write+0
;ili9341.c,152 :: 		TFT_write(0x14, DAT);
MOVS	R1, #1
MOVS	R0, #20
BL	_TFT_write+0
;ili9341.c,153 :: 		TFT_write(0x03, DAT);
MOVS	R1, #1
MOVS	R0, #3
BL	_TFT_write+0
;ili9341.c,154 :: 		TFT_write(0x11, DAT);
MOVS	R1, #1
MOVS	R0, #17
BL	_TFT_write+0
;ili9341.c,155 :: 		TFT_write(0x07, DAT);
MOVS	R1, #1
MOVS	R0, #7
BL	_TFT_write+0
;ili9341.c,156 :: 		TFT_write(0x31, DAT);
MOVS	R1, #1
MOVS	R0, #49
BL	_TFT_write+0
;ili9341.c,157 :: 		TFT_write(0xC1, DAT);
MOVS	R1, #1
MOVS	R0, #193
BL	_TFT_write+0
;ili9341.c,158 :: 		TFT_write(0x48, DAT);
MOVS	R1, #1
MOVS	R0, #72
BL	_TFT_write+0
;ili9341.c,159 :: 		TFT_write(0x08, DAT);
MOVS	R1, #1
MOVS	R0, #8
BL	_TFT_write+0
;ili9341.c,160 :: 		TFT_write(0x0F, DAT);
MOVS	R1, #1
MOVS	R0, #15
BL	_TFT_write+0
;ili9341.c,161 :: 		TFT_write(0x0C, DAT);
MOVS	R1, #1
MOVS	R0, #12
BL	_TFT_write+0
;ili9341.c,162 :: 		TFT_write(0x31, DAT);
MOVS	R1, #1
MOVS	R0, #49
BL	_TFT_write+0
;ili9341.c,163 :: 		TFT_write(0x36, DAT);
MOVS	R1, #1
MOVS	R0, #54
BL	_TFT_write+0
;ili9341.c,164 :: 		TFT_write(0x0F, DAT);
MOVS	R1, #1
MOVS	R0, #15
BL	_TFT_write+0
;ili9341.c,166 :: 		TFT_write(ILI9341_SLEEP_OUT, CMD);
MOVS	R1, #0
MOVS	R0, #17
BL	_TFT_write+0
;ili9341.c,167 :: 		delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_TFT_init6:
SUBS	R7, R7, #1
BNE	L_TFT_init6
NOP
NOP
NOP
;ili9341.c,169 :: 		TFT_on_off(ON);
MOVS	R0, #1
BL	_TFT_on_off+0
;ili9341.c,170 :: 		TFT_write(ILI9341_GRAM, CMD);
MOVS	R1, #0
MOVS	R0, #44
BL	_TFT_write+0
;ili9341.c,172 :: 		TFT_set_rotation(LANDSCAPE_1);
MOVS	R0, #3
BL	_TFT_set_rotation+0
;ili9341.c,173 :: 		}
L_end_TFT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_init
_TFT_reset:
;ili9341.c,176 :: 		void TFT_reset()
;ili9341.c,178 :: 		RST_pin = LOW;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;ili9341.c,179 :: 		delay_ms(20);
MOVW	R7, #5886
MOVT	R7, #17
NOP
NOP
L_TFT_reset8:
SUBS	R7, R7, #1
BNE	L_TFT_reset8
NOP
NOP
NOP
;ili9341.c,180 :: 		RST_pin = HIGH;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;ili9341.c,181 :: 		}
L_end_TFT_reset:
BX	LR
; end of _TFT_reset
_TFT_write:
;ili9341.c,184 :: 		void TFT_write(unsigned char value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ili9341.c,186 :: 		DC_pin = mode;
MOVW	R2, #lo_addr(GPIOD_ODRbits+0)
MOVT	R2, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R2, #0]
; mode end address is: 4 (R1)
;ili9341.c,187 :: 		CS_pin = LOW;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili9341.c,188 :: 		SPI5_Write(value);
; value end address is: 0 (R0)
BL	_SPI5_Write+0
;ili9341.c,189 :: 		CS_pin = HIGH;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili9341.c,190 :: 		}
L_end_TFT_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write
_TFT_write_word:
;ili9341.c,193 :: 		void TFT_write_word(unsigned int value, unsigned char mode)
; mode start address is: 4 (R1)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; mode start address is: 4 (R1)
;ili9341.c,195 :: 		unsigned char hb = 0x00;
;ili9341.c,196 :: 		unsigned char lb = 0x00;
;ili9341.c,198 :: 		lb = (value & 0x00FF);
AND	R2, R0, #255
; lb start address is: 20 (R5)
UXTB	R5, R2
;ili9341.c,199 :: 		hb = (value >> 0x08);
LSRS	R4, R0, #8
; value end address is: 0 (R0)
;ili9341.c,201 :: 		DC_pin = mode;
MOVW	R2, #lo_addr(GPIOD_ODRbits+0)
MOVT	R2, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R2, #0]
; mode end address is: 4 (R1)
;ili9341.c,202 :: 		CS_pin = LOW;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili9341.c,203 :: 		SPI5_Write(hb);
UXTB	R0, R4
BL	_SPI5_Write+0
;ili9341.c,204 :: 		SPI5_Write(lb);
UXTB	R0, R5
; lb end address is: 20 (R5)
BL	_SPI5_Write+0
;ili9341.c,205 :: 		CS_pin = HIGH;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODRbits+0)
MOVT	R2, #hi_addr(GPIOC_ODRbits+0)
STR	R3, [R2, #0]
;ili9341.c,206 :: 		}
L_end_TFT_write_word:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_write_word
_TFT_on_off:
;ili9341.c,209 :: 		void TFT_on_off(unsigned char mode)
; mode start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;ili9341.c,211 :: 		switch(mode)
IT	AL
BAL	L_TFT_on_off10
; mode end address is: 0 (R0)
;ili9341.c,213 :: 		case ON:
L_TFT_on_off12:
;ili9341.c,215 :: 		TFT_write(ILI9341_DISPLAY_ON, CMD);
MOVS	R1, #0
MOVS	R0, #41
BL	_TFT_write+0
;ili9341.c,216 :: 		break;
IT	AL
BAL	L_TFT_on_off11
;ili9341.c,218 :: 		case OFF:
L_TFT_on_off13:
;ili9341.c,220 :: 		TFT_write(ILI9341_DISPLAY_OFF, CMD);
MOVS	R1, #0
MOVS	R0, #40
BL	_TFT_write+0
;ili9341.c,221 :: 		break;
IT	AL
BAL	L_TFT_on_off11
;ili9341.c,223 :: 		}
L_TFT_on_off10:
; mode start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_TFT_on_off12
CMP	R0, #0
IT	EQ
BEQ	L_TFT_on_off13
; mode end address is: 0 (R0)
L_TFT_on_off11:
;ili9341.c,224 :: 		}
L_end_TFT_on_off:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_on_off
_TFT_set_rotation:
;ili9341.c,227 :: 		void TFT_set_rotation(unsigned char value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R0
; value end address is: 0 (R0)
; value start address is: 16 (R4)
;ili9341.c,229 :: 		TFT_write(ILI9341_MAC, CMD);
MOVS	R1, #0
MOVS	R0, #54
BL	_TFT_write+0
;ili9341.c,231 :: 		switch(value)
IT	AL
BAL	L_TFT_set_rotation14
;ili9341.c,233 :: 		case PORTRAIT_1:
L_TFT_set_rotation16:
;ili9341.c,235 :: 		TFT_write(0x58, DAT);
MOVS	R1, #1
MOVS	R0, #88
BL	_TFT_write+0
;ili9341.c,236 :: 		break;
IT	AL
BAL	L_TFT_set_rotation15
;ili9341.c,238 :: 		case PORTRAIT_2:
L_TFT_set_rotation17:
;ili9341.c,240 :: 		TFT_write(0x88, DAT);
MOVS	R1, #1
MOVS	R0, #136
BL	_TFT_write+0
;ili9341.c,241 :: 		break;
IT	AL
BAL	L_TFT_set_rotation15
;ili9341.c,243 :: 		case LANDSCAPE_1:
L_TFT_set_rotation18:
;ili9341.c,245 :: 		TFT_write(0x28, DAT);
MOVS	R1, #1
MOVS	R0, #40
BL	_TFT_write+0
;ili9341.c,246 :: 		break;
IT	AL
BAL	L_TFT_set_rotation15
;ili9341.c,248 :: 		case LANDSCAPE_2:
L_TFT_set_rotation19:
;ili9341.c,250 :: 		TFT_write(0xE8, DAT);
MOVS	R1, #1
MOVS	R0, #232
BL	_TFT_write+0
;ili9341.c,251 :: 		break;
IT	AL
BAL	L_TFT_set_rotation15
;ili9341.c,253 :: 		}
L_TFT_set_rotation14:
CMP	R4, #1
IT	EQ
BEQ	L_TFT_set_rotation16
CMP	R4, #2
IT	EQ
BEQ	L_TFT_set_rotation17
CMP	R4, #3
IT	EQ
BEQ	L_TFT_set_rotation18
CMP	R4, #4
IT	EQ
BEQ	L_TFT_set_rotation19
L_TFT_set_rotation15:
;ili9341.c,255 :: 		if((value == PORTRAIT_1) || (value == PORTRAIT_2))
CMP	R4, #1
IT	EQ
BEQ	L__TFT_set_rotation255
CMP	R4, #2
IT	EQ
BEQ	L__TFT_set_rotation254
IT	AL
BAL	L_TFT_set_rotation22
L__TFT_set_rotation255:
L__TFT_set_rotation254:
;ili9341.c,257 :: 		MAX_X = X_max;
MOVS	R2, #240
MOVW	R1, #lo_addr(_MAX_X+0)
MOVT	R1, #hi_addr(_MAX_X+0)
STRH	R2, [R1, #0]
;ili9341.c,258 :: 		MAX_Y = Y_max;
MOVW	R2, #320
MOVW	R1, #lo_addr(_MAX_Y+0)
MOVT	R1, #hi_addr(_MAX_Y+0)
STRH	R2, [R1, #0]
;ili9341.c,259 :: 		}
L_TFT_set_rotation22:
;ili9341.c,261 :: 		if((value == LANDSCAPE_1) || (value == LANDSCAPE_2))
CMP	R4, #3
IT	EQ
BEQ	L__TFT_set_rotation257
CMP	R4, #4
IT	EQ
BEQ	L__TFT_set_rotation256
; value end address is: 16 (R4)
IT	AL
BAL	L_TFT_set_rotation25
L__TFT_set_rotation257:
L__TFT_set_rotation256:
;ili9341.c,263 :: 		MAX_X = Y_max;
MOVW	R2, #320
MOVW	R1, #lo_addr(_MAX_X+0)
MOVT	R1, #hi_addr(_MAX_X+0)
STRH	R2, [R1, #0]
;ili9341.c,264 :: 		MAX_Y = X_max;
MOVS	R2, #240
MOVW	R1, #lo_addr(_MAX_Y+0)
MOVT	R1, #hi_addr(_MAX_Y+0)
STRH	R2, [R1, #0]
;ili9341.c,265 :: 		}
L_TFT_set_rotation25:
;ili9341.c,266 :: 		}
L_end_TFT_set_rotation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_rotation
_TFT_set_display_window:
;ili9341.c,269 :: 		void TFT_set_display_window(unsigned int x_pos1, unsigned int y_pos1, unsigned int x_pos2, unsigned int y_pos2)
; y_pos2 start address is: 12 (R3)
; x_pos2 start address is: 8 (R2)
; y_pos1 start address is: 4 (R1)
; x_pos1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R0
UXTH	R6, R1
UXTH	R7, R2
UXTH	R8, R3
; y_pos2 end address is: 12 (R3)
; x_pos2 end address is: 8 (R2)
; y_pos1 end address is: 4 (R1)
; x_pos1 end address is: 0 (R0)
; x_pos1 start address is: 16 (R4)
; y_pos1 start address is: 24 (R6)
; x_pos2 start address is: 28 (R7)
; y_pos2 start address is: 32 (R8)
;ili9341.c,271 :: 		TFT_write(ILI9341_COLUMN_ADDR, CMD);
MOVS	R1, #0
MOVS	R0, #42
BL	_TFT_write+0
;ili9341.c,272 :: 		TFT_write_word(x_pos1, DAT);
MOVS	R1, #1
UXTH	R0, R4
; x_pos1 end address is: 16 (R4)
BL	_TFT_write_word+0
;ili9341.c,273 :: 		TFT_write_word(x_pos2, DAT);
MOVS	R1, #1
UXTH	R0, R7
; x_pos2 end address is: 28 (R7)
BL	_TFT_write_word+0
;ili9341.c,275 :: 		TFT_write(ILI9341_PAGE_ADDR, CMD);
MOVS	R1, #0
MOVS	R0, #43
BL	_TFT_write+0
;ili9341.c,276 :: 		TFT_write_word(y_pos1, DAT);
MOVS	R1, #1
UXTH	R0, R6
; y_pos1 end address is: 24 (R6)
BL	_TFT_write_word+0
;ili9341.c,277 :: 		TFT_write_word(y_pos2, DAT);
MOVS	R1, #1
UXTH	R0, R8
; y_pos2 end address is: 32 (R8)
BL	_TFT_write_word+0
;ili9341.c,279 :: 		TFT_write(ILI9341_GRAM, CMD);
MOVS	R1, #0
MOVS	R0, #44
BL	_TFT_write+0
;ili9341.c,280 :: 		}
L_end_TFT_set_display_window:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_set_display_window
_TFT_fill:
;ili9341.c,283 :: 		void TFT_fill(unsigned int colour)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
;ili9341.c,285 :: 		unsigned long index = pixels;
MOV	R1, #76800
STR	R1, [SP, #4]
;ili9341.c,287 :: 		TFT_set_display_window(0, 0, (MAX_X - 1), (MAX_Y - 1));
MOVW	R1, #lo_addr(_MAX_Y+0)
MOVT	R1, #hi_addr(_MAX_Y+0)
LDRH	R1, [R1, #0]
SUBS	R2, R1, #1
MOVW	R1, #lo_addr(_MAX_X+0)
MOVT	R1, #hi_addr(_MAX_X+0)
LDRH	R1, [R1, #0]
SUBS	R1, R1, #1
UXTH	R3, R2
UXTH	R2, R1
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_set_display_window+0
;ili9341.c,289 :: 		while(index)
L_TFT_fill26:
LDR	R1, [SP, #4]
CMP	R1, #0
IT	EQ
BEQ	L_TFT_fill27
;ili9341.c,291 :: 		TFT_write_word(colour, DAT);
MOVS	R1, #1
LDRH	R0, [SP, #8]
BL	_TFT_write_word+0
;ili9341.c,292 :: 		index--;
LDR	R1, [SP, #4]
SUBS	R1, R1, #1
STR	R1, [SP, #4]
;ili9341.c,293 :: 		};
IT	AL
BAL	L_TFT_fill26
L_TFT_fill27:
;ili9341.c,294 :: 		}
L_end_TFT_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _TFT_fill
_TFT_fill_area:
;ili9341.c,297 :: 		void TFT_fill_area(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
SUB	SP, SP, #28
STR	LR, [SP, #0]
STRH	R0, [SP, #12]
STRH	R1, [SP, #16]
STRH	R2, [SP, #20]
STRH	R3, [SP, #24]
; colour start address is: 24 (R6)
LDRH	R6, [SP, #28]
;ili9341.c,299 :: 		unsigned long index = 0x00000000;
;ili9341.c,301 :: 		if(x1 > x2)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	LE
BLE	L_TFT_fill_area28
;ili9341.c,303 :: 		swap(&x1, &x2);
ADD	R5, SP, #20
ADD	R4, SP, #12
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,304 :: 		}
L_TFT_fill_area28:
;ili9341.c,305 :: 		if(y1 > y2)
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #16]
CMP	R4, R5
IT	LE
BLE	L_TFT_fill_area29
;ili9341.c,307 :: 		swap(&y1, &y2);
ADD	R5, SP, #24
ADD	R4, SP, #16
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,308 :: 		}
L_TFT_fill_area29:
;ili9341.c,310 :: 		index = (x2 - x1);
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #20]
SUB	R0, R4, R5
; index start address is: 0 (R0)
SXTH	R0, R0
;ili9341.c,311 :: 		index *= (y2 - y1);
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #24]
SUB	R4, R4, R5
SXTH	R4, R4
MULS	R0, R4, R0
;ili9341.c,313 :: 		TFT_set_display_window(x1, y1, (x2 - 1), (y2 - 1));
LDRSH	R4, [SP, #24]
SUBS	R5, R4, #1
LDRSH	R4, [SP, #20]
SUBS	R4, R4, #1
STR	R0, [SP, #4]
STRH	R6, [SP, #8]
UXTH	R3, R5
UXTH	R2, R4
LDRSH	R1, [SP, #16]
LDRSH	R0, [SP, #12]
BL	_TFT_set_display_window+0
; index end address is: 0 (R0)
LDRH	R6, [SP, #8]
LDR	R0, [SP, #4]
MOV	R7, R0
;ili9341.c,315 :: 		while(index)
L_TFT_fill_area30:
; index start address is: 28 (R7)
; colour start address is: 24 (R6)
; colour end address is: 24 (R6)
CMP	R7, #0
IT	EQ
BEQ	L_TFT_fill_area31
; colour end address is: 24 (R6)
;ili9341.c,317 :: 		TFT_write_word(colour, DAT);
; colour start address is: 24 (R6)
MOVS	R1, #1
UXTH	R0, R6
BL	_TFT_write_word+0
;ili9341.c,318 :: 		index--;
SUBS	R7, R7, #1
;ili9341.c,319 :: 		};
; colour end address is: 24 (R6)
; index end address is: 28 (R7)
IT	AL
BAL	L_TFT_fill_area30
L_TFT_fill_area31:
;ili9341.c,320 :: 		}
L_end_TFT_fill_area:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _TFT_fill_area
_TFT_BGR2RGB:
;ili9341.c,323 :: 		unsigned int TFT_BGR2RGB(unsigned int colour)
; colour start address is: 0 (R0)
; colour end address is: 0 (R0)
; colour start address is: 0 (R0)
;ili9341.c,325 :: 		unsigned int r = 0x0000;
;ili9341.c,326 :: 		unsigned int g = 0x0000;
;ili9341.c,327 :: 		unsigned int b = 0x0000;
;ili9341.c,328 :: 		unsigned int rgb_colour = 0x0000;
;ili9341.c,330 :: 		b = ((colour >> 0)  & 0x1F);
AND	R2, R0, #31
UXTH	R2, R2
;ili9341.c,331 :: 		g = ((colour >> 5)  & 0x3F);
LSRS	R1, R0, #5
UXTH	R1, R1
AND	R4, R1, #63
UXTH	R4, R4
;ili9341.c,332 :: 		r = ((colour >> 11) & 0x1F);
LSRS	R1, R0, #11
UXTH	R1, R1
; colour end address is: 0 (R0)
AND	R3, R1, #31
UXTH	R3, R3
;ili9341.c,334 :: 		rgb_colour = ((b << 11) + (g << 5) + (r << 0));
LSLS	R2, R2, #11
UXTH	R2, R2
LSLS	R1, R4, #5
UXTH	R1, R1
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R1, R3
;ili9341.c,336 :: 		return rgb_colour;
UXTH	R0, R1
;ili9341.c,337 :: 		}
L_end_TFT_BGR2RGB:
BX	LR
; end of _TFT_BGR2RGB
_RGB565_converter:
;ili9341.c,340 :: 		unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
; b start address is: 8 (R2)
; g start address is: 4 (R1)
; r start address is: 0 (R0)
; b end address is: 8 (R2)
; g end address is: 4 (R1)
; r end address is: 0 (R0)
; r start address is: 0 (R0)
; g start address is: 4 (R1)
; b start address is: 8 (R2)
;ili9341.c,342 :: 		return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
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
;ili9341.c,343 :: 		}
L_end_RGB565_converter:
BX	LR
; end of _RGB565_converter
_swap:
;ili9341.c,346 :: 		void swap(signed int *a, signed int *b)
; b start address is: 4 (R1)
; a start address is: 0 (R0)
; b end address is: 4 (R1)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
; b start address is: 4 (R1)
;ili9341.c,348 :: 		signed int temp = 0x0000;
;ili9341.c,350 :: 		temp = *b;
LDRSH	R2, [R1, #0]
; temp start address is: 12 (R3)
SXTH	R3, R2
;ili9341.c,351 :: 		*b = *a;
LDRSH	R2, [R0, #0]
STRH	R2, [R1, #0]
; b end address is: 4 (R1)
;ili9341.c,352 :: 		*a = temp;
STRH	R3, [R0, #0]
; a end address is: 0 (R0)
; temp end address is: 12 (R3)
;ili9341.c,353 :: 		}
L_end_swap:
BX	LR
; end of _swap
_Draw_Pixel:
;ili9341.c,356 :: 		void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour)
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
;ili9341.c,358 :: 		TFT_set_display_window(x_pos, y_pos, x_pos, y_pos);
UXTH	R3, R1
UXTH	R2, R0
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_display_window+0
;ili9341.c,359 :: 		TFT_write_word(colour, DAT);
MOVS	R1, #1
UXTH	R0, R9
; colour end address is: 36 (R9)
BL	_TFT_write_word+0
;ili9341.c,360 :: 		}
L_end_Draw_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Pixel
_Draw_Point:
;ili9341.c,363 :: 		void Draw_Point(unsigned int x_pos, unsigned int y_pos, unsigned char pen_width, unsigned int colour)
; colour start address is: 12 (R3)
; pen_width start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; colour end address is: 12 (R3)
; pen_width end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; pen_width start address is: 8 (R2)
; colour start address is: 12 (R3)
;ili9341.c,365 :: 		Draw_Circle(x_pos, y_pos, pen_width, YES, colour);
PUSH	(R3)
MOVS	R3, #1
; pen_width end address is: 8 (R2)
SXTH	R1, R1
; y_pos end address is: 4 (R1)
SXTH	R0, R0
; x_pos end address is: 0 (R0)
; colour end address is: 12 (R3)
BL	_Draw_Circle+0
ADD	SP, SP, #4
;ili9341.c,366 :: 		}
L_end_Draw_Point:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw_Point
_Draw_Line:
;ili9341.c,369 :: 		void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
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
;ili9341.c,371 :: 		signed int dx = 0x0000;
;ili9341.c,372 :: 		signed int dy = 0x0000;
;ili9341.c,373 :: 		signed int stepx = 0x0000;
;ili9341.c,374 :: 		signed int stepy = 0x0000;
;ili9341.c,375 :: 		signed int fraction = 0x0000;
;ili9341.c,377 :: 		dy = (y2 - y1);
LDRSH	R4, [SP, #20]
SUB	R5, R4, R11, LSL #0
SXTH	R5, R5
; dy start address is: 8 (R2)
SXTH	R2, R5
;ili9341.c,378 :: 		dx = (x2 - x1);
LDRSH	R4, [SP, #16]
SUB	R0, R4, R10, LSL #0
SXTH	R0, R0
; dx start address is: 0 (R0)
;ili9341.c,380 :: 		if(dy < 0)
CMP	R5, #0
IT	GE
BGE	L_Draw_Line32
;ili9341.c,382 :: 		dy = -dy;
RSBS	R4, R2, #0
; dy end address is: 8 (R2)
; dy start address is: 20 (R5)
SXTH	R5, R4
;ili9341.c,383 :: 		stepy = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #10]
;ili9341.c,384 :: 		}
SXTH	R2, R5
; dy end address is: 20 (R5)
IT	AL
BAL	L_Draw_Line33
L_Draw_Line32:
;ili9341.c,387 :: 		stepy = 1;
; dy start address is: 8 (R2)
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #10]
; dy end address is: 8 (R2)
;ili9341.c,388 :: 		}
L_Draw_Line33:
;ili9341.c,390 :: 		if(dx < 0)
; dy start address is: 8 (R2)
CMP	R0, #0
IT	GE
BGE	L_Draw_Line34
;ili9341.c,392 :: 		dx = -dx;
RSBS	R4, R0, #0
; dx end address is: 0 (R0)
; dx start address is: 12 (R3)
SXTH	R3, R4
;ili9341.c,393 :: 		stepx = -1;
MOVW	R4, #65535
SXTH	R4, R4
STRH	R4, [SP, #8]
;ili9341.c,394 :: 		}
SXTH	R0, R3
; dx end address is: 12 (R3)
IT	AL
BAL	L_Draw_Line35
L_Draw_Line34:
;ili9341.c,397 :: 		stepx = 1;
; dx start address is: 0 (R0)
MOVS	R4, #1
SXTH	R4, R4
STRH	R4, [SP, #8]
; dx end address is: 0 (R0)
;ili9341.c,398 :: 		}
L_Draw_Line35:
;ili9341.c,400 :: 		dx <<= 0x01;
; dx start address is: 0 (R0)
LSLS	R1, R0, #1
SXTH	R1, R1
; dx end address is: 0 (R0)
; dx start address is: 4 (R1)
;ili9341.c,401 :: 		dy <<= 0x01;
LSLS	R0, R2, #1
SXTH	R0, R0
; dy end address is: 8 (R2)
; dy start address is: 0 (R0)
;ili9341.c,403 :: 		Draw_Pixel(x1, y1, colour);
STRH	R0, [SP, #4]
STRH	R1, [SP, #6]
UXTH	R2, R12
UXTH	R1, R11
UXTH	R0, R10
BL	_Draw_Pixel+0
LDRSH	R1, [SP, #6]
LDRSH	R0, [SP, #4]
;ili9341.c,405 :: 		if(dx > dy)
CMP	R1, R0
IT	LE
BLE	L_Draw_Line36
;ili9341.c,407 :: 		fraction = (dy - (dx >> 1));
ASRS	R4, R1, #1
SXTH	R4, R4
SUB	R4, R0, R4
STRH	R4, [SP, #12]
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R3, R10
SXTH	R2, R11
;ili9341.c,408 :: 		while(x1 != x2)
L_Draw_Line37:
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
BEQ	L_Draw_Line38
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
;ili9341.c,410 :: 		if(fraction >= 0)
; colour start address is: 48 (R12)
; dx start address is: 4 (R1)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #12]
CMP	R4, #0
IT	LT
BLT	L__Draw_Line258
;ili9341.c,412 :: 		y1 += stepy;
LDRSH	R4, [SP, #10]
ADD	R11, R2, R4, LSL #0
SXTH	R11, R11
; y1 end address is: 8 (R2)
; y1 start address is: 44 (R11)
;ili9341.c,413 :: 		fraction -= dx;
LDRSH	R4, [SP, #12]
SUB	R4, R4, R1
STRH	R4, [SP, #12]
; y1 end address is: 44 (R11)
;ili9341.c,414 :: 		}
IT	AL
BAL	L_Draw_Line39
L__Draw_Line258:
;ili9341.c,410 :: 		if(fraction >= 0)
SXTH	R11, R2
;ili9341.c,414 :: 		}
L_Draw_Line39:
;ili9341.c,415 :: 		x1 += stepx;
; y1 start address is: 44 (R11)
LDRSH	R4, [SP, #8]
ADDS	R5, R3, R4
; x1 end address is: 12 (R3)
; x1 start address is: 40 (R10)
SXTH	R10, R5
;ili9341.c,416 :: 		fraction += dy;
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R4, [SP, #12]
;ili9341.c,418 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #6]
UXTH	R2, R12
UXTH	R1, R11
UXTH	R0, R5
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R1, [SP, #4]
;ili9341.c,419 :: 		}
SXTH	R3, R10
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R2, R11
IT	AL
BAL	L_Draw_Line37
L_Draw_Line38:
;ili9341.c,420 :: 		}
IT	AL
BAL	L_Draw_Line40
L_Draw_Line36:
;ili9341.c,423 :: 		fraction = (dx - (dy >> 1));
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
;ili9341.c,425 :: 		while(y1 != y2)
L_Draw_Line41:
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
BEQ	L_Draw_Line42
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
;ili9341.c,427 :: 		if (fraction >= 0)
; colour start address is: 48 (R12)
; dx start address is: 4 (R1)
; dy start address is: 0 (R0)
LDRSH	R4, [SP, #12]
CMP	R4, #0
IT	LT
BLT	L__Draw_Line259
;ili9341.c,429 :: 		x1 += stepx;
LDRSH	R4, [SP, #8]
ADDS	R4, R3, R4
; x1 end address is: 12 (R3)
; x1 start address is: 24 (R6)
SXTH	R6, R4
;ili9341.c,430 :: 		fraction -= dy;
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R4, [SP, #12]
; x1 end address is: 24 (R6)
SXTH	R10, R6
;ili9341.c,431 :: 		}
IT	AL
BAL	L_Draw_Line43
L__Draw_Line259:
;ili9341.c,427 :: 		if (fraction >= 0)
SXTH	R10, R3
;ili9341.c,431 :: 		}
L_Draw_Line43:
;ili9341.c,432 :: 		y1 += stepy;
; x1 start address is: 40 (R10)
LDRSH	R4, [SP, #10]
ADDS	R5, R2, R4
; y1 end address is: 8 (R2)
; y1 start address is: 44 (R11)
SXTH	R11, R5
;ili9341.c,433 :: 		fraction += dx;
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R1
STRH	R4, [SP, #12]
;ili9341.c,434 :: 		Draw_Pixel(x1, y1, colour);
STRH	R1, [SP, #4]
STRH	R0, [SP, #6]
UXTH	R2, R12
UXTH	R1, R5
UXTH	R0, R10
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #6]
LDRSH	R1, [SP, #4]
;ili9341.c,435 :: 		}
SXTH	R3, R10
; dy end address is: 0 (R0)
; dx end address is: 4 (R1)
; colour end address is: 48 (R12)
; x1 end address is: 40 (R10)
; y1 end address is: 44 (R11)
SXTH	R2, R11
IT	AL
BAL	L_Draw_Line41
L_Draw_Line42:
;ili9341.c,436 :: 		}
L_Draw_Line40:
;ili9341.c,437 :: 		}
L_end_Draw_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Line
_Draw_V_Line:
;ili9341.c,440 :: 		void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
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
;ili9341.c,442 :: 		signed int pos = 0;
;ili9341.c,443 :: 		signed int temp = 0;
;ili9341.c,445 :: 		if(y1 > y2)
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line44
;ili9341.c,447 :: 		swap(&y1, &y2);
ADD	R5, SP, #8
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,448 :: 		}
L_Draw_V_Line44:
;ili9341.c,450 :: 		while(y2 > (y1 - 1))
SXTH	R11, R6
; colour end address is: 28 (R7)
UXTH	R10, R7
L_Draw_V_Line45:
; x1 end address is: 24 (R6)
; x1 start address is: 44 (R11)
; colour start address is: 40 (R10)
; colour start address is: 40 (R10)
; colour end address is: 40 (R10)
; x1 start address is: 44 (R11)
; x1 end address is: 44 (R11)
LDRSH	R4, [SP, #4]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_V_Line46
; colour end address is: 40 (R10)
; x1 end address is: 44 (R11)
;ili9341.c,452 :: 		Draw_Pixel(x1, y2, colour);
; x1 start address is: 44 (R11)
; colour start address is: 40 (R10)
UXTH	R2, R10
LDRSH	R1, [SP, #8]
UXTH	R0, R11
BL	_Draw_Pixel+0
;ili9341.c,453 :: 		y2--;
LDRSH	R4, [SP, #8]
SUBS	R4, R4, #1
STRH	R4, [SP, #8]
;ili9341.c,454 :: 		}
; colour end address is: 40 (R10)
; x1 end address is: 44 (R11)
IT	AL
BAL	L_Draw_V_Line45
L_Draw_V_Line46:
;ili9341.c,455 :: 		}
L_end_Draw_V_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_V_Line
_Draw_H_Line:
;ili9341.c,458 :: 		void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
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
;ili9341.c,460 :: 		signed int pos = 0;
;ili9341.c,461 :: 		signed int temp = 0;
;ili9341.c,463 :: 		if(x1 > x2)
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line47
;ili9341.c,465 :: 		swap(&x1, &x2);
ADD	R5, SP, #8
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,466 :: 		}
L_Draw_H_Line47:
;ili9341.c,468 :: 		while(x2 > (x1 - 1))
SXTH	R11, R6
; colour end address is: 28 (R7)
UXTH	R10, R7
L_Draw_H_Line48:
; y1 end address is: 24 (R6)
; y1 start address is: 44 (R11)
; colour start address is: 40 (R10)
; colour start address is: 40 (R10)
; colour end address is: 40 (R10)
; y1 start address is: 44 (R11)
; y1 end address is: 44 (R11)
LDRSH	R4, [SP, #4]
SUBS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_H_Line49
; colour end address is: 40 (R10)
; y1 end address is: 44 (R11)
;ili9341.c,470 :: 		Draw_Pixel(x2, y1, colour);
; y1 start address is: 44 (R11)
; colour start address is: 40 (R10)
UXTH	R2, R10
UXTH	R1, R11
LDRSH	R0, [SP, #8]
BL	_Draw_Pixel+0
;ili9341.c,471 :: 		x2--;
LDRSH	R4, [SP, #8]
SUBS	R4, R4, #1
STRH	R4, [SP, #8]
;ili9341.c,472 :: 		}
; colour end address is: 40 (R10)
; y1 end address is: 44 (R11)
IT	AL
BAL	L_Draw_H_Line48
L_Draw_H_Line49:
;ili9341.c,473 :: 		}
L_end_Draw_H_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_H_Line
_Draw_Triangle:
;ili9341.c,476 :: 		void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
SUB	SP, SP, #44
STR	LR, [SP, #0]
STRH	R0, [SP, #28]
STRH	R1, [SP, #32]
STRH	R2, [SP, #36]
STRH	R3, [SP, #40]
LDRSH	R4, [SP, #44]
STRH	R4, [SP, #44]
LDRSH	R4, [SP, #48]
STRH	R4, [SP, #48]
; fill start address is: 0 (R0)
LDRB	R0, [SP, #52]
LDRH	R4, [SP, #56]
STRH	R4, [SP, #56]
;ili9341.c,478 :: 		signed int a = 0;
MOVW	R4, #0
STRH	R4, [SP, #4]
MOVW	R4, #0
STRH	R4, [SP, #6]
;ili9341.c,479 :: 		signed int b = 0;
;ili9341.c,480 :: 		signed int sa = 0;
;ili9341.c,481 :: 		signed int sb = 0;
;ili9341.c,482 :: 		signed int yp = 0;
;ili9341.c,483 :: 		signed int last = 0;
;ili9341.c,484 :: 		signed int dx12 = 0;
;ili9341.c,485 :: 		signed int dx23 = 0;
;ili9341.c,486 :: 		signed int dx13 = 0;
;ili9341.c,487 :: 		signed int dy12 = 0;
;ili9341.c,488 :: 		signed int dy23 = 0;
;ili9341.c,489 :: 		signed int dy13 = 0;
;ili9341.c,491 :: 		switch(fill)
IT	AL
BAL	L_Draw_Triangle50
; fill end address is: 0 (R0)
;ili9341.c,493 :: 		case YES:
L_Draw_Triangle52:
;ili9341.c,495 :: 		if(y1 > y2)
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle53
;ili9341.c,497 :: 		swap(&y1, &y2);
ADD	R5, SP, #40
ADD	R4, SP, #32
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,498 :: 		swap(&x1, &x2);
ADD	R5, SP, #36
ADD	R4, SP, #28
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,499 :: 		}
L_Draw_Triangle53:
;ili9341.c,500 :: 		if(y2 > y3)
LDRSH	R5, [SP, #48]
LDRSH	R4, [SP, #40]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle54
;ili9341.c,502 :: 		swap(&y3, &y2);
ADD	R5, SP, #40
ADD	R4, SP, #48
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,503 :: 		swap(&x3, &x2);
ADD	R5, SP, #36
ADD	R4, SP, #44
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,504 :: 		}
L_Draw_Triangle54:
;ili9341.c,505 :: 		if(y1 > y2)
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle55
;ili9341.c,507 :: 		swap(&y1, &y2);
ADD	R5, SP, #40
ADD	R4, SP, #32
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,508 :: 		swap(&x1, &x2);
ADD	R5, SP, #36
ADD	R4, SP, #28
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,509 :: 		}
L_Draw_Triangle55:
;ili9341.c,511 :: 		if(y1 == y3)
LDRSH	R5, [SP, #48]
LDRSH	R4, [SP, #32]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle56
;ili9341.c,513 :: 		a = b = x1;
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #6]
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #4]
;ili9341.c,515 :: 		if(x2 < a)
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle57
;ili9341.c,517 :: 		a = x2;
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #4]
;ili9341.c,518 :: 		}
IT	AL
BAL	L_Draw_Triangle58
L_Draw_Triangle57:
;ili9341.c,519 :: 		else if(x2 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle59
;ili9341.c,521 :: 		b = x2;
LDRSH	R4, [SP, #36]
STRH	R4, [SP, #6]
;ili9341.c,522 :: 		}
L_Draw_Triangle59:
L_Draw_Triangle58:
;ili9341.c,523 :: 		if(x2 < a)
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #36]
CMP	R4, R5
IT	GE
BGE	L_Draw_Triangle60
;ili9341.c,525 :: 		a = x3;
LDRSH	R4, [SP, #44]
STRH	R4, [SP, #4]
;ili9341.c,526 :: 		}
IT	AL
BAL	L_Draw_Triangle61
L_Draw_Triangle60:
;ili9341.c,527 :: 		else if(x3 > b)
LDRSH	R5, [SP, #6]
LDRSH	R4, [SP, #44]
CMP	R4, R5
IT	LE
BLE	L_Draw_Triangle62
;ili9341.c,529 :: 		b = x3;
LDRSH	R4, [SP, #44]
STRH	R4, [SP, #6]
;ili9341.c,530 :: 		}
L_Draw_Triangle62:
L_Draw_Triangle61:
;ili9341.c,532 :: 		Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #56]
LDRSH	R2, [SP, #32]
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili9341.c,533 :: 		return;
IT	AL
BAL	L_end_Draw_Triangle
;ili9341.c,534 :: 		}
L_Draw_Triangle56:
;ili9341.c,536 :: 		dx12 = (x2 - x1);
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #36]
SUB	R4, R4, R5
STRH	R4, [SP, #14]
;ili9341.c,537 :: 		dy12 = (y2 - y1);
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #40]
SUB	R4, R4, R5
STRH	R4, [SP, #20]
;ili9341.c,538 :: 		dx13 = (x3 - x1);
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #44]
SUB	R4, R4, R5
STRH	R4, [SP, #18]
;ili9341.c,539 :: 		dy13 = (y3 - y1);
LDRSH	R5, [SP, #32]
LDRSH	R4, [SP, #48]
SUB	R4, R4, R5
STRH	R4, [SP, #24]
;ili9341.c,540 :: 		dx23 = (x3 - x2);
LDRSH	R5, [SP, #36]
LDRSH	R4, [SP, #44]
SUB	R4, R4, R5
STRH	R4, [SP, #16]
;ili9341.c,541 :: 		dy23 = (y3 - y2);
LDRSH	R5, [SP, #40]
LDRSH	R4, [SP, #48]
SUB	R4, R4, R5
STRH	R4, [SP, #22]
;ili9341.c,542 :: 		sa = 0,
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #8]
;ili9341.c,543 :: 		sb = 0;
MOVS	R4, #0
SXTH	R4, R4
STRH	R4, [SP, #10]
;ili9341.c,545 :: 		if(y2 == y3)
LDRSH	R5, [SP, #48]
LDRSH	R4, [SP, #40]
CMP	R4, R5
IT	NE
BNE	L_Draw_Triangle63
;ili9341.c,547 :: 		last = y2;
LDRSH	R4, [SP, #40]
STRH	R4, [SP, #12]
;ili9341.c,548 :: 		}
IT	AL
BAL	L_Draw_Triangle64
L_Draw_Triangle63:
;ili9341.c,551 :: 		last = (y2 - 1);
LDRSH	R4, [SP, #40]
SUBS	R4, R4, #1
STRH	R4, [SP, #12]
;ili9341.c,552 :: 		}
L_Draw_Triangle64:
;ili9341.c,554 :: 		for(yp = y1; yp <= last; yp++)
; yp start address is: 48 (R12)
LDRSH	R12, [SP, #32]
; yp end address is: 48 (R12)
L_Draw_Triangle65:
; yp start address is: 48 (R12)
LDRSH	R4, [SP, #12]
CMP	R12, R4
IT	GT
BGT	L_Draw_Triangle66
;ili9341.c,556 :: 		a = (x1 + (sa / dy12));
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #28]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ili9341.c,557 :: 		b = (x1 + (sb / dy13));
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #28]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ili9341.c,558 :: 		sa += dx12;
LDRSH	R5, [SP, #14]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
;ili9341.c,559 :: 		sb += dx13;
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ili9341.c,560 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle68
;ili9341.c,562 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,563 :: 		}
L_Draw_Triangle68:
;ili9341.c,564 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #56]
SXTH	R2, R12
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili9341.c,554 :: 		for(yp = y1; yp <= last; yp++)
ADD	R0, R12, #1
SXTH	R0, R0
; yp end address is: 48 (R12)
; yp start address is: 0 (R0)
;ili9341.c,565 :: 		}
SXTH	R12, R0
; yp end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle65
L_Draw_Triangle66:
;ili9341.c,567 :: 		sa = (dx23 * (yp - y2));
; yp start address is: 48 (R12)
LDRSH	R4, [SP, #40]
SUB	R5, R12, R4, LSL #0
SXTH	R5, R5
LDRSH	R4, [SP, #16]
MULS	R4, R5, R4
STRH	R4, [SP, #8]
;ili9341.c,568 :: 		sb = (dx13 * (yp - y1));
LDRSH	R4, [SP, #32]
SUB	R5, R12, R4, LSL #0
SXTH	R5, R5
LDRSH	R4, [SP, #18]
MULS	R4, R5, R4
STRH	R4, [SP, #10]
; yp end address is: 48 (R12)
;ili9341.c,569 :: 		for(; yp <= y3; yp++)
L_Draw_Triangle69:
; yp start address is: 48 (R12)
LDRSH	R4, [SP, #48]
CMP	R12, R4
IT	GT
BGT	L_Draw_Triangle70
;ili9341.c,571 :: 		a = (x2 + (sa / dy23));
LDRSH	R5, [SP, #22]
LDRSH	R4, [SP, #8]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #36]
ADDS	R7, R4, R5
SXTH	R7, R7
STRH	R7, [SP, #4]
;ili9341.c,572 :: 		b = (x1 + (sb / dy13));
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #10]
SDIV	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #28]
ADDS	R6, R4, R5
SXTH	R6, R6
STRH	R6, [SP, #6]
;ili9341.c,573 :: 		sa += dx23;
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #8]
ADDS	R4, R4, R5
STRH	R4, [SP, #8]
;ili9341.c,574 :: 		sb += dx13;
LDRSH	R5, [SP, #18]
LDRSH	R4, [SP, #10]
ADDS	R4, R4, R5
STRH	R4, [SP, #10]
;ili9341.c,576 :: 		if(a > b)
CMP	R7, R6
IT	LE
BLE	L_Draw_Triangle72
;ili9341.c,578 :: 		swap(&a, &b);
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,579 :: 		}
L_Draw_Triangle72:
;ili9341.c,580 :: 		Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
LDRSH	R4, [SP, #4]
ADDS	R5, R4, #1
SXTH	R5, R5
LDRSH	R4, [SP, #6]
SUB	R5, R4, R5
SXTH	R5, R5
LDRSH	R4, [SP, #4]
ADDS	R4, R4, R5
LDRH	R3, [SP, #56]
SXTH	R2, R12
SXTH	R1, R4
LDRSH	R0, [SP, #4]
BL	_Draw_H_Line+0
;ili9341.c,569 :: 		for(; yp <= y3; yp++)
ADD	R4, R12, #1
; yp end address is: 48 (R12)
; yp start address is: 0 (R0)
SXTH	R0, R4
;ili9341.c,581 :: 		}
SXTH	R12, R0
; yp end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle69
L_Draw_Triangle70:
;ili9341.c,584 :: 		break;
IT	AL
BAL	L_Draw_Triangle51
;ili9341.c,586 :: 		default:
L_Draw_Triangle73:
;ili9341.c,588 :: 		Draw_Line(x1, y1, x2, y2, colour);
LDRH	R4, [SP, #56]
LDRSH	R3, [SP, #40]
LDRSH	R2, [SP, #36]
LDRSH	R1, [SP, #32]
LDRSH	R0, [SP, #28]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili9341.c,589 :: 		Draw_Line(x2, y2, x3, y3, colour);
LDRH	R4, [SP, #56]
LDRSH	R3, [SP, #48]
LDRSH	R2, [SP, #44]
LDRSH	R1, [SP, #40]
LDRSH	R0, [SP, #36]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili9341.c,590 :: 		Draw_Line(x3, y3, x1, y1, colour);
LDRH	R4, [SP, #56]
LDRSH	R3, [SP, #32]
LDRSH	R2, [SP, #28]
LDRSH	R1, [SP, #48]
LDRSH	R0, [SP, #44]
PUSH	(R4)
BL	_Draw_Line+0
ADD	SP, SP, #4
;ili9341.c,591 :: 		break;
IT	AL
BAL	L_Draw_Triangle51
;ili9341.c,593 :: 		}
L_Draw_Triangle50:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Triangle52
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Triangle73
L_Draw_Triangle51:
;ili9341.c,594 :: 		}
L_end_Draw_Triangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _Draw_Triangle
_Draw_Rectangle:
;ili9341.c,597 :: 		void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
; x1 start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
SXTH	R12, R0
STRH	R1, [SP, #12]
STRH	R2, [SP, #16]
STRH	R3, [SP, #20]
; x1 end address is: 0 (R0)
; x1 start address is: 48 (R12)
; fill start address is: 0 (R0)
LDRB	R0, [SP, #24]
LDRB	R4, [SP, #28]
STRB	R4, [SP, #28]
LDRH	R4, [SP, #32]
STRH	R4, [SP, #32]
LDRH	R4, [SP, #36]
STRH	R4, [SP, #36]
;ili9341.c,599 :: 		signed int i = 0x0000;
;ili9341.c,600 :: 		signed int xmin = 0x0000;
;ili9341.c,601 :: 		signed int xmax = 0x0000;
;ili9341.c,602 :: 		signed int ymin = 0x0000;
;ili9341.c,603 :: 		signed int ymax = 0x0000;
;ili9341.c,605 :: 		switch(fill)
IT	AL
BAL	L_Draw_Rectangle74
; fill end address is: 0 (R0)
;ili9341.c,607 :: 		case YES:
L_Draw_Rectangle76:
;ili9341.c,609 :: 		if(x1 < x2)
LDRSH	R4, [SP, #16]
CMP	R12, R4
IT	GE
BGE	L_Draw_Rectangle77
;ili9341.c,611 :: 		xmin = x1;
; xmin start address is: 32 (R8)
SXTH	R8, R12
;ili9341.c,612 :: 		xmax = x2;
LDRSH	R4, [SP, #16]
STRH	R4, [SP, #4]
;ili9341.c,613 :: 		}
SXTH	R9, R8
; xmin end address is: 32 (R8)
IT	AL
BAL	L_Draw_Rectangle78
L_Draw_Rectangle77:
;ili9341.c,616 :: 		xmin = x2;
; xmin start address is: 32 (R8)
LDRSH	R8, [SP, #16]
;ili9341.c,617 :: 		xmax = x1;
STRH	R12, [SP, #4]
; xmin end address is: 32 (R8)
SXTH	R9, R8
;ili9341.c,618 :: 		}
L_Draw_Rectangle78:
;ili9341.c,620 :: 		if(y1 < y2)
; xmin start address is: 36 (R9)
LDRSH	R5, [SP, #20]
LDRSH	R4, [SP, #12]
CMP	R4, R5
IT	GE
BGE	L_Draw_Rectangle79
;ili9341.c,622 :: 		ymin = y1;
LDRSH	R4, [SP, #12]
STRH	R4, [SP, #6]
;ili9341.c,623 :: 		ymax = y2;
LDRSH	R4, [SP, #20]
STRH	R4, [SP, #8]
;ili9341.c,624 :: 		}
IT	AL
BAL	L_Draw_Rectangle80
L_Draw_Rectangle79:
;ili9341.c,627 :: 		ymin = y2;
LDRSH	R4, [SP, #20]
STRH	R4, [SP, #6]
;ili9341.c,628 :: 		ymax = y1;
LDRSH	R4, [SP, #12]
STRH	R4, [SP, #8]
;ili9341.c,629 :: 		}
L_Draw_Rectangle80:
;ili9341.c,631 :: 		for(; xmin <= xmax; ++xmin)
SXTH	R0, R12
; x1 end address is: 48 (R12)
; xmin end address is: 36 (R9)
L_Draw_Rectangle81:
; xmin start address is: 36 (R9)
; x1 start address is: 0 (R0)
LDRSH	R4, [SP, #4]
CMP	R9, R4
IT	GT
BGT	L_Draw_Rectangle82
;ili9341.c,633 :: 		for(i = ymin; i <= ymax; ++i)
; i start address is: 44 (R11)
LDRSH	R11, [SP, #6]
; x1 end address is: 0 (R0)
; i end address is: 44 (R11)
; xmin end address is: 36 (R9)
SXTH	R12, R9
SXTH	R10, R0
L_Draw_Rectangle84:
; i start address is: 44 (R11)
; x1 start address is: 40 (R10)
; xmin start address is: 48 (R12)
LDRSH	R4, [SP, #8]
CMP	R11, R4
IT	GT
BGT	L_Draw_Rectangle85
;ili9341.c,635 :: 		Draw_Pixel(xmin, i, colour);
LDRH	R2, [SP, #32]
UXTH	R1, R11
UXTH	R0, R12
BL	_Draw_Pixel+0
;ili9341.c,633 :: 		for(i = ymin; i <= ymax; ++i)
ADD	R4, R11, #1
; i end address is: 44 (R11)
; i start address is: 4 (R1)
SXTH	R1, R4
;ili9341.c,636 :: 		}
; i end address is: 4 (R1)
SXTH	R11, R1
IT	AL
BAL	L_Draw_Rectangle84
L_Draw_Rectangle85:
;ili9341.c,631 :: 		for(; xmin <= xmax; ++xmin)
ADD	R4, R12, #1
; xmin end address is: 48 (R12)
; xmin start address is: 36 (R9)
SXTH	R9, R4
;ili9341.c,637 :: 		}
SXTH	R0, R10
; xmin end address is: 36 (R9)
; x1 end address is: 40 (R10)
IT	AL
BAL	L_Draw_Rectangle81
L_Draw_Rectangle82:
;ili9341.c,639 :: 		break;
; x1 start address is: 0 (R0)
SXTH	R10, R0
; x1 end address is: 0 (R0)
IT	AL
BAL	L_Draw_Rectangle75
;ili9341.c,641 :: 		default:
L_Draw_Rectangle87:
;ili9341.c,643 :: 		Draw_V_Line(x1, y1, y2, colour);
; x1 start address is: 48 (R12)
LDRH	R3, [SP, #32]
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #12]
SXTH	R0, R12
BL	_Draw_V_Line+0
;ili9341.c,644 :: 		Draw_V_Line(x2, y1, y2, colour);
LDRH	R3, [SP, #32]
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
BL	_Draw_V_Line+0
;ili9341.c,645 :: 		Draw_H_Line(x1, x2, y1, colour);
LDRH	R3, [SP, #32]
LDRSH	R2, [SP, #12]
LDRSH	R1, [SP, #16]
SXTH	R0, R12
BL	_Draw_H_Line+0
;ili9341.c,646 :: 		Draw_H_Line(x1, x2, y2, colour);
LDRH	R3, [SP, #32]
LDRSH	R2, [SP, #20]
LDRSH	R1, [SP, #16]
SXTH	R0, R12
BL	_Draw_H_Line+0
;ili9341.c,647 :: 		break;
SXTH	R10, R12
IT	AL
BAL	L_Draw_Rectangle75
;ili9341.c,649 :: 		}
L_Draw_Rectangle74:
; fill start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_Draw_Rectangle76
; fill end address is: 0 (R0)
IT	AL
BAL	L_Draw_Rectangle87
; x1 end address is: 48 (R12)
L_Draw_Rectangle75:
;ili9341.c,651 :: 		if(type != SQUARE)
; x1 start address is: 40 (R10)
LDRB	R4, [SP, #28]
CMP	R4, #0
IT	EQ
BEQ	L_Draw_Rectangle88
;ili9341.c,653 :: 		Draw_Pixel(x1, y1, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #12]
UXTH	R0, R10
BL	_Draw_Pixel+0
;ili9341.c,654 :: 		Draw_Pixel(x1, y2, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #20]
UXTH	R0, R10
; x1 end address is: 40 (R10)
BL	_Draw_Pixel+0
;ili9341.c,655 :: 		Draw_Pixel(x2, y1, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #12]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;ili9341.c,656 :: 		Draw_Pixel(x2, y2, back_colour);
LDRH	R2, [SP, #36]
LDRSH	R1, [SP, #20]
LDRSH	R0, [SP, #16]
BL	_Draw_Pixel+0
;ili9341.c,657 :: 		}
L_Draw_Rectangle88:
;ili9341.c,658 :: 		}
L_end_Draw_Rectangle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Rectangle
_Draw_H_Bar:
;ili9341.c,661 :: 		void Draw_H_Bar(signed int x1, signed int x2, signed int y1, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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
;ili9341.c,663 :: 		switch(border)
IT	AL
BAL	L_Draw_H_Bar89
; border end address is: 16 (R4)
;ili9341.c,665 :: 		case YES:
L_Draw_H_Bar91:
;ili9341.c,667 :: 		Draw_Rectangle((x1 + 1), (y1 + 1), (x1 + bar_value), (y1 + bar_width - 1), YES, SQUARE, bar_colour, back_colour);
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
;ili9341.c,668 :: 		Draw_Rectangle((x2 - 1), (y1 + 1), (x1 + bar_value + 1), (y1 + bar_width - 1), YES, SQUARE, back_colour, back_colour);
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
;ili9341.c,669 :: 		Draw_Rectangle(x1, y1, x2, (y1 + bar_width), NO, SQUARE, border_colour, back_colour);
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
;ili9341.c,670 :: 		break;
IT	AL
BAL	L_Draw_H_Bar90
;ili9341.c,672 :: 		default:
L_Draw_H_Bar92:
;ili9341.c,674 :: 		Draw_Rectangle(x1, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, bar_colour, back_colour);
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
;ili9341.c,675 :: 		Draw_Rectangle(x2, y1, (x1 + bar_value), (y1 + bar_width), YES, SQUARE, back_colour, back_colour);
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
;ili9341.c,676 :: 		break;
IT	AL
BAL	L_Draw_H_Bar90
;ili9341.c,678 :: 		}
L_Draw_H_Bar89:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y1 start address is: 8 (R2)
; x2 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_H_Bar91
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_H_Bar92
; x1 end address is: 0 (R0)
; x2 end address is: 4 (R1)
; y1 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_H_Bar90:
;ili9341.c,679 :: 		}
L_end_Draw_H_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_H_Bar
_Draw_V_Bar:
;ili9341.c,682 :: 		void Draw_V_Bar(signed int x1, signed int y1, signed int y2, signed int bar_width, signed int bar_value, unsigned int border_colour, unsigned int bar_colour, unsigned int back_colour, unsigned char border)
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
;ili9341.c,684 :: 		switch(border)
IT	AL
BAL	L_Draw_V_Bar93
; border end address is: 16 (R4)
;ili9341.c,686 :: 		case YES:
L_Draw_V_Bar95:
;ili9341.c,688 :: 		Draw_Rectangle((x1 + 1), (y2 - 1), (x1 + bar_width - 1), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
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
;ili9341.c,689 :: 		Draw_Rectangle((x1 + 1), (y2 - bar_value - 1), (x1 + bar_width - 1), (y1 + 1), YES, SQUARE, back_colour, back_colour);
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
;ili9341.c,690 :: 		Draw_Rectangle(x1, y1, (x1 + bar_width), y2, NO, SQUARE, border_colour, back_colour);
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
;ili9341.c,691 :: 		break;
IT	AL
BAL	L_Draw_V_Bar94
;ili9341.c,693 :: 		default:
L_Draw_V_Bar96:
;ili9341.c,695 :: 		Draw_Rectangle(x1, y2, (x1 + bar_width), (y2 - bar_value), YES, SQUARE, bar_colour, back_colour);
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
;ili9341.c,696 :: 		Draw_Rectangle(x1, (y2 - bar_value), (x1 + bar_width), y1, YES, SQUARE, back_colour, back_colour);
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
;ili9341.c,697 :: 		break;
IT	AL
BAL	L_Draw_V_Bar94
;ili9341.c,699 :: 		}
L_Draw_V_Bar93:
; border start address is: 16 (R4)
; bar_colour start address is: 20 (R5)
; bar_value start address is: 48 (R12)
; bar_width start address is: 12 (R3)
; y2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
CMP	R4, #1
IT	EQ
BEQ	L_Draw_V_Bar95
; border end address is: 16 (R4)
IT	AL
BAL	L_Draw_V_Bar96
; x1 end address is: 0 (R0)
; y1 end address is: 4 (R1)
; y2 end address is: 8 (R2)
; bar_width end address is: 12 (R3)
; bar_value end address is: 48 (R12)
; bar_colour end address is: 20 (R5)
L_Draw_V_Bar94:
;ili9341.c,700 :: 		}
L_end_Draw_V_Bar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_V_Bar
_Draw_Circle:
;ili9341.c,703 :: 		void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
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
;ili9341.c,705 :: 		signed int a = 0x0000;
; a start address is: 40 (R10)
MOVW	R10, #0
SXTH	R10, R10
;ili9341.c,706 :: 		signed int b = 0x0000;
;ili9341.c,707 :: 		signed int p = 0x0000;
;ili9341.c,709 :: 		b = radius;
STRH	R0, [SP, #8]
;ili9341.c,710 :: 		p = (1 - b);
RSB	R4, R0, #1
; radius end address is: 0 (R0)
STRH	R4, [SP, #10]
; a end address is: 40 (R10)
SXTH	R0, R10
;ili9341.c,712 :: 		do
IT	AL
BAL	L_Draw_Circle97
L__Draw_Circle260:
;ili9341.c,746 :: 		}while(a <= b);
SXTH	R0, R10
;ili9341.c,712 :: 		do
L_Draw_Circle97:
;ili9341.c,714 :: 		switch(fill)
; a start address is: 0 (R0)
IT	AL
BAL	L_Draw_Circle100
;ili9341.c,716 :: 		case YES:
L_Draw_Circle102:
;ili9341.c,718 :: 		Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
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
;ili9341.c,719 :: 		Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
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
;ili9341.c,720 :: 		Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
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
;ili9341.c,721 :: 		Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
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
;ili9341.c,722 :: 		break;
IT	AL
BAL	L_Draw_Circle101
;ili9341.c,724 :: 		default:
L_Draw_Circle103:
;ili9341.c,726 :: 		Draw_Pixel((xc + a), (yc + b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
ADDS	R5, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R5
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,727 :: 		Draw_Pixel((xc + b), (yc + a), colour);
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,728 :: 		Draw_Pixel((xc - a), (yc + b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
ADDS	R5, R4, R5
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R5
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,729 :: 		Draw_Pixel((xc - b), (yc + a), colour);
LDRSH	R4, [SP, #16]
ADDS	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,730 :: 		Draw_Pixel((xc + b), (yc - a), colour);
LDRSH	R4, [SP, #16]
SUB	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,731 :: 		Draw_Pixel((xc + a), (yc - b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R5, R4, R5
LDRSH	R4, [SP, #12]
ADDS	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R5
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,732 :: 		Draw_Pixel((xc - a), (yc - b), colour);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R5, R4, R5
LDRSH	R4, [SP, #12]
SUB	R4, R4, R0
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R5
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,733 :: 		Draw_Pixel((xc - b), (yc - a), colour);
LDRSH	R4, [SP, #16]
SUB	R6, R4, R0
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R0, [SP, #4]
LDRH	R2, [SP, #24]
UXTH	R1, R6
UXTH	R0, R4
BL	_Draw_Pixel+0
LDRSH	R0, [SP, #4]
;ili9341.c,734 :: 		break;
IT	AL
BAL	L_Draw_Circle101
;ili9341.c,736 :: 		}
L_Draw_Circle100:
LDRB	R4, [SP, #20]
CMP	R4, #1
IT	EQ
BEQ	L_Draw_Circle102
IT	AL
BAL	L_Draw_Circle103
L_Draw_Circle101:
;ili9341.c,738 :: 		if(p < 0)
LDRSH	R4, [SP, #10]
CMP	R4, #0
IT	GE
BGE	L_Draw_Circle104
;ili9341.c,740 :: 		p += (0x03 + (0x02 * a++));
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
;ili9341.c,741 :: 		}
; a end address is: 40 (R10)
IT	AL
BAL	L_Draw_Circle105
L_Draw_Circle104:
;ili9341.c,744 :: 		p += (0x05 + (0x02 * ((a++) - (b--))));
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
;ili9341.c,745 :: 		}
L_Draw_Circle105:
;ili9341.c,746 :: 		}while(a <= b);
; a start address is: 40 (R10)
LDRSH	R4, [SP, #8]
CMP	R10, R4
IT	LE
BLE	L__Draw_Circle260
; a end address is: 40 (R10)
;ili9341.c,747 :: 		}
L_end_Draw_Circle:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _Draw_Circle
_Draw_Font_Pixel:
;ili9341.c,751 :: 		void Draw_Font_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour, unsigned char pixel_size)
; pixel_size start address is: 12 (R3)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRH	R2, [SP, #8]
; pixel_size end address is: 12 (R3)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; pixel_size start address is: 12 (R3)
;ili9341.c,753 :: 		unsigned char i = (pixel_size * pixel_size);
MUL	R4, R3, R3
STRB	R4, [SP, #4]
;ili9341.c,755 :: 		TFT_set_display_window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));
ADDS	R4, R1, R3
UXTH	R4, R4
SUBS	R5, R4, #1
ADDS	R4, R0, R3
UXTH	R4, R4
; pixel_size end address is: 12 (R3)
SUBS	R4, R4, #1
UXTH	R3, R5
UXTH	R2, R4
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
BL	_TFT_set_display_window+0
;ili9341.c,757 :: 		while(i > 0)
L_Draw_Font_Pixel106:
LDRB	R4, [SP, #4]
CMP	R4, #0
IT	LS
BLS	L_Draw_Font_Pixel107
;ili9341.c,759 :: 		TFT_write_word(colour, DAT);
MOVS	R1, #1
LDRH	R0, [SP, #8]
BL	_TFT_write_word+0
;ili9341.c,760 :: 		i--;
LDRB	R4, [SP, #4]
SUBS	R4, R4, #1
STRB	R4, [SP, #4]
;ili9341.c,761 :: 		}
IT	AL
BAL	L_Draw_Font_Pixel106
L_Draw_Font_Pixel107:
;ili9341.c,762 :: 		}
L_end_Draw_Font_Pixel:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Draw_Font_Pixel
_print_char:
;ili9341.c,765 :: 		void print_char(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
; font_size start address is: 8 (R2)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRH	R0, [SP, #8]
STRH	R1, [SP, #12]
UXTB	R9, R2
STRH	R3, [SP, #16]
; font_size end address is: 8 (R2)
; font_size start address is: 36 (R9)
LDRH	R4, [SP, #20]
STRH	R4, [SP, #20]
LDRB	R4, [SP, #24]
STRB	R4, [SP, #24]
;ili9341.c,767 :: 		unsigned char i = 0x00;
;ili9341.c,768 :: 		unsigned char j = 0x00;
;ili9341.c,769 :: 		unsigned char value = 0x00;
;ili9341.c,771 :: 		if(font_size <= 0)
CMP	R9, #0
IT	HI
BHI	L__print_char261
; font_size end address is: 36 (R9)
;ili9341.c,773 :: 		font_size = 1;
; font_size start address is: 20 (R5)
MOVS	R5, #1
; font_size end address is: 20 (R5)
UXTB	R9, R5
;ili9341.c,774 :: 		}
IT	AL
BAL	L_print_char108
L__print_char261:
;ili9341.c,771 :: 		if(font_size <= 0)
;ili9341.c,774 :: 		}
L_print_char108:
;ili9341.c,776 :: 		if(x_pos < font_size)
; font_size start address is: 36 (R9)
LDRH	R4, [SP, #8]
CMP	R4, R9
IT	CS
BCS	L_print_char109
;ili9341.c,778 :: 		x_pos = font_size;
STRH	R9, [SP, #8]
;ili9341.c,779 :: 		}
L_print_char109:
;ili9341.c,781 :: 		for(i = 0x00; i < 0x05; i++)
MOVS	R4, #0
STRB	R4, [SP, #4]
; font_size end address is: 36 (R9)
UXTB	R0, R9
L_print_char110:
; font_size start address is: 0 (R0)
LDRB	R4, [SP, #4]
CMP	R4, #5
IT	CS
BCS	L_print_char111
;ili9341.c,783 :: 		for(j = 0x00; j < 0x08; j++)
MOVS	R4, #0
STRB	R4, [SP, #5]
; font_size end address is: 0 (R0)
UXTB	R9, R0
L_print_char113:
; font_size start address is: 36 (R9)
LDRB	R4, [SP, #5]
CMP	R4, #8
IT	CS
BCS	L_print_char114
;ili9341.c,786 :: 		value = ((font[((unsigned char)ch) - 0x20][i]));
LDRB	R4, [SP, #24]
SUBW	R5, R4, #32
SXTH	R5, R5
MOVS	R4, #5
MULS	R5, R4, R5
MOVW	R4, #lo_addr(tft_disp_demo_font+0)
MOVT	R4, #hi_addr(tft_disp_demo_font+0)
ADDS	R5, R4, R5
LDRB	R4, [SP, #4]
ADDS	R4, R5, R4
LDRB	R5, [R4, #0]
;ili9341.c,788 :: 		if(((value >> j) & 0x01) != 0x00)
LDRB	R4, [SP, #5]
LSR	R4, R5, R4
UXTB	R4, R4
AND	R4, R4, #1
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_print_char116
;ili9341.c,790 :: 		Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
UXTB	R3, R9
LDRH	R2, [SP, #16]
LDRH	R1, [SP, #12]
LDRH	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;ili9341.c,791 :: 		}
IT	AL
BAL	L_print_char117
L_print_char116:
;ili9341.c,794 :: 		Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
UXTB	R3, R9
LDRH	R2, [SP, #20]
LDRH	R1, [SP, #12]
LDRH	R0, [SP, #8]
BL	_Draw_Font_Pixel+0
;ili9341.c,795 :: 		}
L_print_char117:
;ili9341.c,797 :: 		y_pos += font_size;
LDRH	R4, [SP, #12]
ADD	R4, R4, R9, LSL #0
STRH	R4, [SP, #12]
;ili9341.c,783 :: 		for(j = 0x00; j < 0x08; j++)
LDRB	R4, [SP, #5]
ADDS	R4, R4, #1
STRB	R4, [SP, #5]
;ili9341.c,798 :: 		}
IT	AL
BAL	L_print_char113
L_print_char114:
;ili9341.c,800 :: 		y_pos -= (font_size << 0x03);
LSL	R5, R9, #3
UXTH	R5, R5
LDRH	R4, [SP, #12]
SUB	R4, R4, R5
STRH	R4, [SP, #12]
;ili9341.c,801 :: 		x_pos += font_size;
LDRH	R4, [SP, #8]
ADD	R4, R4, R9, LSL #0
STRH	R4, [SP, #8]
;ili9341.c,781 :: 		for(i = 0x00; i < 0x05; i++)
LDRB	R4, [SP, #4]
ADDS	R4, R4, #1
STRB	R4, [SP, #4]
;ili9341.c,802 :: 		}
UXTB	R0, R9
; font_size end address is: 36 (R9)
IT	AL
BAL	L_print_char110
L_print_char111:
;ili9341.c,803 :: 		}
L_end_print_char:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _print_char
_print_str:
;ili9341.c,806 :: 		void print_str(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 16 (R4)
LDRH	R4, [SP, #20]
; ch start address is: 20 (R5)
LDR	R5, [SP, #24]
STRH	R1, [SP, #4]
; x_pos end address is: 0 (R0)
; y_pos end address is: 4 (R1)
; font_size end address is: 8 (R2)
; colour end address is: 12 (R3)
; back_colour end address is: 16 (R4)
; ch end address is: 20 (R5)
UXTH	R1, R0
UXTB	R12, R2
MOV	R2, R5
UXTH	R11, R3
UXTH	R10, R4
LDRH	R0, [SP, #4]
;ili9341.c,808 :: 		do
L_print_str118:
;ili9341.c,810 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
; ch start address is: 8 (R2)
; ch start address is: 8 (R2)
; back_colour start address is: 40 (R10)
; colour start address is: 44 (R11)
; font_size start address is: 48 (R12)
; y_pos start address is: 0 (R0)
; x_pos start address is: 4 (R1)
LDRB	R4, [R2, #0]
UXTB	R5, R4
UXTH	R4, R10
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
STR	R2, [SP, #12]
STRH	R1, [SP, #16]
UXTH	R3, R11
UXTB	R2, R12
UXTH	R1, R0
LDRH	R0, [SP, #16]
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
LDR	R2, [SP, #12]
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
ADDS	R5, R2, #1
MOV	R2, R5
; ch end address is: 8 (R2)
;ili9341.c,811 :: 		x_pos += (font_size * 0x06);
MOVS	R4, #6
SXTH	R4, R4
MUL	R4, R12, R4
SXTH	R4, R4
ADDS	R1, R1, R4
UXTH	R1, R1
;ili9341.c,812 :: 		}while((*ch >= 0x20) && (*ch <= 0x7F));
LDRB	R4, [R5, #0]
CMP	R4, #32
IT	CC
BCC	L__print_str264
; ch end address is: 8 (R2)
; ch start address is: 8 (R2)
LDRB	R4, [R2, #0]
CMP	R4, #127
IT	HI
BHI	L__print_str263
; ch end address is: 8 (R2)
IT	AL
BAL	L_print_str118
L__print_str264:
L__print_str263:
;ili9341.c,814 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
MOVS	R5, #32
UXTH	R4, R10
; back_colour end address is: 40 (R10)
STRH	R1, [SP, #4]
; colour end address is: 44 (R11)
UXTH	R3, R11
UXTB	R2, R12
; font_size end address is: 48 (R12)
UXTH	R1, R0
; y_pos end address is: 0 (R0)
LDRH	R0, [SP, #4]
; x_pos end address is: 4 (R1)
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ili9341.c,815 :: 		}
L_end_print_str:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _print_str
_print_C:
;ili9341.c,818 :: 		void print_C(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
;ili9341.c,820 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;ili9341.c,822 :: 		if(value < 0x00)
CMP	R6, #0
IT	GE
BGE	L_print_C123
;ili9341.c,824 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ili9341.c,825 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ili9341.c,826 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_C124
L_print_C123:
;ili9341.c,829 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;ili9341.c,830 :: 		}
L_print_C124:
;ili9341.c,832 :: 		if((value > 99) && (value <= 999))
; value start address is: 36 (R9)
CMP	R9, #99
IT	LE
BLE	L__print_C269
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_C268
L__print_C267:
;ili9341.c,834 :: 		ch[1] = ((value / 100) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVS	R4, #100
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili9341.c,835 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,836 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,837 :: 		}
IT	AL
BAL	L_print_C128
;ili9341.c,832 :: 		if((value > 99) && (value <= 999))
L__print_C269:
; value start address is: 36 (R9)
L__print_C268:
;ili9341.c,838 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_C271
CMP	R9, #99
IT	GT
BGT	L__print_C270
L__print_C266:
;ili9341.c,840 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,841 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,842 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,843 :: 		}
IT	AL
BAL	L_print_C132
;ili9341.c,838 :: 		else if((value > 9) && (value <= 99))
L__print_C271:
; value start address is: 36 (R9)
L__print_C270:
;ili9341.c,844 :: 		else if((value >= 0) && (value <= 9))
CMP	R9, #0
IT	LT
BLT	L__print_C273
CMP	R9, #9
IT	GT
BGT	L__print_C272
L__print_C265:
;ili9341.c,846 :: 		ch[1] = ((value % 10) + 0x30);
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
;ili9341.c,847 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,848 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,844 :: 		else if((value >= 0) && (value <= 9))
L__print_C273:
L__print_C272:
;ili9341.c,849 :: 		}
L_print_C132:
L_print_C128:
;ili9341.c,851 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili9341.c,852 :: 		}
L_end_print_C:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_C
_print_I:
;ili9341.c,855 :: 		void print_I(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
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
;ili9341.c,857 :: 		unsigned char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
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
;ili9341.c,859 :: 		if(value < 0)
CMP	R6, #0
IT	GE
BGE	L_print_I136
;ili9341.c,861 :: 		ch[0] = 0x2D;
ADD	R5, SP, #4
MOVS	R4, #45
STRB	R4, [R5, #0]
;ili9341.c,862 :: 		value = -value;
RSB	R9, R6, #0
SXTH	R9, R9
; value end address is: 24 (R6)
; value start address is: 36 (R9)
;ili9341.c,863 :: 		}
; value end address is: 36 (R9)
IT	AL
BAL	L_print_I137
L_print_I136:
;ili9341.c,866 :: 		ch[0] = 0x20;
; value start address is: 24 (R6)
ADD	R5, SP, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
; value end address is: 24 (R6)
SXTH	R9, R6
;ili9341.c,867 :: 		}
L_print_I137:
;ili9341.c,869 :: 		if(value > 9999)
; value start address is: 36 (R9)
MOVW	R4, #9999
CMP	R9, R4
IT	LE
BLE	L_print_I138
;ili9341.c,871 :: 		ch[1] = ((value / 10000) + 0x30);
ADD	R7, SP, #4
ADDS	R5, R7, #1
MOVW	R4, #10000
SXTH	R4, R4
SDIV	R4, R9, R4
SXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili9341.c,872 :: 		ch[2] = (((value % 10000)/ 1000) + 0x30);
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
;ili9341.c,873 :: 		ch[3] = (((value % 1000) / 100) + 0x30);
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
;ili9341.c,874 :: 		ch[4] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,875 :: 		ch[5] = ((value % 10) + 0x30);
ADDS	R6, R7, #5
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,876 :: 		}
IT	AL
BAL	L_print_I139
L_print_I138:
;ili9341.c,878 :: 		else if((value > 999) && (value <= 9999))
; value start address is: 36 (R9)
MOVW	R4, #999
CMP	R9, R4
IT	LE
BLE	L__print_I278
MOVW	R4, #9999
CMP	R9, R4
IT	GT
BGT	L__print_I277
L__print_I276:
;ili9341.c,880 :: 		ch[1] = (((value % 10000)/ 1000) + 0x30);
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
;ili9341.c,881 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
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
;ili9341.c,882 :: 		ch[3] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,883 :: 		ch[4] = ((value % 10) + 0x30);
ADDS	R6, R7, #4
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,884 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,885 :: 		}
IT	AL
BAL	L_print_I143
;ili9341.c,878 :: 		else if((value > 999) && (value <= 9999))
L__print_I278:
; value start address is: 36 (R9)
L__print_I277:
;ili9341.c,886 :: 		else if((value > 99) && (value <= 999))
CMP	R9, #99
IT	LE
BLE	L__print_I280
MOVW	R4, #999
CMP	R9, R4
IT	GT
BGT	L__print_I279
L__print_I275:
;ili9341.c,888 :: 		ch[1] = (((value % 1000) / 100) + 0x30);
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
;ili9341.c,889 :: 		ch[2] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,890 :: 		ch[3] = ((value % 10) + 0x30);
ADDS	R6, R7, #3
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,891 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,892 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,893 :: 		}
IT	AL
BAL	L_print_I147
;ili9341.c,886 :: 		else if((value > 99) && (value <= 999))
L__print_I280:
; value start address is: 36 (R9)
L__print_I279:
;ili9341.c,894 :: 		else if((value > 9) && (value <= 99))
CMP	R9, #9
IT	LE
BLE	L__print_I282
CMP	R9, #99
IT	GT
BGT	L__print_I281
L__print_I274:
;ili9341.c,896 :: 		ch[1] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,897 :: 		ch[2] = ((value % 10) + 0x30);
ADDS	R6, R7, #2
MOVS	R5, #10
SXTH	R5, R5
SDIV	R4, R9, R5
MLS	R4, R5, R4, R9
SXTH	R4, R4
; value end address is: 36 (R9)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,898 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,899 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,900 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,901 :: 		}
IT	AL
BAL	L_print_I151
;ili9341.c,894 :: 		else if((value > 9) && (value <= 99))
L__print_I282:
; value start address is: 36 (R9)
L__print_I281:
;ili9341.c,904 :: 		ch[1] = ((value % 10) + 0x30);
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
;ili9341.c,905 :: 		ch[2] = 0x20;
ADDS	R5, R7, #2
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,906 :: 		ch[3] = 0x20;
ADDS	R5, R7, #3
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,907 :: 		ch[4] = 0x20;
ADDS	R5, R7, #4
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,908 :: 		ch[5] = 0x20;
ADDS	R5, R7, #5
MOVS	R4, #32
STRB	R4, [R5, #0]
;ili9341.c,909 :: 		}
L_print_I151:
L_print_I147:
L_print_I143:
L_print_I139:
;ili9341.c,911 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili9341.c,912 :: 		}
L_end_print_I:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _print_I
_print_D:
;ili9341.c,915 :: 		void print_D(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
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
; back_colour start address is: 28 (R7)
LDRH	R7, [SP, #8]
; value start address is: 32 (R8)
LDRH	R8, [SP, #12]
; points start address is: 36 (R9)
LDRB	R9, [SP, #16]
;ili9341.c,917 :: 		unsigned char ch[4] = {0x2E, 0x20, 0x20, 0x20};
MOVS	R4, #46
STRB	R4, [SP, #4]
MOVS	R4, #32
STRB	R4, [SP, #5]
MOVS	R4, #32
STRB	R4, [SP, #6]
MOVS	R4, #32
STRB	R4, [SP, #7]
;ili9341.c,919 :: 		ch[1] = ((value / 1000) + 0x30);
ADD	R4, SP, #4
ADDS	R5, R4, #1
MOVW	R4, #1000
UDIV	R4, R8, R4
UXTH	R4, R4
ADDS	R4, #48
STRB	R4, [R5, #0]
;ili9341.c,921 :: 		if(points > 1)
CMP	R9, #1
IT	LS
BLS	L_print_D152
;ili9341.c,923 :: 		ch[2] = (((value % 1000) / 100) + 0x30);
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
;ili9341.c,925 :: 		if(points > 2)
CMP	R9, #2
IT	LS
BLS	L_print_D153
;ili9341.c,927 :: 		ch[3] = (((value % 100) / 10) + 0x30);
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
;ili9341.c,929 :: 		if(points > 3)
CMP	R9, #3
IT	LS
BLS	L_print_D154
; points end address is: 36 (R9)
;ili9341.c,931 :: 		ch[4] = ((value % 10) + 0x30);
ADD	R4, SP, #4
ADDS	R6, R4, #4
MOVS	R5, #10
UDIV	R4, R8, R5
MLS	R4, R5, R4, R8
UXTH	R4, R4
; value end address is: 32 (R8)
ADDS	R4, #48
STRB	R4, [R6, #0]
;ili9341.c,932 :: 		}
L_print_D154:
;ili9341.c,933 :: 		}
L_print_D153:
;ili9341.c,934 :: 		}
L_print_D152:
;ili9341.c,936 :: 		print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
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
;ili9341.c,937 :: 		}
L_end_print_D:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _print_D
_print_F:
;ili9341.c,940 :: 		void print_F(unsigned int x_pos, unsigned int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
SUB	SP, SP, #32
STR	LR, [SP, #0]
; x_pos start address is: 0 (R0)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; font_size start address is: 8 (R2)
; colour start address is: 12 (R3)
; back_colour start address is: 32 (R8)
LDRH	R8, [SP, #32]
; value start address is: 8 (R2)
VMOV.F32	S2, S0
; points start address is: 24 (R6)
LDRB	R6, [SP, #36]
;ili9341.c,942 :: 		signed long tmp = 0x0000;
;ili9341.c,944 :: 		tmp = value;
VCVT	#1, .F32, S0, S2
VMOV	R4, S0
; tmp start address is: 28 (R7)
MOV	R7, R4
;ili9341.c,945 :: 		print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
SXTH	R5, R4
UXTH	R4, R8
STR	R7, [SP, #4]
STRB	R6, [SP, #8]
STRH	R8, [SP, #12]
STRH	R3, [SP, #16]
STRB	R2, [SP, #20]
STRH	R1, [SP, #24]
STRH	R0, [SP, #28]
PUSH	(R5)
PUSH	(R4)
BL	_print_I+0
ADD	SP, SP, #8
LDRH	R0, [SP, #28]
LDRH	R1, [SP, #24]
LDRB	R2, [SP, #20]
LDRH	R3, [SP, #16]
LDRH	R8, [SP, #12]
LDRB	R6, [SP, #8]
LDR	R7, [SP, #4]
;ili9341.c,946 :: 		tmp = ((value - tmp) * 10000);
VMOV	S0, R7
VCVT.F32	#1, S0, S0
; tmp end address is: 28 (R7)
VSUB.F32	S1, S2, S0
MOVW	R4, #16384
MOVT	R4, #17948
VMOV	S0, R4
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R4, S0
; tmp start address is: 20 (R5)
MOV	R5, R4
;ili9341.c,948 :: 		if(tmp < 0)
CMP	R4, #0
IT	GE
BGE	L__print_F295
;ili9341.c,950 :: 		tmp = -tmp;
RSBS	R5, R5, #0
; tmp end address is: 20 (R5)
;ili9341.c,951 :: 		}
IT	AL
BAL	L_print_F155
L__print_F295:
;ili9341.c,948 :: 		if(tmp < 0)
;ili9341.c,951 :: 		}
L_print_F155:
;ili9341.c,953 :: 		if((value >= 10000) && (value < 100000))
; tmp start address is: 20 (R5)
MOVW	R4, #16384
MOVT	R4, #17948
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__print_F288
MOVW	R4, #20480
MOVT	R4, #18371
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__print_F287
; value end address is: 8 (R2)
L__print_F286:
;ili9341.c,955 :: 		print_D((x_pos + 36), y_pos, font_size, colour, back_colour, tmp, points);
UXTB	R7, R6
; points end address is: 24 (R6)
UXTH	R6, R5
; tmp end address is: 20 (R5)
UXTH	R5, R8
; back_colour end address is: 32 (R8)
ADDW	R4, R0, #36
; x_pos end address is: 0 (R0)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili9341.c,956 :: 		}
IT	AL
BAL	L_print_F159
;ili9341.c,953 :: 		if((value >= 10000) && (value < 100000))
L__print_F288:
; tmp start address is: 20 (R5)
; points start address is: 24 (R6)
; value start address is: 8 (R2)
; back_colour start address is: 32 (R8)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__print_F287:
;ili9341.c,957 :: 		else if((value >= 1000) && (value < 10000))
MOVW	R4, #0
MOVT	R4, #17530
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__print_F290
MOVW	R4, #16384
MOVT	R4, #17948
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__print_F289
; value end address is: 8 (R2)
L__print_F285:
;ili9341.c,959 :: 		print_D((x_pos + 30), y_pos, font_size, colour, back_colour, tmp, points);
UXTB	R7, R6
; points end address is: 24 (R6)
UXTH	R6, R5
; tmp end address is: 20 (R5)
UXTH	R5, R8
; back_colour end address is: 32 (R8)
ADDW	R4, R0, #30
; x_pos end address is: 0 (R0)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili9341.c,960 :: 		}
IT	AL
BAL	L_print_F163
;ili9341.c,957 :: 		else if((value >= 1000) && (value < 10000))
L__print_F290:
; tmp start address is: 20 (R5)
; points start address is: 24 (R6)
; value start address is: 8 (R2)
; back_colour start address is: 32 (R8)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__print_F289:
;ili9341.c,961 :: 		else if((value >= 100) && (value < 1000))
MOVW	R4, #0
MOVT	R4, #17096
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__print_F292
MOVW	R4, #0
MOVT	R4, #17530
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__print_F291
; value end address is: 8 (R2)
L__print_F284:
;ili9341.c,963 :: 		print_D((x_pos + 24), y_pos, font_size, colour, back_colour, tmp, points);
UXTB	R7, R6
; points end address is: 24 (R6)
UXTH	R6, R5
; tmp end address is: 20 (R5)
UXTH	R5, R8
; back_colour end address is: 32 (R8)
ADDW	R4, R0, #24
; x_pos end address is: 0 (R0)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili9341.c,964 :: 		}
IT	AL
BAL	L_print_F167
;ili9341.c,961 :: 		else if((value >= 100) && (value < 1000))
L__print_F292:
; tmp start address is: 20 (R5)
; points start address is: 24 (R6)
; value start address is: 8 (R2)
; back_colour start address is: 32 (R8)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__print_F291:
;ili9341.c,965 :: 		else if((value >= 10) && (value < 100))
VMOV.F32	S0, #10
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__print_F294
MOVW	R4, #0
MOVT	R4, #17096
VMOV	S0, R4
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__print_F293
; value end address is: 8 (R2)
L__print_F283:
;ili9341.c,967 :: 		print_D((x_pos + 18), y_pos, font_size, colour, back_colour, tmp, points);
UXTB	R7, R6
; points end address is: 24 (R6)
UXTH	R6, R5
; tmp end address is: 20 (R5)
UXTH	R5, R8
; back_colour end address is: 32 (R8)
ADDW	R4, R0, #18
; x_pos end address is: 0 (R0)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
;ili9341.c,968 :: 		}
IT	AL
BAL	L_print_F171
;ili9341.c,965 :: 		else if((value >= 10) && (value < 100))
L__print_F294:
; tmp start address is: 20 (R5)
; points start address is: 24 (R6)
; value start address is: 8 (R2)
; back_colour start address is: 32 (R8)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
L__print_F293:
;ili9341.c,969 :: 		else if(value < 10)
VMOV.F32	S0, #10
VCMPE.F32	S2, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_print_F172
;ili9341.c,971 :: 		print_D((x_pos + 12), y_pos, font_size, colour, back_colour, tmp, points);
UXTB	R7, R6
; points end address is: 24 (R6)
UXTH	R6, R5
; tmp end address is: 20 (R5)
UXTH	R5, R8
ADDW	R4, R0, #12
STRH	R8, [SP, #4]
STRH	R3, [SP, #8]
STRB	R2, [SP, #12]
STRH	R1, [SP, #16]
STRH	R0, [SP, #20]
UXTH	R0, R4
PUSH	(R7)
PUSH	(R6)
PUSH	(R5)
BL	_print_D+0
ADD	SP, SP, #12
LDRH	R0, [SP, #20]
LDRH	R1, [SP, #16]
LDRB	R2, [SP, #12]
LDRH	R3, [SP, #8]
LDRH	R8, [SP, #4]
;ili9341.c,973 :: 		if((value) < 0)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_print_F173
; value end address is: 8 (R2)
;ili9341.c,975 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
MOVS	R5, #45
UXTH	R4, R8
; back_colour end address is: 32 (R8)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ili9341.c,976 :: 		}
IT	AL
BAL	L_print_F174
L_print_F173:
;ili9341.c,979 :: 		print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
; back_colour start address is: 32 (R8)
; colour start address is: 12 (R3)
; font_size start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
MOVS	R5, #32
UXTH	R4, R8
; back_colour end address is: 32 (R8)
; colour end address is: 12 (R3)
; font_size end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
PUSH	(R5)
PUSH	(R4)
BL	_print_char+0
ADD	SP, SP, #8
;ili9341.c,980 :: 		}
L_print_F174:
;ili9341.c,981 :: 		}
L_print_F172:
L_print_F171:
L_print_F167:
L_print_F163:
L_print_F159:
;ili9341.c,982 :: 		}
L_end_print_F:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _print_F
_Draw_BMP:
;ili9341.c,985 :: 		void Draw_BMP(signed int x_pos1, signed int y_pos1, signed int x_pos2, signed int y_pos2, unsigned char *bitmap)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
STRH	R1, [SP, #8]
STRH	R2, [SP, #12]
STRH	R3, [SP, #16]
; bitmap start address is: 36 (R9)
LDR	R9, [SP, #20]
;ili9341.c,987 :: 		unsigned long size = 0x00000000;
;ili9341.c,988 :: 		unsigned long index = 0x00000000;
;ili9341.c,990 :: 		if(x_pos1 > x_pos2)
LDRSH	R5, [SP, #12]
LDRSH	R4, [SP, #4]
CMP	R4, R5
IT	LE
BLE	L_Draw_BMP175
;ili9341.c,992 :: 		swap(&x_pos1, &x_pos2);
ADD	R5, SP, #12
ADD	R4, SP, #4
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,993 :: 		}
L_Draw_BMP175:
;ili9341.c,995 :: 		if(y_pos1 > y_pos2)
LDRSH	R5, [SP, #16]
LDRSH	R4, [SP, #8]
CMP	R4, R5
IT	LE
BLE	L_Draw_BMP176
;ili9341.c,997 :: 		swap(&y_pos1, &y_pos2);
ADD	R5, SP, #16
ADD	R4, SP, #8
MOV	R1, R5
MOV	R0, R4
BL	_swap+0
;ili9341.c,998 :: 		}
L_Draw_BMP176:
;ili9341.c,1000 :: 		size = (y_pos2 - y_pos1);
LDRSH	R5, [SP, #8]
LDRSH	R4, [SP, #16]
SUB	R4, R4, R5
SXTH	R4, R4
; size start address is: 0 (R0)
SXTH	R0, R4
;ili9341.c,1001 :: 		size *= (x_pos2 - x_pos1);
LDRSH	R5, [SP, #4]
LDRSH	R4, [SP, #12]
SUB	R4, R4, R5
SXTH	R4, R4
MULS	R4, R0, R4
; size end address is: 0 (R0)
;ili9341.c,1002 :: 		size <<= 1;
LSLS	R4, R4, #1
; size start address is: 40 (R10)
MOV	R10, R4
;ili9341.c,1004 :: 		TFT_set_display_window(x_pos1, y_pos1, (x_pos2 - 1), (y_pos2 - 1));
LDRSH	R4, [SP, #16]
SUBS	R5, R4, #1
LDRSH	R4, [SP, #12]
SUBS	R4, R4, #1
UXTH	R3, R5
UXTH	R2, R4
LDRSH	R1, [SP, #8]
LDRSH	R0, [SP, #4]
BL	_TFT_set_display_window+0
;ili9341.c,1006 :: 		for(index = 0; index < size; index++)
; index start address is: 24 (R6)
MOVS	R6, #0
; bitmap end address is: 36 (R9)
; size end address is: 40 (R10)
; index end address is: 24 (R6)
MOV	R7, R9
MOV	R5, R10
L_Draw_BMP177:
; index start address is: 24 (R6)
; size start address is: 20 (R5)
; bitmap start address is: 28 (R7)
CMP	R6, R5
IT	CS
BCS	L_Draw_BMP178
;ili9341.c,1008 :: 		TFT_write(*bitmap++, DAT);
LDRB	R4, [R7, #0]
MOVS	R1, #1
UXTB	R0, R4
BL	_TFT_write+0
ADDS	R4, R7, #1
; bitmap end address is: 28 (R7)
; bitmap start address is: 0 (R0)
MOV	R0, R4
;ili9341.c,1006 :: 		for(index = 0; index < size; index++)
ADDS	R6, R6, #1
;ili9341.c,1009 :: 		}
MOV	R7, R0
; size end address is: 20 (R5)
; bitmap end address is: 0 (R0)
; index end address is: 24 (R6)
IT	AL
BAL	L_Draw_BMP177
L_Draw_BMP178:
;ili9341.c,1010 :: 		}
L_end_Draw_BMP:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Draw_BMP
_STMPE811_peripheral_setup:
;stmpe811.c,4 :: 		void STMPE811_peripheral_setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stmpe811.c,6 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;stmpe811.c,7 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;stmpe811.c,9 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_I2C3_PA8_PC9);
MOVW	R0, #lo_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
BL	_GPIO_Alternate_Function_Enable+0
;stmpe811.c,13 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #40
MOVT	R2, #8
;stmpe811.c,12 :: 		_GPIO_PINMASK_8,
MOVW	R1, #256
;stmpe811.c,11 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;stmpe811.c,13 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;stmpe811.c,17 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
MOVW	R2, #40
MOVT	R2, #8
;stmpe811.c,16 :: 		_GPIO_PINMASK_9,
MOVW	R1, #512
;stmpe811.c,15 :: 		GPIO_Config(&GPIOC_BASE,
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;stmpe811.c,17 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));
BL	_GPIO_Config+0
;stmpe811.c,19 :: 		delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_STMPE811_peripheral_setup180:
SUBS	R7, R7, #1
BNE	L_STMPE811_peripheral_setup180
NOP
NOP
NOP
;stmpe811.c,21 :: 		I2C3_Init_Advanced(400000, &_GPIO_MODULE_I2C3_PA8_PC9);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C3_Init_Advanced+0
;stmpe811.c,22 :: 		I2C_Set_Active(&I2C3_Start, &I2C3_Read, &I2C3_Write);
MOVW	R2, #lo_addr(_I2C3_Write+0)
MOVT	R2, #hi_addr(_I2C3_Write+0)
MOVW	R1, #lo_addr(_I2C3_Read+0)
MOVT	R1, #hi_addr(_I2C3_Read+0)
MOVW	R0, #lo_addr(_I2C3_Start+0)
MOVT	R0, #hi_addr(_I2C3_Start+0)
BL	_I2C_Set_Active+0
;stmpe811.c,23 :: 		delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_STMPE811_peripheral_setup182:
SUBS	R7, R7, #1
BNE	L_STMPE811_peripheral_setup182
NOP
NOP
NOP
;stmpe811.c,24 :: 		}
L_end_STMPE811_peripheral_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE811_peripheral_setup
_STMPE811_init:
;stmpe811.c,27 :: 		void STMPE811_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stmpe811.c,29 :: 		STMPE811_peripheral_setup();
BL	_STMPE811_peripheral_setup+0
;stmpe811.c,31 :: 		STMPE811_write_byte(STMPE811_SYS_CTRL1, 0x02);
MOVS	R1, #2
MOVS	R0, #3
BL	_STMPE811_write_byte+0
;stmpe811.c,32 :: 		delay_ms(6);
MOVW	R7, #8318
MOVT	R7, #5
NOP
NOP
L_STMPE811_init184:
SUBS	R7, R7, #1
BNE	L_STMPE811_init184
NOP
NOP
NOP
;stmpe811.c,33 :: 		STMPE811_write_byte(STMPE811_SYS_CTRL1, 0x00);
MOVS	R1, #0
MOVS	R0, #3
BL	_STMPE811_write_byte+0
;stmpe811.c,34 :: 		delay_ms(4);
MOVW	R7, #27390
MOVT	R7, #3
NOP
NOP
L_STMPE811_init186:
SUBS	R7, R7, #1
BNE	L_STMPE811_init186
NOP
NOP
NOP
;stmpe811.c,35 :: 		STMPE811_write_byte(STMPE811_SYS_CTRL2, 0x04);
MOVS	R1, #4
MOVS	R0, #4
BL	_STMPE811_write_byte+0
;stmpe811.c,36 :: 		STMPE811_write_byte(STMPE811_SPI_CFG, 0x00);
MOVS	R1, #0
MOVS	R0, #8
BL	_STMPE811_write_byte+0
;stmpe811.c,37 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
MOVS	R1, #1
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,38 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);
MOVS	R1, #0
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,39 :: 		STMPE811_write_byte(STMPE811_ADC_CTRL1, 0x48);
MOVS	R1, #72
MOVS	R0, #32
BL	_STMPE811_write_byte+0
;stmpe811.c,40 :: 		STMPE811_write_byte(STMPE811_ADC_CTRL2, 0x01);
MOVS	R1, #1
MOVS	R0, #33
BL	_STMPE811_write_byte+0
;stmpe811.c,41 :: 		STMPE811_write_byte(STMPE811_GPIO_AF, 0x0F);
MOVS	R1, #15
MOVS	R0, #23
BL	_STMPE811_write_byte+0
;stmpe811.c,42 :: 		STMPE811_write_byte(STMPE811_TSC_CFG, 0xD3);
MOVS	R1, #211
MOVS	R0, #65
BL	_STMPE811_write_byte+0
;stmpe811.c,43 :: 		STMPE811_write_byte(STMPE811_FIFO_TH, 0x01);
MOVS	R1, #1
MOVS	R0, #74
BL	_STMPE811_write_byte+0
;stmpe811.c,44 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
MOVS	R1, #1
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,45 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);
MOVS	R1, #0
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,46 :: 		STMPE811_write_byte(STMPE811_TSC_FRACTION_Z, 0x01);
MOVS	R1, #1
MOVS	R0, #86
BL	_STMPE811_write_byte+0
;stmpe811.c,47 :: 		STMPE811_write_byte(STMPE811_TSC_I_DRIVE, 0x01);
MOVS	R1, #1
MOVS	R0, #88
BL	_STMPE811_write_byte+0
;stmpe811.c,48 :: 		STMPE811_write_byte(STMPE811_TSC_CTRL, 0x03);
MOVS	R1, #3
MOVS	R0, #64
BL	_STMPE811_write_byte+0
;stmpe811.c,49 :: 		STMPE811_write_byte(STMPE811_INT_STA, 0xFF);
MOVS	R1, #255
MOVS	R0, #11
BL	_STMPE811_write_byte+0
;stmpe811.c,50 :: 		delay_ms(4);
MOVW	R7, #27390
MOVT	R7, #3
NOP
NOP
L_STMPE811_init188:
SUBS	R7, R7, #1
BNE	L_STMPE811_init188
NOP
NOP
NOP
;stmpe811.c,51 :: 		}
L_end_STMPE811_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE811_init
_STMPE811_write_byte:
;stmpe811.c,54 :: 		void STMPE811_write_byte(unsigned char addr, unsigned char value)
; value start address is: 4 (R1)
; addr start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; value end address is: 4 (R1)
; addr end address is: 0 (R0)
; addr start address is: 0 (R0)
; value start address is: 4 (R1)
;stmpe811.c,56 :: 		unsigned char data_values[2] = {0x00, 0x00};
MOVS	R2, #0
STRB	R2, [SP, #4]
MOVS	R2, #0
STRB	R2, [SP, #5]
;stmpe811.c,58 :: 		data_values[0] = addr;
ADD	R2, SP, #4
STRB	R0, [R2, #0]
; addr end address is: 0 (R0)
;stmpe811.c,59 :: 		data_values[1] = value;
ADDS	R2, R2, #1
STRB	R1, [R2, #0]
; value end address is: 4 (R1)
;stmpe811.c,61 :: 		I2C3_Start();
BL	_I2C3_Start+0
;stmpe811.c,62 :: 		I2C3_Write(STMPE811_device_address, data_values, 2, END_MODE_STOP);
ADD	R2, SP, #4
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #2
MOVS	R0, #65
BL	_I2C3_Write+0
;stmpe811.c,63 :: 		}
L_end_STMPE811_write_byte:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _STMPE811_write_byte
_STMPE811_read_byte:
;stmpe811.c,66 :: 		unsigned char STMPE811_read_byte(unsigned char addr)
; addr start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; addr end address is: 0 (R0)
; addr start address is: 0 (R0)
;stmpe811.c,68 :: 		unsigned char value_a[1] = {0x00};
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
;stmpe811.c,69 :: 		unsigned char value_d[1] = {0x00};
;stmpe811.c,71 :: 		value_a[0] = addr;
ADD	R1, SP, #4
STRB	R0, [R1, #0]
; addr end address is: 0 (R0)
;stmpe811.c,73 :: 		I2C3_Start();
BL	_I2C3_Start+0
;stmpe811.c,74 :: 		I2C3_Write(STMPE811_device_address, value_a, 1, END_MODE_RESTART);
ADD	R1, SP, #4
MOVW	R3, #0
MOVS	R2, #1
MOVS	R0, #65
BL	_I2C3_Write+0
;stmpe811.c,75 :: 		I2C3_Read(STMPE811_device_address, value_d, 1, END_MODE_STOP);
ADD	R1, SP, #5
MOVW	R3, #1
MOVS	R2, #1
MOVS	R0, #65
BL	_I2C3_Read+0
;stmpe811.c,77 :: 		return (value_d[0]);
ADD	R1, SP, #5
LDRB	R1, [R1, #0]
UXTB	R0, R1
;stmpe811.c,78 :: 		}
L_end_STMPE811_read_byte:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _STMPE811_read_byte
_STMPE811_write_word:
;stmpe811.c,81 :: 		void STMPE811_write_word(unsigned char addr, unsigned int value)
; value start address is: 4 (R1)
; addr start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; value end address is: 4 (R1)
; addr end address is: 0 (R0)
; addr start address is: 0 (R0)
; value start address is: 4 (R1)
;stmpe811.c,83 :: 		unsigned char data_values[3] = {0x00, 0x00, 0x00};
MOVS	R2, #0
STRB	R2, [SP, #4]
MOVS	R2, #0
STRB	R2, [SP, #5]
MOVS	R2, #0
STRB	R2, [SP, #6]
;stmpe811.c,85 :: 		data_values[0] = addr;
ADD	R4, SP, #4
STRB	R0, [R4, #0]
; addr end address is: 0 (R0)
;stmpe811.c,86 :: 		data_values[2] = (value & 0x00FF);
ADDS	R3, R4, #2
AND	R2, R1, #255
STRB	R2, [R3, #0]
;stmpe811.c,87 :: 		data_values[1] = (value >> 0x08);
ADDS	R3, R4, #1
LSRS	R2, R1, #8
; value end address is: 4 (R1)
STRB	R2, [R3, #0]
;stmpe811.c,89 :: 		I2C3_Start();
BL	_I2C3_Start+0
;stmpe811.c,90 :: 		I2C3_Write(STMPE811_device_address, data_values, 3, END_MODE_STOP);
ADD	R2, SP, #4
MOVW	R3, #1
MOV	R1, R2
MOVS	R2, #3
MOVS	R0, #65
BL	_I2C3_Write+0
;stmpe811.c,91 :: 		}
L_end_STMPE811_write_word:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _STMPE811_write_word
_STMPE811_read_word:
;stmpe811.c,94 :: 		unsigned int STMPE811_read_word(unsigned char addr)
; addr start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; addr end address is: 0 (R0)
; addr start address is: 0 (R0)
;stmpe811.c,96 :: 		unsigned char value_a[1] = {0x00};
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
MOVS	R1, #0
STRB	R1, [SP, #6]
;stmpe811.c,97 :: 		unsigned char value_d[2] = {0x00, 0x00};
;stmpe811.c,99 :: 		unsigned int value = 0x0000;
;stmpe811.c,101 :: 		value_a[0] = addr;
ADD	R1, SP, #4
STRB	R0, [R1, #0]
; addr end address is: 0 (R0)
;stmpe811.c,103 :: 		I2C3_Start();
BL	_I2C3_Start+0
;stmpe811.c,104 :: 		I2C3_Write(STMPE811_device_address, value_a, 1, END_MODE_RESTART);
ADD	R1, SP, #4
MOVW	R3, #0
MOVS	R2, #1
MOVS	R0, #65
BL	_I2C3_Write+0
;stmpe811.c,105 :: 		I2C3_Read(STMPE811_device_address, value_d, 2, END_MODE_STOP);
ADD	R1, SP, #5
MOVW	R3, #1
MOVS	R2, #2
MOVS	R0, #65
BL	_I2C3_Read+0
;stmpe811.c,107 :: 		value = value_d[0];
ADD	R3, SP, #5
LDRB	R1, [R3, #0]
; value start address is: 0 (R0)
UXTB	R0, R1
;stmpe811.c,108 :: 		value <<= 0x08;
LSLS	R2, R0, #8
UXTH	R2, R2
; value end address is: 0 (R0)
;stmpe811.c,109 :: 		value |= value_d[1];
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
;stmpe811.c,111 :: 		return value;
UXTH	R0, R1
;stmpe811.c,112 :: 		}
L_end_STMPE811_read_word:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _STMPE811_read_word
_STMPE811_read_x:
;stmpe811.c,115 :: 		unsigned int STMPE811_read_x()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stmpe811.c,117 :: 		unsigned int value = 0x0000;
;stmpe811.c,119 :: 		value = STMPE811_read_word(STMPE811_TSC_DATA_X);
MOVS	R0, #77
BL	_STMPE811_read_word+0
;stmpe811.c,121 :: 		return value;
;stmpe811.c,122 :: 		}
L_end_STMPE811_read_x:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE811_read_x
_STMPE811_read_y:
;stmpe811.c,125 :: 		unsigned int STMPE811_read_y()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stmpe811.c,127 :: 		unsigned int value = 0x0000;
;stmpe811.c,129 :: 		value = STMPE811_read_word(STMPE811_TSC_DATA_Y);
MOVS	R0, #79
BL	_STMPE811_read_word+0
;stmpe811.c,131 :: 		return value;
;stmpe811.c,132 :: 		}
L_end_STMPE811_read_y:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE811_read_y
_STMPE811_get_touch:
;stmpe811.c,135 :: 		void STMPE811_get_touch(unsigned int *x_pos, unsigned int *y_pos, unsigned char orientation)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R11, R0
MOV	R12, R1
STRB	R2, [SP, #8]
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 44 (R11)
; y_pos start address is: 48 (R12)
;stmpe811.c,137 :: 		unsigned char temp = 0x00;
;stmpe811.c,139 :: 		signed int xp = 0x0000;
;stmpe811.c,140 :: 		signed int yp = 0x0000;
;stmpe811.c,141 :: 		signed int tp = 0x0000;
;stmpe811.c,144 :: 		temp = STMPE811_read_byte(STMPE811_TSC_CTRL);
MOVS	R0, #64
BL	_STMPE811_read_byte+0
;stmpe811.c,146 :: 		if((temp & 0x80) != 0x00)
AND	R3, R0, #128
UXTB	R3, R3
CMP	R3, #0
IT	EQ
BEQ	L_STMPE811_get_touch190
;stmpe811.c,148 :: 		xp = STMPE811_read_x();
BL	_STMPE811_read_x+0
STRH	R0, [SP, #4]
;stmpe811.c,149 :: 		yp = STMPE811_read_y();
BL	_STMPE811_read_y+0
; yp start address is: 40 (R10)
SXTH	R10, R0
;stmpe811.c,151 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x01);
MOVS	R1, #1
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,152 :: 		STMPE811_write_byte(STMPE811_FIFO_STA, 0x00);
MOVS	R1, #0
MOVS	R0, #75
BL	_STMPE811_write_byte+0
;stmpe811.c,154 :: 		switch(orientation)
IT	AL
BAL	L_STMPE811_get_touch191
;stmpe811.c,156 :: 		case PORTRAIT_1:
L_STMPE811_get_touch193:
;stmpe811.c,158 :: 		tp = map(xp, RW_min, RW_max, W_min, W_max);
LDRSH	R3, [SP, #4]
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R6, #0
MOVT	R6, #17264
MOV	R5, #0
MOVW	R4, #32768
MOVT	R4, #17773
MOVW	R3, #0
MOVT	R3, #17244
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,159 :: 		*x_pos = constrain(tp, W_min, W_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17264
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R11, #0]
; x_pos end address is: 44 (R11)
;stmpe811.c,160 :: 		tp = map(yp, RL_max, RL_min, L_min, L_max);
VMOV	S0, R10
VCVT.F32	#1, S0, S0
; yp end address is: 40 (R10)
MOVW	R6, #0
MOVT	R6, #17312
MOV	R5, #0
MOVW	R4, #0
MOVT	R4, #17332
MOVW	R3, #49152
MOVT	R3, #17779
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,161 :: 		*y_pos = constrain(tp, L_min, L_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17312
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R12, #0]
; y_pos end address is: 48 (R12)
;stmpe811.c,162 :: 		break;
IT	AL
BAL	L_STMPE811_get_touch192
;stmpe811.c,164 :: 		case PORTRAIT_2:
L_STMPE811_get_touch194:
;stmpe811.c,166 :: 		tp = map(xp, RW_max, RW_min, W_min, W_max);
; yp start address is: 40 (R10)
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
LDRSH	R3, [SP, #4]
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R6, #0
MOVT	R6, #17264
MOV	R5, #0
MOVW	R4, #0
MOVT	R4, #17244
MOVW	R3, #32768
MOVT	R3, #17773
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,167 :: 		*x_pos = constrain(tp, W_min, W_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17264
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R11, #0]
; x_pos end address is: 44 (R11)
;stmpe811.c,168 :: 		tp = map(yp, RL_min, RL_max, L_min, L_max);
VMOV	S0, R10
VCVT.F32	#1, S0, S0
; yp end address is: 40 (R10)
MOVW	R6, #0
MOVT	R6, #17312
MOV	R5, #0
MOVW	R4, #49152
MOVT	R4, #17779
MOVW	R3, #0
MOVT	R3, #17332
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,169 :: 		*y_pos = constrain(tp, L_min, L_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17312
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R12, #0]
; y_pos end address is: 48 (R12)
;stmpe811.c,170 :: 		break;
IT	AL
BAL	L_STMPE811_get_touch192
;stmpe811.c,172 :: 		case LANDSCAPE_1:
L_STMPE811_get_touch195:
;stmpe811.c,174 :: 		tp = map(yp, RL_max, RL_min, L_min, L_max);
; yp start address is: 40 (R10)
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
VMOV	S0, R10
VCVT.F32	#1, S0, S0
; yp end address is: 40 (R10)
MOVW	R6, #0
MOVT	R6, #17312
MOV	R5, #0
MOVW	R4, #0
MOVT	R4, #17332
MOVW	R3, #49152
MOVT	R3, #17779
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,175 :: 		*x_pos = constrain(tp, L_min, L_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17312
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R11, #0]
; x_pos end address is: 44 (R11)
;stmpe811.c,176 :: 		tp = map(xp, RW_max, RW_min, 0, W_max);
LDRSH	R3, [SP, #4]
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R6, #0
MOVT	R6, #17264
MOV	R5, #0
MOVW	R4, #0
MOVT	R4, #17244
MOVW	R3, #32768
MOVT	R3, #17773
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,177 :: 		*y_pos = constrain(tp, W_min, W_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17264
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R12, #0]
; y_pos end address is: 48 (R12)
;stmpe811.c,178 :: 		break;
IT	AL
BAL	L_STMPE811_get_touch192
;stmpe811.c,180 :: 		case LANDSCAPE_2:
L_STMPE811_get_touch196:
;stmpe811.c,182 :: 		tp = map(yp, RL_min, RL_max, L_min, L_max);
; yp start address is: 40 (R10)
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
VMOV	S0, R10
VCVT.F32	#1, S0, S0
; yp end address is: 40 (R10)
MOVW	R6, #0
MOVT	R6, #17312
MOV	R5, #0
MOVW	R4, #49152
MOVT	R4, #17779
MOVW	R3, #0
MOVT	R3, #17332
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,183 :: 		*x_pos = constrain(tp, L_min, L_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17312
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R11, #0]
; x_pos end address is: 44 (R11)
;stmpe811.c,184 :: 		tp = map(xp, RW_min, RW_max, W_min, W_max);
LDRSH	R3, [SP, #4]
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R6, #0
MOVT	R6, #17264
MOV	R5, #0
MOVW	R4, #32768
MOVT	R4, #17773
MOVW	R3, #0
MOVT	R3, #17244
VMOV	S4, R6
VMOV	S3, R5
VMOV	S2, R4
VMOV	S1, R3
BL	_map+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;stmpe811.c,185 :: 		*y_pos = constrain(tp, W_min, W_max);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R4, #0
MOVT	R4, #17264
MOV	R3, #0
VMOV	S2, R4
VMOV	S1, R3
BL	_constrain+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
STRH	R3, [R12, #0]
; y_pos end address is: 48 (R12)
;stmpe811.c,186 :: 		break;
IT	AL
BAL	L_STMPE811_get_touch192
;stmpe811.c,188 :: 		}
L_STMPE811_get_touch191:
; yp start address is: 40 (R10)
; y_pos start address is: 48 (R12)
; x_pos start address is: 44 (R11)
LDRB	R3, [SP, #8]
CMP	R3, #1
IT	EQ
BEQ	L_STMPE811_get_touch193
LDRB	R3, [SP, #8]
CMP	R3, #2
IT	EQ
BEQ	L_STMPE811_get_touch194
LDRB	R3, [SP, #8]
CMP	R3, #3
IT	EQ
BEQ	L_STMPE811_get_touch195
LDRB	R3, [SP, #8]
CMP	R3, #4
IT	EQ
BEQ	L_STMPE811_get_touch196
; x_pos end address is: 44 (R11)
; y_pos end address is: 48 (R12)
; yp end address is: 40 (R10)
L_STMPE811_get_touch192:
;stmpe811.c,189 :: 		}
L_STMPE811_get_touch190:
;stmpe811.c,190 :: 		}
L_end_STMPE811_get_touch:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _STMPE811_get_touch
_map:
;stmpe811.c,193 :: 		float map(float value, float x_min, float x_max, float y_min, float y_max)
SUB	SP, SP, #4
; y_max start address is: 16 (R4)
; y_min start address is: 12 (R3)
; x_max start address is: 8 (R2)
; x_min start address is: 4 (R1)
; value start address is: 0 (R0)
VSTR	#1, S4, [SP, #0]
VMOV.F32	S4, S2
VMOV.F32	S2, S0
VLDR	#1, S0, [SP, #0]
VMOV.F32	S5, S3
VMOV.F32	S3, S1
; y_max end address is: 16 (R4)
; y_min end address is: 12 (R3)
; x_max end address is: 8 (R2)
; x_min end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 8 (R2)
; x_min start address is: 12 (R3)
; x_max start address is: 16 (R4)
; y_min start address is: 20 (R5)
; y_max start address is: 0 (R0)
;stmpe811.c,195 :: 		return (y_min + (((y_max - y_min) / ((x_max - x_min)) * (value - x_min))));
VSUB.F32	S1, S0, S5
; y_max end address is: 0 (R0)
VSUB.F32	S0, S4, S3
; x_max end address is: 16 (R4)
VDIV.F32	S1, S1, S0
VSUB.F32	S0, S2, S3
; value end address is: 8 (R2)
; x_min end address is: 12 (R3)
VMUL.F32	S0, S1, S0
VADD.F32	S0, S5, S0
; y_min end address is: 20 (R5)
;stmpe811.c,196 :: 		}
L_end_map:
ADD	SP, SP, #4
BX	LR
; end of _map
_constrain:
;stmpe811.c,199 :: 		float constrain(float value, float value_min, float value_max)
; value_max start address is: 8 (R2)
; value_min start address is: 4 (R1)
; value start address is: 0 (R0)
; value_max end address is: 8 (R2)
; value_min end address is: 4 (R1)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
; value_min start address is: 4 (R1)
; value_max start address is: 8 (R2)
;stmpe811.c,201 :: 		if(value >= value_max)
VCMPE.F32	S0, S2
VMRS	#60, FPSCR
IT	LT
BLT	L_constrain197
; value end address is: 0 (R0)
; value_min end address is: 4 (R1)
;stmpe811.c,203 :: 		return value_max;
VMOV.F32	S0, S2
; value_max end address is: 8 (R2)
IT	AL
BAL	L_end_constrain
;stmpe811.c,204 :: 		}
L_constrain197:
;stmpe811.c,205 :: 		else if(value <= value_min)
; value_min start address is: 4 (R1)
; value start address is: 0 (R0)
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GT
BGT	L_constrain199
; value end address is: 0 (R0)
;stmpe811.c,207 :: 		return value_min;
VMOV.F32	S0, S1
; value_min end address is: 4 (R1)
IT	AL
BAL	L_end_constrain
;stmpe811.c,208 :: 		}
L_constrain199:
;stmpe811.c,211 :: 		return value;
; value start address is: 0 (R0)
; value end address is: 0 (R0)
;stmpe811.c,213 :: 		}
L_end_constrain:
BX	LR
; end of _constrain
_main:
;tft_disp_demo.c,15 :: 		void main()
SUB	SP, SP, #16
;tft_disp_demo.c,17 :: 		unsigned int xt = 0;
MOVW	R0, #0
STRH	R0, [SP, #12]
MOVW	R0, #0
STRH	R0, [SP, #14]
;tft_disp_demo.c,18 :: 		unsigned int yt = 0;
;tft_disp_demo.c,20 :: 		setup_MCU();
BL	_setup_MCU+0
;tft_disp_demo.c,22 :: 		test_RGB();
BL	_test_RGB+0
;tft_disp_demo.c,24 :: 		test_colours();
BL	_test_colours+0
;tft_disp_demo.c,25 :: 		test_2D_graphics();
BL	_test_2D_graphics+0
;tft_disp_demo.c,26 :: 		draw_flag();
BL	_draw_flag+0
;tft_disp_demo.c,27 :: 		print_test_data();
BL	_print_test_data+0
;tft_disp_demo.c,28 :: 		print_image();
BL	_print_image+0
;tft_disp_demo.c,29 :: 		print_str(10, 10, 2, Green, Black, "Draw Check");
ADD	R11, SP, #0
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr1_tft_disp_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr1_tft_disp_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #0
MOV	R1, R0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #10
MOVS	R0, #10
BL	_print_str+0
ADD	SP, SP, #8
;tft_disp_demo.c,31 :: 		while(1)
L_main201:
;tft_disp_demo.c,33 :: 		STMPE811_get_touch(&xt, &yt, LANDSCAPE_1);
ADD	R1, SP, #14
ADD	R0, SP, #12
MOVS	R2, #3
BL	_STMPE811_get_touch+0
;tft_disp_demo.c,34 :: 		Draw_Point(xt, yt, 3, Green);
MOVW	R3, #2016
MOVS	R2, #3
LDRH	R1, [SP, #14]
LDRH	R0, [SP, #12]
BL	_Draw_Point+0
;tft_disp_demo.c,35 :: 		};
IT	AL
BAL	L_main201
;tft_disp_demo.c,36 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_MCU:
;tft_disp_demo.c,39 :: 		void setup_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tft_disp_demo.c,41 :: 		TFT_init();
BL	_TFT_init+0
;tft_disp_demo.c,42 :: 		STMPE811_init();
BL	_STMPE811_init+0
;tft_disp_demo.c,43 :: 		}
L_end_setup_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_MCU
_draw_flag:
;tft_disp_demo.c,46 :: 		void draw_flag()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tft_disp_demo.c,48 :: 		Draw_Rectangle(20, 20, 299, 219, YES, SQUARE, Green, Green);
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
;tft_disp_demo.c,49 :: 		Draw_Circle(160, 120, 60, YES, Red);
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
;tft_disp_demo.c,50 :: 		delay_ms(4000);
MOVW	R7, #63486
MOVT	R7, #3417
NOP
NOP
L_draw_flag203:
SUBS	R7, R7, #1
BNE	L_draw_flag203
NOP
NOP
NOP
;tft_disp_demo.c,51 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,52 :: 		}
L_end_draw_flag:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _draw_flag
_test_RGB:
;tft_disp_demo.c,55 :: 		void test_RGB()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tft_disp_demo.c,57 :: 		TFT_fill(Red);
MOVW	R0, #63488
BL	_TFT_fill+0
;tft_disp_demo.c,58 :: 		delay_ms(600);
MOVW	R7, #45566
MOVT	R7, #512
NOP
NOP
L_test_RGB205:
SUBS	R7, R7, #1
BNE	L_test_RGB205
NOP
NOP
NOP
;tft_disp_demo.c,59 :: 		TFT_fill(Green);
MOVW	R0, #2016
BL	_TFT_fill+0
;tft_disp_demo.c,60 :: 		delay_ms(600);
MOVW	R7, #45566
MOVT	R7, #512
NOP
NOP
L_test_RGB207:
SUBS	R7, R7, #1
BNE	L_test_RGB207
NOP
NOP
NOP
;tft_disp_demo.c,61 :: 		TFT_fill(Blue);
MOVS	R0, #31
BL	_TFT_fill+0
;tft_disp_demo.c,62 :: 		delay_ms(600);
MOVW	R7, #45566
MOVT	R7, #512
NOP
NOP
L_test_RGB209:
SUBS	R7, R7, #1
BNE	L_test_RGB209
NOP
NOP
NOP
;tft_disp_demo.c,63 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,64 :: 		}
L_end_test_RGB:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_RGB
_test_colours:
;tft_disp_demo.c,67 :: 		void test_colours()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tft_disp_demo.c,69 :: 		TFT_fill_area(0, 0, 319, 23, Grey);
MOVW	R0, #63454
PUSH	(R0)
MOVS	R3, #23
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,70 :: 		TFT_fill_area(0, 23, 319, 47, White);
MOVW	R0, #65535
PUSH	(R0)
MOVS	R3, #47
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #23
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,71 :: 		TFT_fill_area(0, 47, 319, 71, Cyan);
MOVW	R0, #32767
PUSH	(R0)
MOVS	R3, #71
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #47
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,72 :: 		TFT_fill_area(0, 71, 319, 95, Light_Blue);
MOVW	R0, #1311
PUSH	(R0)
MOVS	R3, #95
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #71
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,73 :: 		TFT_fill_area(0, 95, 319, 119, Blue);
MOVS	R0, #31
PUSH	(R0)
MOVS	R3, #119
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #95
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,74 :: 		TFT_fill_area(0, 119, 319, 143, Green);
MOVW	R0, #2016
PUSH	(R0)
MOVS	R3, #143
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #119
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,75 :: 		TFT_fill_area(0, 143, 319, 167, Yellow);
MOVW	R0, #65504
PUSH	(R0)
MOVS	R3, #167
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #143
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,76 :: 		TFT_fill_area(0, 167, 319, 191, Magenta);
MOVW	R0, #63519
PUSH	(R0)
MOVS	R3, #191
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #167
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,77 :: 		TFT_fill_area(0, 191, 319, 215, Red);
MOVW	R0, #63488
PUSH	(R0)
MOVS	R3, #215
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #191
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,78 :: 		TFT_fill_area(0, 215, 319, 239, Black);
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #215
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_fill_area+0
ADD	SP, SP, #4
;tft_disp_demo.c,79 :: 		delay_ms(2600);
MOVW	R7, #44542
MOVT	R7, #2221
NOP
NOP
L_test_colours211:
SUBS	R7, R7, #1
BNE	L_test_colours211
NOP
NOP
NOP
;tft_disp_demo.c,80 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,81 :: 		}
L_end_test_colours:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _test_colours
_test_2D_graphics:
;tft_disp_demo.c,84 :: 		void test_2D_graphics()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;tft_disp_demo.c,86 :: 		signed int i = 0;
;tft_disp_demo.c,88 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,90 :: 		for(i = 10; i <= 310; i += 10)
; i start address is: 48 (R12)
MOVW	R12, #10
SXTH	R12, R12
; i end address is: 48 (R12)
L_test_2D_graphics213:
; i start address is: 48 (R12)
CMP	R12, #310
IT	GT
BGT	L_test_2D_graphics214
;tft_disp_demo.c,92 :: 		Draw_V_Line(i, 20, 220, White);
MOVW	R3, #65535
MOVS	R2, #220
SXTH	R2, R2
MOVS	R1, #20
SXTH	R1, R1
SXTH	R0, R12
BL	_Draw_V_Line+0
;tft_disp_demo.c,90 :: 		for(i = 10; i <= 310; i += 10)
ADD	R12, R12, #10
SXTH	R12, R12
;tft_disp_demo.c,93 :: 		}
; i end address is: 48 (R12)
IT	AL
BAL	L_test_2D_graphics213
L_test_2D_graphics214:
;tft_disp_demo.c,94 :: 		for(i = 20; i <= 220; i += 10)
; i start address is: 48 (R12)
MOVW	R12, #20
SXTH	R12, R12
; i end address is: 48 (R12)
L_test_2D_graphics216:
; i start address is: 48 (R12)
CMP	R12, #220
IT	GT
BGT	L_test_2D_graphics217
;tft_disp_demo.c,96 :: 		Draw_H_Line(10, 310, i, White);
MOVW	R3, #65535
SXTH	R2, R12
MOVW	R1, #310
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_Draw_H_Line+0
;tft_disp_demo.c,94 :: 		for(i = 20; i <= 220; i += 10)
ADD	R12, R12, #10
SXTH	R12, R12
;tft_disp_demo.c,97 :: 		}
; i end address is: 48 (R12)
IT	AL
BAL	L_test_2D_graphics216
L_test_2D_graphics217:
;tft_disp_demo.c,99 :: 		delay_ms(3000);
MOVW	R7, #31230
MOVT	R7, #2563
NOP
NOP
L_test_2D_graphics219:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics219
NOP
NOP
NOP
;tft_disp_demo.c,101 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,102 :: 		for(i = 0; i < 240; i += 5)
; i start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics221:
; i start address is: 4 (R1)
CMP	R1, #240
IT	GE
BGE	L_test_2D_graphics222
;tft_disp_demo.c,104 :: 		Draw_Line(0, 0, 319, i, Light_Blue);
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
;tft_disp_demo.c,102 :: 		for(i = 0; i < 240; i += 5)
ADDS	R1, R1, #5
SXTH	R1, R1
;tft_disp_demo.c,105 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics221
L_test_2D_graphics222:
;tft_disp_demo.c,107 :: 		for(i = 239; i > -1; i -= 5)
; i start address is: 4 (R1)
MOVS	R1, #239
SXTH	R1, R1
; i end address is: 4 (R1)
L_test_2D_graphics224:
; i start address is: 4 (R1)
CMP	R1, #-1
IT	LE
BLE	L_test_2D_graphics225
;tft_disp_demo.c,109 :: 		Draw_Line(319, 240, 0, i, Blue);
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
;tft_disp_demo.c,107 :: 		for(i = 239; i > -1; i -= 5)
SUBS	R1, R1, #5
SXTH	R1, R1
;tft_disp_demo.c,110 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_test_2D_graphics224
L_test_2D_graphics225:
;tft_disp_demo.c,112 :: 		delay_ms(3000);
MOVW	R7, #31230
MOVT	R7, #2563
NOP
NOP
L_test_2D_graphics227:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics227
NOP
NOP
NOP
;tft_disp_demo.c,114 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,116 :: 		Draw_Rectangle(9, 19, 309, 199, NO, ROUND, Magenta, Black);
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
;tft_disp_demo.c,117 :: 		Draw_Rectangle(19, 29, 299, 189, YES, SQUARE, Cyan, Black);
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
;tft_disp_demo.c,119 :: 		delay_ms(4000);
MOVW	R7, #63486
MOVT	R7, #3417
NOP
NOP
L_test_2D_graphics229:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics229
NOP
NOP
NOP
;tft_disp_demo.c,121 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,123 :: 		Draw_Circle(159, 119, 80, NO, Red);
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
;tft_disp_demo.c,124 :: 		Draw_Circle(159, 119, 40, YES, Yellow);
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
;tft_disp_demo.c,127 :: 		delay_ms(3000);
MOVW	R7, #31230
MOVT	R7, #2563
NOP
NOP
L_test_2D_graphics231:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics231
NOP
NOP
NOP
;tft_disp_demo.c,129 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,131 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, NO, Green);
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
;tft_disp_demo.c,132 :: 		delay_ms(400);
MOVW	R7, #52222
MOVT	R7, #341
NOP
NOP
L_test_2D_graphics233:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics233
NOP
NOP
NOP
;tft_disp_demo.c,133 :: 		Draw_Triangle(10, 200, 309, 200, 149, 19, YES, Grey);
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
;tft_disp_demo.c,135 :: 		delay_ms(3000);
MOVW	R7, #31230
MOVT	R7, #2563
NOP
NOP
L_test_2D_graphics235:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics235
NOP
NOP
NOP
;tft_disp_demo.c,137 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,139 :: 		for(i = 0; i < 100; i++)
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics237:
; i start address is: 20 (R5)
CMP	R5, #100
IT	GE
BGE	L_test_2D_graphics238
;tft_disp_demo.c,141 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
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
;tft_disp_demo.c,142 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
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
;tft_disp_demo.c,139 :: 		for(i = 0; i < 100; i++)
ADDS	R5, R5, #1
SXTH	R5, R5
;tft_disp_demo.c,143 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics237
L_test_2D_graphics238:
;tft_disp_demo.c,145 :: 		for(i = 100; i > -1; i--)
; i start address is: 20 (R5)
MOVS	R5, #100
SXTH	R5, R5
; i end address is: 20 (R5)
L_test_2D_graphics240:
; i start address is: 20 (R5)
CMP	R5, #-1
IT	LE
BLE	L_test_2D_graphics241
;tft_disp_demo.c,147 :: 		Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
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
;tft_disp_demo.c,148 :: 		Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
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
;tft_disp_demo.c,145 :: 		for(i = 100; i > -1; i--)
SUBS	R5, R5, #1
SXTH	R5, R5
;tft_disp_demo.c,149 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_test_2D_graphics240
L_test_2D_graphics241:
;tft_disp_demo.c,150 :: 		delay_ms(3000);
MOVW	R7, #31230
MOVT	R7, #2563
NOP
NOP
L_test_2D_graphics243:
SUBS	R7, R7, #1
BNE	L_test_2D_graphics243
NOP
NOP
NOP
;tft_disp_demo.c,152 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,153 :: 		}
L_end_test_2D_graphics:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _test_2D_graphics
_print_test_data:
;tft_disp_demo.c,156 :: 		void print_test_data()
SUB	SP, SP, #48
STR	LR, [SP, #0]
;tft_disp_demo.c,158 :: 		unsigned char s = 0;
;tft_disp_demo.c,159 :: 		signed char c = -9;
MVN	R0, #8
STRB	R0, [SP, #45]
;tft_disp_demo.c,161 :: 		signed int i = -9;
MVN	R0, #8
STRH	R0, [SP, #46]
;tft_disp_demo.c,163 :: 		float f = -9.0;
; f start address is: 12 (R3)
VMOV.F32	S3, #-9
;tft_disp_demo.c,166 :: 		print_str(10, 10, 1, Red, Black, "MicroArena");
ADD	R11, SP, #4
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr2_tft_disp_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr2_tft_disp_demo+0)
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
;tft_disp_demo.c,167 :: 		print_str(10, 30, 2, Green, Black, "fb.com/MicroArena");
ADD	R11, SP, #15
ADD	R10, R11, #18
MOVW	R12, #lo_addr(?ICS?lstr3_tft_disp_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr3_tft_disp_demo+0)
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
;tft_disp_demo.c,168 :: 		print_str(10, 60, 3, Blue, Black, "SShahryiar");
ADD	R11, SP, #33
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr4_tft_disp_demo+0)
MOVT	R12, #hi_addr(?ICS?lstr4_tft_disp_demo+0)
BL	___CC2DW+0
ADD	R0, SP, #33
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
;tft_disp_demo.c,170 :: 		for(s = 0; s < 250; s++)
MOVS	R0, #0
STRB	R0, [SP, #44]
; f end address is: 12 (R3)
L_print_test_data245:
; f start address is: 12 (R3)
LDRB	R0, [SP, #44]
CMP	R0, #250
IT	CS
BCS	L_print_test_data246
;tft_disp_demo.c,172 :: 		print_F(20, 120, 1, Blue, Black, f, 1);
MOVS	R1, #1
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
VMOV.F32	S0, S3
MOVS	R3, #31
MOVS	R2, #1
MOVS	R1, #120
MOVS	R0, #20
BL	_print_F+0
ADD	SP, SP, #8
;tft_disp_demo.c,173 :: 		print_I(20, 160, 2, Green, Black, i);
LDRSH	R1, [SP, #46]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #2016
MOVS	R2, #2
MOVS	R1, #160
MOVS	R0, #20
BL	_print_I+0
ADD	SP, SP, #8
;tft_disp_demo.c,174 :: 		print_C(20, 200, 3, Red, Black, c);
LDRSB	R1, [SP, #45]
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVW	R3, #63488
MOVS	R2, #3
MOVS	R1, #200
MOVS	R0, #20
BL	_print_C+0
ADD	SP, SP, #8
;tft_disp_demo.c,176 :: 		c++;
LDRSB	R0, [SP, #45]
ADDS	R0, R0, #1
STRB	R0, [SP, #45]
;tft_disp_demo.c,177 :: 		i++;
LDRSH	R0, [SP, #46]
ADDS	R0, R0, #1
STRH	R0, [SP, #46]
;tft_disp_demo.c,178 :: 		f += 0.1;
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VADD.F32	S0, S3, S0
; f end address is: 12 (R3)
; f start address is: 0 (R0)
;tft_disp_demo.c,180 :: 		delay_ms(45);
MOVW	R7, #29630
MOVT	R7, #38
NOP
NOP
L_print_test_data248:
SUBS	R7, R7, #1
BNE	L_print_test_data248
NOP
NOP
NOP
;tft_disp_demo.c,170 :: 		for(s = 0; s < 250; s++)
LDRB	R0, [SP, #44]
ADDS	R0, R0, #1
STRB	R0, [SP, #44]
;tft_disp_demo.c,181 :: 		}
VMOV.F32	S3, S0
; f end address is: 0 (R0)
IT	AL
BAL	L_print_test_data245
L_print_test_data246:
;tft_disp_demo.c,183 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,184 :: 		}
L_end_print_test_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #48
BX	LR
; end of _print_test_data
_print_image:
;tft_disp_demo.c,187 :: 		void print_image()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tft_disp_demo.c,189 :: 		Draw_BMP(0, 0, 315, 240, gImage_test);
MOVW	R0, #lo_addr(_gImage_test+0)
MOVT	R0, #hi_addr(_gImage_test+0)
PUSH	(R0)
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_Draw_BMP+0
ADD	SP, SP, #4
;tft_disp_demo.c,190 :: 		delay_ms(6000);
MOVW	R7, #62462
MOVT	R7, #5126
NOP
NOP
L_print_image250:
SUBS	R7, R7, #1
BNE	L_print_image250
NOP
NOP
NOP
;tft_disp_demo.c,191 :: 		TFT_fill(Black);
MOVS	R0, #0
BL	_TFT_fill+0
;tft_disp_demo.c,192 :: 		}
L_end_print_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_image
