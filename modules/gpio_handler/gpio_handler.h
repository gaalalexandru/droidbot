//gpio_handler.h
#ifndef GPIO_HDL
#define GPIO_HDL

/*-------------------Function Definitions-------------*/
void GPIO_Light_sensor_init(void);
void GPIO_Red_led_init(void);
void GPIO_Red_led_toggle(void);
void GPIO_lcd_init(void);
void GPIO_lcd_DC(unsigned char DC);
void GPIO_lcd_RST(unsigned char RST);

#endif
