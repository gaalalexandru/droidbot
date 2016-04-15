//adc_handler.c
//Service layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------Self header Includes-------------*/
#include "adc_handler.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/adc.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/sysctl.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"

void ADC_Temperature_sensor_init(void) //Initialize microphone input
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);			//The ADC0 peripheral must be enabled for use.

	IntDisable(INT_ADC0SS3);
	
	ADCIntClear(ADC0_BASE, 3); 										//Clear interrupt flag	
	ADCIntDisable(ADC0_BASE, 3);
	ADCSequenceDisable(ADC0_BASE,3);							//Disable sequencer 3
	
	ADCSequenceConfigure(ADC0_BASE,3, /*ADC_TRIGGER_ALWAYS*/ADC_TRIGGER_PROCESSOR, 0); //Sequence 3 will do a single sample when the processor (SW) sends a signal to start the conversion
	ADCSequenceStepConfigure(ADC0_BASE,3,0, ADC_CTL_CH1 |ADC_CTL_TS| ADC_CTL_IE | ADC_CTL_END);  //Configure step 0 on sequencer 3 to channel 1, interrupt enable and end conversion when after 1 conversion
	
	ADCSequenceEnable(ADC0_BASE,3); 							//Enable sequencer 3
	ADCIntEnable(ADC0_BASE, 3); 
		
	IntPrioritySet(INT_ADC0SS3,(Int_Prio_Temp_Sens)<<5);
	IntEnable(INT_ADC0SS3);	
}

void ADC_Light_sensor_init(void) //Initialize microphone input
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC1);		//The ADC0 peripheral must be enabled for use.
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);	//Enable GPIO port E
	
	GPIOPinTypeADC(GPIO_PORTE_BASE, GPIO_PIN_3);	// Configure PE3 as analog input
	GPIODirModeSet(GPIO_PORTE_BASE, GPIO_PIN_3, GPIO_DIR_MODE_IN);	//Set direction input for PE3
	GPIOPadConfigSet(GPIO_PORTE_BASE, GPIO_PIN_3, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_ANALOG); //Configure PUR for PE3

	IntDisable(INT_ADC1SS3);
	
	ADCIntClear(ADC1_BASE, 3); 										//Clear interrupt flag for ADC1 sequencer 3
	ADCIntDisable(ADC1_BASE, 3);									//Disable interrupts from ADC1 sequencer 3
	ADCSequenceDisable(ADC1_BASE,3);							//Disable ADC1 sequencer 3
	
	ADCSequenceConfigure(ADC1_BASE,3, ADC_TRIGGER_PROCESSOR, /*1*/ 0); //Sequence 3 will do a single sample when the processor (SW) sends a signal to start the conversion
	ADCSequenceStepConfigure(ADC1_BASE,3,0, ADC_CTL_CH0 | ADC_CTL_IE | ADC_CTL_END);  //Configure step 0 on sequencer 3 to channel 0, interrupt enable and end conversion when after 1 conversion
	
	ADCSequenceEnable(ADC1_BASE,3); 							//Enable ADC1 sequencer 3
	ADCIntEnable(ADC1_BASE, 3); 									//Enable interrupts from ADC1 sequencer 3
		
	IntPrioritySet(INT_ADC1SS3,(Int_Prio_Light_Sens)<<5);
	IntEnable(INT_ADC1SS3);												//Enable interrupts from ADC1 sequencer 3
}

	/*ADCIntEnableEx(ADC0_BASE,ADC_INT_DCON_SS3);
	ADCComparatorRegionSet(ADC0_BASE,1,1000,3000);*/
	//



/*
The sample sequencers are configured with  ADCSequenceConfigure() and ADCSequenceStep-
Configure(). They are enabled and disabled with ADCSequenceEnable() and ADCSequenceDisable().
The captured data is obtained with ADCSequenceDataGet(). Sample sequencer FIFO
overflow and underflow is managed with ADCSequenceOverflow(), ADCSequenceOverflowClear(),
ADCSequenceUnderflow(), and ADCSequenceUnderflowClear().

Hardware oversampling of the ADC is controlled with ADCHardwareOversampleConfigure(). Software
oversampling of the ADC is controlled with ADCSoftwareOversampleConfigure(), ADCSoftwareOversampleStepConfigure(),
and ADCSoftwareOversampleDataGet().

The processor trigger is generated with ADCProcessorTrigger().

The interrupt handler for the ADC sample sequencer interrupts are managed with ADCIntRegister()
and ADCIntUnregister(). The sample sequencer interrupt sources are managed with ADCIntDisable(),
ADCIntEnable(), ADCIntStatus(), and ADCIntClear().
*/


