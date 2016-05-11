#line 1 "modules\\lcd_handler\\lcd_handler.c"


 
#line 1 ".\\modules\\compile_switches\\compile_switches.c"











 
#line 19 ".\\modules\\compile_switches\\compile_switches.c"

 



 
#line 31 ".\\modules\\compile_switches\\compile_switches.c"

 











 

 
#line 53 ".\\modules\\compile_switches\\compile_switches.c"





#line 5 "modules\\lcd_handler\\lcd_handler.c"

 
#line 1 ".\\modules\\custom_types\\custom_types.h"



 
typedef struct mtr_prm_st
{
	char right_motor_DC;
	char left_motor_DC;
	char motor_direction;		
} motor_parameters_st;

typedef enum LCD_typeOfWrite
{
  COMMAND,                              
  DATA                                  
} LCD_typeOfWrite_en;

















typedef enum Motor_Mode
{
  IN_IN,
  PHASE_ENABLE
} Motor_Mode_en;

typedef enum Led_State
{
  Right_Feedback_Off,
	Right_Feedback_On,
	Left_Feedback_Off,
	Left_Feedback_On,
	Center_Feedback_Off,
	Center_Feedback_On
} Led_State_en;



#line 8 "modules\\lcd_handler\\lcd_handler.c"

 
 
 
#line 1 ".\\modules\\gpio_handler\\gpio_handler.h"



 
#line 6 ".\\modules\\gpio_handler\\gpio_handler.h"
 
void GPIO_Light_sensor_init(void);
void GPIO_Red_led_init(void);
void GPIO_Red_led_toggle(void);
void GPIO_lcd_init(void);
void GPIO_lcd_DC(unsigned char DC);
void GPIO_lcd_RST(unsigned char RST);
void GPIO_motor_mode_select(Motor_Mode_en mode);

void GPIO_LS_Feedback_Init(void);	
void GPIO_LS_Feedback_Toogle(Led_State_en State);
#line 13 "modules\\lcd_handler\\lcd_handler.c"
#line 1 ".\\modules\\ssi_handler\\ssi_handler.h"




void SSI_lcd_init(void);
void SSI_lcd_write(unsigned char message);

#line 14 "modules\\lcd_handler\\lcd_handler.c"
#line 1 ".\\modules\\resources\\resources.h"







static const unsigned char res_Longhorn1[] = {
  0x08, 0x08, 0x08, 0x08, 0x08, 0x18, 0x18, 0x18, 0x38, 0x30, 0x30, 0x30, 0x70, 0xF0,
  0xE0, 0xC0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0xE0, 0xE0, 0xF0, 0x70,
  0x70, 0x30, 0x30, 0x18, 0x18, 0x18, 0x18, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x03, 0x03, 0x03, 0x07, 0x0F, 0x0E, 0x0C, 0x1C, 0x38, 0x38, 0xB8, 0xF8, 0xF0,
  0xF0, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8,
  0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xE0, 0xE0, 0xF0, 0xF0, 0xF0,
  0xF0, 0x78, 0x38, 0x3C, 0x1C, 0x1F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0F, 0x0F, 0x0F, 0x0F,
  0x0F, 0x07, 0x07, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x0F, 0x1F, 0x1F, 0x1F, 0x1F,
  0x1F, 0x1F, 0x1E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x0B, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x07, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0x7F, 0x3F, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};


