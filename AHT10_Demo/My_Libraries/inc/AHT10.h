#include "main.h"


extern I2C_HandleTypeDef hi2c1;


#define AHT10_I2C_Address				0x70

#define AHT10_INIT_CMD             		0xE1
#define AHT10_START_MEASURMENT_CMD 		0xAC
#define AHT10_NORMAL_CMD           		0xA8
#define AHT10_SOFT_RESET_CMD       		0xBA
#define AHT10_INIT_NORMAL_MODE 	    	0x00
#define AHT10_INIT_CYCLE_MODE    		0x20
#define AHT10_INIT_CMD_MODE        		0x40
#define AHT10_INIT_CAL_ENABLE      		0x08
#define AHT10_DATA_MEASURMENT_CMD  		0x33
#define AHT10_DATA_NOP            		0x00

#define AHT10_GET_RH_CMD				1
#define AHT10_GET_T_CMD					0


void AHT10_init(void);
void AHT10_calibrate(void);
unsigned char AHT10_read_status(void);
unsigned long AHT10_read_sensor(unsigned char command);
void AHT10_set_normal_mode(void);
void AHT10_set_cyclic_mode(void);
void AHT10_soft_reset(void);
float AHT10_read_temperature(void);
float AHT10_read_relative_humidity(void);
