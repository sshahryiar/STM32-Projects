#include "SSD1306.c"


void setup();


void main()
{
     
     bit toggle;
     unsigned int m = 0;
     unsigned char n = 0;
     unsigned char o = 0;
     unsigned char p = 0;

     signed int i = -9;

     float f = -10.0;

     setup();

     while(1)
     {
         i = -9;
         f = -10.0;

         OLED_fill(0x00);
         OLED_fill(0xAA);
         delay_ms(600);

         OLED_fill(0x55);
         delay_ms(600);

         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 18; m < 114; m += 10)
         {
             for(n = 12;  n < 57; n += 8)
             {
                 Draw_Circle(m, n, 4, toggle, ON);
                 toggle ^= ON;
                 delay_ms(40);
             }
         }
         delay_ms(1600);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(n = 1;  n < 32; n++)
         {
             Draw_Circle(63, 31, n, ON, ON);
         }
         delay_ms(2000);
         for(n = 1;  n < 32; n++)
         {
             Draw_Circle(63, 31, n, ON, OFF);
         }
         delay_ms(900);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(n = 1;  n < 32; n++)
         {
             Draw_Circle(63, 31, n, N, toggle);
             toggle ^= ON;
             delay_ms(10);
         }
         delay_ms(2000);

         OLED_fill(0x00);
         OLED_clear_buffer();
         for(m = 0; m < 128; m += 4)
         {
             for(n = 0; n < 64; n += 4)
             {
                Draw_Line(m, n, 127, 63, ON);
             }
         }
         for(m = 0; m < 128; m += 4)
         {
             for(n = 0; n < 64; n += 4)
             {
                Draw_Line(127, 63, m, n, ON);
             }
         }
         delay_ms(1600);
         for(m = 0; m < 128; m += 4)
         {
             for(n = 0; n < 64; n += 4)
             {
                Draw_Line(m, n, 127, 63, OFF);
             }
         }
         for(m = 0; m < 128; m += 4)
         {
             for(n = 0; n < 64; n += 4)
             {
                Draw_Line(127, 63, m, n, OFF);
             }
         }
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
         delay_ms(600);
         
         for(m = 0; m < 128; m++)
         {
             n = (28 + (28 * sin(m * 0.04090874)));
             Draw_Pixel(m, n, ON);
             n = (28 + (28 * cos(m * 0.04090874)));
             Draw_Pixel(m, n, ON);
             delay_ms(20);
         }
         delay_ms(2000);
         
         OLED_fill(0x00);
         OLED_clear_buffer();
         for(n = 0; n < 63; n++)
         {
            Draw_Rectangle((0 + (n * 2)), (0 + n), (127 - (n * 2)), (63 - n), OFF, ON, SQUARE);
            delay_ms(40);
         }

         OLED_fill(0x00);
         OLED_print_string(36, 1, "MicroArena");
         OLED_print_string(12, 2, "fb.com/MicroArena");
         for(p = 0; p < 250; p++)
         {
             f += 0.1;
             i += 1;

             OLED_print_float(1, 5, f, 1);
             OLED_print_int(1, 6, i);
             OLED_print_chr(1, 7, p);

             delay_ms(99);
         }

         OLED_fill(0xFF);
     };
}


void setup()
{
    OLED_init();
}