static const unsigned char res_Longhorn2[] = {
  0x08, 0x08, 0x08, 0x08, 0x08, 0x18, 0x18, 0x18, 0x38, 0x30, 0x30, 0x30, 0x70, 0xF0,
  0xE0, 0xC0, 0xC0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xC0, 0xE0, 0xE0, 0xF0, 0x70,
  0x70, 0x30, 0x30, 0x18, 0x18, 0x18, 0x18, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00,
  0xF0, 0x08, 0x04, 0x24, 0x24, 0xE4, 0x24, 0x24, 0x04, 0x04, 0x04, 0x04, 0x04, 0x08,
  0xF1, 0x03, 0x03, 0x03, 0x07, 0x0F, 0x0E, 0x0C, 0x1C, 0x38, 0x38, 0xB8, 0xF8, 0xF0,
  0xF0, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8,
  0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xE0, 0xE0, 0xF0, 0xF0, 0xF0,
  0xF0, 0x78, 0x38, 0x3C, 0x1C, 0x1F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xFF, 0x00, 0x00, 0x04, 0x04, 0x07, 0x84, 0x44, 0x40, 0x80, 0x40, 0x40, 0x80, 0x00,
  0x00, 0x01, 0x02, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0F, 0x0F, 0x0F, 0x0F,
  0x0F, 0x07, 0x07, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x0F, 0x1F, 0x1F, 0x1F, 0x1F,
  0x1F, 0x1F, 0x1E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x0B, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x84, 0x88, 0x84, 0x02, 0x01, 0x00,
  0x00, 0x80, 0x00, 0x00, 0x01, 0x82, 0x84, 0x84, 0x84, 0x04, 0x04, 0x84, 0x04, 0x04,
  0x84, 0x08, 0x10, 0xE0, 0x00, 0x01, 0x07, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0x1F, 0x07, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x0F, 0x10, 0x20, 0x40, 0x80, 0x80, 0x80, 0x80, 0x88, 0x88, 0x8A, 0x85, 0x80, 0x80,
  0x89, 0x8F, 0x88, 0x80, 0x80, 0x83, 0x82, 0x82, 0x8F, 0x80, 0x80, 0x8F, 0x82, 0x85,
  0x88, 0x80, 0x80, 0x8F, 0x50, 0x20, 0x00, 0x3C, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0x7F, 0x3F, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};


static const unsigned char res_welcome_img[] = {
  0x00, 0x00, 0x00, 0x00, 0xFC, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x44, 0xA4,
  0x24, 0x18, 0x00, 0x00, 0xF8, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x00, 0x00,
  0xFC, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0xFC, 0x24, 0x24, 0x24, 0xD8, 0x00, 0x00,
  0xF8, 0x04, 0x04, 0x04, 0xF8, 0x00, 0x00, 0x04, 0x04, 0xFC, 0x04, 0x04, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x60, 0x80, 0x00, 0x80, 0x60, 0x00, 0x00, 0x40, 0xE0, 0x00,
  0x00, 0x00, 0x00, 0x00, 0xC0, 0x40, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x03, 0x02, 0x02, 0x02, 0x01, 0x00, 0x00, 0x03, 0x00, 0x00,
  0x01, 0x02, 0x00, 0x00, 0x01, 0x02, 0x02, 0x02, 0x01, 0x00, 0x00, 0x03, 0x00, 0x00,
  0x03, 0x02, 0x02, 0x02, 0x01, 0x00, 0x80, 0x43, 0x42, 0x22, 0x22, 0xB1, 0x90, 0x90,
  0x91, 0x92, 0x32, 0x22, 0x21, 0x40, 0x40, 0x80, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0xC0, 0x38, 0x06, 0x61, 0x10, 0x52, 0x52, 0x03, 0x01, 0x01, 0x00, 0x00,
  0x00, 0x01, 0x01, 0x03, 0x02, 0x52, 0x50, 0x10, 0x61, 0x06, 0x38, 0xE0, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0xFF, 0x02, 0x42, 0x22, 0xF2, 0x22, 0x32, 0x22, 0xB2, 0xA2, 0x32, 0x23,
  0x32, 0x22, 0x32, 0x22, 0x32, 0x22, 0x32, 0xE2, 0x22, 0x92, 0x02, 0xFF, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x80,
  0x80, 0x00, 0xFF, 0x00, 0x92, 0x49, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x21, 0x12,
  0x0C, 0x30, 0xC0, 0x80, 0x80, 0x00, 0x00, 0xFF, 0x49, 0x24, 0x00, 0xFF, 0x00, 0x80,
  0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x40, 0x40, 0x40,
  0x5E, 0x0C, 0x1F, 0x10, 0x14, 0x12, 0x13, 0x16, 0x12, 0x16, 0x12, 0x16, 0x12, 0x16,
  0x12, 0x16, 0x12, 0x16, 0x12, 0x16, 0x12, 0x17, 0x12, 0x11, 0x10, 0x1F, 0x0C, 0x5E,
  0x40, 0x40, 0x40, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};



