#line 1 "C:/Users/Shawon & Nipa/Desktop/Nokia 5110 LCD Demo with STM32/nokia_5510_lcd_demo.c"
#line 1 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/pcd8544.c"
#line 1 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/pcd8544.h"
#line 1 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/font.c"
static const unsigned char font[][5] =
{
 {0x00, 0x00, 0x00, 0x00, 0x00}
 ,{0x00, 0x00, 0x5f, 0x00, 0x00}
 ,{0x00, 0x07, 0x00, 0x07, 0x00}
 ,{0x14, 0x7f, 0x14, 0x7f, 0x14}
 ,{0x24, 0x2a, 0x7f, 0x2a, 0x12}
 ,{0x23, 0x13, 0x08, 0x64, 0x62}
 ,{0x36, 0x49, 0x55, 0x22, 0x50}
 ,{0x00, 0x05, 0x03, 0x00, 0x00}
 ,{0x00, 0x1c, 0x22, 0x41, 0x00}
 ,{0x00, 0x41, 0x22, 0x1c, 0x00}
 ,{0x14, 0x08, 0x3e, 0x08, 0x14}
 ,{0x08, 0x08, 0x3e, 0x08, 0x08}
 ,{0x00, 0x50, 0x30, 0x00, 0x00}
 ,{0x08, 0x08, 0x08, 0x08, 0x08}
 ,{0x00, 0x60, 0x60, 0x00, 0x00}
 ,{0x20, 0x10, 0x08, 0x04, 0x02}
 ,{0x3e, 0x51, 0x49, 0x45, 0x3e}
 ,{0x00, 0x42, 0x7f, 0x40, 0x00}
 ,{0x42, 0x61, 0x51, 0x49, 0x46}
 ,{0x21, 0x41, 0x45, 0x4b, 0x31}
 ,{0x18, 0x14, 0x12, 0x7f, 0x10}
 ,{0x27, 0x45, 0x45, 0x45, 0x39}
 ,{0x3c, 0x4a, 0x49, 0x49, 0x30}
 ,{0x01, 0x71, 0x09, 0x05, 0x03}
 ,{0x36, 0x49, 0x49, 0x49, 0x36}
 ,{0x06, 0x49, 0x49, 0x29, 0x1e}
 ,{0x00, 0x36, 0x36, 0x00, 0x00}
 ,{0x00, 0x56, 0x36, 0x00, 0x00}
 ,{0x08, 0x14, 0x22, 0x41, 0x00}
 ,{0x14, 0x14, 0x14, 0x14, 0x14}
 ,{0x00, 0x41, 0x22, 0x14, 0x08}
 ,{0x02, 0x01, 0x51, 0x09, 0x06}
 ,{0x32, 0x49, 0x79, 0x41, 0x3e}
 ,{0x7e, 0x11, 0x11, 0x11, 0x7e}
 ,{0x7f, 0x49, 0x49, 0x49, 0x36}
 ,{0x3e, 0x41, 0x41, 0x41, 0x22}
 ,{0x7f, 0x41, 0x41, 0x22, 0x1c}
 ,{0x7f, 0x49, 0x49, 0x49, 0x41}
 ,{0x7f, 0x09, 0x09, 0x09, 0x01}
 ,{0x3e, 0x41, 0x49, 0x49, 0x7a}
 ,{0x7f, 0x08, 0x08, 0x08, 0x7f}
 ,{0x00, 0x41, 0x7f, 0x41, 0x00}
 ,{0x20, 0x40, 0x41, 0x3f, 0x01}
 ,{0x7f, 0x08, 0x14, 0x22, 0x41}
 ,{0x7f, 0x40, 0x40, 0x40, 0x40}
 ,{0x7f, 0x02, 0x0c, 0x02, 0x7f}
 ,{0x7f, 0x04, 0x08, 0x10, 0x7f}
 ,{0x3e, 0x41, 0x41, 0x41, 0x3e}
 ,{0x7f, 0x09, 0x09, 0x09, 0x06}
 ,{0x3e, 0x41, 0x51, 0x21, 0x5e}
 ,{0x7f, 0x09, 0x19, 0x29, 0x46}
 ,{0x46, 0x49, 0x49, 0x49, 0x31}
 ,{0x01, 0x01, 0x7f, 0x01, 0x01}
 ,{0x3f, 0x40, 0x40, 0x40, 0x3f}
 ,{0x1f, 0x20, 0x40, 0x20, 0x1f}
 ,{0x3f, 0x40, 0x38, 0x40, 0x3f}
 ,{0x63, 0x14, 0x08, 0x14, 0x63}
 ,{0x07, 0x08, 0x70, 0x08, 0x07}
 ,{0x61, 0x51, 0x49, 0x45, 0x43}
 ,{0x00, 0x7f, 0x41, 0x41, 0x00}
 ,{0x02, 0x04, 0x08, 0x10, 0x20}
 ,{0x00, 0x41, 0x41, 0x7f, 0x00}
 ,{0x04, 0x02, 0x01, 0x02, 0x04}
 ,{0x40, 0x40, 0x40, 0x40, 0x40}
 ,{0x00, 0x01, 0x02, 0x04, 0x00}
 ,{0x20, 0x54, 0x54, 0x54, 0x78}
 ,{0x7f, 0x48, 0x44, 0x44, 0x38}
 ,{0x38, 0x44, 0x44, 0x44, 0x20}
 ,{0x38, 0x44, 0x44, 0x48, 0x7f}
 ,{0x38, 0x54, 0x54, 0x54, 0x18}
 ,{0x08, 0x7e, 0x09, 0x01, 0x02}
 ,{0x0c, 0x52, 0x52, 0x52, 0x3e}
 ,{0x7f, 0x08, 0x04, 0x04, 0x78}
 ,{0x00, 0x44, 0x7d, 0x40, 0x00}
 ,{0x20, 0x40, 0x44, 0x3d, 0x00}
 ,{0x7f, 0x10, 0x28, 0x44, 0x00}
 ,{0x00, 0x41, 0x7f, 0x40, 0x00}
 ,{0x7c, 0x04, 0x18, 0x04, 0x78}
 ,{0x7c, 0x08, 0x04, 0x04, 0x78}
 ,{0x38, 0x44, 0x44, 0x44, 0x38}
 ,{0x7c, 0x14, 0x14, 0x14, 0x08}
 ,{0x08, 0x14, 0x14, 0x18, 0x7c}
 ,{0x7c, 0x08, 0x04, 0x04, 0x08}
 ,{0x48, 0x54, 0x54, 0x54, 0x20}
 ,{0x04, 0x3f, 0x44, 0x40, 0x20}
 ,{0x3c, 0x40, 0x40, 0x20, 0x7c}
 ,{0x1c, 0x20, 0x40, 0x20, 0x1c}
 ,{0x3c, 0x40, 0x30, 0x40, 0x3c}
 ,{0x44, 0x28, 0x10, 0x28, 0x44}
 ,{0x0c, 0x50, 0x50, 0x50, 0x3c}
 ,{0x44, 0x64, 0x54, 0x4c, 0x44}
 ,{0x00, 0x08, 0x36, 0x41, 0x00}
 ,{0x00, 0x00, 0x7f, 0x00, 0x00}
 ,{0x00, 0x41, 0x36, 0x08, 0x00}
 ,{0x10, 0x08, 0x08, 0x10, 0x08}
 ,{0x78, 0x46, 0x41, 0x46, 0x78}
};
#line 1 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/gpio.h"
#line 51 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/pcd8544.h"
unsigned char PCD8544_buffer[ 84 ][ 6 ];


