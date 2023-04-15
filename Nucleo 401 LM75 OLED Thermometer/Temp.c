#include "LM75.c"
#include "SSD1306.c"
#include "background.c"

#define bar_offset         20


void setup_mcu();
void background_layer();
void draw_bar(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char on_off);


void main()
{
     float t_diff = 0.0;
     float t_new = 0.0;
     float t_old = 0.0;

     setup_mcu();
     background_layer();

     while(1)
     {
        t_new = get_temp();
        
        if((t_new != t_old) && ((t_new >= 0) && (t_new <= 100)))
        {
            t_diff = (t_new - t_old);
            Draw_Line(20, 25, 122, 25, ON);
            Draw_Line(20, 32, 122, 32, ON);
            
            if(t_old <= t_new)
            {
                Draw_Rectangle(bar_offset, 27, (t_old + t_diff + bar_offset - 1), 30, YES, ON, SQUARE);
                Draw_Line((t_old + t_diff + bar_offset), 28, (t_old + t_diff + bar_offset), 29, ON);
            }
            else
            {
                Draw_Rectangle((t_new + bar_offset), 27, (t_old + bar_offset + 2), 30, YES, OFF, SQUARE);
                Draw_Line((t_new + bar_offset), 28, (t_new + bar_offset), 29, ON);
            }
            
            OLED_print_string(56, 7, "          ");
            OLED_print_float(56, 7, t_new, 3);
            t_old = t_new;
        }

        delay_ms(600);
     };
}


void setup_mcu()
{
    GPIO_Clk_Enable(&GPIOA_BASE);
    GPIO_Clk_Enable(&GPIOB_BASE);

    GPIO_Config(&GPIOA_BASE,
            _GPIO_PINMASK_5,
            (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

    OLED_init();
    LM75_init();
}


void background_layer()
{
    OLED_draw_bitmap(0, 0, 127, 7, (unsigned char *)image);
    OLED_print_string(15, 0, "LM75 Thermometer");
    OLED_print_string(24, 7, "T/'C: ");
}


void draw_bar(unsigned char x1, unsigned char y1, unsigned char x2, unsigned char y2, unsigned char on_off)
{
    Draw_Rectangle(x1, y1, x2, y2, YES, on_off, SQUARE);
    Draw_Line(x1, 28, x1, 29, ON);
}