static const char ASCII[][5] = {
  {0x00, 0x00, 0x00, 0x00, 0x00} 
  ,{0x00, 0x00, 0x5f, 0x00, 0x00} 
  ,{0x00, 0x07, 0x00, 0x07, 0x00} 
  ,{0x14, 0x7f, 0x14, 0x7f, 0x14} 
  ,{0x24, 0x2a, 0x7f, 0x2a, 0x12} 
  ,{0x23, 0x13, 0x08, 0x64, 0x62} 
  ,{0x36, 0x49, 0x55, 0x22, 0x50} 
  ,{0x00, 0x05, 0x03, 0x00, 0x00} 
  ,{0x00, 0x1c, 0x22, 0x41, 0x00} 
  ,{0x00, 0x41, 0x22, 0x1c, 0x00} 
  ,{0x14, 0x08, 0x3e, 0x08, 0x14} 
  ,{0x08, 0x08, 0x3e, 0x08, 0x08} 
  ,{0x00, 0x50, 0x30, 0x00, 0x00} 
  ,{0x08, 0x08, 0x08, 0x08, 0x08} 
  ,{0x00, 0x60, 0x60, 0x00, 0x00} 
  ,{0x20, 0x10, 0x08, 0x04, 0x02} 
  ,{0x3e, 0x51, 0x49, 0x45, 0x3e} 
  ,{0x00, 0x42, 0x7f, 0x40, 0x00} 
  ,{0x42, 0x61, 0x51, 0x49, 0x46} 
  ,{0x21, 0x41, 0x45, 0x4b, 0x31} 
  ,{0x18, 0x14, 0x12, 0x7f, 0x10} 
  ,{0x27, 0x45, 0x45, 0x45, 0x39} 
  ,{0x3c, 0x4a, 0x49, 0x49, 0x30} 
  ,{0x01, 0x71, 0x09, 0x05, 0x03} 
  ,{0x36, 0x49, 0x49, 0x49, 0x36} 
  ,{0x06, 0x49, 0x49, 0x29, 0x1e} 
  ,{0x00, 0x36, 0x36, 0x00, 0x00} 
  ,{0x00, 0x56, 0x36, 0x00, 0x00} 
  ,{0x08, 0x14, 0x22, 0x41, 0x00} 
  ,{0x14, 0x14, 0x14, 0x14, 0x14} 
  ,{0x00, 0x41, 0x22, 0x14, 0x08} 
  ,{0x02, 0x01, 0x51, 0x09, 0x06} 
  ,{0x32, 0x49, 0x79, 0x41, 0x3e} 
  ,{0x7e, 0x11, 0x11, 0x11, 0x7e} 
  ,{0x7f, 0x49, 0x49, 0x49, 0x36} 
  ,{0x3e, 0x41, 0x41, 0x41, 0x22} 
  ,{0x7f, 0x41, 0x41, 0x22, 0x1c} 
  ,{0x7f, 0x49, 0x49, 0x49, 0x41} 
  ,{0x7f, 0x09, 0x09, 0x09, 0x01} 
  ,{0x3e, 0x41, 0x49, 0x49, 0x7a} 
  ,{0x7f, 0x08, 0x08, 0x08, 0x7f} 
  ,{0x00, 0x41, 0x7f, 0x41, 0x00} 
  ,{0x20, 0x40, 0x41, 0x3f, 0x01} 
  ,{0x7f, 0x08, 0x14, 0x22, 0x41} 
  ,{0x7f, 0x40, 0x40, 0x40, 0x40} 
  ,{0x7f, 0x02, 0x0c, 0x02, 0x7f} 
  ,{0x7f, 0x04, 0x08, 0x10, 0x7f} 
  ,{0x3e, 0x41, 0x41, 0x41, 0x3e} 
  ,{0x7f, 0x09, 0x09, 0x09, 0x06} 
  ,{0x3e, 0x41, 0x51, 0x21, 0x5e} 
  ,{0x7f, 0x09, 0x19, 0x29, 0x46} 
  ,{0x46, 0x49, 0x49, 0x49, 0x31} 
  ,{0x01, 0x01, 0x7f, 0x01, 0x01} 
  ,{0x3f, 0x40, 0x40, 0x40, 0x3f} 
  ,{0x1f, 0x20, 0x40, 0x20, 0x1f} 
  ,{0x3f, 0x40, 0x38, 0x40, 0x3f} 
  ,{0x63, 0x14, 0x08, 0x14, 0x63} 
  ,{0x07, 0x08, 0x70, 0x08, 0x07} 
  ,{0x61, 0x51, 0x49, 0x45, 0x43} 
  ,{0x00, 0x7f, 0x41, 0x41, 0x00} 
  ,{0x02, 0x04, 0x08, 0x10, 0x20} 
  ,{0x00, 0x41, 0x41, 0x7f, 0x00} 
  ,{0x04, 0x02, 0x01, 0x02, 0x04} 
  ,{0x40, 0x40, 0x40, 0x40, 0x40} 
  ,{0x00, 0x01, 0x02, 0x04, 0x00} 
  ,{0x20, 0x54, 0x54, 0x54, 0x78} 
  ,{0x7f, 0x48, 0x44, 0x44, 0x38} 
  ,{0x38, 0x44, 0x44, 0x44, 0x20} 
  ,{0x38, 0x44, 0x44, 0x48, 0x7f} 
  ,{0x38, 0x54, 0x54, 0x54, 0x18} 
  ,{0x08, 0x7e, 0x09, 0x01, 0x02} 
  ,{0x0c, 0x52, 0x52, 0x52, 0x3e} 
  ,{0x7f, 0x08, 0x04, 0x04, 0x78} 
  ,{0x00, 0x44, 0x7d, 0x40, 0x00} 
  ,{0x20, 0x40, 0x44, 0x3d, 0x00} 
  ,{0x7f, 0x10, 0x28, 0x44, 0x00} 
  ,{0x00, 0x41, 0x7f, 0x40, 0x00} 
  ,{0x7c, 0x04, 0x18, 0x04, 0x78} 
  ,{0x7c, 0x08, 0x04, 0x04, 0x78} 
  ,{0x38, 0x44, 0x44, 0x44, 0x38} 
  ,{0x7c, 0x14, 0x14, 0x14, 0x08} 
  ,{0x08, 0x14, 0x14, 0x18, 0x7c} 
  ,{0x7c, 0x08, 0x04, 0x04, 0x08} 
  ,{0x48, 0x54, 0x54, 0x54, 0x20} 
  ,{0x04, 0x3f, 0x44, 0x40, 0x20} 
  ,{0x3c, 0x40, 0x40, 0x20, 0x7c} 
  ,{0x1c, 0x20, 0x40, 0x20, 0x1c} 
  ,{0x3c, 0x40, 0x30, 0x40, 0x3c} 
  ,{0x44, 0x28, 0x10, 0x28, 0x44} 
  ,{0x0c, 0x50, 0x50, 0x50, 0x3c} 
  ,{0x44, 0x64, 0x54, 0x4c, 0x44} 
  ,{0x00, 0x08, 0x36, 0x41, 0x00} 
  ,{0x00, 0x00, 0x7f, 0x00, 0x00} 
  ,{0x00, 0x41, 0x36, 0x08, 0x00} 
  ,{0x10, 0x08, 0x08, 0x10, 0x08} 

  ,{0x1f, 0x24, 0x7c, 0x24, 0x1f} 
};




