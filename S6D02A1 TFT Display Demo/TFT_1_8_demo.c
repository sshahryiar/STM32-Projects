#include "S6D02A1.c"


void main() 
{
     float f = -0.09;
     signed int i = -9;
     signed char c = 127;
     
     TFT_init();
     
     TFT_init();
     TFT_set_rotation(0x03);
     
     TFT_fill(RED);
     delay_ms(2000);
     TFT_fill(GREEN);
     delay_ms(2000);
     TFT_fill(BLUE);
     delay_ms(2000);
     
     TFT_fill(WHITE);
     
     Draw_Circle(6, 6, 4, YES, RED);
     Draw_Circle(153, 6, 4, YES, RED);
     Draw_Circle(6, 121, 4, YES, RED);
     Draw_Circle(153, 121, 4, YES, RED);
     
     delay_ms(1000);
     
     Draw_Line(14, 0, 14, 127, ORANGE);
     Draw_Line(145, 0, 145, 127, ORANGE);
     Draw_Line(0, 14, 159, 14, ORANGE);
     Draw_Line(0, 113, 159, 113, ORANGE);
     
     delay_ms(1000);
     
     Draw_Rectangle(17, 17, 142, 110, YES, ROUND, BLUE, WHITE);
     delay_ms(1000);
     
     print_str(22, 58, 2, L_YELLOW, BLUE, "MICROARENA");
     delay_ms(4000);
     
     TFT_fill(GRAY);
     
     while(1)
     {
             print_F(10, 20, 1, BLUE, GRAY, f, 2);
             print_C(10, 40, 1, BLUE, GRAY, c);
             print_I(10, 60, 1, BLUE, GRAY, i);
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