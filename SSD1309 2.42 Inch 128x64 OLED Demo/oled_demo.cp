#line 1 "C:/Users/sshah/Desktop/SSD1309 2.2 Inch 128x64 OLED Demo/oled_demo.c"
#line 1 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/ssd1309.c"
#line 1 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/ssd1309.h"
#line 76 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/ssd1309.h"
unsigned char buffer[ 1024 ];

void setup_GPIOs();
void swap(signed int *a, signed int *b);
void OLED_init();
void OLED_reset_sequence();
void OLED_write(unsigned char value, unsigned char type);
void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos);
void OLED_fill(unsigned char bmp_data);
void OLED_clear_screen();
void OLED_clear_buffer();
void OLED_cursor(unsigned char x_pos, unsigned char y_pos);
void OLED_print_Image(const unsigned char *bmp, unsigned char pixel);
void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img);
void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch);
void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch);
void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value);
void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value);
void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points);
void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points);
void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour);
void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char colour);
void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour);
void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour);
void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour);
void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type);
void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour);
#line 1 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/fonts.c"
const unsigned char font_regular[92][6] =
{
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00,
 0x00, 0x00, 0x07, 0x00, 0x07, 0x00,
 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14,
 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12,
 0x00, 0x62, 0x64, 0x08, 0x13, 0x23,
 0x00, 0x36, 0x49, 0x55, 0x22, 0x50,
 0x00, 0x00, 0x05, 0x03, 0x00, 0x00,
 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00,
 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00,
 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14,
 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08,
 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00,
 0x00, 0x08, 0x08, 0x08, 0x08, 0x08,
 0x00, 0x00, 0x60, 0x60, 0x00, 0x00,
 0x00, 0x20, 0x10, 0x08, 0x04, 0x02,
 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E,
 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00,
 0x00, 0x42, 0x61, 0x51, 0x49, 0x46,
 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31,
 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10,
 0x00, 0x27, 0x45, 0x45, 0x45, 0x39,
 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30,
 0x00, 0x01, 0x71, 0x09, 0x05, 0x03,
 0x00, 0x36, 0x49, 0x49, 0x49, 0x36,
 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E,
 0x00, 0x00, 0x36, 0x36, 0x00, 0x00,
 0x00, 0x00, 0x56, 0x36, 0x00, 0x00,
 0x00, 0x08, 0x14, 0x22, 0x41, 0x00,
 0x00, 0x14, 0x14, 0x14, 0x14, 0x14,
 0x00, 0x00, 0x41, 0x22, 0x14, 0x08,
 0x00, 0x02, 0x01, 0x51, 0x09, 0x06,
 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E,
 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C,
 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36,
 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22,
 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C,
 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41,
 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01,
 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A,
 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F,
 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00,
 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01,
 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41,
 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40,
 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F,
 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F,
 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E,
 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06,
 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E,
 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46,
 0x00, 0x46, 0x49, 0x49, 0x49, 0x31,
 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01,
 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F,
 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F,
 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F,
 0x00, 0x63, 0x14, 0x08, 0x14, 0x63,
 0x00, 0x07, 0x08, 0x70, 0x08, 0x07,
 0x00, 0x61, 0x51, 0x49, 0x45, 0x43,
 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00,
 0x00, 0x02, 0x04 , 0x08, 0x10, 0x20,
 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00,
 0x00, 0x04, 0x02, 0x01, 0x02, 0x04,
 0x00, 0x40, 0x40, 0x40, 0x40, 0x40,
 0x00, 0x00, 0x01, 0x02, 0x04, 0x00,
 0x00, 0x20, 0x54, 0x54, 0x54, 0x78,
 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38,
 0x00, 0x38, 0x44, 0x44, 0x44, 0x20,
 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F,
 0x00, 0x38, 0x54, 0x54, 0x54, 0x18,
 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02,
 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C,
 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78,
 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00,
 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00,
 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00,
 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00,
 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78,
 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78,
 0x00, 0x38, 0x44, 0x44, 0x44, 0x38,
 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18,
 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC,
 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08,
 0x00, 0x48, 0x54, 0x54, 0x54, 0x20,
 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20,
 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C,
 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C,
 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C,
 0x00, 0x44, 0x28, 0x10, 0x28, 0x44,
 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C,
 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44,
 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
};
#line 5 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/ssd1309.c"
void setup_GPIOs()
{
 GPIO_Clk_Enable(&GPIOA_BASE);

 GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_10),
 (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

 GPIO_Config(&GPIOA_BASE,
 (_GPIO_PINMASK_5 | _GPIO_PINMASK_7),
 (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_MAX));

 GPIO_Config(&GPIOA_BASE,
 _GPIO_PINMASK_6,
 (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_SPEED_MAX));

 GPIO_Clk_Enable(&GPIOB_BASE);

 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7,
 (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SPI1_PA567);

 RCC_APB2ENRbits.SPI1EN =  1 ;

 SPI1_Init_Advanced(_SPI_FPCLK_DIV8, (_SPI_8_BIT | _SPI_MASTER | _SPI_CLK_IDLE_LOW
 | _SPI_FIRST_CLK_EDGE_TRANSITION | _SPI_MSB_FIRST
 | _SPI_SS_ENABLE | _SPI_SSM_ENABLE | _SPI_SSI_0),
 &_GPIO_MODULE_SPI1_PA567);
 delay_ms(100);
}


