#include "ST7735.c"


void main()
{
     float f = -0.09;
     signed int i = -9;
     signed char c = 127;

     ST7735_init();

     Set_Rotation(0x03);

     TFT_fill(Swap_Colour(GREEN));
     Draw_Circle(79, 63, 40, YES, Swap_Colour(RED));
     delay_ms(6000);

     TFT_fill(Swap_Colour(WHITE));

     Draw_Circle(6, 6, 4, YES, Swap_Colour(RED));
     Draw_Circle(153, 6, 4, YES, Swap_Colour(RED));
     Draw_Circle(6, 121, 4, YES, Swap_Colour(RED));
     Draw_Circle(153, 121, 4, YES, Swap_Colour(RED));

     delay_ms(1000);

     Draw_Line(14, 0, 14, 127, Swap_Colour(CYAN));
     Draw_Line(145, 0, 145, 127, Swap_Colour(CYAN));
     Draw_Line(0, 14, 159, 14, Swap_Colour(CYAN));
     Draw_Line(0, 113, 159, 113, Swap_Colour(CYAN));

     delay_ms(1000);

     Draw_Rectangle(17, 17, 142, 110, YES, ROUND, Swap_Colour(BLUE), Swap_Colour(WHITE));
     delay_ms(1000);

     print_str(22, 58, 2, Swap_Colour(MAGENTA), Swap_Colour(BLUE), "MicroArena");
     delay_ms(4000);

     TFT_fill(BLACK);
     print_str(20, 90, 1, Swap_Colour(CYAN), BLACK, "www.fb.com/MicroArena");

     while(1)
     {
             print_F(60, 20, 1, Swap_Colour(BLUE), BLACK, f, 2);
             print_C(60, 40, 1, Swap_Colour(GREEN), BLACK, c);
             print_I(60, 60, 1, Swap_Colour(RED), BLACK, i);
             f += 0.01;
             c -= 1;
             i += 1;
             if(c < -128)
             {
                 c = 127;
             }
             delay_ms(60);
     };
}