//motion_handler.c
//Application layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "custom_types.h"

/*-------------------Self header Includes-------------*/
#include "motion_handler.h"

/*-------------------Service Includes-----------------*/
#include "pwm_handler.h"
#include "timer_handler.h"

/*-------------Global Variable Definitions------------*/
extern unsigned long comp0_interrupt_flag;	//Global variable used to measure in debugger time till backwards motion is active
motor_parameters_st motor_parameters;	//Global structure variable for motor parameters
// motor_direction;		//0 - stop, 1 - forward left, 2 - forward right, 3 - forward straight, 4 - backward
extern unsigned long Mx_LS_Value;	//Central light sensor output
extern unsigned long Rx_LS_Value;		//Right light sensor output
extern unsigned long Lx_LS_Value;			//Left light sensor output

/*-------------------Function Definitions-------------*/
void Motion_Go_Left(void)
{
	PWM_right_motor_duty_cycle(Outer_Wheel_DS);
	PWM_left_motor_duty_cycle(Inner_Wheel_DS);
	motor_parameters.right_motor_DC = Outer_Wheel_DS;
	motor_parameters.left_motor_DC = Inner_Wheel_DS;	
	motor_parameters.motor_direction=1;	
}

void Motion_Go_Right(void)
{
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
	PWM_right_motor_duty_cycle(Cruise_Wheel_DS);
	PWM_left_motor_duty_cycle(Cruise_Wheel_DS);
	motor_parameters.left_motor_DC = Cruise_Wheel_DS;
	motor_parameters.right_motor_DC = Cruise_Wheel_DS;		
	motor_parameters.motor_direction=3;	
}

void Motion_Max_Speed(void)
{
	PWM_right_motor_duty_cycle(Max_Speed_Wheel_DS);
	PWM_left_motor_duty_cycle(Max_Speed_Wheel_DS);
	motor_parameters.left_motor_DC = Max_Speed_Wheel_DS;
	motor_parameters.right_motor_DC = Max_Speed_Wheel_DS;		
	motor_parameters.motor_direction=3;
}

void Motion_Go_Back(void)
{
	Motion_Stop();
	PWM_motor_reverse_init(1000, Revers_Wheel_DS);
	motor_parameters.left_motor_DC = Revers_Wheel_DS;
	motor_parameters.right_motor_DC = Revers_Wheel_DS;	
	motor_parameters.motor_direction=4;
	
	//TIMER_delay(1000);						//1 second delay, but with interrupts enabled
	TIMER_delay_No_Int(1000);		//1 second delay, but with interrupts disabled
	comp0_interrupt_flag = 0;
	PWM_motor_reverse_stop();
}


void Motion_calculate_direction(void)
{
	/*
extern unsigned long Mx_LS_Value;	//Central light sensor output
extern unsigned long Rx_LS_Value;		//Right light sensor output
extern unsigned long Lx_LS_Value;	
	*/
	signed long Rx_Lx_LS_Delta = Rx_LS_Value - Lx_LS_Value;
	signed long Rx_Mx_LS_Delta = Rx_LS_Value - Mx_LS_Value;
	signed long Lx_Mx_LS_Delta = Lx_LS_Value - Mx_LS_Value;
	static unsigned char Go_Fwd_Counter = 0;	//Will be incremented every 100 ms, if condition fulfill
	
	if(((Rx_Lx_LS_Delta < Min_Delta_LS)&&(Rx_Lx_LS_Delta > -Min_Delta_LS))&&	//Check if Rx = Lx (within min delta)
	((Rx_Mx_LS_Delta > Min_Delta_LS)||(Rx_Mx_LS_Delta < -Min_Delta_LS))&&			//Check if Rx != Mx	(not within delta)
	((Rx_Mx_LS_Delta > Min_Delta_LS)||(Rx_Mx_LS_Delta < -Min_Delta_LS)))			//Check if Lx != Mx	(not within delta)
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
	else if((Rx_Lx_LS_Delta > Min_Delta_LS)&&															//Check if Rx > Lx	(not within delta)
	((Rx_Mx_LS_Delta > Min_Delta_LS)||(Rx_Mx_LS_Delta < -Min_Delta_LS)))	//Check if Rx != Mx	(not within delta)
	{
		//Condition fulfill to go right, lightsource in right of droidbot
		Motion_Go_Right();
		Go_Fwd_Counter = 0;
	}
	else if((Rx_Lx_LS_Delta < -Min_Delta_LS)&&														//Check if Lx > Rx	(not within delta)
	((Lx_Mx_LS_Delta > Min_Delta_LS)||(Lx_Mx_LS_Delta < -Min_Delta_LS)))	//Check if Lx != Mx	(not within delta)
	{
		//Condition fulfill to go left, lightsource in left of droidbot
		Motion_Go_Left();
		Go_Fwd_Counter = 0;		
	}
	else
	{
		//None of the above conditions fulfill, stop droidbot
		Motion_Stop();
		Go_Fwd_Counter = 0;
	}
}
//EOF
