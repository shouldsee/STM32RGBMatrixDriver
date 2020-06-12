#ifndef __MATIRX_CONFIG_H
#define __MATIRX_CONFIG_H

// PB3/4 (MTX_PR0/MTX_PG0) are JTAG ports and need to be remapped

#define LED_PORT 	GPIOD
#define LED_P		GPIO_Pin_13
#define LED_RCCPB	RCC_AHB1Periph_GPIOD
// #define LED_CLOCKCMD(x) 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, x)


#define MTX_PORT	GPIOB
#define MTX_RCCPB	RCC_AHB1Periph_GPIOB
// #define MTX_CLOCKCMD(x)	RCC_AHB1PeriphClockCmd(RCC_APB2Periph_GPIOB, x)

#define MTX_PR0		GPIO_Pin_3
#define MTX_PG0		GPIO_Pin_4
#define MTX_PB0		GPIO_Pin_5

#define MTX_PR1		GPIO_Pin_6
#define MTX_PG1		GPIO_Pin_7
#define MTX_PB1		GPIO_Pin_8

#define MTX_PA		GPIO_Pin_12
#define MTX_PB		GPIO_Pin_13
#define MTX_PC		GPIO_Pin_14
#define MTX_PD		GPIO_Pin_15

#define MTX_PSTB	GPIO_Pin_0
#define MTX_POE		GPIO_Pin_1
#define MTX_PCLK	GPIO_Pin_9

#define DISP_ON         MTX_PORT->BSRRH = MTX_POE;
#define DISP_OFF        MTX_PORT->BSRRL = MTX_POE;
#define CLK_TOGGLE      MTX_PORT->BSRRL = MTX_PCLK; MTX_PORT->BSRRH = MTX_PCLK;
#define STROBE          MTX_PORT->BSRRL = MTX_PSTB; MTX_PORT->BSRRH = MTX_PSTB;

#define MATRIX_WIDTH    32
#define MATRIX_HEIGHT   32
#define MATRIX_SIZE     MATRIX_WIDTH*MATRIX_HEIGHT

#endif
