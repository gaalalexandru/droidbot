#line 1 "modules\\printing_handler\\printing_handler.c"


 
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



#line 5 "modules\\printing_handler\\printing_handler.c"
 
#line 1 ".\\OS\\os_core.h"








 
#line 1 ".\\3rd_pty_drv\\CortexM.h"





#line 18 ".\\3rd_pty_drv\\CortexM.h"







void DisableInterrupts(void); 





void EnableInterrupts(void);  






long StartCritical(void);    






void EndCritical(long sr);    







void WaitForInterrupt(void);  

#line 11 ".\\OS\\os_core.h"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 12 ".\\OS\\os_core.h"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
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


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 13 ".\\OS\\os_core.h"
#line 1 ".\\OS\\os_hw.h"








 
#line 1 ".\\3rd_pty_drv\\CortexM.h"





#line 18 ".\\3rd_pty_drv\\CortexM.h"







void DisableInterrupts(void); 





void EnableInterrupts(void);  






long StartCritical(void);    






void EndCritical(long sr);    







void WaitForInterrupt(void);  

#line 11 ".\\OS\\os_hw.h"
#line 12 ".\\OS\\os_hw.h"
#line 13 ".\\OS\\os_hw.h"
#line 1 ".\\OS\\os_core.h"





#line 154 ".\\OS\\os_core.h"

#line 14 ".\\OS\\os_hw.h"
#line 1 ".\\OS\\os_config.h"





























#line 38 ".\\OS\\os_config.h"


#line 52 ".\\OS\\os_config.h"



#line 15 ".\\OS\\os_hw.h"


struct port_sema {
	int32_t pin0;
	int32_t pin1;
	int32_t pin2;
	int32_t pin3;
	int32_t pin4;
	int32_t pin5;
	int32_t pin6;
	int32_t pin7;
};
typedef struct port_sema PortSema_t;




 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















































#line 58 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 94 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 170 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 244 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 283 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 318 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 339 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"













#line 475 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















#line 34 ".\\OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
















































#line 116 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            
#line 150 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"

#line 35 ".\\OS\\os_hw.h"
 
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










#line 37 ".\\OS\\os_hw.h"
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

#line 38 ".\\OS\\os_hw.h"
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










#line 39 ".\\OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"










































#line 44 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"
#line 45 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"





















#line 143 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 158 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 174 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 188 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"
                                            





















#line 217 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 388 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 465 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"

















#line 489 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








                                            

                                            











#line 519 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"






#line 538 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"















#line 559 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"


























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










#line 40 ".\\OS\\os_hw.h"
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









#line 41 ".\\OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/systick.h"


























































extern void SysTickEnable(void);
extern void SysTickDisable(void);
extern void SysTickIntRegister(void (*pfnHandler)(void));
extern void SysTickIntUnregister(void);
extern void SysTickIntEnable(void);
extern void SysTickIntDisable(void);
extern void SysTickPeriodSet(uint32_t ui32Period);
extern uint32_t SysTickPeriodGet(void);
extern uint32_t SysTickValueGet(void);










#line 42 ".\\OS\\os_hw.h"


enum tm4c_ports {
	PortA = 0,
	PortB,
	PortC,
	PortD,
	PortE,
	PortF
};
typedef enum tm4c_ports	ports_t;

enum tm4c_timers {
	Timer0A = 0, 
	Timer1A = 1,
	Timer2A = 2,
	Timer3A = 3,
	Timer4A = 4,
	Timer5A = 5,
	WTimer0A = 10,  
	WTimer1A = 11,
	WTimer2A = 12,
	WTimer3A = 13,
	WTimer4A = 14,
	WTimer5A = 15,
};
typedef enum tm4c_timers	timers_t;



#line 84 ".\\OS\\os_hw.h"

uint8_t OS_EdgeTrigger_Restart(ports_t port, uint8_t pin);
uint8_t OS_EdgeTrigger_Init(ports_t port, uint8_t pin, uint8_t priority, uint8_t type, uint8_t resistor);
uint32_t OS_Clock_Init(uint8_t clock_Mhz);
uint8_t OS_Timer_Init(timers_t timer, uint32_t freqency, uint8_t priority);
void OS_SysTick_Init(uint32_t time);



#line 14 ".\\OS\\os_core.h"
#line 15 ".\\OS\\os_core.h"





struct tcb{  
  int32_t *sp;  
  struct tcb *next;  
	int32_t *blocked;  
	int32_t sleep;  
  uint8_t priority;  
};
typedef struct tcb tcbType;

