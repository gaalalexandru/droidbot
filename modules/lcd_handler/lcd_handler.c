//lcd_handler.c
//Application layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.c"

/*-------------------Type Includes-------------------*/
#include "custom_types.h"

/*-------------------HW define Includes--------------*/
/*-------------------Driver Includes-----------------*/
/*-------------------Service Includes----------------*/
#include "gpio_handler.h"
#include "ssi_handler.h"
#include "timer_handler.h"
#include "resources.h"

/*-------------------Self header Includes------------*/
#include "lcd_handler.h"

/*-------------------Macro Definitions----------------*/
#define DC_COMMAND            	0
#define DC_DATA               	0x40
#define RESET_LOW               0
#define RESET_HIGH              0x80


/*-------------------Function Definitions-------------*/
// This is a helper function that sends an 8-bit message to the LCD.
// inputs: type     COMMAND or DATA
//         message  8-bit code to transmit
// outputs: none
// assumes: SSI0 and port A have already been initialized and enabled
void static LCD_write(LCD_typeOfWrite_en type, unsigned char message)
{
  if(type == COMMAND)
	{

		GPIO_lcd_DC(DC_COMMAND);		//Set command mode
	}
	else
	{

		GPIO_lcd_DC(DC_DATA);			//Set data mode
	}
	SSI_lcd_write(message);		//Transmit the message
}

//***********Nokia5110_Init**************
// Initialize Nokia 5110 48x84 LCD by sending the proper
// commands to the PCD8544 driver.  One new feature of the
// LM4F120 is that its SSIs can get their baud clock from
// either the system clock or from the 16 MHz precision
// internal oscillator.  If the system clock is faster than
// 50 MHz, the SSI baud clock will be faster than the 4 MHz
// maximum of the Nokia 5110.
// inputs: none
// outputs: none
// assumes: system clock rate of 50 MHz or less
void LCD_init(void)
{
	volatile unsigned long delay;

	SSI_lcd_init();						// Initialize SSI pins
	GPIO_lcd_init();					// Initialize GPIO pins

	GPIO_lcd_RST(RESET_LOW);	// reset the LCD to a known state
	TIMER_delay_No_Int(1);
	GPIO_lcd_RST(RESET_HIGH); // negative logic

	LCD_write(COMMAND, 0x21);              // chip active; horizontal addressing mode (V = 0); use extended instruction set (H = 1)
																				 // set LCD Vop (contrast), which may require some tweaking:
  LCD_write(COMMAND, LCD_Contrast);      // try 0xB1 (for 3.3V red SparkFun), 0xB8 (for 3.3V blue SparkFun), 0xBF if your display is too dark, or 0x80 to 0xFF if experimenting
	LCD_write(COMMAND, 0x04);              // set temp coefficient
  LCD_write(COMMAND, 0x14);              // LCD bias mode 1:48: try 0x13 or 0x14
	
  LCD_write(COMMAND, 0x20);              // we must send 0x20 before modifying the display control mode
  LCD_write(COMMAND, LCD_Mode);          // set display control to normal mode: 0x0D for inverse
	
	LCD_clear();													 // Clear LCD content
}

//********Nokia5110_SetCursor*****************
// Move the cursor to the desired X- and Y-position.  The
// next character will be printed here.  X=0 is the leftmost
// column.  Y=0 is the top row.
// inputs: newX  new X-position of the cursor (0<=newX<=11)
//         newY  new Y-position of the cursor (0<=newY<=5)
// outputs: none
bool LCD_set_cursor(unsigned char xpos, unsigned char ypos)
{
	if((xpos > 11) || (ypos > 5))	// bad input
	{        
		return false;								// do nothing
	}
	else
	{
		/* multiply newX by 7 because each character is 7 columns wide */
		LCD_write(COMMAND, 0x80|(xpos*7));     // setting bit 7 updates X-position
		LCD_write(COMMAND, 0x40|ypos);         // setting bit 6 updates Y-position
		return true;
	}
}

