/*
===============================================================================
 Name        : main.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/

#include "chip.h"

#define RED_LED 7
#define BLUE_LED 16

/*Main Function*/
int main(void) {

	/*Enable GPIO peripheral clock*/
	Chip_GPIO_Init(LPC_GPIO_PORT);

	/*Set Pin Direction as output*/
	Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT,0,RED_LED);
	Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT,0,BLUE_LED);

	/*Make Pin High*/
	Chip_GPIO_SetPinOutHigh(LPC_GPIO_PORT,0,RED_LED);

	/*Make Pin Low*/
	Chip_GPIO_SetPinOutLow(LPC_GPIO_PORT,0,BLUE_LED);

	/*Configure SysTick to tick at every 200msec*/
	SysTick_Config(4800000);

	while(1)
	{
		/*Do nothing*/
	}
    return 0 ;
}

/*SysTick Event handler*/
void SysTick_Handler(void)
{
	/*Toggle LEDs at each timer tick*/
	Chip_GPIO_SetPinToggle(LPC_GPIO_PORT,0,RED_LED);
	Chip_GPIO_SetPinToggle(LPC_GPIO_PORT,0,BLUE_LED);
}