struct ptcb{	
	int32_t semaphore;
	uint32_t period;
	uint32_t counter;
};
typedef struct ptcb ptcbType;

struct fifo_st{
	uint32_t Fifo[10];
	uint32_t LostData;	
	int32_t CurrentSize;
	int32_t Mutex;
	uint8_t PutI;
	uint8_t GetI;
};
typedef struct fifo_st fifo_t;











void OS_Init(uint8_t clock_Mhz);







int OS_AddThreads(void(*thread0)(void), uint32_t p0,
                  void(*thread1)(void), uint32_t p1,
                  void(*thread2)(void), uint32_t p2,
                  void(*thread3)(void), uint32_t p3,
                  void(*thread4)(void), uint32_t p4,
                  void(*thread5)(void), uint32_t p5,
                  void(*thread6)(void), uint32_t p6,
                  void(*thread7)(void), uint32_t p7);












int OS_AddPeriodicEventThread(int32_t *semaPt, uint32_t period);







void OS_Launch(uint32_t theTimeSlice);






void OS_Suspend(void);






void OS_Sleep(uint32_t sleepTime);






void OS_InitSemaphore(int32_t *semaPt, int32_t value);







void OS_Wait(int32_t *semaPt);







void OS_Signal(int32_t *semaPt);






void OS_FIFO_Init(fifo_t *fifo);







int OS_FIFO_Put(fifo_t *fifo,uint32_t data);







uint32_t OS_FIFO_Get(fifo_t *fifo);


#line 7 "modules\\printing_handler\\printing_handler.c"
 

 

 
#line 1 "modules\\printing_handler\\printing_handler.h"




 

#line 8 "modules\\printing_handler\\printing_handler.h"
 
void Print_Welcome_Image(void);
void Print_Motor_Parameters(void);


#line 13 "modules\\printing_handler\\printing_handler.c"

 
#line 1 ".\\modules\\lcd_handler\\lcd_handler.h"




 
#line 7 ".\\modules\\lcd_handler\\lcd_handler.h"

 








































































































 

 
void LCD_init(void);
_Bool LCD_set_cursor(unsigned char xpos,unsigned char ypos);
void LCD_clear(void);
void LCD_out_char(unsigned char data);
void LCD_out_string(char *string);
void LCD_out_number(unsigned short number);
void LCD_out_image(const unsigned char *image);



#line 16 "modules\\printing_handler\\printing_handler.c"
#line 1 ".\\modules\\resources\\resources.h"







static const unsigned char res_Longhorn1[] = {
  0x08, 0x08, 0x08, 0x08, 0x08, 0x18, 0x18, 0x18, 0x38, 0x30, 0x30, 0x30, 0x70, 0xF0,
  0xE0, 0xC0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0xE0, 0xE0, 0xF0, 0x70,
  0x70, 0x30, 0x30, 0x18, 0x18, 0x18, 0x18, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x03, 0x03, 0x03, 0x07, 0x0F, 0x0E, 0x0C, 0x1C, 0x38, 0x38, 0xB8, 0xF8, 0xF0,
  0xF0, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8,
  0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xE0, 0xE0, 0xF0, 0xF0, 0xF0,
  0xF0, 0x78, 0x38, 0x3C, 0x1C, 0x1F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0F, 0x0F, 0x0F, 0x0F,
  0x0F, 0x07, 0x07, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x0F, 0x1F, 0x1F, 0x1F, 0x1F,
  0x1F, 0x1F, 0x1E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x0B, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x07, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0x7F, 0x3F, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};


