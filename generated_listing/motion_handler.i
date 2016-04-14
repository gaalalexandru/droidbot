#line 1 "modules\\motion_handler\\motion_handler.c"


 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"







 
#line 15 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 23 ".\\modules\\compile_switches\\compile_switches.c"

 











 

 







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

 
#line 1 "modules\\motion_handler\\motion_handler.h"





void Motion_Go_Right(void);
void Motion_Go_Left(void);
void Motion_Stop(void);
void Motion_Cruise(void);
void Motion_Max_Speed(void);
void Motion_Go_Back(void);

#line 11 "modules\\motion_handler\\motion_handler.c"

 
#line 1 ".\\modules\\pwm_handler\\pwm_handler.h"





void PWM_motor_init(unsigned long PWM_Period);
void PWM_set_duty_cycle(unsigned long PWM_Base, unsigned long PWM_Generator, unsigned long PWM_Output, unsigned long PWM_duty_cycle);
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_motor_reverse_init(unsigned long PWM_Period, unsigned short PWM_duty_cycle);
void PWM_motor_reverse_stop(void);;
void PWM_Red_led_init(unsigned long PWM_Period);
void PWM_Red_led_toggle(void);

#line 14 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\timer_handler\\timer_handler.h"




 
void TIMER_cyclic_1s_init(void);
void TIMER_cyclic_50ms_init(void);
unsigned long TIMER_reload_calculator(unsigned long milli_seconds_requested);

void TIMER_delay(unsigned long delay_time_ms);
void TIMER_delay_No_Int(unsigned long delay_time_ms);

#line 15 "modules\\motion_handler\\motion_handler.c"

 
extern unsigned long comp0_interrupt_flag;	
motor_parameters_st motor_parameters;	

 
void Motion_Go_Left(void)
{
	PWM_right_motor_duty_cycle((70));
	PWM_left_motor_duty_cycle((0));
	motor_parameters.right_motor_DC = (70);
	motor_parameters.left_motor_DC = (0);	
	motor_parameters.motor_direction=1;	
}

void Motion_Go_Right(void)
{
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
	PWM_right_motor_duty_cycle((60));
	PWM_left_motor_duty_cycle((60));
	motor_parameters.left_motor_DC = (60);
	motor_parameters.right_motor_DC = (60);		
	motor_parameters.motor_direction=3;	
}

void Motion_Max_Speed(void)
{
	PWM_right_motor_duty_cycle((95));
	PWM_left_motor_duty_cycle((95));
	motor_parameters.left_motor_DC = (95);
	motor_parameters.right_motor_DC = (95);		
	motor_parameters.motor_direction=3;
}

void Motion_Go_Back(void)
{
	Motion_Stop();
	PWM_motor_reverse_init(1000, (50));
	motor_parameters.left_motor_DC = (50);
	motor_parameters.right_motor_DC = (50);	
	motor_parameters.motor_direction=4;
	
	
	TIMER_delay_No_Int(1000);		
	comp0_interrupt_flag = 0;
	PWM_motor_reverse_stop();
}
