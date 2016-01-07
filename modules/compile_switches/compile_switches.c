//This file will contain all the preprocessor commands to configure the SW before compilation

#ifndef COMP_SW
#define COMP_SW

#define SysTick_Enabled (0x07)		//0x00 - disable; 0x05 - SysTick enabled W/O Interrupts;	0x07 - SysTick enable with Interrupts (For periodic interrupts)

/*----------------On board LED definitions-------------*/
#define Red_LED (0x02)
#define Blue_LED (0x04) //PF2
#define Green_LED (0x08) //PF3
#define Yellow_LED (0x0A)
#define Cyan_LED (0x0C)
#define White_LED (0x0E)

/*-------------Motor PWM duty cycle config------------*/
#define Outer_Wheel_DS (95)			//PWM duty cycle for outer wheel at cornering
#define Inner_Wheel_DS (0)			//PWM duty cycle for inner wheel at cornering
#define Stop_Wheel_DS (0)				//PWM duty cycle for stoped wheel
#define Cruise_Wheel_DS (9)			//PWM duty cycle for cruising speed
#define Max_Speed_Wheel_DS (95)	//PWM duty cycle for cruising speed
#define Revers_Wheel_DS (50)		//PWM duty cycle for reverse

/*---------------------LCD config--------------------*/
// Maximum dimensions of the LCD, although the pixels are numbered from zero to (MAX-1).  
//Address may automatically be incremented after each transmission.
#define LCD_Max_X 		(84)
#define LCD_Max_Y 		(48)
#define	LCD_Mode 			(0x0C)		// 0x0C -for normal mode, 0x0D - for inverse mode
#define LCD_Contrast	(0xBA) 		//LCD display contrast
/* try 
0xB1 (for 3.3V red SparkFun), 
0xB8 (for 3.3V blue SparkFun), 
0xBF if your display is too dark,
0x80 to 0xFF if experimenting,
0xBA optimal value so far - Gaal Alexandru */

/*-------------------Interrupt priorities-------------*/
#define Int_Prio_1_Timer0A_50ms			(0x00) 	//Priority 1 = "001"0.0000
#define Int_Prio_1_WTimer0A_1s		(0x01) 	//Priority 1 = "001"0.0000
#define Int_Prio_2_GPIO_PF_LightS	(0x02)	//Priority 2 = "010"0.0000
#define Int_Prio_3_Comp_Mic				(0x03)	//Priority 3 = "011"0.0000

#endif
//EOF
