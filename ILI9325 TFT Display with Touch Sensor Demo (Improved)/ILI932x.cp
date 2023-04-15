#line 1 "C:/Users/SShahryiar/Desktop/New folder/ILI9325 TFT Display with Touch Sensor Demo/ILI932x.c"
#line 1 "c:/users/sshahryiar/desktop/new folder/ili9325 tft display with touch sensor demo/ili932x.h"
#line 1 "c:/users/sshahryiar/desktop/new folder/ili9325 tft display with touch sensor demo/fonts.c"
#line 165 "c:/users/sshahryiar/desktop/new folder/ili9325 tft display with touch sensor demo/ili932x.h"
unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b);
void TFT_write_reg(unsigned int reg_val, unsigned int data_val);
void TFT_write(unsigned int value, unsigned char mode);
unsigned int TFT_read(unsigned int value, unsigned char mode);
void TFT_init();
void TFT_write_RAM_prepare();
void TFT_set_cursor(unsigned int x_pos, unsigned int y_pos);
void TFT_clear(unsigned int colour);
void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour);
unsigned int Get_Pixel(unsigned int x_pos, unsigned int y_pos);
unsigned int TFT_BGR2RGB(unsigned int colour);
#line 4 "C:/Users/SShahryiar/Desktop/New folder/ILI9325 TFT Display with Touch Sensor Demo/ILI932x.c"
unsigned int RGB565_converter(unsigned char r, unsigned char g, unsigned char b)
{
 return (((((unsigned int)r) >> 3) << 11) | ((((unsigned int)g) >> 2) << 5) | (((unsigned int)b) >> 3));
}


void TFT_write_reg(unsigned int reg_val, unsigned int data_val)
{
 TFT_write(reg_val,  0 );
 TFT_write(data_val,  1 );
}


void TFT_write(unsigned int value, unsigned char mode)
{
  GPIOC_ODRbits.ODR8  = 0;
  GPIOC_ODRbits.ODR9  = mode;
  GPIOC_ODR  = (( GPIOC_ODR  & 0xFF00) | (value & 0x00FF));
  GPIOB_ODR  = (( GPIOB_ODR  & 0x00FF) | (value & 0xFF00));
  GPIOC_ODRbits.ODR10  = 0;
  GPIOC_ODRbits.ODR10  = 1;
  GPIOC_ODRbits.ODR8  = 1;
}


unsigned int TFT_read(unsigned int value, unsigned char mode)
{
 unsigned int temp = 0x0000;

 switch(mode)
 {
 case  0 :
 {
 TFT_write(value,  0 );
 break;
 }
 case  1 :
 {
 break;
 }
 }

  GPIOB_CRH  = 0x44444444;
  GPIOC_CRL  = 0x44444444;

  GPIOC_ODRbits.ODR8  = 0;
  GPIOC_ODRbits.ODR9  = 1;
  GPIOC_ODRbits.ODR11  = 0;

 temp = (( GPIOB_IDR  & 0xFF00) | ( GPIOC_IDR  & 0x00FF));

  GPIOC_ODRbits.ODR11  = 1;
  GPIOC_ODRbits.ODR8  = 1;


  GPIOB_CRH  = 0x33333333;
  GPIOC_CRL  = 0x33333333;

 return temp;
}


