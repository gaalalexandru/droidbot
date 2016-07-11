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

unsigned char I2C_Init_Flag = 0;

void Accelerometer_init(void)
{
	GPIO_accelerometer_CS_init();
	GPIO_accelerometer_CS_select(CS_I2C);
	I2C_Accelerometer_Init();
	
	I2C_Write(Acc_Slave_Adress,0x16,0x05); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x10,0); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x11,0); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x12,0); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x13,0); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x14,0); //try 0x16, 0x15
	I2C_Write(Acc_Slave_Adress,0x15,0); //try 0x16, 0x15
	I2C_Init_Flag = 1;
}
/*
	      self.b.write_byte_data(0x1D,0x16,0x16) # Setup the Mode
        self.b.write_byte_data(0x1D,0x10,0) # Calibrate
        self.b.write_byte_data(0x1D,0x11,0) # Calibrate
        self.b.write_byte_data(0x1D,0x12,0) # Calibrate
        self.b.write_byte_data(0x1D,0x13,0) # Calibrate
        self.b.write_byte_data(0x1D,0x14,0) # Calibrate
        self.b.write_byte_data(0x1D,0x15,0) # Calibrate
	*/
//EOF