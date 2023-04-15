_LCD_GLASS_Init:
;Glass_LCD.c,5 :: 		void LCD_GLASS_Init()
;Glass_LCD.c,7 :: 		KeyPressed = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_KeyPressed+0)
MOVT	R0, #hi_addr(_KeyPressed+0)
STR	R1, [R0, #0]
;Glass_LCD.c,8 :: 		RCC_APB1LPENRbits.PWRLPEN = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB1LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1LPENRbits+0)
STR	R1, [R0, #0]
;Glass_LCD.c,9 :: 		RCC_APB1LPENRbits.LCDLPEN = 1;
MOVW	R0, #lo_addr(RCC_APB1LPENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1LPENRbits+0)
STR	R1, [R0, #0]
;Glass_LCD.c,10 :: 		}
L_end_LCD_GLASS_Init:
BX	LR
; end of _LCD_GLASS_Init
_LCD_GLASS_Configure_GPIO:
;Glass_LCD.c,13 :: 		void LCD_GLASS_Configure_GPIO()
;Glass_LCD.c,15 :: 		enable_GPIOA(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;Glass_LCD.c,16 :: 		setup_GPIOA(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,17 :: 		setup_GPIOA(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,18 :: 		setup_GPIOA(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,19 :: 		setup_GPIOA(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,20 :: 		setup_GPIOA(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,21 :: 		setup_GPIOA(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,22 :: 		setup_GPIOA(15, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOA_MODER+0)
MOVT	R0, #hi_addr(GPIOA_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOA_OTYPER+0)
MOVT	R0, #hi_addr(GPIOA_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1073741824
MOVW	R0, #lo_addr(GPIOA_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOA_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_PUPDR+0)
MOVT	R0, #hi_addr(GPIOA_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,24 :: 		setup_GPIOA_AF(1, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO114:
;Glass_LCD.c,25 :: 		setup_GPIOA_AF(2, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO127:
;Glass_LCD.c,26 :: 		setup_GPIOA_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOA_AFRL+0)
MOVT	R0, #hi_addr(GPIOA_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO140:
;Glass_LCD.c,27 :: 		setup_GPIOA_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO147:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,28 :: 		setup_GPIOA_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO158:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,29 :: 		setup_GPIOA_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO169:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,30 :: 		setup_GPIOA_AF(15, AF11_LCD);
L_LCD_GLASS_Configure_GPIO180:
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOA_AFRH+0)
MOVT	R0, #hi_addr(GPIOA_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,32 :: 		enable_GPIOB(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;Glass_LCD.c,33 :: 		setup_GPIOB(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,34 :: 		setup_GPIOB(4, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #768
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,35 :: 		setup_GPIOB(5, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #32
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3072
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,36 :: 		setup_GPIOB(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,37 :: 		setup_GPIOB(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,38 :: 		setup_GPIOB(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,39 :: 		setup_GPIOB(11, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2048
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12582912
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,40 :: 		setup_GPIOB(12, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #50331648
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #50331648
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,41 :: 		setup_GPIOB(13, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #134217728
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8192
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #201326592
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #201326592
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,42 :: 		setup_GPIOB(14, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #536870912
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #16384
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #805306368
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #805306368
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,43 :: 		setup_GPIOB(15, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R0, #0]
MOVW	R0, #32767
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOB_OTYPER+0)
MOVT	R0, #hi_addr(GPIOB_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1073741824
MOVW	R0, #lo_addr(GPIOB_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOB_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #-1073741824
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_PUPDR+0)
MOVT	R0, #hi_addr(GPIOB_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,45 :: 		setup_GPIOB_AF(1, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO362:
;Glass_LCD.c,46 :: 		setup_GPIOB_AF(2, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO375:
;Glass_LCD.c,47 :: 		setup_GPIOB_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOB_AFRL+0)
MOVT	R0, #hi_addr(GPIOB_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO388:
;Glass_LCD.c,48 :: 		setup_GPIOB_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO395:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,49 :: 		setup_GPIOB_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO406:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,50 :: 		setup_GPIOB_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO417:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,51 :: 		setup_GPIOB_AF(11, AF11_LCD);
L_LCD_GLASS_Configure_GPIO428:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,52 :: 		setup_GPIOB_AF(12, AF11_LCD);
L_LCD_GLASS_Configure_GPIO439:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #720896
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,53 :: 		setup_GPIOB_AF(13, AF11_LCD);
L_LCD_GLASS_Configure_GPIO450:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11534336
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,54 :: 		setup_GPIOB_AF(14, AF11_LCD);
L_LCD_GLASS_Configure_GPIO461:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,55 :: 		setup_GPIOB_AF(15, AF11_LCD);
L_LCD_GLASS_Configure_GPIO472:
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOB_AFRH+0)
MOVT	R0, #hi_addr(GPIOB_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,57 :: 		enable_GPIOC(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_AHBENRbits+0)
MOVT	R0, #hi_addr(RCC_AHBENRbits+0)
STR	R1, [R0, #0]
;Glass_LCD.c,58 :: 		setup_GPIOC(0, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,59 :: 		setup_GPIOC(1, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,60 :: 		setup_GPIOC(2, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #48
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #48
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,61 :: 		setup_GPIOC(3, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,62 :: 		setup_GPIOC(6, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #64
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12288
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,63 :: 		setup_GPIOC(7, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #49152
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #16383
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,64 :: 		setup_GPIOC(8, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #196608
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,65 :: 		setup_GPIOC(9, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #786432
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,66 :: 		setup_GPIOC(10, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #1024
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,67 :: 		setup_GPIOC(11, AFIO, output_open_drain, high_speed, no_pull_resistor);
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOC_MODER+0)
MOVT	R0, #hi_addr(GPIOC_MODER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R1, [R0, #0]
MVN	R0, #2048
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOC_OTYPER+0)
MOVT	R0, #hi_addr(GPIOC_OTYPER+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12582912
MOVW	R0, #lo_addr(GPIOC_OSPEEDR+0)
MOVT	R0, #hi_addr(GPIOC_OSPEEDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_PUPDR+0)
MOVT	R0, #hi_addr(GPIOC_PUPDR+0)
STR	R1, [R0, #0]
;Glass_LCD.c,69 :: 		setup_GPIOC_AF(0, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO639:
;Glass_LCD.c,70 :: 		setup_GPIOC_AF(1, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO652:
;Glass_LCD.c,71 :: 		setup_GPIOC_AF(2, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO665:
;Glass_LCD.c,72 :: 		setup_GPIOC_AF(3, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO678:
;Glass_LCD.c,73 :: 		setup_GPIOC_AF(6, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO691:
;Glass_LCD.c,74 :: 		setup_GPIOC_AF(7, AF11_LCD);
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOC_AFRL+0)
MOVT	R0, #hi_addr(GPIOC_AFRL+0)
STR	R1, [R0, #0]
L_LCD_GLASS_Configure_GPIO704:
;Glass_LCD.c,75 :: 		setup_GPIOC_AF(8, AF11_LCD);
L_LCD_GLASS_Configure_GPIO711:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,76 :: 		setup_GPIOC_AF(9, AF11_LCD);
L_LCD_GLASS_Configure_GPIO722:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,77 :: 		setup_GPIOC_AF(10, AF11_LCD);
L_LCD_GLASS_Configure_GPIO733:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,78 :: 		setup_GPIOC_AF(11, AF11_LCD);
L_LCD_GLASS_Configure_GPIO744:
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOC_AFRH+0)
MOVT	R0, #hi_addr(GPIOC_AFRH+0)
STR	R1, [R0, #0]
;Glass_LCD.c,79 :: 		}
L_end_LCD_GLASS_Configure_GPIO:
BX	LR
; end of _LCD_GLASS_Configure_GPIO
