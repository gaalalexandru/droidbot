//printing_handler.c
//Application layer
/*-------------------Type Includes-------------------*/
#include "custom_types.h"
/*---------------------OS Includes--------------------*/
#include "os_core.h"
/*-------------------HW define Includes--------------*/

/*-------------------Driver Includes-----------------*/

/*------Export interface---Self header Includes------*/
#include "printing_handler.h"

/*-------------------Service Includes----------------*/
#include "lcd_handler.h"
#include "resources.h"

/*-------------Global Variable Definitions------------*/
extern motor_parameters_st motor_parameters;	//Global structure variable for motor parameters
extern fifo_t FifoADC_Temp;

extern unsigned long Mx_LS_Value;	//Central light sensor output
extern unsigned long Rx_LS_Value;		//Right light sensor output
extern unsigned long Lx_LS_Value;			//Left light sensor output

char print_flag = 0;
/*-------------------Function Definitions-------------*/
void Print_Welcome_Image(void)
{
	LCD_out_image(res_welcome_img);
	//	LCD_out_image(res_Longhorn1);
}
void Print_Motor_Parameters(void)
{
	uint32_t temperature;
	if(print_flag ==0)
	{
		LCD_clear();
		print_flag = 1;
	}
	/*Print left motor parameters on raw 0*/
	LCD_set_cursor(2,0);
	LCD_out_number(motor_parameters.left_motor_DC);	//print left motor DC
	LCD_out_char(37); 																	//print % sign
	LCD_set_cursor(0,0);
	LCD_out_string("MtrL");															//print left motor label
	
	/*Print right motor parameters on raw 1*/
	LCD_set_cursor(2,1);
	LCD_out_number(motor_parameters.right_motor_DC);	//print right motor DC
	LCD_out_char(37); 																	//print % sign
	LCD_set_cursor(0,1);
	LCD_out_string("MtrR");															//print right motor label
	
	/*Print robot moving direction on raw 2*/
	LCD_set_cursor(0,2);
	LCD_out_string("Dir ");															//print direction label
	
	switch(motor_parameters.motor_direction)
	{
		case 0:																						//Robot is stoped
			LCD_out_string("St");
			break;
		case 1:																						//Robot is going forward left
			LCD_out_string("FL");
			break;
		case 2:																						//Robot is going forward right
			LCD_out_string("FR");
			break;
		case 3:																						//Robot is going forward
			LCD_out_string("Fw");
			break;
		case 4:																						//Robot is going backward
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
	LCD_out_number(Rx_LS_Value);
	LCD_set_cursor(4,4);
	LCD_out_number(Mx_LS_Value);
	LCD_set_cursor(0,4);
	LCD_out_number(Lx_LS_Value);
}
//EOF

