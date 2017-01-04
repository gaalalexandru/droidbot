#line 1 "modules\\motion_handler\\motion_handler.c"


 
#line 1 ".\\modules\\compile_switches\\compile_switches.h"





#line 14 ".\\modules\\compile_switches\\compile_switches.h"

 
#line 22 ".\\modules\\compile_switches\\compile_switches.h"

 




 
#line 35 ".\\modules\\compile_switches\\compile_switches.h"

 




 











 

 
#line 63 ".\\modules\\compile_switches\\compile_switches.h"

 
#line 73 ".\\modules\\compile_switches\\compile_switches.h"

#line 5 "modules\\motion_handler\\motion_handler.c"

 
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



#line 8 "modules\\motion_handler\\motion_handler.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 9 "modules\\motion_handler\\motion_handler.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
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




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 10 "modules\\motion_handler\\motion_handler.c"
 
#line 1 ".\\OS\\os_core.h"








#line 10 ".\\OS\\os_core.h"
























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







void OS_Init(void);







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



#line 12 "modules\\motion_handler\\motion_handler.c"

 
#line 1 "modules\\motion_handler\\motion_handler.h"





void Motion_Init(void);
void Motion_Go_Right(void);
void Motion_Go_Left(void);
void Motion_Stop(void);
void Motion_Cruise(void);
void Motion_Max_Speed(void);
void Motion_Go_Back(void);
void Motion_Calculate_Direction(void);

#line 15 "modules\\motion_handler\\motion_handler.c"

 
#line 1 ".\\modules\\adc_handler\\adc_handler.h"



void ADC_Temperature_Sensor_Init(void);
void ADC_Light_Sensor_Init(void);

#line 18 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\gpio_handler\\gpio_handler.h"



 
#line 6 ".\\modules\\gpio_handler\\gpio_handler.h"
 
void GPIO_steering_switch_init(void);
void GPIO_red_led_init(void);
void GPIO_red_led_toggle(void);
void GPIO_lcd_init(void);
void GPIO_lcd_DC(unsigned char DC);
void GPIO_lcd_RST(unsigned char RST);
void GPIO_motor_direction_init(void);
void GPIO_motor_direction_select(Motor_Direction_en direction);
void GPIO_accelerometer_CS_init(void);
void GPIO_accelerometer_CS_select(unsigned char CS);



#line 19 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\pwm_handler\\pwm_handler.h"





void PWM_motor_init(unsigned long PWM_Period);
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_Red_led_init(unsigned long PWM_Period);
void PWM_Red_led_toggle(void);




#line 20 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\timer_handler\\timer_handler.h"




 
void TIMER_cyclic_1s_init(void);
void TIMER_cyclic_50ms_init(void);
unsigned long TIMER_reload_calculator(unsigned long milli_seconds_requested);

void TIMER_delay(unsigned long delay_time_ms);
void TIMER_delay_No_Int(unsigned long delay_time_ms);

#line 21 "modules\\motion_handler\\motion_handler.c"

 
extern unsigned long comp0_interrupt_flag;	
motor_parameters_st motor_parameters;	


extern unsigned long X_acceleration;
extern unsigned long Y_acceleration;
extern unsigned long Z_acceleration;

extern uint8_t GPIO_PF0_SW2_Pressed;
extern uint8_t GPIO_PF4_SW1_Pressed;
extern fifo_t FifoADC_MxLight;
extern fifo_t FifoADC_LxLight;
extern fifo_t FifoADC_RxLight;

 
void Motion_Init(void)
{
	GPIO_steering_switch_init();	
	GPIO_motor_direction_init();	
	PWM_motor_init(1000);					
	ADC_Light_Sensor_Init();			
}
void Motion_Go_Left(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle((70));
	PWM_left_motor_duty_cycle((0));
	motor_parameters.right_motor_DC = (70);
	motor_parameters.left_motor_DC = (0);	
	motor_parameters.motor_direction=1;	
}

void Motion_Go_Right(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle((0));
	PWM_left_motor_duty_cycle((70));
	motor_parameters.left_motor_DC = (70);
	motor_parameters.right_motor_DC = (0);		
	motor_parameters.motor_direction=2;
}

