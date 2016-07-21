//shift_register_handler.c
//Application layer
/*-------------------Configuration Includes-----------*/
#include "compile_switches.h"

/*-------------------Type Includes-------------------*/
#include "custom_types.h"

/*-------------------HW define Includes--------------*/

/*-------------------Driver Includes-----------------*/

/*-------------------Service Includes----------------*/
#include "ssi_handler.h"
/*------Export interface---Self header Includes------*/
#include "shift_register_handler.h"

/*-------------------Macro Definitions----------------*/

/*-------------------Function Definitions-------------*/
void Shift_Register_Init(void)
{
	SSI_shift_register_init();
}