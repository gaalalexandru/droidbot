//cyclic_activity_handler.c
//Application layer
/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/adc.h"
#include "driverlib/gpio.h"
//#include "driverlib/pin_map.h"

/*-------------------Self header Includes-------------*/
#include "cyclic_activity_handler.h"
#include "pwm_handler.h"
#include "printing_handler.h"

/*-------------Global Variable Definitions------------*/
extern char print_flag;

/*-------------------Function Definitions-------------*/
void CYCL_1_second(void)	//Fucntion container, with everything that executes at 1 second interval
{
	static unsigned char counter = 0;
	if (counter <=2)
	{
		print_flag = 0;
		Print_Welcome_Image();
	}
	else
	{
		//Print_Motor_Parameters();
	}
	PWM_Red_led_toggle();
	if((counter%2)==0)
	{
		//Code that runs only every 2 seconds
	}
	if((counter%5)==0)
	{
		//Code that runs only every 5 seconds
		//print_flag = 0;
		//Print_5s_img();
	}
	if((counter%10)==0)
	{
		//Code that runs onle every 10 seconds
	}
	if(counter == 254)	//Max value reached (Not 255, to keep 2s, 5s and 10s interval
	{
		counter = 5;			//Reset counter to 5, to keep 2s, 5s and 10s interval
	}
	else
	{
		counter++;				//Just increment counter
	}
}

void CYCL_50_milisecond(void)	//Fucntion container, with everything that executes at 50 mili second interval
{
	static unsigned char counter = 0;
	if((counter%2)==0)
	{
		//Code that runs only every 100 ms
		Print_Motor_Parameters();
		ADCProcessorTrigger(ADC1_BASE, 1);
		ADCProcessorTrigger(ADC1_BASE, 2);
		ADCProcessorTrigger(ADC1_BASE, 3);
	}
	if((counter%5)==0)
	{
		//Code that runs only every 250 ms
	}
	if((counter%10)==0)
	{
		//Code that runs only every 500 ms
		ADCProcessorTrigger(ADC0_BASE, 3);
	}
	if(counter == 254)	//Max value reached (Not 255, to keep 50ms, 100ms, 250ms, 500ms interval)
	{
		counter = 5;			//Reset counter to 5, to keep 50ms, 100ms, 250ms, 500ms interval
	}
	else
	{
		counter++;				//Just increment counter
	}

}
