//can_handler.c
//Service layer
/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
/*-------------------Driver Includes-----------------*/
#include "driverlib/can.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
/*-------------------Self header Includes------------*/
#include "can_handler.h"
/*-------------------Service Includes----------------*/
/*-------------Global Variable Definitions------------*/
/*-------------------Function Definitions-------------*/
void CAN_init(void)
{
	SysCtlPeripheralEnable(CAN0_BASE);						//PWM enable 
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);	//Port E enable
	
	GPIOPinConfigure(GPIO_PE4_CAN0RX);						//Configure PF2, Right motor
	GPIOPinConfigure(GPIO_PE5_CAN0TX);						//Configure PF3, Left motor
	GPIOPinTypeCAN(GPIO_PORTE_BASE, GPIO_PIN_4);	//Set PWM for PF2, Right motor
	GPIOPinTypeCAN(GPIO_PORTE_BASE, GPIO_PIN_5);	//Set PWM for PF3, Left motor
	
	CANInit(CAN0_BASE);	//Initializes the CAN controller after reset.
	CANEnable(CAN0_BASE);
	
}
//EOF
/*
To use the CAN controller, the peripheral clock must be enabled using the RCGC0 register (see page 456). 
In addition, the clock to the appropriate GPIO module must be enabled via the RCGC2 register (see page 464).
To find out which GPIO port to enable, refer to Table 23-4 on page 1344.

Set the GPIO AFSEL bits for the appropriate pins (see page 671). 
Configure the PMCn fields in the GPIOPCTL register to assign the CAN signals to the appropriate pins. 
See page 688 and Table 23-5 on page 1351.

Software initialization is started by setting the INIT bit in the CAN Control (CANCTL) register (with
software or by a hardware reset) or by going bus-off, which occurs when the transmitter's error
counter exceeds a count of 255.

While INIT is set, all message transfers to and from the CAN bus are stopped and the CANnTX signal is held High. 
Entering the initialization state does not change the configuration of the CAN controller,
the message objects, or the error counters.

However, some configuration registers are only accessible while in the initialization state.
To initialize the CAN controller, set the CAN Bit Timing (CANBIT) register and configure each
message object. 

If a message object is not needed, label it as not valid by clearing the MSGVAL bit
in the CAN IFn Arbitration 2 (CANIFnARB2) register. Otherwise, the whole message object must
be initialized, as the fields of the message object may not have valid information, causing unexpected results.

Both the INIT and CCE bits in the CANCTL register must be set in order to access the
CANBIT register and the CAN Baud Rate Prescaler Extension (CANBRPE) register to configure
the bit timing. To leave the initialization state, the INIT bit must be cleared. Afterwards, the internal
Bit Stream Processor (BSP) synchronizes itself to the data transfer on the CAN bus by waiting for
the occurrence of a sequence of 11 consecutive recessive bits (indicating a bus idle condition)
before it takes part in bus activities and starts message transfers. Message object initialization does
not require the CAN to be in the initialization state and can be done on the fly. However, message
objects should all be configured to particular identifiers or set to not valid before message transfer
starts. To change the configuration of a message object during normal operation, clear the MSGVAL
bit in the CANIFnARB2 register to indicate that the message object is not valid during the change.
When the configuration is completed, set the MSGVAL bit again to indicate that the message object
is once again valid.
*/
