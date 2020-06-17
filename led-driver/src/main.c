
// #include "stm32f4xx_gpio.h"
// #include "stm32f4xx_rcc.h"
// #include "math.h"
// #include "stdlib.h"
// #include "main.h"
// #include "config_led_matrix.h"
#include <stdio.h>
#include "stm32f4xx.h"
#include "led_matrix.h"

int main() {

	led_clear_buffer(testBufferTranslated);
	initTestBuffer_line();
	matrix_init();
	setupRGBMatrixPorts();
	while(1){displayBuffer(testBufferTranslated);}
}