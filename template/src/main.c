#include <stdio.h>
#include "stm32f4xx.h"
// #include "stm32f4xx_gpio.h"
// #include "stm32f4xx_rcc.h"
#include "math.h"
#include "string.h"
#include "stdlib.h"
#include "main.h"
#include "matrix_config.h"

const int waits[] = { 5, 10, 20, 40, 80, 160, 320, 640 };
// const int scan = MATRIX_HEIGHT / 2;
// int scan = MATRIX_HEIGHT / 2;
#define SCAN_ROWS 4
uint8_t gammaTable[256];
uint32_t bufferA[MATRIX_SIZE];
uint32_t bufferB[MATRIX_SIZE];
uint32_t birthRate = 0;

// ----- Timing definitions -------------------------------------------------

void WaitaMoment (int time)
{
for (; time > 0; time--);
}

int display_test_scan(int j){
	j = (j+1)%3;
	int L = sizeof(bufferA)/ sizeof(bufferA[0]);
	for (int i=0; i< L ; i++){
		if (i==0){
		bufferA[L-1]=0;
		}else{
		bufferA[i-1]=0;
		}
		if (j==0){
			bufferA[i] = 0x0050;
		}else if(j==1){
			bufferA[i] = 0x5000;
		}else if(j==2){
			bufferA[i] = 0x500000;
			// bufferA[i] = 0x505050;
		}
		for (int j=0; j<5; j++) displayBuffer(bufferA);
		// showLine(10000000);
	}
	return j;
}

int main() {

	// RCC -> AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	// GPIOD -> MODER |= GPIO_MODER_MODER14_0;
	// GPIOD -> OTYPER &= ~ (GPIO_OTYPER_OT_14);
	// GPIOD -> OSPEEDR |= GPIO_OSPEEDER_OSPEEDR14;
	// GPIOD -> PUPDR &= ~ (GPIO_PUPDR_PUPDR14);

	// GPIOD -> BSRRL = GPIO_BSRR_BS_14;
	// LED_PORT->BSRRL = LED_P;
	// GPIOD -> BSRRH = GPIO_BSRR_BS_14;

	matrix_init();
	setupRGBMatrixPorts();

	// precalculate the gamma lookup table
	for (int i=0; i < 256; i++) gammaTable[i] = 255 * pow((i / 256.0), 1.6);

	// clear framebuffers
	memset(bufferA, 0, sizeof(bufferA));
	memset(bufferB, 0, sizeof(bufferB));


	// test animation. showing the scanning pattern 
	int j=-1;
	while(1){ j = display_test_scan(j);}


	LED_PORT->BSRRL = LED_P;

	uint32_t* currentBuffer = bufferA;
	uint32_t* srcBuffer = bufferA;
	uint32_t* dstBuffer = bufferB;
	randomizeFramebuffer(currentBuffer);

	int frame = 0;
	while (1) {
		displayBuffer(currentBuffer);
		birthRate  = 0;
		int simRun = 0;

		if (++frame % 5 == 0)	{
			simRun = 1;
			processBuffer(srcBuffer,dstBuffer);

			currentBuffer = srcBuffer;
			srcBuffer     = dstBuffer;
			dstBuffer     = currentBuffer;
			currentBuffer = srcBuffer;
		}
		if (frame % 4000 == 0 || (birthRate < 10 && simRun == 1)) {
			randomizeFramebuffer(currentBuffer);
			LED_PORT->ODR ^= LED_P;
		}
	}
}

/**
 * Displays the buffer on the display using binary encoding (PWM equivalent).
 */

void displayBuffer(uint32_t buffer[]) {
	// GPIOE->BSRRH = MTX_PSTB;
	for (int s=0; s<SCAN_ROWS; s++){
	// for (int s=scan-1; s>-1; s--){
		// s = scan-1-s;
		setRow(s);
		// scan -1 -s);
		int offset1 = MATRIX_WIDTH * 2 * s;
		int offset2 = MATRIX_WIDTH * 2 * (s+SCAN_ROWS);
		// STROBE;
		for (int plane=0; plane < 8; plane ++) {

			for (int x=0; x<MATRIX_WIDTH * 2; x++) {
				// setRGB( buffer[offset1+x], buffer[offset2+x], plane);
				setRGB( buffer[offset1+x],  buffer[offset2+x], plane);
				CLK_TOGGLE;

			}

			// for (int x=0; x<32; x++) {
			// 	CLK_TOGGLE;
			// }


			// for (int x= 33; x<36; x++) {
			// 	setRGB( buffer[offset1+x], buffer[offset2+x], plane);
			// 	CLK_TOGGLE;
			// }

			// int amount = waits[plane];
			// // int amount = 10;
			// STROBE;
			// DISP_ON;
			// for (int c=0; c<amount; c++) __ASM("nop");
			// DISP_OFF;			
			showLine(waits[plane]);
		}
	}
	// GPIOE->BSRRH = MTX_PSTB;
	// GPIOE->BSRRL = MTX_PSTB;
}


