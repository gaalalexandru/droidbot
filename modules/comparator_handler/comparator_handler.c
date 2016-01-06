//comparator_handler.c
//Service layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/comp.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"

/*-------------------Self header Includes-------------*/
#include "comparator_handler.h"

/*-------------------Function Definitions-------------*/
void COMP_mic_input_init(void)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_COMP0);		//Comp 0 enable 
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);	 	//Port C enable
	
	IntDisable(INT_COMP0);													//Comparator 0 disable of interrupts
	ComparatorIntDisable(COMP_BASE,0);	
	
	GPIOPinTypeComparator(GPIO_PORTC_BASE, GPIO_PIN_7);	// Configure PC7 as analog comparator input
	//GPIOPinConfigure(GPIO_PC6_C0+);										// Not needed at the moment, GPIO_PC7_C0- is not defined in pin_map.h
	
	/*The comparator generates an interrupt when analog input voltage becomes higher then the bellow set refference voltage.*/
	/*If the oposite is desired, to generate interrupt when the input is lower then reference, use the COMP_OUTPUT_NORMAL option in the configuration*/
	
	ComparatorConfigure(COMP_BASE,0,COMP_TRIG_NONE|COMP_INT_HIGH|COMP_ASRCP_REF|COMP_OUTPUT_INVERT);
	ComparatorRefSet(COMP_BASE,COMP_REF_0_825V/*COMP_REF_0_825V*/); 
	ComparatorIntEnable(COMP_BASE,0);
	
	IntPrioritySet(INT_COMP0,(Int_Prio_3_Comp_Mic)<<5); 								//Priority 3 = "100"0.0000
	IntEnable(INT_COMP0);														//Comparator 0 enable of interrupts
	
	/* List of possible reference voltages: COMP_REF_OFF to turn off the reference voltage
	COMP_REF_0V to set the reference voltage to 0 V
	COMP_REF_0_1375V to set the reference voltage to 0.1375 V
	COMP_REF_0_275V to set the reference voltage to 0.275 V
	COMP_REF_0_4125V to set the reference voltage to 0.4125 V
	COMP_REF_0_55V to set the reference voltage to 0.55 V
	COMP_REF_0_6875V to set the reference voltage to 0.6875 V
	COMP_REF_0_825V to set the reference voltage to 0.825 V
	COMP_REF_0_928125V to set the reference voltage to 0.928125 V
	COMP_REF_0_9625V to set the reference voltage to 0.9625 V
	COMP_REF_1_03125V to set the reference voltage to 1.03125 V
	COMP_REF_1_134375V to set the reference voltage to 1.134375 V
	COMP_REF_1_1V to set the reference voltage to 1.1 V
	COMP_REF_1_2375V to set the reference voltage to 1.2375 V
	COMP_REF_1_340625V to set the reference voltage to 1.340625 V
	COMP_REF_1_375V to set the reference voltage to 1.375 V
	COMP_REF_1_44375V to set the reference voltage to 1.44375 V
	COMP_REF_1_5125V to set the reference voltage to 1.5125 V
	COMP_REF_1_546875V to set the reference voltage to 1.546875 V
	COMP_REF_1_65V to set the reference voltage to 1.65 V
	COMP_REF_1_753125V to set the reference voltage to 1.753125 V
	COMP_REF_1_7875V to set the reference voltage to 1.7875 V
	COMP_REF_1_85625V to set the reference voltage to 1.85625 V
	COMP_REF_1_925V to set the reference voltage to 1.925 V
	COMP_REF_1_959375V to set the reference voltage to 1.959375 V
	COMP_REF_2_0625V to set the reference voltage to 2.0625 V
	COMP_REF_2_165625V to set the reference voltage to 2.165625 V
	COMP_REF_2_26875V to set the reference voltage to 2.26875 V
	COMP_REF_2_371875V to set the reference voltage to 2.371875 V */
}

/*-------------------Trash code area-----------------*/
//This portions contains temporary code... will be deleted after project completion
