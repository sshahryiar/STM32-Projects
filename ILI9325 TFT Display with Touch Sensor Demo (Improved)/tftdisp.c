#include "bmp.c"
#include "ILI932x.c"
#include "touch.c"


void setup_MCU();
void test_colours();
void test_2D_graphics();
void draw_flag();
void test_RGB();
void print_test_data();
void print_image();


void main() 
{
    setup_MCU();
    
    test_RGB();
    test_colours();
    test_2D_graphics();
    draw_flag();
    print_test_data();
    print_image();
    print_str(10, 10, 2, White, Black, "Draw Check");
    
    while(1)
    {
        if(TP_INT_pin == 0)
        {
            TP_read_coordinates(&tpx, &tpy);
            Draw_Pixel(tpx, tpy, White);
        }
    };
}


void setup_MCU()
{
    tp_init();
    TFT_init();
}


void draw_flag()
{
    Draw_Rectangle(20, 20, 299, 219, YES, SQUARE, Green, Green);
    Draw_Circle(160, 120, 60, YES, Red);
    delay_ms(4000);
    TFT_fill(Black);
}


void test_RGB()
{
    TFT_fill(Red);
    delay_ms(600);
    TFT_fill(Green);
    delay_ms(600);
    TFT_fill(Blue);
    delay_ms(600);
    TFT_fill(Black);
}


void test_colours()
{
    Draw_Rectangle(0, 0, 319, 23, YES, SQUARE, Grey, Grey);
    Draw_Rectangle(0, 23, 319, 47, YES, SQUARE, White, White);
    Draw_Rectangle(0, 47, 319, 71, YES, SQUARE, Cyan, Cyan);
    Draw_Rectangle(0, 71, 319, 95, YES, SQUARE, Light_Blue, Light_Blue);
    Draw_Rectangle(0, 95, 319, 119, YES, SQUARE, Blue, Blue);
    Draw_Rectangle(0, 119, 319, 143, YES, SQUARE, Green, Green);
    Draw_Rectangle(0, 143, 319, 167, YES, SQUARE, Yellow, Yellow);
    Draw_Rectangle(0, 167, 319, 191, YES, SQUARE, Magenta, Magenta);
    Draw_Rectangle(0, 191, 319, 215, YES, SQUARE, Red, Red);
    Draw_Rectangle(0, 215, 319, 239, YES, SQUARE, Black, Black);
    delay_ms(2600);
    TFT_fill(Black);
}


void test_2D_graphics()
{
    signed int i = 0;

    TFT_fill(Black);

    for(i = 10; i <= 310; i += 10)
    {
        Draw_V_Line(i, 20, 220, White);
    }
    for(i = 20; i <= 220; i += 10)
    {
        Draw_H_Line(10, 310, i, White);
    }

    delay_ms(3000);

    TFT_fill(Black);
    for(i = 0; i < 240; i += 5)
    {
        Draw_Line(0, 0, 319, i, Light_Blue);
    }

    for(i = 239; i > -1; i -= 5)
    {
        Draw_Line(319, 240, 0, i, Blue);
    }

    delay_ms(3000);

    TFT_fill(Black);

    Draw_Rectangle(9, 19, 309, 199, NO, ROUND, Magenta, Black);
    Draw_Rectangle(19, 29, 299, 189, YES, SQUARE, Cyan, Black);

    delay_ms(4000);

    TFT_fill(Black);

    Draw_Circle(159, 119, 80, NO, Red);
    Draw_Circle(159, 119, 40, YES, Yellow);


    delay_ms(3000);

    TFT_fill(Black);

    Draw_Triangle(10, 200, 309, 200, 149, 19, NO, Green);
    delay_ms(400);
    Draw_Triangle(10, 200, 309, 200, 149, 19, YES, Grey);

    delay_ms(3000);

    TFT_fill(Black);

    for(i = 0; i < 100; i++)
    {
       Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
       Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
    }

    for(i = 100; i > -1; i--)
    {
       Draw_H_Bar(10, 110, 10, 20,  i,  Green, Yellow, Black, YES);
       Draw_V_Bar(280, 130, 230, 20, i, Red, Cyan, Black, YES);
    }
    delay_ms(3000);

    TFT_fill(Black);
}


void print_test_data()
{
    unsigned char s = 0;
    signed char c = -9;

    signed int i = -9;

    float f = -9.0;
    
    
    print_str(10, 10, 1, Red, Black, "MicroArena");
    print_str(10, 30, 2, Green, Black, "MicroArena");
    print_str(10, 60, 3, Blue, Black, "MicroArena");
    
    print_str(10, 90, 3, White, Black, "https://www.facebook.com/MicroArena");
    
    for(s = 0; s < 250; s++)
    {
        print_C(10, 160, 1, Red, Black, c);
        print_I(10, 180, 1, Green, Black, i);
        print_F(10, 200, 1, Blue, Black, f, 1);
        
        print_C(60, 160, 2, Red, Black, c);
        print_I(60, 180, 2, Green, Black, i);
        print_F(60, 200, 2, Blue, Black, f, 1);
        
        print_C(120, 140, 3, Red, Black, c);
        print_I(120, 174, 3, Green, Black, i);
        print_F(120, 210, 3, Blue, Black, f, 1);
        
        c++;
        i++;
        f += 0.1;
        
        delay_ms(45);
    }
    TFT_fill(White);
}


void print_image()
{
    Draw_BMP(16, 20, 285, 200, gImage_test);
    delay_ms(6000);
    TFT_fill(Black);
}