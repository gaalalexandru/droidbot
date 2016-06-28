#line 1 "modules\\pwm_handler\\pwm_handler.c"



 
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"



#line 6 "modules\\pwm_handler\\pwm_handler.c"
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



 



#line 7 "modules\\pwm_handler\\pwm_handler.c"
#line 1 ".\\modules\\custom_types\\custom_types.h"



 
typedef struct mtr_prm_st
{
	char right_motor_DC;
	char left_motor_DC;
	char motor_direction;		
} motor_parameters_st;

typedef enum LCD_typeOfWrite
{
  COMMAND,                              
  DATA                                  
} LCD_typeOfWrite_en;

















typedef enum Motor_Mode
{
  IN_IN,
  PHASE_ENABLE
} Motor_Mode_en;

typedef enum Motor_Direction
{
  FWD,
  RWD
} Motor_Direction_en;


typedef enum Led_State
{
  Right_Feedback_Off,
	Right_Feedback_On,
	Left_Feedback_Off,
	Left_Feedback_On,
	Center_Feedback_Off,
	Center_Feedback_On
} Led_State_en;



#line 8 "modules\\pwm_handler\\pwm_handler.c"

 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
















































#line 116 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            
#line 150 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"

#line 11 "modules\\pwm_handler\\pwm_handler.c"

 
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










#line 14 "modules\\pwm_handler\\pwm_handler.c"
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

#line 15 "modules\\pwm_handler\\pwm_handler.c"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"



























































#line 78 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"
                                            


                                            


                                            


                                            


                                            


                                            







#line 113 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"






#line 128 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"


























#line 162 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"

#line 171 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"









#line 187 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"









#line 204 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"






#line 218 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"







#line 232 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pwm.h"


















extern void PWMGenConfigure(uint32_t ui32Base, uint32_t ui32Gen,
                            uint32_t ui32Config);
extern void PWMGenPeriodSet(uint32_t ui32Base, uint32_t ui32Gen,
                            uint32_t ui32Period);
extern uint32_t PWMGenPeriodGet(uint32_t ui32Base,
                                uint32_t ui32Gen);
extern void PWMGenEnable(uint32_t ui32Base, uint32_t ui32Gen);
extern void PWMGenDisable(uint32_t ui32Base, uint32_t ui32Gen);
extern void PWMPulseWidthSet(uint32_t ui32Base, uint32_t ui32PWMOut,
                             uint32_t ui32Width);
extern uint32_t PWMPulseWidthGet(uint32_t ui32Base,
                                 uint32_t ui32PWMOut);
extern void PWMDeadBandEnable(uint32_t ui32Base, uint32_t ui32Gen,
                              uint16_t ui16Rise, uint16_t ui16Fall);
extern void PWMDeadBandDisable(uint32_t ui32Base, uint32_t ui32Gen);
extern void PWMSyncUpdate(uint32_t ui32Base, uint32_t ui32GenBits);
extern void PWMSyncTimeBase(uint32_t ui32Base, uint32_t ui32GenBits);
extern void PWMOutputState(uint32_t ui32Base, uint32_t ui32PWMOutBits,
                           _Bool bEnable);
extern void PWMOutputInvert(uint32_t ui32Base, uint32_t ui32PWMOutBits,
                            _Bool bInvert);
extern void PWMOutputFaultLevel(uint32_t ui32Base,
                                uint32_t ui32PWMOutBits,
                                _Bool bDriveHigh);
extern void PWMOutputFault(uint32_t ui32Base, uint32_t ui32PWMOutBits,
                           _Bool bFaultSuppress);
extern void PWMGenIntRegister(uint32_t ui32Base, uint32_t ui32Gen,
                              void (*pfnIntHandler)(void));
extern void PWMGenIntUnregister(uint32_t ui32Base, uint32_t ui32Gen);
extern void PWMFaultIntRegister(uint32_t ui32Base,
                                void (*pfnIntHandler)(void));
extern void PWMFaultIntUnregister(uint32_t ui32Base);
extern void PWMGenIntTrigEnable(uint32_t ui32Base, uint32_t ui32Gen,
                                uint32_t ui32IntTrig);
