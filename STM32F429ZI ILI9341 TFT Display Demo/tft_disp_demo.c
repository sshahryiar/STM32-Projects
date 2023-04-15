#include "ILI9341.c"
#include "STMPE811.c"
#include "test.c"


void setup_MCU();
void test_colours();
void test_2D_graphics();
void draw_flag();
void test_RGB();
void print_test_data();
void print_image();


void main()
{
    unsigned int xt = 0;
    unsigned int yt = 0;

    setup_MCU();

    test_RGB();
    
    test_colours();
    test_2D_graphics();
    draw_flag();
    print_test_data();
    print_image();
    print_str(10, 10, 2, Green, Black, "Draw Check");
    
    while(1)
    {
          STMPE811_get_touch(&xt, &yt, LANDSCAPE_1);
          Draw_Point(xt, yt, 3, Green);
    };
}


void setup_MCU()
{
    TFT_init();
    STMPE811_init();
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
    TFT_fill_area(0, 0, 319, 23, Grey);
    TFT_fill_area(0, 23, 319, 47, White);
    TFT_fill_area(0, 47, 319, 71, Cyan);
    TFT_fill_area(0, 71, 319, 95, Light_Blue);
    TFT_fill_area(0, 95, 319, 119, Blue);
    TFT_fill_area(0, 119, 319, 143, Green);
    TFT_fill_area(0, 143, 319, 167, Yellow);
    TFT_fill_area(0, 167, 319, 191, Magenta);
    TFT_fill_area(0, 191, 319, 215, Red);
    TFT_fill_area(0, 215, 319, 239, Black);
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
    print_str(10, 30, 2, Green, Black, "fb.com/MicroArena");
    print_str(10, 60, 3, Blue, Black, "SShahryiar");

    for(s = 0; s < 250; s++)
    {
        print_F(20, 120, 1, Blue, Black, f, 1);
        print_I(20, 160, 2, Green, Black, i);
        print_C(20, 200, 3, Red, Black, c);

        c++;
        i++;
        f += 0.1;

        delay_ms(45);
    }
    
    TFT_fill(Black);
}


void print_image()
{
    Draw_BMP(0, 0, 315, 240, gImage_test);
    delay_ms(6000);
    TFT_fill(Black);
}