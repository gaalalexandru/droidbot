//i2c_handler.c
#ifndef I2C_HDL
#define I2C_HDL
/*-------------------Type Includes-------------------*/

/*-------------------Function Definitions-------------*/
#endif
void I2C_Master_Wait(void);
unsigned long I2C_Read(unsigned char Slave_Address, unsigned char Register_Address);
unsigned char I2C_Write(unsigned char Slave_Address, unsigned char Register_Address, unsigned char Register_Write_Value);
void I2C_Accelerometer_Init(void);
//EOF