void swap(signed int *a, signed int *b)
{
 signed int temp = 0x0000;

 temp = *b;
 *b = *a;
 *a = temp;
}


void OLED_init()
{
 setup_GPIOs();

 OLED_reset_sequence();

 OLED_write(( 0xAE  +  0x00 ) ,  0 );;

 OLED_write( 0xD5 ,  0 );
 OLED_write(0x80,  0 );

 OLED_write( 0xA8 ,  0 );
 OLED_write(0x3F,  0 );

 OLED_write( 0xD3 ,  0 );
 OLED_write(0x00,  0 );

 OLED_write(( 0x40  | 0x00),  0 );

 OLED_write( 0x8D ,  0 );
 OLED_write(( 0x10  |  0x04 ),  0 );

 OLED_write( 0x20 ,  0 );
 OLED_write( 0x02 ,  0 );

 OLED_write(( 0xA0  |  0x01 ),  0 );

 OLED_write(( 0xC0  |  0x08 ),  0 );

 OLED_write( 0xDA ,  0 );
 OLED_write(0x12,  0 );

 OLED_write( 0x81 ,  0 );
 OLED_write(0xCF,  0 );

 OLED_write( 0xD9 ,  0 );
 OLED_write(0xF1,  0 );

 OLED_write( 0xDB ,  0 );
 OLED_write(0x40,  0 );

 OLED_write(( 0xA4  |  0x00 ),  0 );

 OLED_write(( 0xA6  |  0x00 ),  0 );

 OLED_write(( 0xAE  +  0x01 ) ,  0 );

 OLED_gotoxy(0, 0);

 OLED_clear_buffer();
 OLED_clear_screen();
}


void OLED_reset_sequence()
{
 delay_ms(40);
  GPIOB_ODRbits.ODR7  =  0 ;
 delay_ms(40);
  GPIOB_ODRbits.ODR7  =  1 ;
}


void OLED_write(unsigned char value, unsigned char type)
{
  GPIOA_ODRbits.ODR10  = (type & 0x01);
  GPIOA_ODRbits.ODR4  =  0 ;
 SPI1_Write(value);
  GPIOA_ODRbits.ODR4  =  1 ;
}


void OLED_gotoxy(unsigned char x_pos, unsigned char y_pos)
{
 OLED_write(( 0xB0  + y_pos),  0 );
 OLED_write(((x_pos & 0x0F) |  0x00 ),  0 );
 OLED_write((((x_pos & 0xF0) >> 0x04) |  0x10 ),  0 );
}


void OLED_fill(unsigned char bmp_data)
{
 unsigned char x_pos = 0x00;
 unsigned char page = 0x00;

 for(page =  0 ; page <  8 ; page++)
 {
 OLED_write(( 0xB0  + page),  0 );
 OLED_write( 0x00 ,  0 );
 OLED_write( 0x10 ,  0 );

 for(x_pos =  0 ; x_pos <  128 ; x_pos++)
 {
 OLED_write(bmp_data,  1 );
 }
 }
}