//********Nokia5110_Clear*****************
// Clear the LCD by writing zeros to the entire screen and
// reset the cursor to (0,0) (top left corner of screen).
// inputs: none
// outputs: none
void LCD_clear(void)
{
	unsigned long index = 0;
  for(index = 0; index < ((LCD_Max_X * LCD_Max_Y) / 8); index++)
	{
    LCD_write(DATA, 0x00);
  }
	LCD_set_cursor(0,0);
}
//********Nokia5110_OutChar*****************
// Print a character to the Nokia 5110 48x84 LCD.  The
// character will be printed at the current cursor position,
// the cursor will automatically be updated, and it will
// wrap to the next row or back to the top if necessary.
// One blank column of pixels will be printed on either side
// of the character for readability.  Since characters are 8
// pixels tall and 5 pixels wide, 12 characters fit per row,
// and there are six rows.
// inputs: data  character to print
// outputs: none
// assumes: LCD is in default horizontal addressing mode (V = 0)
void LCD_out_char(unsigned char data)
{
	unsigned long index = 0;
	for(index = 0; index <5; index++)
	{
		LCD_write(DATA, ASCII[data - 0x20][index]);
	}
	LCD_write(DATA, 0x00);
}

//********Nokia5110_OutString*****************
// Print a string of characters to the Nokia 5110 48x84 LCD.
// The string will automatically wrap, so padding spaces may
// be needed to make the output look optimal.
// inputs: ptr  pointer to NULL-terminated ASCII string
// outputs: none
// assumes: LCD is in default horizontal addressing mode (V = 0)
void LCD_out_string(char *string)
{
	while(*string) 						//Last item is /0 so will end while loop
	{
		LCD_out_char(*string);	//Print out current element of string
		string++;								//Increment string index, move to next element of string
	}
}

//********Nokia5110_OutUDec*****************
// Output a 16-bit number in unsigned decimal format with a
// fixed size of five right-justified digits of output.
// Inputs: n  16-bit unsigned number
// Outputs: none
// assumes: LCD is in default horizontal addressing mode (V = 0)
void LCD_out_number(unsigned short number) 
{
  if(number < 10)
	{
    LCD_out_string("    "); 	//Gaal Alexandru investigate this warning!!!
    LCD_out_char(number+'0'); /* n is between 0 and 9 */
  }
	else if(number<100)
	{
		LCD_out_string("   ");		//Gaal Alexandru investigate this warning!!!
    LCD_out_char(number / 10+'0'); /* tens digit */
    LCD_out_char(number % 10+'0'); /* ones digit */
	}
	else if(number<1000)
	{
    LCD_out_string("  ");		//Gaal Alexandru investigate this warning!!!
    LCD_out_char(number / 100+'0'); /* hundreds digit */
    number = number % 100;
    LCD_out_char(number / 10+'0'); /* tens digit */
    LCD_out_char(number % 10+'0'); /* ones digit */
  }
  else if(number<10000)
	{
    LCD_out_char(' ');
    LCD_out_char(number / 1000+'0'); /* thousands digit */
    number = number % 1000;
    LCD_out_char(number / 100+'0'); /* hundreds digit */
    number = number % 100;
    LCD_out_char(number / 10+'0'); /* tens digit */
    LCD_out_char(number % 10+'0'); /* ones digit */
  }
  else
	{
    LCD_out_char(number/10000+'0'); /* ten-thousands digit */
    number = number%10000;
    LCD_out_char(number/1000+'0'); /* thousands digit */
    number = number%1000;
    LCD_out_char(number/100+'0'); /* hundreds digit */
    number = number%100;
    LCD_out_char(number/10+'0'); /* tens digit */
    LCD_out_char(number%10+'0'); /* ones digit */
  }
}

//********Nokia5110_DrawFullImage*****************
// Fill the whole screen by drawing a 48x84 bitmap image.
// inputs: ptr  pointer to 504 byte bitmap
// outputs: none
// assumes: LCD is in default horizontal addressing mode (V = 0)
void LCD_out_image(const unsigned char *image)
{
	unsigned long index = 0;
	LCD_set_cursor(0,0);
	for(index = 0; index < ((LCD_Max_X * LCD_Max_Y) / 8); index++)
	{
		LCD_write(DATA, image[index]);
	}
}
//EOF


