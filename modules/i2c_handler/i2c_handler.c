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

#include "inc/hw_i2c.h"
#include "inc/hw_types.h"

#define I2C0_MCS (*((volatile uint32_t *)0x40020004))
	
void I2C_Master_Wait(void)
{
	while(I2CMasterBusy(I2C0_BASE));
}
void I2C_Write(unsigned char Slave_Address, unsigned char Register_Address, unsigned char Register_Value)
{	
	unsigned char error_nr = 0;
	//I2CMasterIntDisable(I2C0_BASE);
	//IntDisable(INT_I2C0);

	
	//Step 1. Set Slave adress and Write mode (R/W bit = 0)
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Tx_Slave_Rx);	//Set slave address and send mode
	//I2C_Master_Wait();
	//while(I2CMasterBusy(I2C0_BASE)){};
	error_nr = I2CMasterErr(I2C0_BASE);

	//Step 2. Send the 8bit register adress to write to
	I2CMasterDataPut(I2C0_BASE, Register_Address); //Send the register adress to the Slave device
	I2C0_MCS = I2C_MASTER_CMD_SINGLE_SEND;
	//I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	//I2C_Master_Wait();
	//while(I2CMasterBusy(I2C0_BASE)){};
	error_nr = I2CMasterErr(I2C0_BASE);
	
	//Step 3. Send data to write on register
	I2CMasterDataPut(I2C0_BASE, Register_Value);	//Send the register value to the Slave device
	I2C0_MCS = I2C_MASTER_CMD_SINGLE_SEND;
	//I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_SEND);
	//I2C_Master_Wait();
	//while(I2CMasterBusy(I2C0_BASE)){};
	error_nr = I2CMasterErr(I2C0_BASE);
		
	//IntEnable(INT_I2C0);
	//I2CMasterIntEnable(I2C0_BASE);
}

unsigned long I2C_Read(unsigned char Slave_Address, unsigned char Register_Address)
{
	unsigned char error_nr = 0;
	unsigned long Read_Value = 0;
	
	//Step 1. Set Slave adress and Write mode (R/W bit = 0)
	I2CMasterSlaveAddrSet(I2C0_BASE,Slave_Address,Master_Tx_Slave_Rx);	//Set slave address and send mode	
	
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
	
	Read_Value = I2CMasterDataGet(I2C0_BASE);
	I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE);
	
	if(I2CMasterErr(I2C0_BASE) == 0)
	{
		return Read_Value;
	}
	return 0;
}
void I2C_Accelerometer_Init(void)
{
	//Init PB2 as I2C_0 SCL
	//Init PB3 as I2C_0 SDA	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);			//The I2C0 peripheral must be enabled for use.
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);		//The GPIOB peripheral must be enabled for use.
	
	//IntDisable(INT_I2C0);
	
	//I2CMasterIntClear(I2C0_BASE);
	//I2CMasterIntDisable(I2C0_BASE);
	
	GPIOPinConfigure(GPIO_PB2_I2C0SCL);
	GPIOPinConfigure(GPIO_PB3_I2C0SDA);
	GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
	GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_3);
	GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_2, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPU); //Configure PUR for PB2
	GPIOPadConfigSet(GPIO_PORTB_BASE, GPIO_PIN_3, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_OD); //Configure OD for PB3
	GPIODirModeSet(GPIO_PORTB_BASE, GPIO_PIN_2|GPIO_PIN_3, GPIO_DIR_MODE_HW);	//Set direction by HW for PB2 and PB3

	I2CMasterInitExpClk(I2C0_BASE,SYS_clock_get,I2C_Rate_100kbps);		//Set System clock and normal (100 kbps) transfer rate for I2C_0
	
	//I2CMasterIntEnable(I2C0_BASE);
	//IntPrioritySet(INT_I2C0,(Int_Prio_Acc_Sens)<<5);
	//IntEnable(INT_I2C0);
	
}
//EOF