void OLED_clear_screen()
{
 OLED_fill(0x00);
}


void OLED_clear_buffer()
{
 unsigned int s = 0x00;

 for(s = 0; s <  1024 ; s++)
 {
 buffer[s] = 0x00;
 }
}


void OLED_cursor(unsigned char x_pos, unsigned char y_pos)
{
 unsigned char i = 0x00;

 if(y_pos != 0x00)
 {
 if(x_pos == 1)
 {
 OLED_gotoxy(0x00, (y_pos + 0x02));
 }
 else
 {
 OLED_gotoxy((0x50 + ((x_pos - 0x02) * 0x06)), (y_pos + 0x02));
 }

 for(i = 0; i < 6; i++)
 {
 OLED_write(0xFF,  1 );
 }
 }
}


void OLED_print_Image(const unsigned char *bmp, unsigned char pixel)
{
 unsigned char x_pos = 0x00;
 unsigned char page = 0x00;

 if(pixel !=  0 )
 {
 pixel = 0xFF;
 }
 else
 {
 pixel = 0x00;
 }

 for(page = 0; page <  8 ; page++)
 {
 OLED_gotoxy( 0 , page);
 for(x_pos =  0 ; x_pos <  128 ; x_pos++)
 {
 OLED_write((*bmp++ ^ pixel),  1 );
 }
 }
}


void OLED_draw_bitmap(unsigned char xb, unsigned char yb, unsigned char xe, unsigned char ye, unsigned char *bmp_img)
{
 unsigned int s = 0x0000;
 unsigned char x_pos = 0x00;
 unsigned char y_pos = 0x00;

 for(y_pos = yb; y_pos <= ye; y_pos++)
 {
 OLED_gotoxy(xb, y_pos);
 for(x_pos = xb; x_pos < xe; x_pos++)
 {
 OLED_write(bmp_img[s],  1 );
 s++;
 }
 }
}


void OLED_print_char(unsigned char x_pos, unsigned char y_pos, unsigned char ch)
{
 unsigned char chr = 0x00;
 unsigned char s = 0x00;

 chr = (ch - 32);

 if(x_pos > ( 128  - 6))
 {
 x_pos = 0;
 y_pos++;
 }

 OLED_gotoxy(x_pos, y_pos);

 for(s = 0x00; s < 0x06; s++)
 {
 OLED_write(font_regular[chr][s],  1 );
 }
}


void OLED_print_string(unsigned char x_pos, unsigned char y_pos, unsigned char *ch)
{
 unsigned char chr = 0x00;
 unsigned char i = 0x00;
 unsigned char j = 0x00;

 while(ch[j] != '\0')
 {
 chr = (ch[j] - 32);

 if(x_pos > ( 128  - 0x06))
 {
 x_pos = 0x00;
 y_pos++;
 }
 OLED_gotoxy(x_pos, y_pos);

 for(i = 0x00; i < 0x06; i++)
 {
 OLED_write(font_regular[chr][i],  1 );
 }

 j++;
 x_pos += 6;
 }
}


void OLED_print_chr(unsigned char x_pos, unsigned char y_pos, signed int value)
{
 unsigned char ch = 0x00;

 if(value < 0x00)
 {
 OLED_print_char(x_pos, y_pos, '-');
 value = -value;
 }
 else
 {
 OLED_print_char(x_pos, y_pos,' ');
 }

 if((value > 99) && (value <= 999))
 {
 ch = (value / 100);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
 ch = (value % 10);
 OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
 ch = (value % 10);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));
 OLED_print_char((x_pos + 18), y_pos , 0x20);
 }
 else if((value >= 0) && (value <= 9))
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
 OLED_print_char((x_pos + 12), y_pos , 0x20);
 OLED_print_char((x_pos + 18), y_pos , 0x20);
 }
}