void setup_LCD_GPIOs();
void PCD8544_write(unsigned char type, unsigned char value);
void PCD8544_reset();
void PCD8544_init();
void PCD8544_backlight_state(unsigned char value);
void PCD8544_set_contrast(unsigned char value);
void PCD8544_set_cursor(unsigned char x_pos, unsigned char y_pos);
void PCD8544_print_char(unsigned char ch, unsigned char colour);
void PCD8544_print_custom_char(unsigned char *map);
void PCD8544_fill(unsigned char bufr);
void PCD8544_clear_buffer(unsigned char colour);
void PCD8544_clear_screen(unsigned char colour);
void PCD8544_print_image(const unsigned char *bmp);
void PCD8544_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour);
void print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch, unsigned char colour);
void print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour);
void print_chr(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char colour);
void print_int(unsigned char x_pos, unsigned char y_pos, signed long value, unsigned char colour);
void print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points, unsigned char colour);
void print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points, unsigned char colour);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour);
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour);
void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour);
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour);
#line 4 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/pcd8544.c"
void setup_LCD_GPIOs()
{
  RCC_APB2ENRbits.IOPBEN = 0x1 ;

  do{if(( 0  >= 0) && ( 0  < 8)){ do{GPIOB_CRL &= (~(0xF << (0 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (0 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  do{if(( 6  >= 0) && ( 6  < 8)){ do{GPIOB_CRL &= (~(0xF << (6 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (6 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((6 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((6 - 8) << 2));}while(0) ;}}while(0) ;
  do{if(( 5  >= 0) && ( 5  < 8)){ do{GPIOB_CRL &= (~(0xF << (5 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (5 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((5 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((5 - 8) << 2));}while(0) ;}}while(0) ;
  do{if(( 7  >= 0) && ( 7  < 8)){ do{GPIOB_CRL &= (~(0xF << (7 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (7 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((7 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((7 - 8) << 2));}while(0) ;}}while(0) ;
  do{if(( 8  >= 0) && ( 8  < 8)){ do{GPIOB_CRL &= (~(0xF << (8 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (8 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((8 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((8 - 8) << 2));}while(0) ;}}while(0) ;
  do{if(( 9  >= 0) && ( 9  < 8)){ do{GPIOB_CRL &= (~(0xF << (9 << 2))); GPIOB_CRL |= ((0x3 | 0x0) << (9 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((9 - 8) << 2))); GPIOB_CRH |= ((0x3 | 0x0) << ((9 - 8) << 2));}while(0) ;}}while(0) ;

  GPIOB_BSRR |= (1 << 0) ;
  GPIOB_BSRR |= (1 << 6) ;
  GPIOB_BSRR |= (1 << 7) ;
  GPIOB_BRR |= (1 << 5) ;
  GPIOB_BRR |= (1 << 8) ;
  GPIOB_BRR |= (1 << 9) ;

 delay_ms(10);
}


void PCD8544_write(unsigned char type, unsigned char value)
{
 unsigned char s = 0x08;

 if(type != 0)
 {
  GPIOB_BSRR |= (1 << 7) ;
 }
 else
 {
  GPIOB_BRR |= (1 << 7) ;
 }

  GPIOB_BRR |= (1 << 6) ;

 while(s > 0)
 {
  GPIOB_BRR |= (1 << 9) ;

 if((value & 0x80) == 0)
 {
  GPIOB_BRR |= (1 << 8) ;
 }
 else
 {
  GPIOB_BSRR |= (1 << 8) ;
 }

 value <<= 1;
  GPIOB_BSRR |= (1 << 9) ;
 s--;
 };

  GPIOB_BSRR |= (1 << 6) ;
}


void PCD8544_reset()
{
  GPIOB_BRR |= (1 << 5) ;
 delay_us(100);
  GPIOB_BSRR |= (1 << 5) ;
}


void PCD8544_init()
{
 setup_LCD_GPIOs();
 PCD8544_reset();
 PCD8544_write( 0 , ( 0x01  |  0x20 ));
 PCD8544_write( 0 , ( 0x10  | 0x02));
 PCD8544_set_contrast(0x39);
 PCD8544_write( 0 ,  0x04 );
 PCD8544_write( 0 , ( 0x04  |  0x08 ));
 PCD8544_write( 0 ,  0x20 );
 PCD8544_write( 0 ,  0x01 );
 PCD8544_write( 0 ,  0x04 );
 PCD8544_clear_buffer( 0 );
}


void PCD8544_backlight_state(unsigned char value)
{
 if(value != 0)
 {
  GPIOB_BRR |= (1 << 0) ;
 }
 else
 {
  GPIOB_BSRR |= (1 << 0) ;
 }
}


void PCD8544_set_contrast(unsigned char value)
{
 if(value >= 0x7F)
 {
 value = 0x7F;
 }

 PCD8544_write( 0 , ( 0x01  |  0x20 ));
 PCD8544_write( 0 , ( 0x80  | value));
 PCD8544_write( 0 ,  0x20 );
}


void PCD8544_set_cursor(unsigned char x_pos, unsigned char y_pos)
{
 PCD8544_write( 0 , ( 0x80  | x_pos));
 PCD8544_write( 0 , ( 0x40  | y_pos));
}


void PCD8544_print_char(unsigned char ch, unsigned char colour)
{
 unsigned char s = 0;
 unsigned char chr = 0;

 for(s = 0; s <= 4; s++)
 {
 chr = font[(ch - 0x20)][s];
 if(colour ==  0 )
 {
 chr = ~chr;
 }
 PCD8544_write( 1 , chr);
 }
}


void PCD8544_print_custom_char(unsigned char *map)
{
 unsigned char s = 0;

 for(s = 0; s <= 4; s++)
 {
 PCD8544_write( 1 , *map++);
 }
}


void PCD8544_fill(unsigned char bufr)
{
 unsigned int s = 0;

 PCD8544_set_cursor(0, 0);

 for(s = 0; s <  504 ; s++)
 {
 PCD8544_write( 1 , bufr);
 }
}


void PCD8544_clear_buffer(unsigned char colour)
{
 unsigned char x_pos = 0;
 unsigned char y_pos = 0;

 for(x_pos; x_pos <  84 ; x_pos++)
 {
 for(y_pos; y_pos <  6 ; y_pos++)
 {
 PCD8544_buffer[x_pos][y_pos] = colour;
 }
 }
}


void PCD8544_clear_screen(unsigned char colour)
{
 unsigned char x_pos = 0;
 unsigned char y_pos = 0;

 for(y_pos = 0; y_pos <  6 ; y_pos++)
 {
 for(x_pos = 0; x_pos <  84 ; x_pos++)
 {
 PCD8544_print_string(x_pos, y_pos, " ", colour);
 }
 }
}


void PCD8544_print_image(const unsigned char *bmp)
{
 unsigned int s = 0;

 PCD8544_set_cursor(0, 0);

 for(s = 0; s <  504 ; s++)
 {
 PCD8544_Write( 1 , bmp[s]);
 }
}


void PCD8544_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch, unsigned char colour)
{
 PCD8544_set_cursor(x_pos, y_pos);

 do
 {
 PCD8544_print_char(*ch++, colour);
 }while((*ch >= 0x20) && (*ch <= 0x7F));
}


void print_chr(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char colour)
{
 unsigned char ch = 0x00;

 if(value < 0)
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x2D, colour);
 value = -value;
 }
 else
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x20, colour);
 }

 if((value > 99) && (value <= 999))
 {
 ch = (value / 100);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char((48 + ch), colour);
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char(0x20, colour);
 }
 else if((value >= 0) && (value <= 9))
 {
 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char(0x20, colour);
 }
}


void print_int(unsigned char x_pos, unsigned char y_pos, signed long value, unsigned char colour)
{
 unsigned char ch = 0x00;

 if(value < 0)
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x2D, colour);
 value = -value;
 }
 else
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x20, colour);
 }

 if(value > 9999)
 {
 ch = (value / 10000);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 10000)/ 1000);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 1000) / 100);
 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 30), y_pos);
 PCD8544_print_char((48 + ch), colour);
 }

 else if((value > 999) && (value <= 9999))
 {
 ch = ((value % 10000)/ 1000);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 1000) / 100);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 30), y_pos);
 PCD8544_print_char(0x20, colour);
 }
 else if((value > 99) && (value <= 999))
 {
 ch = ((value % 1000) / 100);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 30), y_pos);
 PCD8544_print_char(0x20, colour);
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 30), y_pos);
 PCD8544_print_char(0x20, colour);
 }
 else
 {
 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char(0x20, colour);

 PCD8544_set_cursor((x_pos + 30), y_pos);
 PCD8544_print_char(0x20, colour);
 }
}


void print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points, unsigned char colour)
{
 unsigned char ch = 0x00;

 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x2E, colour);

 ch = (value / 1000);
 PCD8544_set_cursor((x_pos + 6), y_pos);
 PCD8544_print_char((48 + ch), colour);

 if(points > 1)
 {
 ch = ((value % 1000) / 100);
 PCD8544_set_cursor((x_pos + 12), y_pos);
 PCD8544_print_char((48 + ch), colour);


 if(points > 2)
 {
 ch = ((value % 100) / 10);
 PCD8544_set_cursor((x_pos + 18), y_pos);
 PCD8544_print_char((48 + ch), colour);

 if(points > 3)
 {
 ch = (value % 10);
 PCD8544_set_cursor((x_pos + 24), y_pos);
 PCD8544_print_char((48 + ch), colour);;
 }
 }
 }
}


void print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points, unsigned char colour)
{
 signed long tmp = 0x00;

 tmp = ((signed long)value);
 print_int(x_pos, y_pos, tmp, colour);
 tmp = ((value - tmp) * 10000);

 if(tmp < 0)
 {
 tmp = -tmp;
 }

 if((value >= 9999) && (value < 99999))
 {
 print_decimal((x_pos + 36), y_pos, tmp, points, colour);
 }
 else if((value >= 999) && (value < 9999))
 {
 print_decimal((x_pos + 30), y_pos, tmp, points, colour);
 }
 else if((value >= 99) && (value < 999))
 {
 print_decimal((x_pos + 24), y_pos, tmp, points, colour);
 }
 else if((value >= 9) && (value < 99))
 {
 print_decimal((x_pos + 18), y_pos, tmp, points, colour);
 }
 else if(value < 9)
 {
 print_decimal((x_pos + 12), y_pos, tmp, points, colour);
 if((value) < 0)
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x2D, colour);
 }
 else
 {
 PCD8544_set_cursor(x_pos, y_pos);
 PCD8544_print_char(0x20, colour);
 }
 }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
 unsigned char row = 0;
 unsigned char value = 0;

 if((x_pos < 0) || (x_pos >=  84 ) || (y_pos < 0) || (y_pos >=  48 ))
 {
 return;
 }

 row = (y_pos >> 3);

 value = PCD8544_buffer[x_pos][row];

 if(colour ==  0 )
 {
 value |= (1 << (y_pos % 8));
 }
 else if(colour ==  1 )
 {
 value &= (~(1 << (y_pos % 8)));
 }
 else if(colour ==  2 )
 {
 value ^= (1 << (y_pos % 8));
 }

 PCD8544_buffer[x_pos][row] = value;

 PCD8544_set_cursor(x_pos, row);
 PCD8544_write( 1 , value);
}


