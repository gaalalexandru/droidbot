//main.c
//#include "tm4c123gh6pm.h"
/*-------------------Configuration Includes-----------*/
/*-------------------Type Includes--------------------*/
/*-------------------HW define Includes---------------*/
/*---------------------OS Includes--------------------*/
#include "os_core.h"
#include "os_hw.h"
/*-------------------Driver Includes------------------*/
/*-------------------Service Includes-----------------*/
#include "motion_handler.h"
#include "system_handler.h"
/*-------------------Macro Definitions----------------*/
/*-------------Global Variable Definitions------------*/
uint8_t GPIO_LS_needed = 0;
uint8_t GPIO_PF0_SW2_Pressed = 0;
uint8_t GPIO_PF4_SW1_Pressed = 0;
fifo_t FifoADC_Temp;

/*---------------------Task Definitions---------------*/
void Task0(void){	//Periodic task 10 ms
  while(1){
		OS_Wait(&PerTask[0].semaphore);
		CYCL_10_ms();
  }
}
void Task1(void){		//Periodic task 100 ms
  while(1){
		OS_Wait(&PerTask[1].semaphore);
		CYCL_100_ms();
  }
}
void Task2(void){		//Periodic task 1000 ms
  while(1){
		OS_Wait(&PerTask[2].semaphore);
		CYCL_1000_ms();
  }
}

void Task3(void){	 //response to task PF0
  while(1){
		OS_Wait(&SemPortF.pin0); // signaled in OS on button touch
		OS_Sleep(50); //sleep to debounce switch		
		if(!GPIOPinRead(GPIO_PORTF_BASE,GPIO_INT_PIN_0)) {
			//PF0 pressed, signal low level
			GPIO_PF0_SW2_Pressed = 1;
		}
		else {
			//PF0 released, signal high level
			GPIO_PF0_SW2_Pressed = 0;
		}
		OS_EdgeTrigger_Restart(PortF,GPIO_PIN_0);
	}
}

void Task4(void){	 //response to task PF4
  while(1){
		OS_Wait(&SemPortF.pin4); // signaled in OS on button touch
		OS_Sleep(50); //sleep to debounce switch		
		if(!GPIOPinRead(GPIO_PORTF_BASE,GPIO_INT_PIN_4)) {   
			//PF4 pressed, signal low level
			GPIO_PF4_SW1_Pressed = 1;
		}
		else {
			//PF4 released, signal high level
			GPIO_PF4_SW1_Pressed = 0;
		}
		OS_EdgeTrigger_Restart(PortF,GPIO_PIN_4);
	}
}

void Task5(void){	 //empty task
  while(1){
		//Idle
	}
}

void Task6(void){	 //empty task
	while(1){
		//Idle
	}
}

void Idle_Task(void){  //idle task
  while(1){
		//Idle
		Motion_Stop();
  }
}
/*-------------------Main program start---------------*/

int main(void)
{
	unsigned long clock1, clock2;
	OS_Init();  // initialize OS, clock and timers, disable interrupts
	//Profile_Init();  // enable digital I/O on profile pins
	Motion_Init();  //Initialize PWM output to motors, GPIO direction switches, ADC input of light sensors
	#if UART_Debug
		UART_Init();
	#endif	
	clock1 = SYS_clock_get;		//clock before modules initialized
	LCD_init();										//Initialize LCD	
	ADC_Temperature_sensor_init();//Initialize ADC for temperature sensor
	//Accelerometer_init();					//Initialize Accelerometer
	
	OS_FIFO_Init(&FifoADC_Temp);
	
	if(GPIO_LS_needed) {
		OS_InitSemaphore(&SemPortF.pin0,0);
		OS_InitSemaphore(&SemPortF.pin4,0);
		OS_EdgeTrigger_Init(PortF,GPIO_PIN_0|GPIO_PIN_4,Int_Prio_GPIO_PF_LightS,GPIO_LOW_LEVEL,GPIO_PIN_TYPE_STD_WPU);
	}
	//OS_EdgeTrigger_Init( port,  pin,  priority,  type, resistor)
		
	OS_AddPeriodicEventThread(&PerTask[0].semaphore, 10);
	OS_AddPeriodicEventThread(&PerTask[1].semaphore, 50);
	OS_AddPeriodicEventThread(&PerTask[2].semaphore, 1000);

  OS_AddThreads(&Task0, 1,  //Periodic task 10 ms
	              &Task1, 5,  //Periodic task 50 ms
	              &Task2, 50, //Periodic task 1000 ms
	              &Task3, 1,  //Event task GPIO PF0
	              &Task4, 1,  //Event task GPIO PF4
	              &Task5, 250, 	//empty task
	              &Task6, 250, 	//empty task
	              &Idle_Task,254);	//Idle task is lowest priority
	
  OS_Launch(BSP_Clock_GetFreq()/THREADFREQ);  // doesn't return, interrupts enabled in here
  return 0;  // this never executes	
}
