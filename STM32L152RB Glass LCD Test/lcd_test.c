#include "Glass_LCD.c"


void main()
{
     LCD_GLASS_Init();
    
     LCD_GLASS_DisplayString("STM32L");
     delay_ms(6000);
     LCD_GLASS_Clear();
     while(1)
     {
         LCD_GLASS_Clear();
         LCD_GLASS_ScrollSentence("      * MICROARENA *      ", 1, SCROLL_SPEED_L);
         delay_ms(600);
         LCD_GLASS_Clear();
         LCD_GLASS_ScrollSentence("      [ https://www.facebook.com/MicroArena ]     ", 1, SCROLL_SPEED);
         delay_ms(600);
     };
}