extern void PWMGenIntTrigDisable(uint32_t ui32Base, uint32_t ui32Gen,
                                 uint32_t ui32IntTrig);
extern uint32_t PWMGenIntStatus(uint32_t ui32Base, uint32_t ui32Gen,
                                _Bool bMasked);
extern void PWMGenIntClear(uint32_t ui32Base, uint32_t ui32Gen,
                           uint32_t ui32Ints);
extern void PWMIntEnable(uint32_t ui32Base, uint32_t ui32GenFault);
extern void PWMIntDisable(uint32_t ui32Base, uint32_t ui32GenFault);
extern void PWMFaultIntClear(uint32_t ui32Base);
extern uint32_t PWMIntStatus(uint32_t ui32Base, _Bool bMasked);
extern void PWMFaultIntClearExt(uint32_t ui32Base,
                                uint32_t ui32FaultInts);
extern void PWMGenFaultConfigure(uint32_t ui32Base, uint32_t ui32Gen,
                                 uint32_t ui32MinFaultPeriod,
                                 uint32_t ui32FaultSenses);
extern void PWMGenFaultTriggerSet(uint32_t ui32Base, uint32_t ui32Gen,
                                  uint32_t ui32Group,
                                  uint32_t ui32FaultTriggers);
extern uint32_t PWMGenFaultTriggerGet(uint32_t ui32Base,
                                      uint32_t ui32Gen,
                                      uint32_t ui32Group);
extern uint32_t PWMGenFaultStatus(uint32_t ui32Base,
                                  uint32_t ui32Gen,
                                  uint32_t ui32Group);
extern void PWMGenFaultClear(uint32_t ui32Base, uint32_t ui32Gen,
                             uint32_t ui32Group,
                             uint32_t ui32FaultTriggers);
extern void PWMClockSet(uint32_t ui32Base, uint32_t ui32Config);
extern uint32_t PWMClockGet(uint32_t ui32Base);
extern void PWMOutputUpdateMode(uint32_t ui32Base,
                                uint32_t ui32PWMOutBits,
                                uint32_t ui32Mode);










#line 16 "modules\\pwm_handler\\pwm_handler.c"
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










#line 17 "modules\\pwm_handler\\pwm_handler.c"

 
#line 1 "modules\\pwm_handler\\pwm_handler.h"





void PWM_motor_init(unsigned long PWM_Period);
void PWM_set_duty_cycle(unsigned long PWM_Base, unsigned long PWM_Generator, unsigned long PWM_Output, unsigned long PWM_duty_cycle);
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_motor_reverse_init(unsigned long PWM_Period, unsigned short PWM_duty_cycle);
void PWM_motor_reverse_stop(void);;
void PWM_Red_led_init(unsigned long PWM_Period);
void PWM_Red_led_toggle(void);

#line 20 "modules\\pwm_handler\\pwm_handler.c"

 


	
 

 
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle)
{
	if(PWM_duty_cycle == 0)
	{
		PWMOutputState(0x40029000, 0x00000040 , (0));	
		PWMGenDisable(0x40029000, 0x00000100);	
	}
	else
	{
		if(PWM_duty_cycle >99)	
		{
			PWM_duty_cycle = 99;	
		}
		PWMPulseWidthSet(0x40029000, 0x00000106, (PWM_duty_cycle*(PWMGenPeriodGet(0x40029000,0x00000100))/100));	
		PWMGenEnable(0x40029000, 0x00000100); 
		PWMOutputState(0x40029000, 0x00000040 , (1)); 
	}		
}

void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle)
{
	if(PWM_duty_cycle == 0)
	{
		PWMOutputState(0x40029000, 0x00000080 , (0));	
		PWMGenDisable(0x40029000, 0x00000100);	
	}
	else
	{
		if(PWM_duty_cycle >99)	
		{
			PWM_duty_cycle = 99;	
		}
		PWMPulseWidthSet(0x40029000, 0x00000107, (PWM_duty_cycle*(PWMGenPeriodGet(0x40029000,0x00000100))/100));		
		PWMGenEnable(0x40029000, 0x00000100);	
		PWMOutputState(0x40029000, 0x00000080 , (1));	
	}
}

