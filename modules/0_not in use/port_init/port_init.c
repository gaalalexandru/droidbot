#include "tm4c123gh6pm.h"
#include "port_init.h"
#include "interrupt_handler.h"

void PortF_Init(void)
//PF0 and PF4 are input switches, configured for falling edge interrupt
//PF1 and PF3 LEDs will respound to this interrupt
//PF2 is set as GPIO Digital output, but not used at the moment
{ 
	volatile unsigned long delay;
  SYSCTL_RCGC2_R |= 0x00000020;			// 1) Enable F clock
  delay = SYSCTL_RCGC2_R;           // delay    
  GPIO_PORTF_LOCK_R = 0x4C4F434B;   // 2) unlock PortF PF0  
  GPIO_PORTF_CR_R |= 0x1F;          // allow changes to PF4-0       
  GPIO_PORTF_AMSEL_R &= 0x00;       // 3) disable analog function
  GPIO_PORTF_PCTL_R &= 0x00000000;  // 4) GPIO clear bit PCTL  
  GPIO_PORTF_DIR_R &= ~0x11;        // 5.1) PF4,PF0 input, clear bit 0 and 4 
  GPIO_PORTF_DIR_R |= 0x0E;         // 5.2) PF1,2,3 output, set bit 1, 2 and 3
  GPIO_PORTF_AFSEL_R &= ~0x1B;       // 6) no alternate function on bit 0,1,3,4 !!! Alternate function on bit 2 !!!
  GPIO_PORTF_PUR_R |= 0x11;         // enable pullup resistors on PF4,PF0       
  GPIO_PORTF_DEN_R |= 0x1F;         // 7) enable digital pins PF4-PF0
	
  GPIO_PORTF_IS_R &= ~0x11;     		// (d) PF4 and PF0 is edge-sensitive 				//IS = Input Sense => 0 configure the bit for edge trigering;
  GPIO_PORTF_IBE_R &= ~0x11;   			//     PF4 and PF0 is not both edges				//IBE = interrupt both edges => 0 for one edge; => 1 for bouth edges
  GPIO_PORTF_IEV_R &= ~0x11;   			//     PF4 and PF0 falling edge event				//IEV = Interrupt Event => 0 for falling edge; =>1 for rising edge

  GPIO_PORTF_ICR_R = 0x11;    		  // (e) clear flag4 and 0
  GPIO_PORTF_IM_R |= 0x11;   		    // (f) arm interrupt on PF4 and PF0					//IME Interrupt mask enable => 0 if busy - wait syncro;  =>1 if interrupt syncro (enable the interrupt syncro)
  NVIC_PRI7_R = (NVIC_PRI7_R&0xFF00FFFF)|0x00A00000; // (g) priority 5  				//0x00A00000 = 1010.0000 => 101 = 5 PRIORITY
  NVIC_EN0_R |= 0x40000000;      		// (h) enable interrupt, bit 30 in NVIC EN0
	
// LaunchPad built-in hardware:
// SW1 left switch is negative logic PF4 on the Launchpad
// SW2 right switch is negative logic PF0 on the Launchpad
// red LED connected to PF1 on the Launchpad
// blue LED connected to PF2 on the Launchpad
// green LED connected to PF3 on the Launchpad
}
