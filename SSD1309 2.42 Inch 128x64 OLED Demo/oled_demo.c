#include "SSD1309.c"
#include "logo_art.c"



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
         OLED_print_Image(mikro_logo, OFF);
         delay_ms(2400);

         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 1; m < 30; m++)
         {
             Draw_Circle(63, 31, m, YES, ON);
             delay_ms(10);
         }
         delay_ms(900);
         for(m = 1; m < 30; m++)
         {
             Draw_Circle(63, 31, m, YES, OFF);
             delay_ms(10);
         }
         delay_ms(1600);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 1; m < 31; m += 2)
         {
             Draw_Circle(63, 31, m, NO, ON);
             delay_ms(10);
         }
         delay_ms(1600);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 1; m < 31; m++)
         {
             Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m), NO, YES, SQUARE);
             delay_ms(10);
         }
         delay_ms(1600);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 1; m < 31; m++)
         {
             Draw_Rectangle((1 + m), (1 + m), (126 - m), (62 - m), NO, YES, ROUND);
             delay_ms(10);
         }
         delay_ms(1600);

         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 0; m < 128; m += 10)
         {
             for(n = 0; n < 64; n += 8)
             {
                Draw_Line(m, n, 127, 63, ON);
                Draw_Line((127 - m), (63 - n), 0, 0, ON);
                delay_ms(10);
             }
         }
         delay_ms(1600);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         Draw_Triangle(0, 63, 127, 63, 63, 0, NO, ON);
         delay_ms(1600);
         Draw_Triangle(0, 63, 127, 63, 63, 0, YES, ON);
         delay_ms(1600);

         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 0; m < 128; m += 8)
         {
             for(n = 0; n < 64; n += 8)
             {
                Draw_Rectangle(m, 0, 127, n, OFF, ON, ROUND);
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