static const unsigned char res_Longhorn2[] = {
  0x08, 0x08, 0x08, 0x08, 0x08, 0x18, 0x18, 0x18, 0x38, 0x30, 0x30, 0x30, 0x70, 0xF0,
  0xE0, 0xC0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0xE0, 0xE0, 0xF0, 0x70,
  0x70, 0x30, 0x30, 0x18, 0x18, 0x18, 0x18, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00,
  0xF0, 0x08, 0x04, 0x24, 0x24, 0xE4, 0x24, 0x24, 0x04, 0x04, 0x04, 0x04, 0x04, 0x08,
  0xF1, 0x03, 0x03, 0x03, 0x07, 0x0F, 0x0E, 0x0C, 0x1C, 0x38, 0x38, 0xB8, 0xF8, 0xF0,
  0xF0, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8,
  0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xE0, 0xE0, 0xF0, 0xF0, 0xF0,
  0xF0, 0x78, 0x38, 0x3C, 0x1C, 0x1F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xFF, 0x00, 0x00, 0x04, 0x04, 0x07, 0x84, 0x44, 0x40, 0x80, 0x40, 0x40, 0x80, 0x00,
  0x00, 0x01, 0x02, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0F, 0x0F, 0x0F, 0x0F,
  0x0F, 0x07, 0x07, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x0F, 0x1F, 0x1F, 0x1F, 0x1F,
  0x1F, 0x1F, 0x1E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x0B, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x84, 0x88, 0x84, 0x02, 0x01, 0x00,
  0x00, 0x80, 0x00, 0x00, 0x01, 0x82, 0x84, 0x84, 0x84, 0x04, 0x04, 0x84, 0x04, 0x04,
  0x84, 0x08, 0x10, 0xE0, 0x00, 0x01, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x07, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x0F, 0x10, 0x20, 0x40, 0x80, 0x80, 0x80, 0x80, 0x88, 0x88, 0x8A, 0x85, 0x80, 0x80,
  0x89, 0x8F, 0x88, 0x80, 0x80, 0x83, 0x82, 0x82, 0x8F, 0x80, 0x80, 0x8F, 0x82, 0x85,
  0x88, 0x80, 0x80, 0x8F, 0x50, 0x20, 0x00, 0x3C, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0x7F, 0x3F, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};


static const unsigned char res_welcome_img[] = {
  0x00, 0x00, 0x00, 0x00, 0xFC, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x44, 0xA4,
  0x24, 0x18, 0x00, 0x00, 0xF8, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x00, 0x00,
  0xFC, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x24, 0x24, 0x24, 0xD8, 0x00, 0x00,
  0xF8, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0x04, 0x04, 0xFC, 0x04, 0x04, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x60, 0x80, 0x00, 0x80, 0x60, 0x00, 0x00, 0x40, 0xE0, 0x00,
  0x00, 0x00, 0x00, 0x00, 0xC0, 0x40, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x03, 0x02, 0x02, 0x02, 0x01, 0x00, 0x00, 0x03, 0x00, 0x00,
  0x01, 0x02, 0x00, 0x00, 0x01, 0x02, 0x02, 0x02, 0x01, 0x00, 0x00, 0x03, 0x00, 0x00,
  0x03, 0x02, 0x02, 0x02, 0x01, 0x00, 0x80, 0x43, 0x42, 0x22, 0x22, 0xB1, 0x90, 0x90,
  0x91, 0x92, 0x32, 0x22, 0x21, 0x40, 0x40, 0x80, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0xC0, 0x38, 0x06, 0x61, 0x10, 0x52, 0x52, 0x03, 0x01, 0x01, 0x00, 0x00,
  0x00, 0x01, 0x01, 0x03, 0x02, 0x52, 0x50, 0x10, 0x61, 0x06, 0x38, 0xE0, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0xFF, 0x02, 0x42, 0x22, 0xF2, 0x22, 0x32, 0x22, 0xB2, 0xA2, 0x32, 0x23,
  0x32, 0x22, 0x32, 0x22, 0x32, 0x22, 0x32, 0xE2, 0x22, 0x92, 0x02, 0xFF, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
  0x80, 0x00, 0xFF, 0x00, 0x92, 0x49, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x21, 0x12,
  0x0C, 0x30, 0xC0, 0x80, 0x80, 0x00, 0x00, 0xFF, 0x49, 0x24, 0x00, 0xFF, 0x00, 0x80,
  0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x40, 0x40, 0x40,
  0x5E, 0x0C, 0x1F, 0x10, 0x14, 0x12, 0x13, 0x16, 0x12, 0x16, 0x12, 0x16, 0x12, 0x16,
  0x12, 0x16, 0x12, 0x16, 0x12, 0x16, 0x12, 0x17, 0x12, 0x11, 0x10, 0x1F, 0x0C, 0x5E,
  0x40, 0x40, 0x40, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};



