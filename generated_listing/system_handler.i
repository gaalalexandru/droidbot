#line 1 "modules\\system_handler\\system_handler.c"



 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"





#line 12 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 20 ".\\modules\\compile_switches\\compile_switches.c"

 




 
#line 33 ".\\modules\\compile_switches\\compile_switches.c"

 


 











 

 
#line 58 ".\\modules\\compile_switches\\compile_switches.c"





#line 6 "modules\\system_handler\\system_handler.c"
 
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"



#line 8 "modules\\system_handler\\system_handler.c"
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



 



#line 9 "modules\\system_handler\\system_handler.c"

 

 
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










#line 14 "modules\\system_handler\\system_handler.c"

 
#line 1 "modules\\system_handler\\system_handler.h"




 
#line 7 "modules\\system_handler\\system_handler.h"
#line 8 "modules\\system_handler\\system_handler.h"

 
#line 11 "modules\\system_handler\\system_handler.h"

 


 
void SYS_clock_init(void);
void SYS_startup(void);
#line 17 "modules\\system_handler\\system_handler.c"

 
#line 1 ".\\modules\\adc_handler\\adc_handler.h"



void ADC_Temperature_sensor_init(void);
void ADC_Light_sensor_init(void);

#line 20 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\comparator_handler\\comparator_handler.h"




 
void COMP_mic_input_init(void);



#line 21 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\cyclic_activity_handler\\cyclic_activity_handler.h"




 
void CYCL_1_second(void);
void CYCL_50_milisecond(void);

#line 22 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\gpio_handler\\gpio_handler.h"



 
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



#line 6 ".\\modules\\gpio_handler\\gpio_handler.h"
 
void GPIO_direction_switch_init(void);
void GPIO_red_led_init(void);
void GPIO_red_led_toggle(void);
void GPIO_lcd_init(void);
void GPIO_lcd_DC(unsigned char DC);
void GPIO_lcd_RST(unsigned char RST);
void GPIO_motor_direction_select(Motor_Direction_en direction);



#line 23 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\interrupt_handler\\interrupt_handler.h"



 
void Int_Master_Enable(void);
void Int_Master_Disable(void);
void Int_Peripherials_Enable(void);


 





#line 24 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\lcd_handler\\lcd_handler.h"




 
#line 7 ".\\modules\\lcd_handler\\lcd_handler.h"

 








































































































 

 
void LCD_init(void);
_Bool LCD_set_cursor(unsigned char xpos,unsigned char ypos);
void LCD_clear(void);
void LCD_out_char(unsigned char data);
void LCD_out_string(char *string);
void LCD_out_number(unsigned short number);
void LCD_out_image(const unsigned char *image);



#line 25 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\motion_handler\\motion_handler.h"





void Motion_Go_Right(void);
void Motion_Go_Left(void);
void Motion_Stop(void);
void Motion_Cruise(void);
void Motion_Max_Speed(void);
void Motion_Go_Back(void);
void Motion_calculate_direction(void);

#line 26 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\pwm_handler\\pwm_handler.h"





void PWM_motor_init(unsigned long PWM_Period);
void PWM_set_duty_cycle(unsigned long PWM_Base, unsigned long PWM_Generator, unsigned long PWM_Output, unsigned long PWM_duty_cycle);
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_motor_reverse_init(unsigned long PWM_Period, unsigned short PWM_duty_cycle);
void PWM_motor_reverse_stop(void);;
void PWM_Red_led_init(unsigned long PWM_Period);
void PWM_Red_led_toggle(void);

#line 27 "modules\\system_handler\\system_handler.c"
#line 1 ".\\modules\\timer_handler\\timer_handler.h"




 
void TIMER_cyclic_1s_init(void);
void TIMER_cyclic_50ms_init(void);
unsigned long TIMER_reload_calculator(unsigned long milli_seconds_requested);

void TIMER_delay(unsigned long delay_time_ms);
void TIMER_delay_No_Int(unsigned long delay_time_ms);

#line 28 "modules\\system_handler\\system_handler.c"

 

 

 
void SYS_clock_init(void)
{
	
	
	
		
										
										
										
										
										
										
		
	SysCtlClockSet(0x07400000 | 0x00000000 | 0x00000540| 0x00000000);	
	






























 
}
void SYS_startup(void)
{
	unsigned long clock1, clock2;
	Int_Master_Disable();			
	SYS_clock_init();					
	clock1 = SysCtlClockGet();		
	
#line 97 "modules\\system_handler\\system_handler.c"
	

		
		

	
	clock2 = SysCtlClockGet();		
	if(clock1 == clock2)			
	{
		Int_Master_Enable();			
	}
}


