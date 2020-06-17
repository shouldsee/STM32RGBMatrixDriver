/**
 *	USB VCP for STM32F4xx example.
 *    
 *	@author		Tilen MAJERLE
 *	@email		tilen@majerle.eu
 *	@website	http://stm32f4-discovery.net
 *	@ide		Keil uVision
 *	@packs		STM32F4xx Keil packs version 2.2.0 or greater required
 *	@stdperiph	STM32F4xx Standard peripheral drivers version 1.4.0 or greater required
 *
 * Add line below to use this example with F429 Discovery board (in defines.h file)
 *
 * #define USE_USB_OTG_HS
 *
 * Before compile in Keil, select your target, I made some settings for different targets
 */
#include "tm_stm32f4_usb_vcp.h"
#include "tm_stm32f4_disco.h"
#include "defines.h"
 
#include <stdio.h>
#include "stm32f4xx.h"
#include "led_matrix.h"


int waitCycles(int wait){
    for(;wait>0;wait--){};
    return 0;
}


int main(void) {
    // uint8_t c;
    char c[100];
    /* System Init */
    /* Initialize LED's. Make sure to check settings for your board in tm_stm32f4_disco.h file */
    SystemInit();    
    TM_DISCO_LedInit();

    led_clear_buffer(testBufferTranslated);
    initTestBuffer_line();
    matrix_init();
    setupRGBMatrixPorts();

    /* Initialize USB VCP */ 

    // Led Red lights up during initialisation  
    TM_DISCO_LedOn(LED_RED);
    TM_USB_VCP_Init();
    TM_DISCO_LedOff(LED_RED);

    while (1) {
        displayBuffer(testBufferTranslated);
        // continue;
        // while(1)
        {
            int out = TM_USB_VCP_GetStatus();
            /* USB configured OK, drivers OK */
            if ( out == TM_USB_VCP_CONNECTED) {            
                /* Turn on GREEN led */
                TM_DISCO_LedOff(LED_BLUE);
                TM_DISCO_LedOn(LED_GREEN);
                /* If something arrived at VCP */
                // if (TM_USB_VCP_Gets(&c[0], 100) == TM_USB_VCP_DATA_OK) {
                if (TM_USB_VCP_Gets(&c[0], 100) !=0) {
                    /* Return data back */
                    // if(c=="hi"){
                    char pre[] = "hi";
                    if( strncmp(pre, c, strlen(pre)) == 0){
                        led_clear_buffer(&testBufferTranslated[0]);
                        testBufferTranslated[0] = X;
                        testBufferTranslated[1] = X;
                        testBufferTranslated[2] = X;
                        // displayBuffer(testBufferTranslated);
                    }else{
                        initTestBuffer();
                    }
                    TM_USB_VCP_Puts(&c[0]);
                    // TM_USB_VCP_Putc(c[0]);
                    TM_DISCO_LedOn(LED_ORANGE);
                    // waitCycles(1000);
                }else{
                    TM_DISCO_LedOff(LED_ORANGE);
                    // break;
                }
            } else {
                /* USB not OK */
                TM_DISCO_LedOn(LED_BLUE);
                TM_DISCO_LedOff(LED_GREEN);
                // break;
                // TM_USB_VCP_Init();
                // TM_DISCO_LedOff(LED_BLUE);
            }
        }

    }
}