static const char ASCII[][5] = {
  {0x00, 0x00, 0x00, 0x00, 0x00} 
  ,{0x00, 0x00, 0x5f, 0x00, 0x00} 
  ,{0x00, 0x07, 0x00, 0x07, 0x00} 
  ,{0x14, 0x7f, 0x14, 0x7f, 0x14} 
  ,{0x24, 0x2a, 0x7f, 0x2a, 0x12} 
  ,{0x23, 0x13, 0x08, 0x64, 0x62} 
  ,{0x36, 0x49, 0x55, 0x22, 0x50} 
  ,{0x00, 0x05, 0x03, 0x00, 0x00} 
  ,{0x00, 0x1c, 0x22, 0x41, 0x00} 
  ,{0x00, 0x41, 0x22, 0x1c, 0x00} 
  ,{0x14, 0x08, 0x3e, 0x08, 0x14} 
  ,{0x08, 0x08, 0x3e, 0x08, 0x08} 
  ,{0x00, 0x50, 0x30, 0x00, 0x00} 
  ,{0x08, 0x08, 0x08, 0x08, 0x08} 
  ,{0x00, 0x60, 0x60, 0x00, 0x00} 
  ,{0x20, 0x10, 0x08, 0x04, 0x02} 
  ,{0x3e, 0x51, 0x49, 0x45, 0x3e} 
  ,{0x00, 0x42, 0x7f, 0x40, 0x00} 
  ,{0x42, 0x61, 0x51, 0x49, 0x46} 
  ,{0x21, 0x41, 0x45, 0x4b, 0x31} 
  ,{0x18, 0x14, 0x12, 0x7f, 0x10} 
  ,{0x27, 0x45, 0x45, 0x45, 0x39} 
  ,{0x3c, 0x4a, 0x49, 0x49, 0x30} 
  ,{0x01, 0x71, 0x09, 0x05, 0x03} 
  ,{0x36, 0x49, 0x49, 0x49, 0x36} 
  ,{0x06, 0x49, 0x49, 0x29, 0x1e} 
  ,{0x00, 0x36, 0x36, 0x00, 0x00} 
  ,{0x00, 0x56, 0x36, 0x00, 0x00} 
  ,{0x08, 0x14, 0x22, 0x41, 0x00} 
  ,{0x14, 0x14, 0x14, 0x14, 0x14} 
  ,{0x00, 0x41, 0x22, 0x14, 0x08} 
  ,{0x02, 0x01, 0x51, 0x09, 0x06} 
  ,{0x32, 0x49, 0x79, 0x41, 0x3e} 
  ,{0x7e, 0x11, 0x11, 0x11, 0x7e} 
  ,{0x7f, 0x49, 0x49, 0x49, 0x36} 
  ,{0x3e, 0x41, 0x41, 0x41, 0x22} 
  ,{0x7f, 0x41, 0x41, 0x22, 0x1c} 
  ,{0x7f, 0x49, 0x49, 0x49, 0x41} 
  ,{0x7f, 0x09, 0x09, 0x09, 0x01} 
  ,{0x3e, 0x41, 0x49, 0x49, 0x7a} 
  ,{0x7f, 0x08, 0x08, 0x08, 0x7f} 
  ,{0x00, 0x41, 0x7f, 0x41, 0x00} 
  ,{0x20, 0x40, 0x41, 0x3f, 0x01} 
  ,{0x7f, 0x08, 0x14, 0x22, 0x41} 
  ,{0x7f, 0x40, 0x40, 0x40, 0x40} 
  ,{0x7f, 0x02, 0x0c, 0x02, 0x7f} 
  ,{0x7f, 0x04, 0x08, 0x10, 0x7f} 
  ,{0x3e, 0x41, 0x41, 0x41, 0x3e} 
  ,{0x7f, 0x09, 0x09, 0x09, 0x06} 
  ,{0x3e, 0x41, 0x51, 0x21, 0x5e} 
  ,{0x7f, 0x09, 0x19, 0x29, 0x46} 
  ,{0x46, 0x49, 0x49, 0x49, 0x31} 
  ,{0x01, 0x01, 0x7f, 0x01, 0x01} 
  ,{0x3f, 0x40, 0x40, 0x40, 0x3f} 
  ,{0x1f, 0x20, 0x40, 0x20, 0x1f} 
  ,{0x3f, 0x40, 0x38, 0x40, 0x3f} 
  ,{0x63, 0x14, 0x08, 0x14, 0x63} 
  ,{0x07, 0x08, 0x70, 0x08, 0x07} 
  ,{0x61, 0x51, 0x49, 0x45, 0x43} 
  ,{0x00, 0x7f, 0x41, 0x41, 0x00} 
  ,{0x02, 0x04, 0x08, 0x10, 0x20} 
  ,{0x00, 0x41, 0x41, 0x7f, 0x00} 
  ,{0x04, 0x02, 0x01, 0x02, 0x04} 
  ,{0x40, 0x40, 0x40, 0x40, 0x40} 
  ,{0x00, 0x01, 0x02, 0x04, 0x00} 
  ,{0x20, 0x54, 0x54, 0x54, 0x78} 
  ,{0x7f, 0x48, 0x44, 0x44, 0x38} 
  ,{0x38, 0x44, 0x44, 0x44, 0x20} 
  ,{0x38, 0x44, 0x44, 0x48, 0x7f} 
  ,{0x38, 0x54, 0x54, 0x54, 0x18} 
  ,{0x08, 0x7e, 0x09, 0x01, 0x02} 
  ,{0x0c, 0x52, 0x52, 0x52, 0x3e} 
  ,{0x7f, 0x08, 0x04, 0x04, 0x78} 
  ,{0x00, 0x44, 0x7d, 0x40, 0x00} 
  ,{0x20, 0x40, 0x44, 0x3d, 0x00} 
  ,{0x7f, 0x10, 0x28, 0x44, 0x00} 
  ,{0x00, 0x41, 0x7f, 0x40, 0x00} 
  ,{0x7c, 0x04, 0x18, 0x04, 0x78} 
  ,{0x7c, 0x08, 0x04, 0x04, 0x78} 
  ,{0x38, 0x44, 0x44, 0x44, 0x38} 
  ,{0x7c, 0x14, 0x14, 0x14, 0x08} 
  ,{0x08, 0x14, 0x14, 0x18, 0x7c} 
  ,{0x7c, 0x08, 0x04, 0x04, 0x08} 
  ,{0x48, 0x54, 0x54, 0x54, 0x20} 
  ,{0x04, 0x3f, 0x44, 0x40, 0x20} 
  ,{0x3c, 0x40, 0x40, 0x20, 0x7c} 
  ,{0x1c, 0x20, 0x40, 0x20, 0x1c} 
  ,{0x3c, 0x40, 0x30, 0x40, 0x3c} 
  ,{0x44, 0x28, 0x10, 0x28, 0x44} 
  ,{0x0c, 0x50, 0x50, 0x50, 0x3c} 
  ,{0x44, 0x64, 0x54, 0x4c, 0x44} 
  ,{0x00, 0x08, 0x36, 0x41, 0x00} 
  ,{0x00, 0x00, 0x7f, 0x00, 0x00} 
  ,{0x00, 0x41, 0x36, 0x08, 0x00} 
  ,{0x10, 0x08, 0x08, 0x10, 0x08} 

  ,{0x1f, 0x24, 0x7c, 0x24, 0x1f} 
};




