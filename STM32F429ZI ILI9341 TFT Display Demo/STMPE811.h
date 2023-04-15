#define STMPE811_device_address                                                          0x41

#define STMPE811_CHIP_ID                                                                 0x00
#define STMPE811_ID_VER                                                                  0x02
#define STMPE811_SYS_CTRL1                                                               0x03
#define STMPE811_SYS_CTRL2                                                               0x04
#define STMPE811_SPI_CFG                                                                 0x08
#define STMPE811_INT_CTRL                                                                0x09
#define STMPE811_INT_EN                                                                  0x0A
#define STMPE811_INT_STA                                                                 0x0B
#define STMPE811_GPIO_INT_EN                                                             0x0C
#define STMPE811_GPIO_INT_STA                                                            0x0D
#define STMPE811_ADC_INT_EN                                                              0x0E
#define STMPE811_ADC_INT_STA                                                             0x0F
#define STMPE811_GPIO_SET_PIN                                                            0x10
#define STMPE811_GPIO_CLR_PIN                                                            0x11
#define STMPE811_GPIO_MP_STA                                                             0x12
#define STMPE811_GPIO_DIR                                                                0x13
#define STMPE811_GPIO_ED                                                                 0x14
#define STMPE811_GPIO_RE                                                                 0x15
#define STMPE811_GPIO_FE                                                                 0x16
#define STMPE811_GPIO_AF                                                                 0x17
#define STMPE811_ADC_CTRL1                                                               0x20
#define STMPE811_ADC_CTRL2                                                               0x21
#define STMPE811_ADC_CAPT                                                                0x22
#define STMPE811_ADC_DATA_CH0                                                            0x30
#define STMPE811_ADC_DATA_CH1                                                            0x32
#define STMPE811_ADC_DATA_CH2                                                            0x34
#define STMPE811_ADC_DATA_CH3                                                            0x36
#define STMPE811_ADC_DATA_CH4                                                            0x38
#define STMPE811_ADC_DATA_CH5                                                            0x3A
#define STMPE811_ADC_DATA_CH6                                                            0x3C
#define STMPE811_ADC_DATA_CH7                                                            0x3E
#define STMPE811_TSC_CTRL                                                                0x40
#define STMPE811_TSC_CFG                                                                 0x41
#define STMPE811_WDW_TR_X                                                                0x42
#define STMPE811_WDW_TR_Y                                                                0x44
#define STMPE811_WDW_BL_X                                                                0x46
#define STMPE811_WDW_BL_Y                                                                0x48
#define STMPE811_FIFO_TH                                                                 0x4A
#define STMPE811_FIFO_STA                                                                0x4B
#define STMPE811_FIFO_SIZE                                                               0x4C
#define STMPE811_TSC_DATA_X                                                              0x4D
#define STMPE811_TSC_DATA_Y                                                              0x4F
#define STMPE811_TSC_DATA_Z                                                              0x51
#define STMPE811_TSC_DATA_XYZ                                                            0x52
#define STMPE811_TSC_FRACTION_Z                                                          0x56
#define STMPE811_TSC_DATA                                                                0x57
#define STMPE811_TSC_I_DRIVE                                                             0x58
#define STMPE811_TSC_SHIELD                                                              0x59
#define STMPE811_TEMP_CTRL                                                               0x60
#define STMPE811_TEMP_DATA                                                               0x61
#define STMPE811_TEMP_TH                                                                 0x62

#define RL_max                                                                           3900
#define RL_min                                                                           360
#define RW_max                                                                           3800
#define RW_min                                                                           220

#define W_max                                                                            240
#define W_min                                                                            0
#define L_max                                                                            320
#define L_min                                                                            0


void STMPE811_peripheral_setup();
void STMPE811_init();
void STMPE811_write_byte(unsigned char addr, unsigned char value);
unsigned char STMPE811_read_byte(unsigned char addr);
void STMPE811_write_word(unsigned char addr, unsigned int value);
unsigned int STMPE811_read_word(unsigned char addr);
void STMPE811_read_x();
void STMPE811_read_y();
void STMPE811_get_touch(unsigned int *x_pos, unsigned int *y_pos, unsigned char orientation);
float map(float value, float x_min, float x_max, float y_min, float y_max);
float constrain(float value, float value_min, float value_max);
