//i2c_handler.c
//Service layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*------Export interface---Self header Includes------*/
#include "i2c_handler.h"

/*-------------------Service Includes----------------*/
#include "system_handler.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/i2c.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"

void I2C_Write(unsigned char Slave_Address, unsigned char Register_Address, unsigned char Register_Value)
{	
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Tx_Slave_Rx);	//Set slave address and send mode
	
	I2CMasterDataPut(I2C0_BASE, 0);	//Send a 0 to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
		
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	
	I2CMasterDataPut(I2C0_BASE, Register_Value);	//Send the register value to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
}

unsigned long I2C_Read(unsigned char Slave_Address, unsigned char Register_Address)
{
	unsigned long Read_Value = 0;
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Rx_Slave_Tx);	//Set slave address and send mode	
	
	I2CMasterDataPut(I2C0_BASE, 0);	//Send a 0 to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
		
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	
	return Read_Value;
}
void I2C_Accelerometer_Init(void)
{
	//Init PB2 as I2C_0 SCL
	//Init PB3 as I2C_0 SDA	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);			//The I2C0 peripheral must be enabled for use.
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);		//The GPIOB peripheral must be enabled for use.
	
	IntDisable(INT_I2C0);
	
	I2CMasterIntClear(I2C0_BASE);
	I2CMasterIntDisable(I2C0_BASE);
	
	//Activation start
	GPIOPinConfigure(GPIO_PB2_I2C0SCL);
	GPIOPinConfigure(GPIO_PB3_I2C0SDA);
	GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
	GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_3);
	GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_2, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPU); //Configure PUR for PB2
	GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_3, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_OD); //Configure OD for PB3
	GPIODirModeSet(GPIO_PORTB_BASE, GPIO_PIN_2|GPIO_PIN_3, GPIO_DIR_MODE_HW);	//Set direction by HW for PB2 and PB3

	I2CMasterInitExpClk(I2C0_BASE,SYS_clock_get,I2C_Rate_100kbps);		//Set System clock and normal (100 kbps) transfer rate for I2C_0
	//Activation end
	
	I2CMasterIntEnable(I2C0_BASE);
	
	IntPrioritySet(INT_I2C0,(Int_Prio_Acc_Sens)<<5);
	IntEnable(INT_I2C0);
	/*
	      self.b.write_byte_data(0x1D,0x16,0x55) # Setup the Mode
        self.b.write_byte_data(0x1D,0x10,0) # Calibrate
        self.b.write_byte_data(0x1D,0x11,0) # Calibrate
        self.b.write_byte_data(0x1D,0x12,0) # Calibrate
        self.b.write_byte_data(0x1D,0x13,0) # Calibrate
        self.b.write_byte_data(0x1D,0x14,0) # Calibrate
        self.b.write_byte_data(0x1D,0x15,0) # Calibrate
	*/
	//I2C_Busy = I2CMasterBusBusy(I2C0_BASE);	//True if I2C bus is busy, False if not
	//I2CMasterBusy(I2C0_BASE);
	/*
	The next command available for I2CMasterControl:
		I2C_MASTER_CMD_SINGLE_SEND
		I2C_MASTER_CMD_SINGLE_RECEIVE
		I2C_MASTER_CMD_BURST_SEND_START
		I2C_MASTER_CMD_BURST_SEND_CONT
		I2C_MASTER_CMD_BURST_SEND_FINISH
		I2C_MASTER_CMD_BURST_SEND_ERROR_STOP
		I2C_MASTER_CMD_BURST_RECEIVE_START
		I2C_MASTER_CMD_BURST_RECEIVE_CONT
		I2C_MASTER_CMD_BURST_RECEIVE_FINISH
		I2C_MASTER_CMD_BURST_RECEIVE_ERROR_STOP
		I2C_MASTER_CMD_QUICK_COMMAND
		I2C_MASTER_CMD_HS_MASTER_CODE_SEND
	*/
}
//EOF