#line 17 "modules\\printing_handler\\printing_handler.c"

 
extern motor_parameters_st motor_parameters;	
extern fifo_t FifoADC_Temp;
extern fifo_t FifoADC_MxLight;
extern fifo_t FifoADC_LxLight;
extern fifo_t FifoADC_RxLight;

char print_flag = 0;
 
void Print_Welcome_Image(void)
{
	LCD_out_image(res_welcome_img);
	
}
void Print_Motor_Parameters(void)
{
	uint32_t light;
	uint32_t temperature;
	if(print_flag ==0)
	{
		LCD_clear();
		print_flag = 1;
	}
	 
	LCD_set_cursor(2,0);
	LCD_out_number(motor_parameters.left_motor_DC);	
	LCD_out_char(37); 																	
	LCD_set_cursor(0,0);
	LCD_out_string("MtrL");															
	
	 
	LCD_set_cursor(2,1);
	LCD_out_number(motor_parameters.right_motor_DC);	
	LCD_out_char(37); 																	
	LCD_set_cursor(0,1);
	LCD_out_string("MtrR");															
	
	 
	LCD_set_cursor(0,2);
	LCD_out_string("Dir ");															
	
	switch(motor_parameters.motor_direction)
	{
		case 0:																						
			LCD_out_string("St");
			break;
		case 1:																						
			LCD_out_string("FL");
			break;
		case 2:																						
			LCD_out_string("FR");
			break;
		case 3:																						
			LCD_out_string("Fw");
			break;
		case 4:																						
			LCD_out_string("Bw");
			break;
		default:
			LCD_out_string("St");
			break;
	}
	LCD_set_cursor(4,3);
	temperature = OS_FIFO_Get(&FifoADC_Temp);
	LCD_out_number(temperature);
	LCD_set_cursor(0,3);
	LCD_out_string("Temp:");
	LCD_set_cursor(8,4);
	light = OS_FIFO_Get(&FifoADC_RxLight);
	LCD_out_number(light);
	LCD_set_cursor(4,4);
	light = OS_FIFO_Get(&FifoADC_MxLight);
	LCD_out_number(light);
	LCD_set_cursor(0,4);
	light = OS_FIFO_Get(&FifoADC_LxLight);
	LCD_out_number(light);
}