#line 15 "modules\\lcd_handler\\lcd_handler.c"

 
#line 1 "modules\\lcd_handler\\lcd_handler.h"




 
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdbool.h"



#line 7 "modules\\lcd_handler\\lcd_handler.h"

 








































































































 

 
void LCD_init(void);
_Bool LCD_set_cursor(unsigned char xpos,unsigned char ypos);
void LCD_clear(void);
void LCD_out_char(unsigned char data);
void LCD_out_string(char *string);
void LCD_out_number(unsigned short number);
void LCD_out_image(const unsigned char *image);



#line 18 "modules\\lcd_handler\\lcd_handler.c"

 






 





void static LCD_write(LCD_typeOfWrite_en type, unsigned char message)
{
  if(type == COMMAND)
	{

		GPIO_lcd_DC(0);		
	}
	else
	{

		GPIO_lcd_DC(0x40);			
	}
	SSI_lcd_write(message);		
}












void LCD_init(void)
{
	volatile unsigned long delay;
	

	SSI_lcd_init();						
	GPIO_lcd_init();					

	GPIO_lcd_RST(0);	
	
  for(delay=0; delay<10; delay=delay+1);
	GPIO_lcd_RST(0x80); 

	LCD_write(COMMAND, 0x21);              
																				 
  LCD_write(COMMAND, (0xBA));      
	LCD_write(COMMAND, 0x04);              
  LCD_write(COMMAND, 0x14);              
	
  LCD_write(COMMAND, 0x20);              
  LCD_write(COMMAND, (0x0C));          
	
	LCD_clear();													 
}








