#line 1 "modules\\adc_handler\\adc_handler.c"


 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"





#line 12 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 20 ".\\modules\\compile_switches\\compile_switches.c"

 




 
#line 33 ".\\modules\\compile_switches\\compile_switches.c"

 


 











 

 
#line 59 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 69 ".\\modules\\compile_switches\\compile_switches.c"

#line 5 "modules\\adc_handler\\adc_handler.c"

 
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"



#line 8 "modules\\adc_handler\\adc_handler.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"
 
 





 










#line 26 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 197 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"

     







     










     











#line 261 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"



 



#line 9 "modules\\adc_handler\\adc_handler.c"

 
#line 1 "modules\\adc_handler\\adc_handler.h"



void ADC_Temperature_sensor_init(void);
void ADC_Light_sensor_init(void);

#line 12 "modules\\adc_handler\\adc_handler.c"

 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"



























































#line 74 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"







#line 124 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"







#line 148 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"

#line 155 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"
                                            
#line 165 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"
                                            



















#line 201 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"
















#line 229 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"






#line 243 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/adc.h"






extern void ADCIntRegister(uint32_t ui32Base, uint32_t ui32SequenceNum,
                           void (*pfnHandler)(void));
extern void ADCIntUnregister(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCIntDisable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCIntEnable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern uint32_t ADCIntStatus(uint32_t ui32Base, uint32_t ui32SequenceNum,
                             _Bool bMasked);
extern void ADCIntClear(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCSequenceEnable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCSequenceDisable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCSequenceConfigure(uint32_t ui32Base, uint32_t ui32SequenceNum,
                                 uint32_t ui32Trigger, uint32_t ui32Priority);
extern void ADCSequenceStepConfigure(uint32_t ui32Base,
                                     uint32_t ui32SequenceNum,
                                     uint32_t ui32Step, uint32_t ui32Config);
extern int32_t ADCSequenceOverflow(uint32_t ui32Base,
                                   uint32_t ui32SequenceNum);
extern void ADCSequenceOverflowClear(uint32_t ui32Base,
                                     uint32_t ui32SequenceNum);
extern int32_t ADCSequenceUnderflow(uint32_t ui32Base,
                                    uint32_t ui32SequenceNum);
extern void ADCSequenceUnderflowClear(uint32_t ui32Base,
                                      uint32_t ui32SequenceNum);
extern int32_t ADCSequenceDataGet(uint32_t ui32Base, uint32_t ui32SequenceNum,
                                  uint32_t *pui32Buffer);
extern void ADCProcessorTrigger(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCSoftwareOversampleConfigure(uint32_t ui32Base,
                                           uint32_t ui32SequenceNum,
                                           uint32_t ui32Factor);
extern void ADCSoftwareOversampleStepConfigure(uint32_t ui32Base,
                                               uint32_t ui32SequenceNum,
                                               uint32_t ui32Step,
                                               uint32_t ui32Config);
extern void ADCSoftwareOversampleDataGet(uint32_t ui32Base,
                                         uint32_t ui32SequenceNum,
                                         uint32_t *pui32Buffer,
                                         uint32_t ui32Count);
extern void ADCHardwareOversampleConfigure(uint32_t ui32Base,
                                           uint32_t ui32Factor);
extern void ADCClockConfigSet(uint32_t ui32Base, uint32_t ui32Config,
                              uint32_t ui32ClockDiv);
extern uint32_t ADCClockConfigGet(uint32_t ui32Base, uint32_t *pui32ClockDiv);

extern void ADCComparatorConfigure(uint32_t ui32Base, uint32_t ui32Comp,
                                   uint32_t ui32Config);
extern void ADCComparatorRegionSet(uint32_t ui32Base, uint32_t ui32Comp,
                                   uint32_t ui32LowRef, uint32_t ui32HighRef);
extern void ADCComparatorReset(uint32_t ui32Base, uint32_t ui32Comp,
                               _Bool bTrigger, _Bool bInterrupt);
extern void ADCComparatorIntDisable(uint32_t ui32Base,
                                    uint32_t ui32SequenceNum);
extern void ADCComparatorIntEnable(uint32_t ui32Base,
                                   uint32_t ui32SequenceNum);
extern uint32_t ADCComparatorIntStatus(uint32_t ui32Base);
extern void ADCComparatorIntClear(uint32_t ui32Base, uint32_t ui32Status);
extern void ADCIntDisableEx(uint32_t ui32Base, uint32_t ui32IntFlags);
extern void ADCIntEnableEx(uint32_t ui32Base, uint32_t ui32IntFlags);
extern uint32_t ADCIntStatusEx(uint32_t ui32Base, _Bool bMasked);
extern void ADCIntClearEx(uint32_t ui32Base, uint32_t ui32IntFlags);
extern void ADCSequenceDMAEnable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern void ADCSequenceDMADisable(uint32_t ui32Base, uint32_t ui32SequenceNum);
extern _Bool ADCBusy(uint32_t ui32Base);
extern void ADCReferenceSet(uint32_t ui32Base, uint32_t ui32Ref);
extern uint32_t ADCReferenceGet(uint32_t ui32Base);
extern void ADCPhaseDelaySet(uint32_t ui32Base, uint32_t ui32Phase);
extern uint32_t ADCPhaseDelayGet(uint32_t ui32Base);
extern void ADCSampleRateSet(uint32_t ui32Base, uint32_t ui32ADCClock,
                             uint32_t ui32Rate);
extern uint32_t ADCSampleRateGet(uint32_t ui32Base);










#line 15 "modules\\adc_handler\\adc_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"



























































#line 68 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"

















#line 91 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 105 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 119 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 135 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"






extern void GPIODirModeSet(uint32_t ui32Port, uint8_t ui8Pins,
                           uint32_t ui32PinIO);
extern uint32_t GPIODirModeGet(uint32_t ui32Port, uint8_t ui8Pin);
extern void GPIOIntTypeSet(uint32_t ui32Port, uint8_t ui8Pins,
                           uint32_t ui32IntType);
extern uint32_t GPIOIntTypeGet(uint32_t ui32Port, uint8_t ui8Pin);
extern void GPIOPadConfigSet(uint32_t ui32Port, uint8_t ui8Pins,
                             uint32_t ui32Strength, uint32_t ui32PadType);
extern void GPIOPadConfigGet(uint32_t ui32Port, uint8_t ui8Pin,
                             uint32_t *pui32Strength, uint32_t *pui32PadType);
extern void GPIOIntEnable(uint32_t ui32Port, uint32_t ui32IntFlags);
extern void GPIOIntDisable(uint32_t ui32Port, uint32_t ui32IntFlags);
extern uint32_t GPIOIntStatus(uint32_t ui32Port, _Bool bMasked);
extern void GPIOIntClear(uint32_t ui32Port, uint32_t ui32IntFlags);
extern void GPIOIntRegister(uint32_t ui32Port, void (*pfnIntHandler)(void));
extern void GPIOIntUnregister(uint32_t ui32Port);
extern int32_t GPIOPinRead(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinWrite(uint32_t ui32Port, uint8_t ui8Pins, uint8_t ui8Val);
extern void GPIOPinConfigure(uint32_t ui32PinConfig);
extern void GPIOPinTypeADC(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeCAN(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeComparator(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeComparatorOutput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEPI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEthernetLED(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEthernetMII(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOInput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOOutput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOOutputOD(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeI2C(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeI2CSCL(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeLCD(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypePWM(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeQEI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeSSI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeTimer(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUART(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUSBAnalog(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUSBDigital(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeWakeHigh(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeWakeLow(uint32_t ui32Port, uint8_t ui8Pins);
extern uint32_t GPIOPinWakeStatus(uint32_t ui32Port);
extern void GPIODMATriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIODMATriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOADCTriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOADCTriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);










#line 16 "modules\\adc_handler\\adc_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/interrupt.h"


































































extern _Bool IntMasterEnable(void);
extern _Bool IntMasterDisable(void);
extern void IntRegister(uint32_t ui32Interrupt, void (*pfnHandler)(void));
extern void IntUnregister(uint32_t ui32Interrupt);
extern void IntPriorityGroupingSet(uint32_t ui32Bits);
extern uint32_t IntPriorityGroupingGet(void);
extern void IntPrioritySet(uint32_t ui32Interrupt,
                           uint8_t ui8Priority);
extern int32_t IntPriorityGet(uint32_t ui32Interrupt);
extern void IntEnable(uint32_t ui32Interrupt);
extern void IntDisable(uint32_t ui32Interrupt);
extern uint32_t IntIsEnabled(uint32_t ui32Interrupt);
extern void IntPendSet(uint32_t ui32Interrupt);
extern void IntPendClear(uint32_t ui32Interrupt);
extern void IntPriorityMaskSet(uint32_t ui32PriorityMask);
extern uint32_t IntPriorityMaskGet(void);
extern void IntTrigger(uint32_t ui32Interrupt);










#line 17 "modules\\adc_handler\\adc_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"






























































#line 140 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 155 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 171 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 185 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"
                                            





















#line 214 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 385 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 462 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"

















#line 486 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








                                            

                                            











#line 516 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"






#line 535 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"















#line 556 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"


























extern uint32_t SysCtlSRAMSizeGet(void);
extern uint32_t SysCtlFlashSizeGet(void);
extern uint32_t SysCtlFlashSectorSizeGet(void);
extern _Bool SysCtlPeripheralPresent(uint32_t ui32Peripheral);
extern _Bool SysCtlPeripheralReady(uint32_t ui32Peripheral);
extern void SysCtlPeripheralPowerOn(uint32_t ui32Peripheral);
extern void SysCtlPeripheralPowerOff(uint32_t ui32Peripheral);
extern void SysCtlPeripheralReset(uint32_t ui32Peripheral);
extern void SysCtlPeripheralEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralSleepEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralSleepDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDeepSleepEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDeepSleepDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralClockGating(_Bool bEnable);
extern void SysCtlIntRegister(void (*pfnHandler)(void));
extern void SysCtlIntUnregister(void);
extern void SysCtlIntEnable(uint32_t ui32Ints);
extern void SysCtlIntDisable(uint32_t ui32Ints);
extern void SysCtlIntClear(uint32_t ui32Ints);
extern uint32_t SysCtlIntStatus(_Bool bMasked);
extern void SysCtlLDOSleepSet(uint32_t ui32Voltage);
extern uint32_t SysCtlLDOSleepGet(void);
extern void SysCtlLDODeepSleepSet(uint32_t ui32Voltage);
extern uint32_t SysCtlLDODeepSleepGet(void);
extern void SysCtlSleepPowerSet(uint32_t ui32Config);
extern void SysCtlDeepSleepPowerSet(uint32_t ui32Config);
extern void SysCtlReset(void);
extern void SysCtlSleep(void);
extern void SysCtlDeepSleep(void);
extern uint32_t SysCtlResetCauseGet(void);
extern void SysCtlResetCauseClear(uint32_t ui32Causes);
extern void SysCtlBrownOutConfigSet(uint32_t ui32Config,
                                    uint32_t ui32Delay);
extern void SysCtlDelay(uint32_t ui32Count);
extern void SysCtlMOSCConfigSet(uint32_t ui32Config);
extern uint32_t SysCtlPIOSCCalibrate(uint32_t ui32Type);
extern void SysCtlClockSet(uint32_t ui32Config);
extern uint32_t SysCtlClockGet(void);
extern void SysCtlDeepSleepClockSet(uint32_t ui32Config);
extern void SysCtlDeepSleepClockConfigSet(uint32_t ui32Div,
                                          uint32_t ui32Config);
extern void SysCtlPWMClockSet(uint32_t ui32Config);
extern uint32_t SysCtlPWMClockGet(void);
extern void SysCtlIOSCVerificationSet(_Bool bEnable);
extern void SysCtlMOSCVerificationSet(_Bool bEnable);
extern void SysCtlPLLVerificationSet(_Bool bEnable);
extern void SysCtlClkVerificationClear(void);
extern void SysCtlGPIOAHBEnable(uint32_t ui32GPIOPeripheral);
extern void SysCtlGPIOAHBDisable(uint32_t ui32GPIOPeripheral);
extern void SysCtlUSBPLLEnable(void);
extern void SysCtlUSBPLLDisable(void);
extern uint32_t SysCtlClockFreqSet(uint32_t ui32Config,
                                   uint32_t ui32SysClock);
extern void SysCtlResetBehaviorSet(uint32_t ui32Behavior);
extern uint32_t SysCtlResetBehaviorGet(void);
extern void SysCtlClockOutConfig(uint32_t ui32Config, uint32_t ui32Div);
extern void SysCtlAltClkConfig(uint32_t ui32Config);
extern uint32_t SysCtlNMIStatus(void);
extern void SysCtlNMIClear(uint32_t ui32Status);
extern void SysCtlVoltageEventConfig(uint32_t ui32Config);
extern uint32_t SysCtlVoltageEventStatus(void);
extern void SysCtlVoltageEventClear(uint32_t ui32Status);










#line 18 "modules\\adc_handler\\adc_handler.c"

 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
















































#line 116 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            
#line 150 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"

#line 21 "modules\\adc_handler\\adc_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















































#line 58 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 94 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 170 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 244 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 283 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 318 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 339 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"













#line 475 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















#line 22 "modules\\adc_handler\\adc_handler.c"

void ADC_Temperature_sensor_init(void) 
{
	SysCtlPeripheralEnable(0xf0003800);			

	IntDisable(33);
	
	ADCIntClear(0x40038000, 3); 										
	ADCIntDisable(0x40038000, 3);
	ADCSequenceDisable(0x40038000,3);							
	
	ADCSequenceConfigure(0x40038000,3,  0x00000000, 0); 
	ADCSequenceStepConfigure(0x40038000,3,0, 0x00000003 |0x00000080| 0x00000040 | 0x00000020);  
	
	ADCSequenceEnable(0x40038000,3); 							
	ADCIntEnable(0x40038000, 3); 
		
	IntPrioritySet(33,((0x07))<<5);
	IntEnable(33);	
}

void ADC_Light_sensor_init(void) 
{
	SysCtlPeripheralEnable(0xf0003801);		
	SysCtlPeripheralEnable(0xf0000804);	
	
	GPIOPinTypeADC(0x40024000, 0x00000002|0x00000004|0x00000008);	
	GPIODirModeSet(0x40024000, 0x00000002|0x00000004|0x00000008, 0x00000000);	
	GPIOPadConfigSet(0x40024000, 0x00000002|0x00000004|0x00000008, 0x00000001,0x00000000); 

	IntDisable(64);
	IntDisable(65);
	IntDisable(66);

	ADCIntClear(0x40039000, 0); 										
	ADCIntDisable(0x40039000, 0);									
	ADCSequenceDisable(0x40039000,0);							
	
	ADCIntClear(0x40039000, 1); 										
	ADCIntDisable(0x40039000, 1);									
	ADCSequenceDisable(0x40039000,1);							
	
	ADCIntClear(0x40039000, 2); 										
	ADCIntDisable(0x40039000, 2);									
	ADCSequenceDisable(0x40039000,2);							
	
	
	ADCSequenceConfigure(0x40039000,0, 0x00000000, 1); 
	ADCSequenceStepConfigure(0x40039000,0,0, 0x00000000 | 0x00000040 | 0x00000020);  
	
	
	ADCSequenceConfigure(0x40039000,2, 0x00000000, 2); 
	ADCSequenceStepConfigure(0x40039000,2,0, 0x00000002 | 0x00000040 | 0x00000020);  
	
	
	ADCSequenceConfigure(0x40039000,1, 0x00000000, 2); 
	ADCSequenceStepConfigure(0x40039000,1,0, 0x00000001 | 0x00000040 | 0x00000020);  

	ADCSequenceEnable(0x40039000,0); 							
	ADCSequenceEnable(0x40039000,1); 							
	ADCSequenceEnable(0x40039000,2); 							
	
	ADCIntEnable(0x40039000, 0); 								
	ADCIntEnable(0x40039000, 1); 								
	ADCIntEnable(0x40039000, 2); 								
	
	IntPrioritySet(64,((0x01))<<5);	
	IntPrioritySet(65,((0x01))<<5);
	IntPrioritySet(66,((0x01))<<5);
	
	IntEnable(64);												
	IntEnable(65);												
	IntEnable(66);												
}
















 


