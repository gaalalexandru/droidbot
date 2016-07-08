#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_ints.h"
#include "inc/hw_i2c.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/i2c.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/timer.h"
#include "driverlib/uart.h"
#include "utils/uartstdio.h"

uint32_t g_ui32Flags;

#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

void Timer0IntHandler(void)
{
char cOne, cTwo;
ROM_TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
HWREGBITW(&g_ui32Flags, 0) ^= 1;
GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, g_ui32Flags << 1);
ROM_IntMasterDisable();
cOne = HWREGBITW(&g_ui32Flags, 0) ? '1' : '0';
cTwo = HWREGBITW(&g_ui32Flags, 1) ? '1' : '0';
UARTprintf("\rT1: %c T2: %c", cOne, cTwo);
ROM_IntMasterEnable();
}
void Timer1IntHandler(void)
{
char cOne, cTwo;
ROM_TimerIntClear(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
HWREGBITW(&g_ui32Flags, 1) ^= 1;
GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, g_ui32Flags << 1);
ROM_IntMasterDisable();
cOne = HWREGBITW(&g_ui32Flags, 0) ? '1' : '0';
cTwo = HWREGBITW(&g_ui32Flags, 1) ? '1' : '0';
UARTprintf("\rT1: %c T2: %c", cOne, cTwo);
ROM_IntMasterEnable();
}
void ConfigureUART(void)
{
ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);
UARTStdioConfig(0, 9600, 16000000);
}

#define MMA_7455_ADDRESS 0x1D //I2C Adsress for the sensor
#define MMA_7455_MODE_CONTROLL 0x16 //Call the sensors Mode Control

#define MMA_7455_2G_MODE 0x05 //Set Sensitivity to 2g
#define MMA_7455_4G_MODE 0x09 //Set Sensitivity to 4g
#define MMA_7455_8G_MODE 0x01 //Set Sensitivity to 8g

#define X_OUT 0x06 //Register for reading the X-Axis
#define Y_OUT 0x07 //Register for reading the Y-Axis
#define Z_OUT 0x08 //Register for reading the Z-Axis

int main(void)
{
uint32_t pui32DataTx[1];
uint32_t pui32DataRx[1];
uint32_t data=7;

SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);

SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);

SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);

GPIOPinConfigure(GPIO_PB2_I2C0SCL);
GPIOPinConfigure(GPIO_PB3_I2C0SDA);

GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_2);
I2CMasterInitExpClk(I2C0_BASE, SysCtlClockGet(), false);
I2CSlaveEnable(I2C0_BASE);

//In loopback mode, it's an arbitrary 7-bit number
I2CSlaveInit(I2C0_BASE, MMA_7455_ADDRESS);
HWREG(I2C0_BASE + I2C_O_MCR) |= 0x01;

ConfigureUART();
UARTprintf("welcome\n");

I2CMasterSlaveAddrSet(I2C0_BASE, MMA_7455_ADDRESS, true);

while(1)
{
pui32DataTx[0] =X_OUT;
UARTprintf("Transferring from: Master -> Slave\n");

I2CSlaveDataPut(I2C0_BASE, pui32DataTx[0]);
I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE);
UARTprintf("TX: %d\t", pui32DataTx[0]);

while(!(I2CSlaveStatus(I2C0_BASE) & I2C_SLAVE_ACT_TREQ))
{
}

pui32DataRx[0] = I2CMasterDataGet(I2C0_BASE);
UARTprintf("RX: %d\t", pui32DataRx[0]);

UARTprintf("data: %d\t", data);

while(I2CMasterBusy(I2C0_BASE))
{
}
data++;
}
}