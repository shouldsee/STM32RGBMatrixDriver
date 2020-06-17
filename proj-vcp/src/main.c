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
 
int waitCycles(int wait){
    for(;wait>0;wait--){};
    return 0;
}


int main(void) {
    uint8_t c;
    /* System Init */
    SystemInit();    
    /* Initialize LED's. Make sure to check settings for your board in tm_stm32f4_disco.h file */
    TM_DISCO_LedInit();
    /* Initialize USB VCP */ 

    // Led Red lights up during initialisation  
    TM_DISCO_LedOn(LED_RED);
    TM_USB_VCP_Init();
    TM_DISCO_LedOff(LED_RED);
    
    while (1) {
        int out = TM_USB_VCP_GetStatus();
        /* USB configured OK, drivers OK */
        if ( out == TM_USB_VCP_CONNECTED) {            
            /* Turn on GREEN led */
            TM_DISCO_LedOff(LED_BLUE);
            TM_DISCO_LedOn(LED_GREEN);
            /* If something arrived at VCP */
            if (TM_USB_VCP_Getc(&c) == TM_USB_VCP_DATA_OK) {
                /* Return data back */
                TM_USB_VCP_Putc(c);
                TM_DISCO_LedOn(LED_ORANGE);
                // waitCycles(1000);
            }else{
                TM_DISCO_LedOff(LED_ORANGE);
            }
        } else {
            /* USB not OK */
            TM_DISCO_LedOn(LED_BLUE);
            TM_DISCO_LedOff(LED_GREEN);
            // TM_USB_VCP_Init();
            // TM_DISCO_LedOff(LED_BLUE);
        }
    }
}
