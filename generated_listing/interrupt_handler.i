#line 1 "modules\\interrupt_handler\\interrupt_handler.c"

 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"











 
#line 19 ".\\modules\\compile_switches\\compile_switches.c"

 




 
#line 32 ".\\modules\\compile_switches\\compile_switches.c"

 


 











 

 
#line 57 ".\\modules\\compile_switches\\compile_switches.c"





#line 4 "modules\\interrupt_handler\\interrupt_handler.c"

 
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"



#line 7 "modules\\interrupt_handler\\interrupt_handler.c"
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



 



#line 8 "modules\\interrupt_handler\\interrupt_handler.c"

 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
















































#line 116 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            
#line 150 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"

#line 11 "modules\\interrupt_handler\\interrupt_handler.c"

 
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










#line 14 "modules\\interrupt_handler\\interrupt_handler.c"
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










#line 15 "modules\\interrupt_handler\\interrupt_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"















































#line 213 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 384 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 555 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 726 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 875 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1024 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1250 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1399 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1625 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1774 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2000 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2171 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2342 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2513 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2684 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2833 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2982 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3208 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3357 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3583 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3732 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3958 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4136 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4314 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4492 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4646 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4880 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5034 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5268 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5422 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5656 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5880 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6104 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6288 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6593 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6777 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7082 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7313 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7544 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7733 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 8046 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"









































































#line 8125 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8132 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"










#line 8148 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8155 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"













































#line 8208 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8216 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

























#line 8548 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 8857 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9166 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9483 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9886 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 10338 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 10749 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 11209 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 11669 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12041 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12536 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12930 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 13455 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 13811 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 14167 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 14671 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 15197 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 15732 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 16267 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 16639 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 17134 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 17528 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18053 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18409 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18765 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 19269 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 19804 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 20378 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 20952 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 16 "modules\\interrupt_handler\\interrupt_handler.c"
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










#line 17 "modules\\interrupt_handler\\interrupt_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/comp.h"





























































#line 78 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/comp.h"






#line 113 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/comp.h"






extern void ComparatorConfigure(uint32_t ui32Base, uint32_t ui32Comp,
                                uint32_t ui32Config);
extern void ComparatorRefSet(uint32_t ui32Base, uint32_t ui32Ref);
extern _Bool ComparatorValueGet(uint32_t ui32Base, uint32_t ui32Comp);
extern void ComparatorIntRegister(uint32_t ui32Base, uint32_t ui32Comp,
                                  void (*pfnHandler)(void));
extern void ComparatorIntUnregister(uint32_t ui32Base, uint32_t ui32Comp);
extern void ComparatorIntEnable(uint32_t ui32Base, uint32_t ui32Comp);
extern void ComparatorIntDisable(uint32_t ui32Base, uint32_t ui32Comp);
extern _Bool ComparatorIntStatus(uint32_t ui32Base, uint32_t ui32Comp,
                                _Bool bMasked);
extern void ComparatorIntClear(uint32_t ui32Base, uint32_t ui32Comp);










#line 18 "modules\\interrupt_handler\\interrupt_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"




























































                                            


                                            
#line 86 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"
                                             



                                             

                                             

                                             

                                             

                                             

                                             

                                             



                                             

                                             

                                             

                                             

                                             

                                             








#line 136 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"

























#line 185 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"
















#line 210 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"







#line 226 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/timer.h"

