void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour)
{
 signed int dx = 0x0000;
 signed int dy = 0x0000;
 signed int stepx = 0x0000;
 signed int stepy = 0x0000;
 signed int fraction = 0x0000;

 dy = (y2 - y1);
 dx = (x2 - x1);

 if (dy < 0)
 {
 dy = -dy;
 stepy = -1;
 }
 else
 {
 stepy = 1;
 }

 if (dx < 0)
 {
 dx = -dx;
 stepx = -1;
 }
 else
 {
 stepx = 1;
 }

 dx <<= 0x01;
 dy <<= 0x01;

 Draw_Pixel(x1, y1, colour);

 if (dx > dy)
 {
 fraction = (dy - (dx >> 1));
 while (x1 != x2)
 {
 if (fraction >= 0)
 {
 y1 += stepy;
 fraction -= dx;
 }
 x1 += stepx;
 fraction += dy;

 Draw_Pixel(x1, y1, colour);
 }
 }
 else
 {
 fraction = (dx - (dy >> 1));

 while (y1 != y2)
 {
 if (fraction >= 0)
 {
 x1 += stepx;
 fraction -= dy;
 }
 y1 += stepy;
 fraction += dx;
 Draw_Pixel(x1, y1, colour);
 }
 }
}


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour)
{
 unsigned char i = 0x00;
 unsigned char xmin = 0x00;
 unsigned char xmax = 0x00;
 unsigned char ymin = 0x00;
 unsigned char ymax = 0x00;

 if(fill !=  0 )
 {
 if(x1 < x2)
 {
 xmin = x1;
 xmax = x2;
 }
 else
 {
 xmin = x2;
 xmax = x1;
 }

 if(y1 < y2)
 {
 ymin = y1;
 ymax = y2;
 }
 else
 {
 ymin = y2;
 ymax = y1;
 }

 for(; xmin <= xmax; ++xmin)
 {
 for(i = ymin; i <= ymax; ++i)
 {
 Draw_Pixel(xmin, i, colour);
 }
 }
 }

 else
 {
 Draw_Line(x1, y1, x2, y1, colour);
 Draw_Line(x1, y2, x2, y2, colour);
 Draw_Line(x1, y1, x1, y2, colour);
 Draw_Line(x2, y1, x2, y2, colour);
 }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
{
 signed int a = 0x0000;
 signed int b = 0x0000;
 signed int p = 0x0000;

 b = radius;
 p = (1 - b);

 do
 {
 if(fill !=  0 )
 {
 Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
 Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
 Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
 Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
 }
 else
 {
 Draw_Pixel((xc + a), (yc + b), colour);
 Draw_Pixel((xc + b), (yc + a), colour);
 Draw_Pixel((xc - a), (yc + b), colour);
 Draw_Pixel((xc - b), (yc + a), colour);
 Draw_Pixel((xc + b), (yc - a), colour);
 Draw_Pixel((xc + a), (yc - b), colour);
 Draw_Pixel((xc - a), (yc - b), colour);
 Draw_Pixel((xc - b), (yc - a), colour);
 }

 if(p < 0)
 {
 p += (0x03 + (0x02 * a++));
 }
 else
 {
 p += (0x05 + (0x02 * ((a++) - (b--))));
 }
 }while(a <= b);
}
#line 1 "c:/users/shawon & nipa/desktop/nokia 5110 lcd demo with stm32/mikroe_logo.c"
unsigned char const mikro_bmp[504] = {
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 7, 71, 99, 99, 99,
 99, 99, 99, 99, 103, 7, 143, 255, 255, 63, 63, 31,
 15, 15, 7, 7, 7, 3, 3, 3, 3, 3, 3, 3,
 3, 3, 7, 7, 7, 15, 15, 31, 31, 63, 255, 255,
255, 255, 255, 255, 255, 0, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 14, 12, 12, 28, 60,
 60, 60, 60, 60, 252, 254, 255, 3, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 248, 254, 254, 254, 252,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
 15, 255, 255, 255, 255, 0, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 34, 102, 6, 6, 30,
 14, 6, 6, 34, 255, 255, 255, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 1, 3, 3, 3, 3,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 255, 255, 0, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 196, 254, 222, 198, 198,
198, 198, 198, 198, 255, 255, 255, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 254, 255, 255, 255, 255,
255, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
 7, 255, 255, 255, 255, 0, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 16, 24, 24, 24, 24,
 24, 24, 24, 24, 27, 63, 255, 224, 128, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 15, 63, 127, 63, 63,
 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128,
240, 255, 255, 255, 255, 0, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 255, 255, 0, 255, 255, 255, 224, 227, 227, 227, 227,
227, 227, 227, 227, 227, 227, 227, 227, 231, 238, 252, 248,
248, 240, 240, 224, 224, 224, 224, 224, 224, 224, 224, 224,
224, 224, 224, 224, 224, 240, 240, 248, 252, 254, 255, 255,
255, 255, 255, 255, 127, 128, 255, 255, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
#line 5 "C:/Users/Shawon & Nipa/Desktop/Nokia 5110 LCD Demo with STM32/nokia_5510_lcd_demo.c"
void setup();


void main()
{
 unsigned char g = 0;
 const unsigned char txt1[11] = {"MicroArena"};
 const unsigned char txt2[11] = {"SSHAHRYIAR"};

 signed char c = -9;
 signed int i = -66;
 float f = -0.04;

 setup();

 PCD8544_backlight_state( 1 );
 PCD8544_print_image(mikro_bmp);
 delay_ms(2000);

 PCD8544_backlight_state( 0 );
 delay_ms(2000);

 PCD8544_clear_screen( 1 );

 PCD8544_backlight_state( 1 );
 Draw_Rectangle(2, 2, 81, 45,  0 ,  0 );
 delay_ms(200);

 Draw_Circle(6, 6, 2,  1 ,  0 );
 delay_ms(200);
 Draw_Circle(77, 6, 2,  1 ,  0 );
 delay_ms(200);
 Draw_Circle(77, 41, 2,  1 ,  0 );
 delay_ms(200);
 Draw_Circle(6, 41, 2,  1 ,  0 );
 delay_ms(200);

 Draw_Line(2, 11, 10, 11,  0 );
 Draw_Line(73, 11, 81, 11,  0 );
 delay_ms(200);
 Draw_Line(2, 36, 10, 36,  0 );
 Draw_Line(73, 36, 81, 36,  0 );
 delay_ms(200);
 Draw_Line(11, 45, 11, 2,  0 );
 Draw_Line(72, 45, 72, 2,  0 );
 delay_ms(200);

 PCD8544_backlight_state( 0 );
 delay_ms(400);

 PCD8544_backlight_state( 1 );

 for(g = 0; g <= 9; g++)
 {
 PCD8544_set_cursor((18 + (g * 5)), 2);
 PCD8544_print_char(txt1[g],  1 );
 delay_ms(90);
 }

 for(g = 0; g <= 9; g++)
 {
 PCD8544_set_cursor((18 + (g * 5)), 3);
 PCD8544_print_char(txt2[g],  1 );
 delay_ms(90);
 }
 delay_ms(4000);

 PCD8544_clear_screen( 1 );

 PCD8544_print_string(1, 2, "CHR:",  1 );
 PCD8544_print_string(1, 3, "INT:",  1 );
 PCD8544_print_string(1, 4, "FLT:",  1 );

 while(1)
 {
 print_chr(26, 2, c,  1 );
 print_int(26, 3, i,  1 );
 print_float(26, 4, f, 2,  1 );
 c++;
 i++;
 f += 0.01;
 delay_ms(400);
 };
}


void setup()
{
 PCD8544_init();
 PCD8544_clear_screen( 1 );
}
