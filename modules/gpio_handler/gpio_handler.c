//gpio_handler.c
//Service layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"
/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"
#include "custom_types.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"

/*-------------------Self header Includes-------------*/
#include "gpio_handler.h"

/*-------------------Macro Definitions----------------*/
#define GPIO_PORTF_LOCK_R       (*((volatile unsigned long *)0x40025520))
#define GPIO_PORTF_CR_R         (*((volatile unsigned long *)0x40025524))

/*-------------------Function Definitions-------------*/
void GPIO_Light_sensor_init(void)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);																			//Enable clock on port F
	
	GPIO_PORTF_LOCK_R = 0x4C4F434B;  																									//Unlock PortF PF0  
  GPIO_PORTF_CR_R |= 0x1F;      																								    //Allow changes to PF4-0
	
	IntDisable(INT_GPIOF);																														//GPIO Port F disable of interrupts
	
	GPIOIntDisable(GPIO_PORTF_BASE,GPIO_PIN_0 | GPIO_PIN_4);													//Disable GPIO pin interrupt
	GPIOPinTypeGPIOInput(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);										//Set PF0 and PF4 as GPIO Input
	GPIOIntTypeSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4, GPIO_LOW_LEVEL);					//Set Low level interrupt type
	GPIODirModeSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4, GPIO_DIR_MODE_IN);				//Set direction input for PF0 and PF4
	GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPU); //Configure PUR for PF0 and PF4
	GPIOIntEnable(GPIO_PORTF_BASE, GPIO_INT_PIN_0 | GPIO_INT_PIN_4);									//Enable GPIO pin interrupt
	
	IntPrioritySet(INT_GPIOF,(Int_Prio_GPIO_PF_LightS)<<5); 												//Priority 2 = "010"0.0000
	IntEnable(INT_GPIOF);																															//GPIO Port F enable of interrupts
}

void GPIO_Red_led_init(void)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);																			//Enable clock on port F
	
  GPIO_PORTF_CR_R |= 0x1F;      																								    //Allow changes to PF4-0
	
	GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1);																//Set PF1 GPIO Output
	GPIODirModeSet(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_DIR_MODE_OUT);										//Set direction Output for PF1
	GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD); //Configure PF1
	//GPIOPinConfigure();
	GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0);
}

void GPIO_Red_led_toggle(void)
{
	static char Red_Led_Status = 0;
	Red_Led_Status ^= 0x02;																			//Toggle the status (bit 1 - 0000.0010)
	GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, Red_Led_Status);	//Set the desired status	
}

void GPIO_lcd_init(void)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);																			//Enable clock on port A
	GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_6 | GPIO_PIN_7);									//Set PA6 - D/C and PA7 - Reset as GPIO Output
	GPIODirModeSet(GPIO_PORTA_BASE, GPIO_PIN_6 | GPIO_PIN_7, GPIO_DIR_MODE_OUT);			//Set direction Output for PA6 and PA7
	GPIOPadConfigSet(GPIO_PORTA_BASE, GPIO_PIN_6 | GPIO_PIN_7, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPD); //Configure PA6 and PA7
}

void GPIO_lcd_DC(unsigned char DC)
{
	//GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_6, DC);
	if(DC) 
	{
		GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_6, GPIO_PIN_6);
	}
	else
	{
		GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_6, 0);
	}
}

void GPIO_lcd_RST(unsigned char RST)
{
	GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_7, RST);
}

void GPIO_motor_mode_select(Motor_Mode_en mode)
{
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);		//Enable clock on port D
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_7);		//Set PD7 as GPIO Output
	GPIODirModeSet(GPIO_PORTD_BASE, GPIO_PIN_7, GPIO_DIR_MODE_OUT);		//Set direction Output for PD7
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_7, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD_WPD); //Configure PD7
	
	
	if(mode) //Phase / Enable mode
	{
		GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_7, GPIO_PIN_7);
	}
	else	//In / In mode
	{
		GPIOPinWrite(GPIO_PORTA_BASE, GPIO_PIN_7, 0);
	}
}

void GPIO_LS_Feedback_Init(void)
{
	//LS = Light Sensor
}
void GPIO_LS_Feedback_Toogle(Led_State_en State)
{
	//abcd
	/*
  Right_Feedback_Off, = 0
	Right_Feedback_On,
	Left_Feedback_Off,
	Left_Feedback_On,
	Center_Feedback_Off,
	Center_Feedback_On	=	5
	*/
}