void OLED_print_int(unsigned char x_pos, unsigned char y_pos, signed long value)
{
 unsigned char ch = 0x00;

 if(value < 0)
 {
 OLED_print_char(x_pos, y_pos, '-');
 value = -value;
 }
 else
 {
 OLED_print_char(x_pos, y_pos,' ');
 }

 if(value > 9999)
 {
 ch = (value / 10000);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

 ch = ((value % 10000)/ 1000);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 30), y_pos , (0x30 + ch));
 }

 else if((value > 999) && (value <= 9999))
 {
 ch = ((value % 10000)/ 1000);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
 OLED_print_char((x_pos + 30), y_pos , 0x20);
 }
 else if((value > 99) && (value <= 999))
 {
 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));
 OLED_print_char((x_pos + 24), y_pos , 0x20);
 OLED_print_char((x_pos + 30), y_pos , 0x20);
 }
 else if((value > 9) && (value <= 99))
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

 ch = (value % 10);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));

 OLED_print_char((x_pos + 18), y_pos , 0x20);
 OLED_print_char((x_pos + 24), y_pos , 0x20);
 OLED_print_char((x_pos + 30), y_pos , 0x20);
 }
 else
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));
 OLED_print_char((x_pos + 12), y_pos , 0x20);
 OLED_print_char((x_pos + 18), y_pos , 0x20);
 OLED_print_char((x_pos + 24), y_pos , 0x20);
 OLED_print_char((x_pos + 30), y_pos , 0x20);
 }
}


void OLED_print_decimal(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char points)
{
 unsigned char ch = 0x00;

 OLED_print_char(x_pos, y_pos, '.');

 ch = (value / 1000);
 OLED_print_char((x_pos + 6), y_pos , (0x30 + ch));

 if(points > 1)
 {
 ch = ((value % 1000) / 100);
 OLED_print_char((x_pos + 12), y_pos , (0x30 + ch));


 if(points > 2)
 {
 ch = ((value % 100) / 10);
 OLED_print_char((x_pos + 18), y_pos , (0x30 + ch));

 if(points > 3)
 {
 ch = (value % 10);
 OLED_print_char((x_pos + 24), y_pos , (0x30 + ch));
 }
 }
 }
}


