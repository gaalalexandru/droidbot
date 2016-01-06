//adc_handler.c

#include "adc_handler.h"

#include "stdbool.h"
#include "stdint.h"

#include "driverlib/adc.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"

#include "inc/hw_memmap.h"


void ADC_Microphone_init(void) //Initialize microphone input
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);		//The ADC0 peripheral must be enabled for use.
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);	//Enable GPIO port E
  
	GPIOPinTypeADC(GPIO_PORTE_BASE, GPIO_PIN_2);	//Select the analog ADC function for desired pin //AIN1
  
	ADCSequenceDisable(ADC0_BASE,3);							//Disable sequencer 3
	
	ADCSequenceConfigure(ADC0_BASE,3, ADC_TRIGGER_ALWAYS/*ADC_TRIGGER_PROCESSOR*/, 0); //Sequence 3 will do a single sample when the processor (SW) sends a signal to start the conversion
	
	ADCSequenceStepConfigure(ADC0_BASE,3,0, ADC_CTL_CH1 | ADC_CTL_IE | ADC_CTL_END);  //Configure step 0 on sequencer 3 to channel 1, interrupt enable and end conversion when after 1 conversion
	ADCSequenceEnable(ADC0_BASE,3); 							//Enable sequencer 3
	ADCIntClear(ADC0_BASE, 3); 										//Clear interrupt flag	
	
	ADCIntEnableEx(ADC0_BASE,ADC_INT_DCON_SS3);
	ADCComparatorRegionSet(ADC0_BASE,1,1000,3000);
	
}


	
/*ADCSequenceDataGet();*/
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


//for the interrupt handler ISR
void ADC0Seq3_Handler(void)		//ADC0 Seq3 ISR
{
	uint32_t Mic_Level;
	ADCSequenceDataGet(ADC0_BASE, 3, &Mic_Level);
	if(Mic_Level>1000)
	{
		//We will see
		Motion_Cruise();
		//Motion_Go_Back() //Next step!!!
	}
}
