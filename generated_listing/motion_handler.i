#line 1 "modules\\motion_handler\\motion_handler.c"


 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"





#line 12 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 20 ".\\modules\\compile_switches\\compile_switches.c"

 




 
#line 33 ".\\modules\\compile_switches\\compile_switches.c"

 


 











 

 
#line 59 ".\\modules\\compile_switches\\compile_switches.c"

 
#line 69 ".\\modules\\compile_switches\\compile_switches.c"

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

 
#line 1 "modules\\motion_handler\\motion_handler.h"





void Motion_init(void);
void Motion_Go_Right(void);
void Motion_Go_Left(void);
void Motion_Stop(void);
void Motion_Cruise(void);
void Motion_Max_Speed(void);
void Motion_Go_Back(void);
void Motion_calculate_direction(void);

#line 11 "modules\\motion_handler\\motion_handler.c"

 
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



#line 14 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\pwm_handler\\pwm_handler.h"





void PWM_motor_init(unsigned long PWM_Period);
void PWM_right_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_left_motor_duty_cycle(unsigned long PWM_duty_cycle);
void PWM_Red_led_init(unsigned long PWM_Period);
void PWM_Red_led_toggle(void);




#line 15 "modules\\motion_handler\\motion_handler.c"
#line 1 ".\\modules\\timer_handler\\timer_handler.h"




 
void TIMER_cyclic_1s_init(void);
void TIMER_cyclic_50ms_init(void);
unsigned long TIMER_reload_calculator(unsigned long milli_seconds_requested);

void TIMER_delay(unsigned long delay_time_ms);
void TIMER_delay_No_Int(unsigned long delay_time_ms);

#line 16 "modules\\motion_handler\\motion_handler.c"

 
extern unsigned long comp0_interrupt_flag;	
motor_parameters_st motor_parameters;	

extern unsigned long Mx_LS_Value;	
extern unsigned long Rx_LS_Value;		
extern unsigned long Lx_LS_Value;			

 
void Motion_init(void)
{
	GPIO_steering_switch_init();	
	GPIO_motor_direction_init();	
	PWM_motor_init(1000);					
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


void Motion_calculate_direction(void)
{

	unsigned long Rx_Lx_LS_Delta = (Rx_LS_Value >= Lx_LS_Value ? (Rx_LS_Value - Lx_LS_Value) : (Lx_LS_Value - Rx_LS_Value));
	unsigned long Rx_Mx_LS_Delta = (Rx_LS_Value >= Mx_LS_Value ? (Rx_LS_Value - Mx_LS_Value) : (Mx_LS_Value - Rx_LS_Value));
	unsigned long Lx_Mx_LS_Delta = (Lx_LS_Value >= Mx_LS_Value ? (Lx_LS_Value - Mx_LS_Value) : (Mx_LS_Value - Lx_LS_Value));
	static unsigned char Go_Fwd_Counter = 0;	
	
	
	if((Rx_Lx_LS_Delta < (120))&&	
		 (Rx_Mx_LS_Delta > (120))&&	
		 (Rx_Mx_LS_Delta > (120))&&
		 (Rx_LS_Value > (Mx_LS_Value + (120)))&&	
		 (Lx_LS_Value > (Mx_LS_Value + (120))))	
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
	
	else if ((Rx_Lx_LS_Delta > (120))&&	
					 (Rx_Mx_LS_Delta > (120))&&	
					 (Rx_LS_Value > (Lx_LS_Value + (120)))&&	
					 (Rx_LS_Value > (Mx_LS_Value + (120))))	
	{
		
		Motion_Go_Right();
		Go_Fwd_Counter = 0;
	}
	
	else if((Rx_Lx_LS_Delta > (120))&&	
					(Lx_Mx_LS_Delta > (120))&&	
					(Lx_LS_Value > (Rx_LS_Value + (120)))&&	
					(Lx_LS_Value > (Mx_LS_Value + (120))))		
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

