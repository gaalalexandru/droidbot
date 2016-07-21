//i2c_handler.c
//Service layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.h"

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

#include "inc/hw_i2c.h"
#include "inc/hw_types.h"

#define I2C0_MCS (*((volatile uint32_t *)0x40020004))
	
void I2C_Master_Wait(void)
{
	while(I2CMasterBusy(I2C0_BASE));
}
unsigned char I2C_Write(unsigned char Slave_Address, unsigned char Register_Address, unsigned char Register_Write_Value)
{	
	unsigned char error_nr = 0;
	//Step 1. Set Slave adress and Write mode (R/W bit = 0)
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Tx_Slave_Rx);	//Set slave address and send mode
	
	//Step 2. Send the 8bit register adress to write to
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	//while(I2CMasterBusBusy(I2C0_BASE)){}
	
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
	while(I2CMasterBusy(I2C0_BASE)){}
		
	error_nr = I2CMasterErr(I2C0_BASE);
	if(error_nr !=0)
	{
		if(error_nr ==0x10)
		{
			I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_ERROR_STOP);
		}
		return 0;
	}
	else
	{
		//Step 3. Send data to write on register
		I2CMasterDataPut(I2C0_BASE, Register_Write_Value);	//Send the register value to the Slave device
		I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH);
		while(I2CMasterBusy(I2C0_BASE)){}
			
		error_nr = I2CMasterErr(I2C0_BASE);
		if(error_nr !=0)
		{
			return 0;
		}
		else
		{
			return 1;
		}
	}
}

unsigned long I2C_Read(unsigned char Slave_Address, unsigned char Register_Address)
{
	unsigned char error_nr = 0;
	unsigned long Register_Read_Value = 0;
	
	//Step 1.1. Set Slave adress and Write mode (R/W bit = 0)
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Tx_Slave_Rx);	//Set slave address and send mode

	//Step 1.2. Send the 8bit register adress to read from
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	while(I2CMasterBusBusy(I2C0_BASE)){}
		
	//I2C0_MCS = I2C_MASTER_CMD_SINGLE_SEND;
	//HWREG(I2C0_BASE + I2C_O_MCS) = I2C_MASTER_CMD_SINGLE_SEND;
	
	//I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	//I2C_Master_Wait();
	error_nr = I2CMasterErr(I2C0_BASE);
	
	//Step 2. Send the 8bit register adress to read
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	I2C_Master_Wait();
	error_nr = I2CMasterErr(I2C0_BASE);
	
	//Step 3. Set Read mode (R/W bit = 1)
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Rx_Slave_Tx);
	I2C_Master_Wait();
	error_nr = I2CMasterErr(I2C0_BASE);
	
	Register_Read_Value = I2CMasterDataGet(I2C0_BASE);
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE);
	
	if(I2CMasterErr(I2C0_BASE) == 0)
	{
		return Register_Read_Value;
	}
	else
	{
		return 0;
	}
	/*
		SINGLE BYTE READ
		The MMA7455L has an 10-bit ADC that can sample, convert and return sensor data on request. The transmission of an 8-bit
		command begins on the falling edge of SCL. After the eight clock cycles are used to send the command, note that the data returned
		is sent with the MSB first once the data is received. Figure 7 shows the timing diagram for the accelerometer 8-bit I2C
		read operation. The Master (or MCU) transmits a start condition (ST) to the MMA7455L, slave address ($1D), with the R/W bit
		set to “0” for a write, and the MMA7455L sends an acknowledgement. Then the Master (or MCU) transmits the 8-bit address of
		the register to read and the MMA7455L sends an acknowledgement. The Master (or MCU) transmits a repeated start condition
		(SR) and then addresses the MMA7455L ($1D) with the R/W bit set to “1” for a read from the previously selected register. The
		Slave then acknowledges and transmits the data from the requested register. The Master does not acknowledge (NAK) it received
		the transmitted data, but transmits a stop condition to end the data transfer.
	*/
}
void I2C_Accelerometer_Init(void)
{
	//Init PB2 as I2C_0 SCL
	//Init PB3 as I2C_0 SDA	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);			//The I2C0 peripheral must be enabled for use.
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);		//The GPIOB peripheral must be enabled for use.
	
	GPIOPinConfigure(GPIO_PB2_I2C0SCL);
	GPIOPinConfigure(GPIO_PB3_I2C0SDA);
	GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
	GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_3);
	//GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_2, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPU); //Configure PUR for PB2
	GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_3, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_OD); //Configure OD for PB3
	//GPIODirModeSet(GPIO_PORTB_BASE, GPIO_PIN_2|GPIO_PIN_3, GPIO_DIR_MODE_HW);	//Set direction by HW for PB2 and PB3

	I2CMasterInitExpClk(I2C0_BASE,SYS_clock_get,0/*I2C_Rate_100kbps*/);		//Set System clock and normal (100 kbps) transfer rate for I2C_0
	
}
//EOF
