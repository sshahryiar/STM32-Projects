_touch_init:
;touch.c,4 :: 		void touch_init()
;touch.c,6 :: 		}
L_end_touch_init:
BX	LR
; end of _touch_init
_touch_GPIO_init:
;touch.c,9 :: 		void touch_GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;touch.c,11 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;touch.c,14 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;touch.c,13 :: 		(_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_7),
MOVS	R1, #176
;touch.c,12 :: 		GPIO_Config(&GPIOA_BASE,
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;touch.c,14 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;touch.c,16 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_6, (_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #194
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;touch.c,18 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;touch.c,19 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #194
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;touch.c,20 :: 		}
L_end_touch_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _touch_GPIO_init
