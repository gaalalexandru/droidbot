//main.c
//#include "tm4c123gh6pm.h"
/*-------------------Configuration Includes-----------*/
/*-------------------Type Includes--------------------*/
/*-------------------HW define Includes---------------*/
/*-------------------Driver Includes------------------*/
/*-------------------Self header Includes-------------*/
/*-------------------Service Includes-----------------*/
#include "motion_handler.h"
#include "system_handler.h"
/*-------------------Macro Definitions----------------*/
/*-------------Global Variable Definitions------------*/
/*-------------------Function Definitions-------------*/
/*-------------------Main program start---------------*/
int main(void)
{
	unsigned long count_me;
	SYS_startup();
	while(1)
	{
		count_me++;
		Motion_Stop();
		
	}
}