void OLED_print_float(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
{
 signed long tmp = 0x00;

 tmp = value;
 OLED_print_int(x_pos, y_pos, tmp);
 tmp = ((value - tmp) * 10000);

 if(tmp < 0)
 {
 tmp = -tmp;
 }

 if((value >= 10000) && (value < 100000))
 {
 OLED_print_decimal((x_pos + 36), y_pos, tmp, points);
 }
 else if((value >= 1000) && (value < 10000))
 {
 OLED_print_decimal((x_pos + 30), y_pos, tmp, points);
 }
 else if((value >= 100) && (value < 1000))
 {
 OLED_print_decimal((x_pos + 24), y_pos, tmp, points);
 }
 else if((value >= 10) && (value < 100))
 {
 OLED_print_decimal((x_pos + 18), y_pos, tmp, points);
 }
 else if(value < 10)
 {
 OLED_print_decimal((x_pos + 12), y_pos, tmp, points);
 if((value) < 0)
 {
 OLED_print_char(x_pos, y_pos, '-');
 }
 else
 {
 OLED_print_char(x_pos, y_pos, ' ');
 }
 }
}


void Draw_Pixel(unsigned char x_pos, unsigned char y_pos, unsigned char colour)
{
 unsigned char value = 0x00;
 unsigned char page = 0x00;
 unsigned char bit_pos = 0x00;

 page = (y_pos /  8 );
 bit_pos = (y_pos - (page *  8 ));
 value = buffer[((page *  128 ) + x_pos)];

 if((colour & 0x01) != 0)
 {
 value |= (1 << bit_pos);
 }
 else
 {
 value &= (~(1 << bit_pos));
 }

 buffer[((page *  128 ) + x_pos)] = value;
 OLED_gotoxy(x_pos, page);
 OLED_write(value,  1 );
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

 dx <<= 1;
 dy <<= 1;

 Draw_Pixel(x1, y1, colour);

 if(dx > dy)
 {
 fraction = (dy - (dx >> 1));
 while (x1 != x2)
 {
 if(fraction >= 0)
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


void Draw_V_Line(signed int x1, signed int y1, signed int y2, unsigned colour)
{
 signed int pos = 0;
 signed int temp = 0;

 if(y1 > y2)
 {
 swap(&y1, &y2);
 }

 while(y2 > (y1 - 1))
 {
 Draw_Pixel(x1, y2, colour);
 y2--;
 }
}


void Draw_H_Line(signed int x1, signed int x2, signed int y1, unsigned colour)
{
 signed int pos = 0;
 signed int temp = 0;

 if(x1 > x2)
 {
 swap(&x1, &x2);
 }

 while(x2 > (x1 - 1))
 {
 Draw_Pixel(x2, y1, colour);
 x2--;
 }
}


void Draw_Triangle(signed int x1, signed int y1, signed int x2, signed int y2, signed int x3, signed int y3, unsigned char fill, unsigned int colour)
{
 signed int a = 0;
 signed int b = 0;
 signed int sa = 0;
 signed int sb = 0;
 signed int yp = 0;
 signed int last = 0;
 signed int dx12 = 0;
 signed int dx23 = 0;
 signed int dx13 = 0;
 signed int dy12 = 0;
 signed int dy23 = 0;
 signed int dy13 = 0;

 switch(fill)
 {
 case  1 :
 {
 if(y1 > y2)
 {
 swap(&y1, &y2);
 swap(&x1, &x2);
 }
 if(y2 > y3)
 {
 swap(&y3, &y2);
 swap(&x3, &x2);
 }
 if(y1 > y2)
 {
 swap(&y1, &y2);
 swap(&x1, &x2);
 }

 if(y1 == y3)
 {
 a = b = x1;

 if(x2 < a)
 {
 a = x2;
 }
 else if(x2 > b)
 {
 b = x2;
 }
 if(x2 < a)
 {
 a = x3;
 }
 else if(x3 > b)
 {
 b = x3;
 }

 Draw_H_Line(a, (a + (b - (a + 1))), y1, colour);
 return;
 }

 dx12 = (x2 - x1);
 dy12 = (y2 - y1);
 dx13 = (x3 - x1);
 dy13 = (y3 - y1);
 dx23 = (x3 - x2);
 dy23 = (y3 - y2);
 sa = 0,
 sb = 0;

 if(y2 == y3)
 {
 last = y2;
 }
 else
 {
 last = (y2 - 1);
 }

 for(yp = y1; yp <= last; yp++)
 {
 a = (x1 + (sa / dy12));
 b = (x1 + (sb / dy13));
 sa += dx12;
 sb += dx13;
 if(a > b)
 {
 swap(&a, &b);
 }
 Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
 }

 sa = (dx23 * (yp - y2));
 sb = (dx13 * (yp - y1));
 for(; yp <= y3; yp++)
 {
 a = (x2 + (sa / dy23));
 b = (x1 + (sb / dy13));
 sa += dx23;
 sb += dx13;

 if(a > b)
 {
 swap(&a, &b);
 }
 Draw_H_Line(a, (a + (b - (a + 1))), yp, colour);
 }


 break;
 }
 default:
 {
 Draw_Line(x1, y1, x2, y2, colour);
 Draw_Line(x2, y2, x3, y3, colour);
 Draw_Line(x3, y3, x1, y1, colour);
 break;
 }
 }
}


void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char colour, unsigned char type)
{
 unsigned short i = 0x00;
 unsigned short xmin = 0x00;
 unsigned short xmax = 0x00;
 unsigned short ymin = 0x00;
 unsigned short ymax = 0x00;

 if(fill != 0)
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

 if(type !=  0 )
 {
 Draw_Pixel(x1, y1, ~colour);
 Draw_Pixel(x1, y2, ~colour);
 Draw_Pixel(x2, y1, ~colour);
 Draw_Pixel(x2, y2, ~colour);
 }
}


void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned char colour)
{
 signed int a = 0x0000;
 signed int b = 0x0000;
 signed int P = 0x0000;

 b = radius;
 P = (1 - b);

 do
 {
 if(fill != 0)
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

 if(P < 0)
 {
 P += (3 + (2 * a++));
 }
 else
 {
 P += (5 + (2 * ((a++) - (b--))));
 }
 }while(a <= b);
}
#line 1 "c:/users/sshah/desktop/ssd1309 2.2 inch 128x64 oled demo/logo_art.c"
const code unsigned char mikro_logo[ 1024 ] =
{
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 254, 254, 254, 14, 142, 198, 198, 198, 198, 198, 198, 206, 14, 30, 254, 254, 126, 126, 30, 30, 14, 14, 14, 6, 6, 6, 6, 6, 6, 6, 6, 14, 14, 14, 30, 30, 62, 126, 254, 254, 254, 254, 254, 254, 254, 255, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 14, 12, 12, 28, 60, 60, 60, 60, 252, 254, 255, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 254, 254, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 17, 179, 131, 131, 143, 135, 131, 145, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 129, 129, 129, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 49, 63, 55, 49, 49, 49, 49, 49, 127, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 2, 99, 99, 99, 99, 99, 99, 99, 99, 103, 127, 124, 112, 192, 128, 128, 0, 0, 0, 0, 0, 0, 1, 7, 7, 7, 1, 0, 0, 0, 0, 0, 0, 128, 192, 224, 240, 254, 255, 255, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 63, 111, 111, 111, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 111, 111, 111, 111, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 103, 31, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
#line 6 "C:/Users/sshah/Desktop/SSD1309 2.2 Inch 128x64 OLED Demo/oled_demo.c"
void setup_MCU();


void main()
{
 unsigned int m = 0;
 unsigned char n = 0;
 unsigned char o = 0;
 unsigned char p = 0;

 signed int i = -9;

 float f = -10.0;

 setup_MCU();

 while(1)
 {
 i = -9;
 f = -10.0;

 OLED_fill(0x00);
 OLED_fill(0xAA);
 delay_ms(600);

 OLED_fill(0x55);
 delay_ms(600);

 OLED_clear_buffer();
 OLED_fill(0x00);
 OLED_print_Image(mikro_logo,  0 );
 delay_ms(2400);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 1; m < 30; m++)
 {
 Draw_Circle(63, 31, m,  1 ,  1 );
 delay_ms(10);
 }
 delay_ms(900);
 for(m = 1; m < 30; m++)
 {
 Draw_Circle(63, 31, m,  1 ,  0 );
 delay_ms(10);
 }
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 1; m < 31; m += 2)
 {
 Draw_Circle(63, 31, m,  0 ,  1 );
 delay_ms(10);
 }
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 1; m < 31; m++)
 {
 Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m),  0 ,  1 ,  0 );
 delay_ms(10);
 }
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 1; m < 31; m++)
 {
 Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m),  0 ,  1 ,  1 );
 delay_ms(10);
 }
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 0; m < 128; m += 10)
 {
 for(n = 0; n < 64; n += 8)
 {
 Draw_Line(m, n, 127, 63,  1 );
 Draw_Line((127 - m), (63 - n), 0, 0,  1 );
 delay_ms(10);
 }
 }
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 Draw_Triangle(0, 63, 127, 63, 63, 0,  0 ,  1 );
 delay_ms(1600);
 Draw_Triangle(0, 63, 127, 63, 63, 0,  1 ,  1 );
 delay_ms(1600);

 OLED_fill(0x00);
 OLED_clear_buffer();
 for(m = 0; m < 128; m += 8)
 {
 for(n = 0; n < 64; n += 8)
 {
 Draw_Rectangle(m, 0, 127, n,  0 ,  1 ,  1 );
 }
 }
 delay_ms(1600);


 OLED_fill(0x00);
 OLED_print_string(36, 1, "MicroArena");
 OLED_print_string(12, 2, "fb.com/MicroArena");
 for(p = 0; p < 250; p++)
 {
 f += 0.1;
 i += 1;

 OLED_print_float(52, 5, f, 1);
 OLED_print_int(52, 6, i);
 OLED_print_chr(52, 7, p);

 delay_ms(99);
 }

 OLED_fill(0xFF);
 };
}


void setup_MCU()
{
 OLED_init();
}
