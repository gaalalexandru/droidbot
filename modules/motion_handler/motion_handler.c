//motion_handler.c
//Application layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.h"

/*-------------------Type Includes-------------------*/
#include "custom_types.h"

/*------Export interface---Self header Includes------*/
#include "motion_handler.h"

/*-------------------Service Includes-----------------*/
#include "gpio_handler.h"
#include "pwm_handler.h"
#include "timer_handler.h"

/*-------------Global Variable Definitions------------*/
extern unsigned long comp0_interrupt_flag;	//Global variable used to measure in debugger time till backwards motion is active
motor_parameters_st motor_parameters;	//Global structure variable for motor parameters
// motor_direction;		//0 - stop, 1 - forward left, 2 - forward right, 3 - forward straight, 4 - backward
extern unsigned long Mx_LS_Value;		//Central light sensor output
extern unsigned long Rx_LS_Value;		//Right light sensor output
extern unsigned long Lx_LS_Value;		//Left light sensor output
extern unsigned long X_acceleration;//X acceleration 8 bit value
extern unsigned long Y_acceleration;//Y acceleration 8 bit value
extern unsigned long Z_acceleration;//Z acceleration 8 bit value

/*-------------------Function Definitions-------------*/
void Motion_init(void)
{
	GPIO_steering_switch_init();	//Initialize GPIO input
	GPIO_motor_direction_init();	//Initialize GPIO output to select motor direction
	PWM_motor_init(1000);					//Initialize PWM for motors forward
}
void Motion_Go_Left(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle(Outer_Wheel_DS);
	PWM_left_motor_duty_cycle(Inner_Wheel_DS);
	motor_parameters.right_motor_DC = Outer_Wheel_DS;
	motor_parameters.left_motor_DC = Inner_Wheel_DS;	
	motor_parameters.motor_direction=1;	
}

void Motion_Go_Right(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle(Inner_Wheel_DS);
	PWM_left_motor_duty_cycle(Outer_Wheel_DS);
	motor_parameters.left_motor_DC = Outer_Wheel_DS;
	motor_parameters.right_motor_DC = Inner_Wheel_DS;		
	motor_parameters.motor_direction=2;
}

void Motion_Stop(void)
{
	PWM_right_motor_duty_cycle(Stop_Wheel_DS);
	PWM_left_motor_duty_cycle(Stop_Wheel_DS);
	motor_parameters.left_motor_DC = Stop_Wheel_DS;
	motor_parameters.right_motor_DC = Stop_Wheel_DS;		
	motor_parameters.motor_direction=0;
}

void Motion_Cruise(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle(Cruise_Wheel_DS);
	PWM_left_motor_duty_cycle(Cruise_Wheel_DS);
	motor_parameters.left_motor_DC = Cruise_Wheel_DS;
	motor_parameters.right_motor_DC = Cruise_Wheel_DS;		
	motor_parameters.motor_direction=3;	
}

void Motion_Max_Speed(void)
{
	GPIO_motor_direction_select(FWD);
	PWM_right_motor_duty_cycle(Max_Speed_Wheel_DS);
	PWM_left_motor_duty_cycle(Max_Speed_Wheel_DS);
	motor_parameters.left_motor_DC = Max_Speed_Wheel_DS;
	motor_parameters.right_motor_DC = Max_Speed_Wheel_DS;		
	motor_parameters.motor_direction=3;
}

void Motion_Go_Back(void)
{
	Motion_Stop();
	GPIO_motor_direction_select(RWD);
	PWM_right_motor_duty_cycle(Revers_Wheel_DS);
	PWM_left_motor_duty_cycle(Revers_Wheel_DS);
	//PWM_motor_reverse_init(1000, Revers_Wheel_DS);
	motor_parameters.left_motor_DC = Revers_Wheel_DS;
	motor_parameters.right_motor_DC = Revers_Wheel_DS;	
	motor_parameters.motor_direction=4;
	
	//TIMER_delay(1000);						//1 second delay, but with interrupts enabled
	TIMER_delay_No_Int(1000);		//1 second delay, but with interrupts disabled
	comp0_interrupt_flag = 0;
	//PWM_motor_reverse_stop();
	Motion_Stop();
}