extern void TimerEnable(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerDisable(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerConfigure(uint32_t ui32Base, uint32_t ui32Config);
extern void TimerControlLevel(uint32_t ui32Base, uint32_t ui32Timer,
                              _Bool bInvert);
extern void TimerControlTrigger(uint32_t ui32Base, uint32_t ui32Timer,
                                _Bool bEnable);
extern void TimerControlEvent(uint32_t ui32Base, uint32_t ui32Timer,
                              uint32_t ui32Event);
extern void TimerControlStall(uint32_t ui32Base, uint32_t ui32Timer,
                              _Bool bStall);
extern void TimerControlWaitOnTrigger(uint32_t ui32Base, uint32_t ui32Timer,
                                      _Bool bWait);
extern void TimerRTCEnable(uint32_t ui32Base);
extern void TimerRTCDisable(uint32_t ui32Base);
extern void TimerPrescaleSet(uint32_t ui32Base, uint32_t ui32Timer,
                             uint32_t ui32Value);
extern uint32_t TimerPrescaleGet(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerPrescaleMatchSet(uint32_t ui32Base, uint32_t ui32Timer,
                                  uint32_t ui32Value);
extern uint32_t TimerPrescaleMatchGet(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerLoadSet(uint32_t ui32Base, uint32_t ui32Timer,
                         uint32_t ui32Value);
extern uint32_t TimerLoadGet(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerLoadSet64(uint32_t ui32Base, uint64_t ui64Value);
extern uint64_t TimerLoadGet64(uint32_t ui32Base);
extern uint32_t TimerValueGet(uint32_t ui32Base, uint32_t ui32Timer);
extern uint64_t TimerValueGet64(uint32_t ui32Base);
extern void TimerMatchSet(uint32_t ui32Base, uint32_t ui32Timer,
                          uint32_t ui32Value);
extern uint32_t TimerMatchGet(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerMatchSet64(uint32_t ui32Base, uint64_t ui64Value);
extern uint64_t TimerMatchGet64(uint32_t ui32Base);
extern void TimerIntRegister(uint32_t ui32Base, uint32_t ui32Timer,
                             void (*pfnHandler)(void));
extern void TimerIntUnregister(uint32_t ui32Base, uint32_t ui32Timer);
extern void TimerIntEnable(uint32_t ui32Base, uint32_t ui32IntFlags);
extern void TimerIntDisable(uint32_t ui32Base, uint32_t ui32IntFlags);
extern uint32_t TimerIntStatus(uint32_t ui32Base, _Bool bMasked);
extern void TimerIntClear(uint32_t ui32Base, uint32_t ui32IntFlags);
extern void TimerSynchronize(uint32_t ui32Base, uint32_t ui32Timers);
extern uint32_t TimerClockSourceGet(uint32_t ui32Base);
extern void TimerClockSourceSet(uint32_t ui32Base, uint32_t ui32Source);
extern uint32_t TimerADCEventGet(uint32_t ui32Base);
extern void TimerADCEventSet(uint32_t ui32Base, uint32_t ui32ADCEvent);
extern uint32_t TimerDMAEventGet(uint32_t ui32Base);
extern void TimerDMAEventSet(uint32_t ui32Base, uint32_t ui32DMAEvent);
extern void TimerUpdateMode(uint32_t ui32Base, uint32_t ui32Timer,
                            uint32_t ui32Config);









#line 19 "modules\\interrupt_handler\\interrupt_handler.c"

 
#line 1 "modules\\interrupt_handler\\interrupt_handler.h"



 
void Int_Master_Enable(void);
void Int_Master_Disable(void);
void Int_Peripherials_Enable(void);


 





#line 22 "modules\\interrupt_handler\\interrupt_handler.c"
#line 1 ".\\modules\\motion_handler\\motion_handler.h"





void Motion_Go_Right(void);
void Motion_Go_Left(void);
void Motion_Stop(void);
void Motion_Cruise(void);
void Motion_Max_Speed(void);
void Motion_Go_Back(void);
void Motion_calculate_direction(void);

#line 23 "modules\\interrupt_handler\\interrupt_handler.c"
#line 1 ".\\modules\\cyclic_activity_handler\\cyclic_activity_handler.h"




 
void CYCL_1_second(void);
void CYCL_50_milisecond(void);

#line 24 "modules\\interrupt_handler\\interrupt_handler.c"

 
unsigned long comp0_interrupt_flag = 0;	
unsigned long internal_temperature = 0;
unsigned long Mx_LS_Value = 0;	
unsigned long Lx_LS_Value = 0;	
unsigned long Rx_LS_Value = 0;	

 
void Int_Master_Enable(void)
{
	IntMasterEnable();		
}
void Int_Master_Disable(void)
{
	IntMasterDisable();		
}
void GPIOPortF_Handler(void) 	
{
	unsigned long Light_sensor_status = 0;
	Light_sensor_status = GPIOIntStatus(0x40025000,0);
	GPIOIntClear(0x40025000,0x00000001 | 0x00000010);
	if((Light_sensor_status&(0x00000001 | 0x00000010)) == (0x00000001 | 0x00000010))
	{
		
		Motion_Cruise();
	}
	else if(Light_sensor_status & 0x00000010)
	{
		
		Motion_Go_Right();
	}
	else if(Light_sensor_status & 0x00000001)
	{
		
		Motion_Go_Left();
	}
}
void Comp0_Handler(void)			
{
	comp0_interrupt_flag = 1;
	if(ComparatorIntStatus(0x4003C000,0,0))
	{
		ComparatorIntClear(0x4003C000,0);
		Motion_Go_Back();		
	}
}
void WideTimer0A_Handler(void)		
{
	unsigned long timer_value=0;
	if(TimerIntStatus(0x40036000,0))
	{
		TimerIntClear(0x40036000, 0x000000ff);
		timer_value = TimerValueGet(0x40036000, 0x000000ff);
		CYCL_1_second();
	}
}

void Timer0A_Handler(void)		
{
	unsigned long timer_value=0;
	if(TimerIntStatus(0x40030000,0))
	{
		TimerIntClear(0x40030000, 0x000000ff);
		timer_value = TimerValueGet(0x40030000, 0x000000ff);
		CYCL_50_milisecond();
	}
}

void ADC0Seq3_Handler(void)		
{
	uint32_t Voltage;
	if(ADCIntStatus(0x40038000, 3, 0))
	{
		ADCIntClear(0x40038000, 3); 										
		ADCSequenceDataGet(0x40038000, 3, &Voltage);		
		internal_temperature = (1475 - ((75 * ((33)) * Voltage) / 4096))/10;
		
		
		










 
	}
}
void ADC1Seq0_Handler(void)		
{
	uint32_t Light;
	if(ADCIntStatus(0x40039000, 0, 0))
	{
		ADCIntClear(0x40039000, 0); 										
		ADCSequenceDataGet(0x40039000, 0, &Light);		
		Mx_LS_Value = Light;
	}
}

void ADC1Seq1_Handler(void)		
{
	uint32_t Light;
	if(ADCIntStatus(0x40039000, 1, 0))
	{
		ADCIntClear(0x40039000, 1); 										
		ADCSequenceDataGet(0x40039000, 1, &Light);		
		Rx_LS_Value = Light;
	}
}

void ADC1Seq2_Handler(void)		
{
	uint32_t Light;
	if(ADCIntStatus(0x40039000, 2, 0))
	{
		ADCIntClear(0x40039000, 2); 										
		ADCSequenceDataGet(0x40039000, 2, &Light);		
		Lx_LS_Value = Light;
	}
}