/**
 * sets the row on the row gpio ports
 */
void setRow(int row) {
	// todo: perhaps a lookup table could give us a tiny boost here.
	if (row & 0b0001) GPIOE->BSRRL = MTX_PA;
	else GPIOE->BSRRH = MTX_PA;

	if (row & 0b0010) GPIOE->BSRRL = MTX_PB;
	else GPIOE->BSRRH = MTX_PB;

	if (row & 0b0100) GPIOE->BSRRL = MTX_PC;
	else GPIOE->BSRRH = MTX_PC;

	if (row & 0b1000) GPIOE->BSRRL = MTX_PD;
	else GPIOE->BSRRH = MTX_PD;
}

/**
 * loads rgb1 and rgb2 gpio ports with the given bitplane
 */
void setRGB(uint32_t rgb1, uint32_t rgb2, uint8_t plane) {
	// using bitshifting seems to be faster due to gcc optimization
	// than using a bitmask lookup table here.

	if (rgb1 & (1 << plane))        MTX_PORT->BSRRL = MTX_PR0;
	else                            MTX_PORT->BSRRH = MTX_PR0;

	if (rgb1 & (1 << (plane + 8))) 	MTX_PORT->BSRRL = MTX_PG0;
	else                            MTX_PORT->BSRRH = MTX_PG0;

	if (rgb1 & (1 << (plane + 16))) MTX_PORT->BSRRL = MTX_PB0;
	else                            MTX_PORT->BSRRH = MTX_PB0;

	if (rgb2 & (1 << plane))        MTX_PORT->BSRRL = MTX_PR1;
	else                            MTX_PORT->BSRRH = MTX_PR1;

	if (rgb2 & (1 << (plane + 8))) 	MTX_PORT->BSRRL = MTX_PG1;
	else                            MTX_PORT->BSRRH = MTX_PG1;

	if (rgb2 & (1 << (plane + 16))) MTX_PORT->BSRRL = MTX_PB1;
	else                            MTX_PORT->BSRRH = MTX_PB1;
}


/**
 * strobes / shows a line for a n*nop amount of time.
 */
void showLine(int amount) {
	STROBE;
	DISP_ON;
	for (int c=0; c<amount; c++) __ASM("nop");
	DISP_OFF;
}

/**
 * generates some random junk for testing on the framebuffer.
 */
void randomizeFramebuffer(uint32_t buffer[]) {

	for (int i = 0; i < MATRIX_SIZE; i++) {
		buffer[i] = 0x00
			| ((gammaTable[rand() % 255]) << 0)
			| ((gammaTable[rand() % 255]) << 8)
			| ((gammaTable[rand() % 255]) << 16)
			| ((rand() % 255) << 24);
	}
}

void processBuffer(uint32_t src[], uint32_t dst[]){
	// apply GOL rules on src and store result in dst.
	for (int i=0; i<MATRIX_SIZE; i++){
		CellAction action = analyzeCell(i,src);
		if (COPY == action ){
			dst[i] = src[i];
		}
		else if (NEW == action ){
			dst[i] = ((gammaTable[rand() % 255]) << 0) | ((gammaTable[rand() % 255]) << 8) | ((gammaTable[rand() % 255]) << 16) | ((1) << 24);
			birthRate++;
		}
		else if (KILL == action ){
			dst[i] = 0x00ffffff & src[i];
		}
	}

	// fade out dead cells
	for (int i=0; i<MATRIX_SIZE; i++){
		if (! (0x01000000 & dst[i]) ){
			dst[i] =  (((dst[i]       & 0x000000ff) >> 1))       |
	              (((dst[i] >> 8  & 0x000000ff) >> 1) << 8)  |
	              (((dst[i] >> 16 & 0x000000ff) >> 1) << 16);
		}
	}
}

