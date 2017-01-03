//interrupt_handler.c
/*-------------------Configuration Includes-----------*/
#include "compile_switches.h"

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/adc.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/i2c.h"
#include "driverlib/interrupt.h"
#include "driverlib/comp.h"
#include "driverlib/timer.h"

/*------Export interface---Self header Includes------*/
#include "interrupt_handler.h"
#include "motion_handler.h"
#include "cyclic_activity_handler.h"
#include "i2c_handler.h"

/*-------------Global Variable Definitions------------*/
unsigned long comp0_interrupt_flag = 0;	//Global variable used to measure in debugger time till backwards motion is active
unsigned long Mx_LS_Value = 0;	//Central light sensor output 
unsigned long Lx_LS_Value = 0;	//left light sensor output 
unsigned long Rx_LS_Value = 0;	//right light sensor output 
unsigned long X_acceleration = 0;	//X acceleration 8 bit value
unsigned long Y_acceleration = 0;	//Y acceleration 8 bit value
unsigned long Z_acceleration = 0;	//Z acceleration 8 bit value

/*-------------------Function Definitions-------------*/
void Int_Master_Enable(void)
{
	IntMasterEnable();		//Allow processor to respond to interrupts
}
void Int_Master_Disable(void)
{
	IntMasterDisable();		//Allow processor to respond to interrupts
}
/*void GPIOPortF_Handler(void) 	//GPIO port F ISR
//Not needed anymore, done by OS
{
	unsigned long Light_sensor_status = 0;
	Light_sensor_status = GPIOIntStatus(GPIO_PORTF_BASE,false);
	GPIOIntClear(GPIO_PORTF_BASE,GPIO_INT_PIN_0 | GPIO_INT_PIN_4);
	if((Light_sensor_status&(GPIO_INT_PIN_0 | GPIO_INT_PIN_4)) == (GPIO_INT_PIN_0 | GPIO_INT_PIN_4))
	{
		//Go Straight ahead
		Motion_Cruise();
	}
	else if(Light_sensor_status & GPIO_INT_PIN_4)
	{
		//Go Right
		Motion_Go_Right();
	}
	else if(Light_sensor_status & GPIO_INT_PIN_0)
	{
		//Go Left
		Motion_Go_Left();
	}
}*/
void Comp0_Handler(void)			//Analog comparator 0 ISR
{
	comp0_interrupt_flag = 1;
	if(ComparatorIntStatus(COMP_BASE,0,false))
	{
		ComparatorIntClear(COMP_BASE,0);
		Motion_Go_Back();		
	}
}
void WideTimer0A_Handler(void)		//Wide Timer 0 A ISR
{
	unsigned long timer_value=0;
	if(TimerIntStatus(WTIMER0_BASE,false))
	{
		TimerIntClear(WTIMER0_BASE, TIMER_A);
		timer_value = TimerValueGet(WTIMER0_BASE, TIMER_A);
		CYCL_1_second();
	}
}

void Timer0A_Handler(void)		//Timer 0 A ISR
{
	unsigned long timer_value=0;
	if(TimerIntStatus(TIMER0_BASE,false))
	{
		TimerIntClear(TIMER0_BASE, TIMER_A);
		timer_value = TimerValueGet(TIMER0_BASE, TIMER_A);
		CYCL_50_milisecond();
	}
}


void ADC1Seq0_Handler(void)		//ADC1 Seq0 ISR
{
	uint32_t Light;
	if(ADCIntStatus(ADC1_BASE, 0, false))
	{
		ADCIntClear(ADC1_BASE, 0); 										//Clear interrupt flag
		ADCSequenceDataGet(ADC1_BASE, 0, &Light);		
		Mx_LS_Value = Light;
	}
}

void ADC1Seq1_Handler(void)		//ADC1 Seq1 ISR
{
	uint32_t Light;
	if(ADCIntStatus(ADC1_BASE, 1, false))
	{
		ADCIntClear(ADC1_BASE, 1); 										//Clear interrupt flag
		ADCSequenceDataGet(ADC1_BASE, 1, &Light);		
		Rx_LS_Value = Light;
	}
}

void ADC1Seq2_Handler(void)		//ADC1 Seq2 ISR
{
	uint32_t Light;
	if(ADCIntStatus(ADC1_BASE, 2, false))
	{
		ADCIntClear(ADC1_BASE, 2); 										//Clear interrupt flag
		ADCSequenceDataGet(ADC1_BASE, 2, &Light);		
		Lx_LS_Value = Light;
	}
}

/*void I2C0_Handler(void)
{
	unsigned long X_acc = 0, Y_acc = 0, Z_acc = 0;
	if(I2CMasterIntStatus(I2C0_BASE,false))
	{
		I2CMasterIntClear(I2C0_BASE);
		//Perform a read from I2C
		
		//X_acc = I2C_Read(Acc_Slave_Adress,Acc_X8bit_Reg_Adress);
		//Y_acc = I2C_Read(Acc_Slave_Adress,Acc_Y8bit_Reg_Adress);
		//Z_acc = I2C_Read(Acc_Slave_Adress,Acc_Z8bit_Reg_Adress);
		
		//X_acceleration = X_acc;
		//Y_acceleration = Y_acc;
		//Z_acceleration = Z_acc;
	}
}*/

//EOF


