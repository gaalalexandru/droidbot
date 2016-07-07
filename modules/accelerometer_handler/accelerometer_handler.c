//accelerometer_handler.c
//Application layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "custom_types.h"

/*-------------------HW define Includes--------------*/
/*-------------------Driver Includes-----------------*/
/*-------------------Service Includes----------------*/
#include "gpio_handler.h"
#include "i2c_handler.h"

/*------Export interface---Self header Includes------*/
#include "accelerometer_handler.h"

/*-------------------Macro Definitions----------------*/
#define CS_SPI            	(0)			//Communication with accelerometer through SPI
#define CS_I2C              (1)			//Communication with accelerometer through I2C

void accelerometer_init(void)
{
	GPIO_accelerometer_CS_init();
	GPIO_accelerometer_CS_select(CS_I2C);
}
//EOF
