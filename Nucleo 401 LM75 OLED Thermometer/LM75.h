#define LM75_I2C_Address                                                             0x48

#define pointer_temp_reg                                                             0x00
#define pointer_conf_reg                                                             0x01
#define pointer_thyst_reg                                                            0x02
#define pointer_tos_reg                                                              0x03

//Configure Register bits
#define queue_value_1                                                                0x00
#define queue_value_2                                                                0x08
#define queue_value_4                                                                0x10
#define queue_value_6                                                                0x18

#define OS_POL_LOW                                                                   0x00
#define OS_POL_HIGH                                                                  0x04

#define OS_Comp                                                                      0x00
#define OS_INT                                                                       0x02

#define normal                                                                       0x00
#define shutdown                                                                     0x01


void LM75_init();
void LM75_write_byte(unsigned char pointer, unsigned char value);
void LM75_write_bytes(unsigned char pointer, signed int value);
signed int LM75_read_byte(unsigned char pointer);
signed int LM75_read_bytes(unsigned char pointer);
float get_temp();