void TFT_GPIO_init()
{
 GPIO_Clk_Enable(&GPIOB_BASE);
 GPIO_Config(&GPIOB_BASE,
 (_GPIO_PINMASK_8 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11
 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13 | _GPIO_PINMASK_14 | _GPIO_PINMASK_15),
 (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));


 GPIO_Clk_Enable(&GPIOC_BASE);
 GPIO_Config(&GPIOC_BASE,
 (_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2
 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5
 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7 | _GPIO_PINMASK_8
 | _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11
 | _GPIO_PINMASK_12),
 (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
}


void TFT_init()
{
 static unsigned int device_code = 0x0000;

 TFT_GPIO_init();

 TFT_write_reg(0x0000, 0x0001);
 delay_ms(50);

 device_code = TFT_read(0x0000,  0 );


 if((device_code == 0x9325) || (device_code == 0x9328))
 {
 TFT_write_reg(0x00E5, 0x78F0);

 TFT_write_reg(0x0001, 0x0100);
 TFT_write_reg(0x0002, 0x0700);
 TFT_write_reg(0x0003, 0x1030);
 TFT_write_reg(0x0004, 0x0000);
 TFT_write_reg(0x0008, 0x0202);
 TFT_write_reg(0x0009, 0x0000);
 TFT_write_reg(0x000A, 0x0000);
 TFT_write_reg(0x000C, 0x0001);
 TFT_write_reg(0x000D, 0x0000);
 TFT_write_reg(0x000F, 0x0000);

 TFT_write_reg(0x0010, 0x0000);
 TFT_write_reg(0x0011, 0x0007);
 TFT_write_reg(0x0012, 0x0000);
 TFT_write_reg(0x0013, 0x0000);
 TFT_write_reg(0x0007, 0x0001);
 delay_ms(50);
 TFT_write_reg(0x0010, 0x1690);
 TFT_write_reg(0x0011, 0x0227);
 delay_ms(50);
 TFT_write_reg(0x0012, 0x009D);
 delay_ms(50);
 TFT_write_reg(0x0013, 0x1900);
 TFT_write_reg(0x0029, 0x0025);
 TFT_write_reg(0x002B, 0x000D);
 delay_ms(50);
 TFT_write_reg(0x0020,0x0000);
 TFT_write_reg(0x0021,0x0000);
 delay_ms(50);

 TFT_write_reg(0x0030, 0x0007);
 TFT_write_reg(0x0031, 0x0303);
 TFT_write_reg(0x0032, 0x0003);
 TFT_write_reg(0x0035, 0x0206);
 TFT_write_reg(0x0036, 0x0008);
 TFT_write_reg(0x0037, 0x0406);
 TFT_write_reg(0x0038, 0x0304);
 TFT_write_reg(0x0039, 0x0007);
 TFT_write_reg(0x003C, 0x0602);
 TFT_write_reg(0x003D, 0x0008);
 delay_ms(50);
 TFT_write_reg(0x0050, 0x0000);
 TFT_write_reg(0x0051, 0x00EF);
 TFT_write_reg(0x0052, 0x0000);
 TFT_write_reg(0x0053, 0x013F);

 TFT_write_reg(0x0060, 0xA700);
 TFT_write_reg(0x0061, 0x0001);
 TFT_write_reg(0x006A, 0x0000);
 TFT_write_reg(0x0080, 0x0000);
 TFT_write_reg(0x0081, 0x0000);
 TFT_write_reg(0x0082, 0x0000);
 TFT_write_reg(0x0083, 0x0000);
 TFT_write_reg(0x0084, 0x0000);
 TFT_write_reg(0x0085, 0x0000);

 TFT_write_reg(0x0090, 0x0010);
 TFT_write_reg(0x0092, 0x0600);

 TFT_write_reg(0x0007, 0x0133);
 }

 if((device_code == 0x9320) || (device_code == 0x9300))
 {
 TFT_write_reg(0x00, 0x0000);
 TFT_write_reg(0x01, 0x0100);
 TFT_write_reg(0x02, 0x0700);
 TFT_write_reg(0x03, 0x1030);


 TFT_write_reg(0x04, 0x0000);
 TFT_write_reg(0x08, 0x0202);
 TFT_write_reg(0x09, 0x0000);
 TFT_write_reg(0x0A, 0x0000);
 TFT_write_reg(0x0C, (1 << 0));
 TFT_write_reg(0x0D, 0x0000);
 TFT_write_reg(0x0F, 0x0000);
 delay_ms(10);
 TFT_write_reg(0x07, 0x0101);
 delay_ms(10);
 TFT_write_reg(0x10, (1 << 12) | (0 << 8)| (1 << 7)| (1 << 6)| (0 << 4));
 TFT_write_reg(0x11, 0x0007);
 TFT_write_reg(0x12, (1 << 8) | (1 << 4)| (0 << 0));
 TFT_write_reg(0x13, 0x0B00);
 TFT_write_reg(0x29, 0x0000);

 TFT_write_reg(0x2B, (1 << 14) | (1 << 4));
 TFT_write_reg(0x50, 0x00);

 TFT_write_reg(0x51, 239);
 TFT_write_reg(0x52, 0x00);
 TFT_write_reg(0x53, 319);

 TFT_write_reg(0x60, 0x2700);
 TFT_write_reg(0x61, 0x0001);
 TFT_write_reg(0x6A, 0x0000);

 TFT_write_reg(0x80, 0x0000);
 TFT_write_reg(0x81, 0x0000);
 TFT_write_reg(0x82, 0x0000);
 TFT_write_reg(0x83, 0x0000);
 TFT_write_reg(0x84, 0x0000);
 TFT_write_reg(0x85, 0x0000);

 TFT_write_reg(0x90, (0 << 7)|(16 << 0));
 TFT_write_reg(0x92, 0x0000);
 TFT_write_reg(0x93, 0x0001);
 TFT_write_reg(0x95, 0x0110);
 TFT_write_reg(0x97, (0 << 8));
 TFT_write_reg(0x98, 0x0000);
 TFT_write_reg(0x07, 0x0173);
 delay_ms(100);
 }

 TFT_clear( 0x0000 );
}


void TFT_write_RAM_prepare()
{
 TFT_write( 0x22 ,  0 );
}


void TFT_set_cursor(unsigned int x_pos, unsigned int y_pos)
{
 TFT_write_reg( 0x20 , x_pos);
 TFT_write_reg( 0x21 , y_pos);
}


void TFT_clear(unsigned int colour)
{
 unsigned long index = 0;

 TFT_set_cursor(0, 0);
 TFT_write_RAM_prepare();

 for(index = 0; index < 76800; index++)
 {
 TFT_write_reg(colour,  1 );
 }
}


void Draw_Pixel(unsigned int x_pos, unsigned int y_pos, unsigned int colour)
{
 TFT_set_cursor(x_pos, y_pos);
 TFT_write_RAM_prepare();
 TFT_write(colour,  1 );
}


unsigned int Get_Pixel(unsigned int x_pos, unsigned int y_pos)
{
 unsigned int value = 0x0000;

 TFT_set_cursor(x_pos, y_pos);
  GPIOC_ODRbits.ODR8  = 0;
 TFT_write_RAM_prepare();
 value = TFT_read(0x0000,  1 );
 value = TFT_read(0x0000,  1 );
  GPIOC_ODRbits.ODR8  = 1;
 value = TFT_BGR2RGB(value);

 return value;
}


unsigned int TFT_BGR2RGB(unsigned int colour)
{
 unsigned int r = 0x0000;
 unsigned int g = 0x0000;
 unsigned int b = 0x0000;
 unsigned int rgb_colour = 0x0000;

 b = ((colour >> 0) & 0x1F);
 g = ((colour >> 5) & 0x3F);
 r = ((colour >> 11) & 0x1F);

 rgb_colour = ((b << 11) + (g << 5) + (r << 0));

 return rgb_colour;
}
