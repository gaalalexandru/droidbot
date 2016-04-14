//interrupt_handler.c

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/adc.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/interrupt.h"
#include "driverlib/comp.h"
#include "driverlib/timer.h"

/*-------------------Self header Includes-------------*/
#include "interrupt_handler.h"
#include "motion_handler.h"
#include "cyclic_activity_handler.h"

/*-------------Global Variable Definitions------------*/
unsigned long comp0_interrupt_flag = 0;	//Global variable used to measure in debugger time till backwards motion is active
unsigned long internal_temperature = 0;
/*-------------------Function Definitions-------------*/
void Int_Master_Enable(void)
{
	IntMasterEnable();		//Allow processor to respond to interrupts
}
void Int_Master_Disable(void)
{
	IntMasterDisable();		//Allow processor to respond to interrupts
}
void GPIOPortF_Handler(void) 	//GPIO port F ISR
{
	unsigned long Light_sensor_status = 0;
	Light_sensor_status = GPIOIntStatus(GPIO_PORTF_BASE,false);
	GPIOIntClear(GPIO_PORTF_BASE,GPIO_INT_PIN_0 | GPIO_INT_PIN_4);
	if((Light_sensor_status&(GPIO_INT_PIN_0 | GPIO_INT_PIN_4)) == (GPIO_INT_PIN_0 | GPIO_INT_PIN_4))
	{
		//Go Straight ahead
		Motion_Cruise();
		//Motion_Go_Back();
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
}
void Comp0_Handler(void)			//Analog comparator 0 ISR
{
	//unsigned long delay = 10;
	comp0_interrupt_flag = 1;
	if(ComparatorIntStatus(COMP_BASE,0,false))
	{
		ComparatorIntClear(COMP_BASE,0);
		Motion_Go_Back();
		/*while (delay) 
		{
			delay --;	//delay 10 cycles
		}*/
		
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
		//Toggle PF2
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
		//Toggle PF2
	}
}

//for the interrupt handler ISR
void ADC0Seq3_Handler(void)		//ADC0 Seq3 ISR
{
	uint32_t Temperature;
	if(ADCIntStatus(ADC0_BASE, 3, false))
	{
		ADCIntClear(ADC0_BASE, 3); 										//Clear interrupt flag
		ADCSequenceDataGet(ADC0_BASE, 3, &Temperature);		
		internal_temperature = Temperature;
	}
}
//EOF