_Bool LCD_set_cursor(unsigned char xpos, unsigned char ypos)
{
	if((xpos > 11) || (ypos > 5))	
	{        
		return 0;								
	}
	else
	{
		 
		LCD_write(COMMAND, 0x80|(xpos*7));     
		LCD_write(COMMAND, 0x40|ypos);         
		return 1;
	}
}






void LCD_clear(void)
{
	unsigned long index = 0;
  for(index = 0; index < (((84) * (48)) / 8); index++)
	{
    LCD_write(DATA, 0x00);
  }
	LCD_set_cursor(0,0);
}












void LCD_out_char(unsigned char data)
{
	unsigned long index = 0;
	for(index = 0; index <5; index++)
	{
		LCD_write(DATA, ASCII[data - 0x20][index]);
	}
	LCD_write(DATA, 0x00);
}








void LCD_out_string(char *string)
{
	while(*string) 						
	{
		LCD_out_char(*string);	
		string++;								
	}
}







void LCD_out_number(unsigned short number) 
{
  if(number < 10)
	{
    LCD_out_string("    "); 	
    LCD_out_char(number+'0');  
  }
	else if(number<100)
	{
		LCD_out_string("   ");		
    LCD_out_char(number / 10+'0');  
    LCD_out_char(number % 10+'0');  
	}
	else if(number<1000)
	{
    LCD_out_string("  ");		
    LCD_out_char(number / 100+'0');  
    number = number % 100;
    LCD_out_char(number / 10+'0');  
    LCD_out_char(number % 10+'0');  
  }
  else if(number<10000)
	{
    LCD_out_char(' ');
    LCD_out_char(number / 1000+'0');  
    number = number % 1000;
    LCD_out_char(number / 100+'0');  
    number = number % 100;
    LCD_out_char(number / 10+'0');  
    LCD_out_char(number % 10+'0');  
  }
  else
	{
    LCD_out_char(number/10000+'0');  
    number = number%10000;
    LCD_out_char(number/1000+'0');  
    number = number%1000;
    LCD_out_char(number/100+'0');  
    number = number%100;
    LCD_out_char(number/10+'0');  
    LCD_out_char(number%10+'0');  
  }
}






void LCD_out_image(const unsigned char *image)
{
	unsigned long index = 0;
	LCD_set_cursor(0,0);
	for(index = 0; index < (((84) * (48)) / 8); index++)
	{
		LCD_write(DATA, image[index]);
	}
}



