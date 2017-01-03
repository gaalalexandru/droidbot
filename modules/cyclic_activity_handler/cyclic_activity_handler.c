//cyclic_activity_handler.c
//Application layer

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
void CYCL_10_ms(void) {
	//Code that runs only every 10 ms
	Motion_calculate_direction();
}

void CYCL_100_ms(void) {
	//Code that runs only every 100 ms
	ADCProcessorTrigger(ADC1_BASE, 0);	//Trigger Light sensor ADC
	ADCProcessorTrigger(ADC1_BASE, 1);	//Trigger Light sensor ADC
	ADCProcessorTrigger(ADC1_BASE, 2);	//Trigger Light sensor ADC
	if (I2C_Init_Flag) {
		//X_acceleration = I2C_Read(Acc_Slave_Adress,Acc_X8bit_Reg_Adress);
		//Y_acceleration = I2C_Read(Acc_Slave_Adress,Acc_Y8bit_Reg_Adress);
		//Z_acceleration = I2C_Read(Acc_Slave_Adress,Acc_Z8bit_Reg_Adress);
	}
}

void CYCL_1000_ms(void) {
	//Code that runs only every 1000 ms
	Print_Welcome_Image();
	if(startup_image != 1) {
		Print_Motor_Parameters();
	}
	PWM_Red_led_toggle();
	ADCProcessorTrigger(ADC0_BASE, 3);		//Trigger Temperature sensor ADC
	Motion_Stop();
	startup_image = 0;
}
//EOF