void Motion_Stop(void)
{
	PWM_right_motor_duty_cycle((0));
	PWM_left_motor_duty_cycle((0));
	motor_parameters.left_motor_DC = (0);
	motor_parameters.right_motor_DC = (0);		
	motor_parameters.motor_direction=0;
}

void Motion_Cruise(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle((60));
	PWM_left_motor_duty_cycle((60));
	motor_parameters.left_motor_DC = (60);
	motor_parameters.right_motor_DC = (60);		
	motor_parameters.motor_direction=3;	
}

void Motion_Max_Speed(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle((95));
	PWM_left_motor_duty_cycle((95));
	motor_parameters.left_motor_DC = (95);
	motor_parameters.right_motor_DC = (95);		
	motor_parameters.motor_direction=3;
}

void Motion_Go_Back(void)
{
	Motion_Stop();
	GPIO_motor_direction_select(RWD);
	PWM_right_motor_duty_cycle((50));
	PWM_left_motor_duty_cycle((50));
	
	motor_parameters.left_motor_DC = (50);
	motor_parameters.right_motor_DC = (50);	
	motor_parameters.motor_direction=4;
	
	
	TIMER_delay_No_Int(1000);		
	comp0_interrupt_flag = 0;
	
	Motion_Stop();
}


void Motion_Calculate_Direction(void)
{
	uint32_t MX_light = 0;
	uint32_t LX_light = 0;
	uint32_t RX_light = 0;
	uint32_t Rx_Lx_LS_Delta = 0;
	uint32_t Rx_Mx_LS_Delta = 0;
	uint32_t Lx_Mx_LS_Delta = 0;
	static uint8_t Go_Fwd_Counter = 0;	
	
	
	MX_light = OS_FIFO_Get(&FifoADC_MxLight);
	LX_light = OS_FIFO_Get(&FifoADC_LxLight);
	RX_light = OS_FIFO_Get(&FifoADC_RxLight);
	
	
	
	Rx_Lx_LS_Delta = (RX_light >= LX_light ? (RX_light - LX_light) : (LX_light - RX_light));
	Rx_Mx_LS_Delta = (RX_light >= MX_light ? (RX_light - MX_light) : (MX_light - RX_light));
	Lx_Mx_LS_Delta = (LX_light >= MX_light ? (LX_light - MX_light) : (MX_light - LX_light));	
	
	
	if((GPIO_PF0_SW2_Pressed && GPIO_PF4_SW1_Pressed)|| 
		((Rx_Lx_LS_Delta < (120))&&	
		(Rx_Mx_LS_Delta > (120))&&	
		(Rx_Mx_LS_Delta > (120))&&
		(RX_light > (MX_light + (120)))&&	
		(LX_light > (MX_light + (120)))))	
	{
		
		if(Go_Fwd_Counter < (100))
		{
			Motion_Cruise();		
			if(Go_Fwd_Counter < 254)
			{
				Go_Fwd_Counter++;
			}
			else
			{
				Go_Fwd_Counter = (100);
			}
		}
		else
		{
			Motion_Max_Speed(); 
		}					
	}
	
	else if((GPIO_PF0_SW2_Pressed)||
		((Rx_Lx_LS_Delta > (120))&&  
		(Rx_Mx_LS_Delta > (120))&&  
		(RX_light > (LX_light + (120)))&&  
		(RX_light > (MX_light + (120)))))  
	{
		
		Motion_Go_Right();
		Go_Fwd_Counter = 0;
	}
	
	else if((GPIO_PF4_SW1_Pressed)||
		((Rx_Lx_LS_Delta > (120))&&  
		(Lx_Mx_LS_Delta > (120))&&  
		(LX_light > (RX_light + (120)))&&  
		(LX_light > (MX_light + (120)))))  
	{
		
		Motion_Go_Left();
		Go_Fwd_Counter = 0;		
	}
	
	
	
	
	
	else
	{
		
		Motion_Stop();
		Go_Fwd_Counter = 0;
	}
	
	



 
}