void Motion_calculate_direction(void)
{
	/*
	//							Delta-------------Condition--------------------True--------------------------False----------------------
	unsigned long Rx_Lx_LS_Delta = (Rx_LS_Value >= Lx_LS_Value ? (Rx_LS_Value - Lx_LS_Value) : (Lx_LS_Value - Rx_LS_Value));
	unsigned long Rx_Mx_LS_Delta = (Rx_LS_Value >= Mx_LS_Value ? (Rx_LS_Value - Mx_LS_Value) : (Mx_LS_Value - Rx_LS_Value));
	unsigned long Lx_Mx_LS_Delta = (Lx_LS_Value >= Mx_LS_Value ? (Lx_LS_Value - Mx_LS_Value) : (Mx_LS_Value - Lx_LS_Value));
	static unsigned char Go_Fwd_Counter = 0;	//Will be incremented every 100 ms, if condition fulfill
	
	//Check if GO FORWARD
	if((Rx_Lx_LS_Delta < Min_Delta_LS)&&	//Check if Rx = Lx (within min delta)
		 (Rx_Mx_LS_Delta > Min_Delta_LS)&&	//Check if Rx != Mx	(not within delta)
		 (Rx_Mx_LS_Delta > Min_Delta_LS)&&
		 (Rx_LS_Value > (Mx_LS_Value + Min_Delta_LS))&&	//Check if Rx > Mx	(atleast by delta)
		 (Lx_LS_Value > (Mx_LS_Value + Min_Delta_LS)))	//Check if Lx > Mx	(atleast by delta)
	{
		//Condition furfilled to go forward, lightsource in front of droidbot
		if(Go_Fwd_Counter < Max_Speed_Delay)
		{
			Motion_Cruise();		//Cruise ahead
			if(Go_Fwd_Counter < 254)
			{
				Go_Fwd_Counter++;
			}
			else
			{
				Go_Fwd_Counter = Max_Speed_Delay;
			}
		}
		else
		{
			Motion_Max_Speed(); //Switch to max speed
		}					
	}
	//Check if GO RIGHT
	else if ((Rx_Lx_LS_Delta > Min_Delta_LS)&&	//Check if Rx != Lx	(not within delta)
					 (Rx_Mx_LS_Delta > Min_Delta_LS)&&	//Check if Rx != Mx	(not within delta)
					 (Rx_LS_Value > (Lx_LS_Value + Min_Delta_LS))&&	//Check if Rx > Lx	(atleast by delta)	
					 (Rx_LS_Value > (Mx_LS_Value + Min_Delta_LS)))	//Check if Mx > Lx	(atleast by delta)			
	{
		//Condition fulfill to go right, lightsource in right of droidbot
		Motion_Go_Right();
		Go_Fwd_Counter = 0;
	}
	//Check if GO LEFT
	else if((Rx_Lx_LS_Delta > Min_Delta_LS)&&	//Check if Lx != Rx	(not within delta)
					(Lx_Mx_LS_Delta > Min_Delta_LS)&&	//Check if Lx != Mx	(not within delta)
					(Lx_LS_Value > (Rx_LS_Value + Min_Delta_LS))&&	//Check if Lx > Rx	(atleast by delta)	
					(Lx_LS_Value > (Mx_LS_Value + Min_Delta_LS)))		//Check if Lx > Mx	(atleast by delta)				
	{
		//Condition fulfill to go left, lightsource in left of droidbot
		Motion_Go_Left();
		Go_Fwd_Counter = 0;		
	}
	//#if Mx_LS_Go_BckW
	//#elseif
	//Check if GO BACKWARD
	//#else if(STOP_CONDITION)
	//#endif
	else
	{
		//None of the above conditions fulfill, stop droidbot
		Motion_Stop();
		Go_Fwd_Counter = 0;
	}
	if (X_acceleration > 50) Motion_Go_Left();
	if (Y_acceleration > 50) Motion_Go_Right();
	if (Z_acceleration > 50) Motion_Cruise();
	*/
}
//EOF
