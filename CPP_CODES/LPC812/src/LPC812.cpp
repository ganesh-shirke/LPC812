#include "chip.h"

class LED
{
   private:
	  uint8_t pvt_pin_number;
   public:
      LED(uint8_t pin_number);
      int set_led(void);
      int clear_led(void);
      int toggle_led(void);
};

LED::LED(uint8_t pin_number)
{
	this->pvt_pin_number = pin_number;
	Chip_GPIO_Init(LPC_GPIO_PORT);
	Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT,0,this->pvt_pin_number);
}

int LED::set_led(void)
{
	Chip_GPIO_SetPinOutHigh(LPC_GPIO_PORT,0,this->pvt_pin_number);
	return 0;
}

int LED::clear_led(void)
{
	Chip_GPIO_SetPinOutLow(LPC_GPIO_PORT,0,this->pvt_pin_number);
	return 0;
}

int LED::toggle_led(void)
{
	Chip_GPIO_SetPinToggle(LPC_GPIO_PORT,0,this->pvt_pin_number);
	return 0;
}

LED red_led(7);
LED blue_led(16);

/*Main Function*/
int main(void) {

	red_led.clear_led();
	blue_led.set_led();

	/*Configure SysTick to tick at every 200msec*/
	SysTick_Config(4800000);

	while(1)
	{
		/*Do nothing*/
	}
    return 0 ;
}

extern "C" {
/*SysTick Event handler*/
void SysTick_Handler(void)
{
	/*Toggle LEDs at each timer tick*/
	red_led.toggle_led();
	blue_led.toggle_led();
}
}
