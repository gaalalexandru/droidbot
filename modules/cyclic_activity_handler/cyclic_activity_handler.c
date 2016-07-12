//cyclic_activity_handler.c
//Application layer

/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"
/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/adc.h"
#include "driverlib/gpio.h"

/*------Export interface---Self header Includes------*/
#include "cyclic_activity_handler.h"

/*-------------------Service Includes-----------------*/
#include "motion_handler.h"
#include "pwm_handler.h"
#include "printing_handler.h"
#include "i2c_handler.h"

/*-------------Global Variable Definitions------------*/
extern char print_flag;

extern unsigned long X_acceleration;//X acceleration 8 bit value
extern unsigned long Y_acceleration;//Y acceleration 8 bit value
extern unsigned long Z_acceleration;//Z acceleration 8 bit value
extern unsigned char I2C_Init_Flag;
/*-------------Local Variable Definitions-------------*/
static unsigned char startup_image = 1;

/*-------------------Function Definitions-------------*/
void CYCL_1_second(void)	//Fucntion container, with everything that executes at 1 second interval
{

	static unsigned char counter = 0;

	if (counter <=2)
	{
		Print_Welcome_Image();
	}
	else
	{
		startup_image = 0;
	}
	PWM_Red_led_toggle();
	if((counter%2)==0)
	{
		//Code that runs only every 2 seconds
	}
	if((counter%5)==0)
	{
		//Code that runs only every 5 seconds
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
	Motion_calculate_direction();
	if((counter%2)==0)
	{
		//Code that runs only every 100 ms

		ADCProcessorTrigger(ADC1_BASE, 0);	//Trigger Light sensor ADC
		ADCProcessorTrigger(ADC1_BASE, 1);	//Trigger Light sensor ADC
		ADCProcessorTrigger(ADC1_BASE, 2);	//Trigger Light sensor ADC
		if (I2C_Init_Flag)
		{
			//X_acceleration = I2C_Read(Acc_Slave_Adress,Acc_X8bit_Reg_Adress);
			//Y_acceleration = I2C_Read(Acc_Slave_Adress,Acc_Y8bit_Reg_Adress);
			//Z_acceleration = I2C_Read(Acc_Slave_Adress,Acc_Z8bit_Reg_Adress);
		}
	}
	if((counter%5)==0)
	{
		//Code that runs only every 250 ms
		Motion_calculate_direction();

	}
	if((counter%10)==0)
	{
		//Code that runs only every 500 ms
		if(startup_image != 1)
		{
			Print_Motor_Parameters();
		}
		ADCProcessorTrigger(ADC0_BASE, 3);		//Trigger Temperature sensor ADC
		Motion_Stop();
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
