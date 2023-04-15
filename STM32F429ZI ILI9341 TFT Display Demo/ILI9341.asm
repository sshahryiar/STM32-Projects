_peripheral_setup:
;ILI9341.c,4 :: 		void peripheral_setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ILI9341.c,6 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;ILI9341.c,9 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_SPI5 | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #24
MOVT	R2, #88
;ILI9341.c,8 :: 		(_GPIO_PINMASK_7 | _GPIO_PINMASK_9),
MOVW	R1, #640
;ILI9341.c,7 :: 		GPIO_Config(&GPIOF_BASE,
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
;ILI9341.c,9 :: 		(_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_SPI5 | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;ILI9341.c,12 :: 		GPIO_Clk_Enable(&GPIOF_BASE);
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Clk_Enable+0
;ILI9341.c,15 :: 		}
L_end_peripheral_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _peripheral_setup
_TFT_init:
;ILI9341.c,18 :: 		void TFT_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ILI9341.c,20 :: 		peripheral_setup();
BL	_peripheral_setup+0
;ILI9341.c,21 :: 		}
L_end_TFT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TFT_init
_TFT_write:
;ILI9341.c,24 :: 		void TFT_write(unsigned char value, unsigned char mode)
;ILI9341.c,26 :: 		}
L_end_TFT_write:
BX	LR
; end of _TFT_write
