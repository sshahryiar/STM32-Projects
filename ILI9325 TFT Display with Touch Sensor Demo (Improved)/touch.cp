#line 1 "C:/Users/SShahryiar/Desktop/New folder/ILI9325 TFT Display with Touch Sensor Demo/touch.c"
#line 1 "c:/users/sshahryiar/desktop/new folder/ili9325 tft display with touch sensor demo/touch.h"




void touch_init();
void touch_GPIO_init();
void touch_write_Byte(unsigned char value);
unsigned int touch_read_ADC(unsigned char command);
unsigned int touch_read_XY(unsigned char xy);
unsigned char touch_read_TP_once();
unsigned char touch_read_ADS2(unsigned int *x_pos, unsigned int *y_pos);
unsigned char touch_read_ADS(unsigned int *x_pos, unsigned int *y_pos);
void draw_touch_point(unsigned int x_pos, unsigned int y_pos);
#line 4 "C:/Users/SShahryiar/Desktop/New folder/ILI9325 TFT Display with Touch Sensor Demo/touch.c"
void touch_init()
{
}


void touch_GPIO_init()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Config(&GPIOA_BASE,
 (_GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_7),
 (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_6, (_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP));

 GPIO_Clk_Enable(&GPIOC_BASE);
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_UP));
}
