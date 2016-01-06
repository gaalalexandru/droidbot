//comparator_handler.c

#include "stdbool.h"
#include "stdint.h"

#include "comparator_handler.h"
#include "driverlib/comp.h"

#include "inc/hw_memmap.h"

#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
//#include "driverlib/pwm.h"
#include "driverlib/sysctl.h"

void COMP_mic_input_init(void)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_COMP0);		//Comp 0 enable 
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);	 	// Port C enable
	
	//GPIOPinConfigure(GPIO_PC6_...);	
	GPIOPinTypeComparator(GPIO_PORTC_BASE, GPIO_PIN_6);
	
	ComparatorConfigure(COMP_BASE,0,COMP_TRIG_NONE|COMP_INT_BOTH/*COMP_INT_HIGH*/|COMP_ASRCP_REF|COMP_OUTPUT_NORMAL);
	ComparatorRefSet(COMP_BASE,COMP_REF_0_825V);
	
	ComparatorIntEnable(COMP_BASE,0);
}

