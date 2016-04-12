//gpio_handler.h
#ifndef GPIO_HDL
#define GPIO_HDL
/*-------------------Type Includes-------------------*/
#include "custom_types.h"
/*-------------------Function Definitions-------------*/
void GPIO_Light_sensor_init(void);
void GPIO_Red_led_init(void);
void GPIO_Red_led_toggle(void);
void GPIO_lcd_init(void);
void GPIO_lcd_DC(unsigned char DC);
void GPIO_lcd_RST(unsigned char RST);
void GPIO_motor_mode_select(Motor_Mode_en mode);

void GPIO_LS_Feedback_Init(void);	//LS = Light Sensor
void GPIO_LS_Feedback_Toogle(Led_State_en State);
#endif