void PWM_motor_init(unsigned long PWM_Period)
{
	
	
	
	SysCtlPWMClockSet(0x00000000);								
	SysCtlPeripheralEnable(0xf0004001);				
	SysCtlPeripheralEnable(0xf0000805);			
	
	GPIOPinConfigure(0x00050805);								
	GPIOPinConfigure(0x00050C05);								
	GPIOPinTypePWM(0x40025000, 0x00000004);			
	GPIOPinTypePWM(0x40025000, 0x00000008);			
	
	PWMGenConfigure(0x40029000, 0x00000100, 0x00000000 | 0x00000000);	
	PWMGenPeriodSet(0x40029000, 0x00000100, PWM_Period);

	PWMPulseWidthSet(0x40029000, 0x00000106, 1);				
	PWMPulseWidthSet(0x40029000, 0x00000107, 1);				
	PWMGenEnable(0x40029000, 0x00000100);								
}
void PWM_Red_led_init(unsigned long PWM_Period)
{
	
	SysCtlPWMClockSet(0x00000000);								
	SysCtlPeripheralEnable(0xf0004001);				
	SysCtlPeripheralEnable(0xf0000805);			
	
	GPIOPinConfigure(0x00050405);								
	GPIOPinTypePWM(0x40025000, 0x00000002);			
	
	PWMGenConfigure(0x40029000, 0x000000C0, 0x00000000 | 0x00000000);	
	PWMGenPeriodSet(0x40029000, 0x000000C0, PWM_Period);
	
	PWMPulseWidthSet(0x40029000, 0x000000C5, (10*(PWMGenPeriodGet(0x40029000,0x000000C0))/100));
	PWMGenEnable(0x40029000, 0x000000C0);								
}

void PWM_Red_led_toggle(void)
{
	static char status = 0;
	if(status)
	{
		
		PWMOutputState(0x40029000, 0x00000020 , (1));		
		PWMGenEnable(0x40029000, 0x000000C0);												
	}
	else
	{
		
		PWMOutputState(0x40029000, 0x00000020 , (0));		
		PWMGenDisable(0x40029000, 0x000000C0);											
	}
	status ^= 0x01;		
}

void PWM_set_duty_cycle(unsigned long PWM_Base, unsigned long PWM_Generator, unsigned long PWM_Output, unsigned long PWM_duty_cycle)
{
	if(PWM_duty_cycle < 1)
	{
		PWM_duty_cycle = 1;
	}
	else if(PWM_duty_cycle >99)
	{
		PWM_duty_cycle = 99;
	}
	PWMPulseWidthSet(PWM_Base, PWM_Output, (PWMGenPeriodGet(PWM_Base,PWM_Generator)/(100/PWM_duty_cycle)));		
}

void PWM_motor_reverse_init(unsigned long PWM_Period, unsigned short PWM_duty_cycle)
{
	SysCtlPWMClockSet(0x00000000);							
	SysCtlPeripheralEnable(0xf0004001);			
	SysCtlPeripheralEnable(0xf0000803);		
	
	GPIOPinConfigure(0x00030005);							
	GPIOPinConfigure(0x00030405);							
	GPIOPinTypePWM(0x40007000, 0x00000001);		
	GPIOPinTypePWM(0x40007000, 0x00000002);		
	
	PWMGenConfigure(0x40029000, 0x00000040, 0x00000000 | 0x00000000);	
	PWMGenPeriodSet(0x40029000, 0x00000040, PWM_Period);	
	PWMPulseWidthSet(0x40029000, 0x00000040,(100*(PWMGenPeriodGet(0x40029000,0x00000040))/PWM_duty_cycle));	
	PWMPulseWidthSet(0x40029000, 0x00000041,(100*(PWMGenPeriodGet(0x40029000,0x00000040))/PWM_duty_cycle));	
	
	PWMGenEnable(0x40029000, 0x00000040);							
	PWMOutputState(0x40029000, 0x00000001 | 0x00000002, (1));	
	
}

void PWM_motor_reverse_stop(void)
{
	SysCtlPeripheralDisable(0xf0000803);		
	PWMGenDisable(0x40029000, 0x00000040);						
	PWMOutputState(0x40029000, 0x00000001 | 0x00000002, (0));	
}