CellAction analyzeCell(int offset, uint32_t buffer[]){
	// skip the first row, first column, last column and last row to make alive neighbor
	// detection easier.
	if ( ( offset    < MATRIX_WIDTH) ||
	     ( offset    > MATRIX_SIZE - MATRIX_WIDTH ) ||
	     ( offset    % MATRIX_WIDTH == 0) ||
	     ((offset+1) % MATRIX_WIDTH == 0)) return KILL;

	int neighbors = 0;
	int alive = buffer[offset] & 0x01000000;

	if (buffer[offset-1] & 0x1000000) neighbors ++;
	if (buffer[offset+1] & 0x1000000) neighbors ++;

	offset -= MATRIX_WIDTH;
	if (buffer[offset-1] & 0x1000000) neighbors ++;
	if (buffer[offset]   & 0x1000000) neighbors ++;
	if (buffer[offset+1] & 0x1000000) neighbors ++;

	offset += MATRIX_WIDTH*2;
	if (buffer[offset-1] & 0x1000000) neighbors ++;
	if (buffer[offset]   & 0x1000000) neighbors ++;
	if (buffer[offset+1] & 0x1000000) neighbors ++;

	return (neighbors < 2) ? KILL :
	       (alive && (neighbors == 2 || neighbors == 3)) ? COPY :
	       (neighbors > 3) ? KILL :
	       (!alive && neighbors == 3) ? NEW :
	       COPY;
}

void matrix_init(){
	static GPIO_InitTypeDef GPIO_InitStructure;
	// GPIO_CONTROL_CLOCKCMD(ENABLE);
	RCC_AHB1PeriphClockCmd( RCC_CONTROL, ENABLE);                        // enable LED GPIO port

	//Pinmode
	GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Speed = GPIO_High_Speed;
	//For control, only row and control pins
	GPIO_InitStructure.GPIO_Pin   = MTX_PA | MTX_PB | MTX_PC | MTX_PD;
	GPIO_Init(GPIO_CONTROL, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = MTX_PSTB | MTX_POE | MTX_PCLK;      // Strobe, OutputEnable, Clock
	GPIO_Init(GPIO_CONTROL, &GPIO_InitStructure);
	// GPIO_InitStructure.GPIO_Pin = (((int)(8 - 1))<<2)|GPIO_Pin_STB;
	// GPIO_InitStructure.GPIO_Pin = (uint16_t)(0x111100)|GPIO_Pin_STB;

}


void setupRGBMatrixPorts() {
	static GPIO_InitTypeDef GPIO_InitStructure;
	RCC_AHB1PeriphClockCmd(MTX_RCCPB, ENABLE);                        // enable matrix GPIO port
	RCC_AHB1PeriphClockCmd(LED_RCCPB, ENABLE);                        // enable LED GPIO port
	// RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);              // enable AFIO module, needed to release (remap the AlternateFunction) the JTAG Pins

	// GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE); 					// disable JTAG Debugging, we only need SWD. Releases PB3 and PB4

	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;

	GPIO_InitStructure.GPIO_Pin = MTX_PR0 | MTX_PG0 | MTX_PB0;        // RGB0
	GPIO_Init(MTX_PORT, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = MTX_PR1 | MTX_PG1 | MTX_PB1;        // RGB1
	GPIO_Init(MTX_PORT, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin =  MTX_PCLK;      // Strobe, OutputEnable, Clock
	GPIO_Init(MTX_PORT, &GPIO_InitStructure);
	// GPIO_InitStructure.GPIO_Pin = MTX_PA | MTX_PB | MTX_PC | MTX_PD;  // ABCD
	// GPIO_Init(MTX_PORT, &GPIO_InitStructure);

	// GPIO_InitStructure.GPIO_Pin = MTX_PSTB | MTX_POE | MTX_PCLK;      // Strobe, OutputEnable, Clock
	// GPIO_Init(MTX_PORT, &GPIO_InitStructure);


	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
	// GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Speed = GPIO_High_Speed;
	GPIO_InitStructure.GPIO_Pin   = MTX_POE;
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	// GPIO_PinAFConfig(GPIOC, GPIO_PinSource6, GPIO_AF_TIM3);  //Output compare OutputEnable
	GPIOC -> BSRRH = MTX_POE;


	GPIO_InitStructure.GPIO_Pin = LED_P | GPIO_Pin_12;                              // Status LED
	GPIO_Init(LED_PORT, &GPIO_InitStructure);

	for(int cnt=0;cnt < 10;cnt++){
		LED_PORT->BSRRL = LED_P;
	    showLine(400000);
		LED_PORT->BSRRH = LED_P;
	    showLine(400000);
		cnt++;
	 }
	 LED_PORT -> BSRRL = GPIO_Pin_12;


}


