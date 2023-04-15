#include "PCD8544.c"
#include "mikroE_logo.c"


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

     PCD8544_backlight_state(ON);
     PCD8544_print_image(mikro_bmp);
     delay_ms(2000);

     PCD8544_backlight_state(OFF);
     delay_ms(2000);

     PCD8544_clear_screen(WHITE);

     PCD8544_backlight_state(ON);
     Draw_Rectangle(2, 2, 81, 45, OFF, BLACK);
     delay_ms(200);

     Draw_Circle(6, 6, 2, ON, BLACK);
     delay_ms(200);
     Draw_Circle(77, 6, 2, ON, BLACK);
     delay_ms(200);
     Draw_Circle(77, 41, 2, ON, BLACK);
     delay_ms(200);
     Draw_Circle(6, 41, 2, ON, BLACK);
     delay_ms(200);

     Draw_Line(2, 11, 10, 11, BLACK);
     Draw_Line(73, 11, 81, 11, BLACK);
     delay_ms(200);
     Draw_Line(2, 36, 10, 36, BLACK);
     Draw_Line(73, 36, 81, 36, BLACK);
     delay_ms(200);
     Draw_Line(11, 45, 11, 2, BLACK);
     Draw_Line(72, 45, 72, 2, BLACK);
     delay_ms(200);

     PCD8544_backlight_state(OFF);
     delay_ms(400);

     PCD8544_backlight_state(ON);

     for(g = 0; g <= 9; g++)
     {
         PCD8544_set_cursor((18 + (g * 5)), 2);
         PCD8544_print_char(txt1[g], WHITE);
         delay_ms(90);
     }

     for(g = 0; g <= 9; g++)
     {
         PCD8544_set_cursor((18 + (g * 5)), 3);
         PCD8544_print_char(txt2[g], WHITE);
         delay_ms(90);
     }
     delay_ms(4000);

     PCD8544_clear_screen(WHITE);

     PCD8544_print_string(1, 2, "CHR:", WHITE);
     PCD8544_print_string(1, 3, "INT:", WHITE);
     PCD8544_print_string(1, 4, "FLT:", WHITE);

     while(1)
     {
         print_chr(26, 2, c, WHITE);
         print_int(26, 3, i, WHITE);
         print_float(26, 4, f, 2, WHITE);
         c++;
         i++;
         f += 0.01;
         delay_ms(400);
     };
}


void setup()
{
    PCD8544_init();
    PCD8544_clear_screen(WHITE);
}