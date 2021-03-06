#include <stdio.h>
#include "math.h"
#include "string.h"
#include "led_matrix.h"
#include "stm32f4xx.h"



// const int scan = MATRIX_HEIGHT / 2;
// int scan = MATRIX_HEIGHT / 2;
uint8_t gammaTable[256];
uint32_t birthRate = 0;
uint32_t bufferA[MATRIX_SIZE];
uint32_t bufferB[MATRIX_SIZE];
int bufferWidth = 8 * N_SEGMENT;
uint32_t testBufferTranslated[MATRIX_SIZE] = {0};
uint32_t testBuffer[MATRIX_SIZE]  = {0};

const int waits[] = { 5, 10, 20, 40, 80, 160, 320, 640 };

// 64 * 5;

// uint32_t testBuffer[MATRIX_SIZE] = {
// 	0,0,0,0, X,0,0,X, X,X,X,X, X,0,0,0,  X,0,0,0, 0,X,X,0, 0,0,0,0, 0,0,0,0,  0,0,0,X, 0,0,0,X, 0,X,X,0, X,X,X,0,  X,0,0,0, X,X,X,0, 0,0,0,0, 0,0,0,0,
// 	0,0,0,0, X,0,0,X, X,0,0,0, X,0,0,0,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,  0,0,0,X, 0,X,0,X, X,0,0,X, X,0,0,X,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,
// 	0,0,0,0, X,X,X,X, X,X,X,X, X,0,0,0,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,  0,0,0,X, 0,X,0,X, X,0,0,X, X,X,X,0,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,
// 	0,0,0,0, X,0,0,X, X,0,0,0, X,0,0,0,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,  0,0,0,X, 0,X,0,X, X,0,0,X, X,0,X,0,  X,0,0,0, X,0,0,X, 0,0,0,0, 0,0,0,0,
// 	0,0,0,0, X,0,0,X, X,X,X,X, X,X,X,X,  X,X,X,X, 0,X,X,0, 0,0,0,0, 0,0,0,0,  0,0,0,0, X,0,X,0, 0,X,X,0, X,0,0,X,  X,X,X,X, X,X,X,0, 0,0,0,0, 0,0,0,0,
// };
// uint32_t testBuffer[MATRIX_SIZE] = {
// 	0,0,0,0,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,0,X,X,0, 
// 	0,0,0,0,0, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, 0,X,X,X,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,X, 0,X,X,X,X, 0,0,X,X,0, 
// 	0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 
// 	0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 
// 	0,0,0,0,0, X,0,0,0,X, 0,0,X,X,0, 0,X,X,X,0, 0,X,0,0,0, 0,X,X,X,0, 
// 	0,0,0,0,0, X,0,X,0,X, 0,X,0,0,X, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, X,0,X,0,X, 0,X,0,0,X, 0,X,X,X,0, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, X,0,X,0,X, 0,X,0,0,X, 0,X,0,X,0, 0,X,0,0,0, 0,X,0,0,X, 
// 	0,0,0,0,0, 0,X,0,X,0, 0,0,X,X,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,0, 
// };
// int bufferWidth = 30;

// uint32_t testBuffer[MATRIX_SIZE] = {
// 	0,X,0,0,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,0,X,X,0, 0,0,X,0,0, X,0,0,0,X, 0,0,X,X,0, 0,X,X,X,0, 0,X,0,0,0, 0,X,X,X,0, 0,0,0,0,0, 
// 	0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,X,0, X,0,X,0,X, 0,X,0,0,X, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	0,X,X,X,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, X,X,X,X,X, X,0,X,0,X, 0,X,0,0,X, 0,X,X,X,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,X,0, X,0,X,0,X, 0,X,0,0,X, 0,X,0,X,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,X, 0,X,X,X,X, 0,0,X,X,0, 0,0,X,0,0, 0,X,0,X,0, 0,0,X,X,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,0, 0,0,0,0,0, 
// 	0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 
// 	0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 
// 	X,0,0,0,X, 0,0,X,X,0, 0,X,X,X,0, 0,X,0,0,0, 0,X,X,X,0, 0,0,0,0,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,0,X,X,0, 0,0,0,0,0, 
// 	X,0,X,0,X, 0,X,0,0,X, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	X,0,X,0,X, 0,X,0,0,X, 0,X,X,X,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 0,X,X,X,X, 0,X,X,X,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	X,0,X,0,X, 0,X,0,0,X, 0,X,0,X,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 0,X,0,0,X, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,0, 0,X,0,0,X, 0,0,0,0,0, 
// 	0,X,0,X,0, 0,0,X,X,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,0, 0,0,0,0,0, 0,X,0,0,X, 0,X,X,X,X, 0,X,X,X,X, 0,X,X,X,X, 0,0,X,X,0, 0,0,0,0,0, 

// };
// int bufferWidth = 60;

int led_clear_buffer(uint32_t buffer[]){
	for (int i=0; i<MATRIX_SIZE; i++){
		buffer[i]=0;
	}
	// memset(buffer,0,sizeof(buffer));
	return 0;
}

void main_gol(void){
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

void setPanelPixel(uint32_t testBuffer[], int panelIndex, int x, int y, int reversed, uint32_t rgb){
	if (reversed==0){
		testBuffer[32*panelIndex + N_SEGMENT*8*y + x] = rgb;		
	}else{
		testBuffer[32*panelIndex + N_SEGMENT*8*15+32 - 1 - x - y * N_SEGMENT*8] = rgb;
	}
}
void setMatrixPixel(uint32_t matrixBuffer[], int x, int y, uint32_t rgb){
	// int panelIndex = ;
	int xx = x / 32;
	int yy = y / 16;
	int reversed  = yy%2!=0;
	int panelIndex;
	if(reversed==0){
		panelIndex = yy * N_PANEL_WIDTH + xx;
	}else{
		panelIndex = ( yy + 1 ) * N_PANEL_WIDTH - 1 - xx;
	}
	setPanelPixel(matrixBuffer, panelIndex, x%32, y%16, reversed, rgb);

}

void initTestBuffer_line(void){
	int CANVAS_WIDTH = N_PANEL_WIDTH*32;
	int CANVAS_HEIGHT = N_PANEL_HEIGHT*16;
	for(int i=0; i<CANVAS_WIDTH; i++)  setMatrixPixel(testBuffer,i,0,X), setMatrixPixel(testBuffer,i,CANVAS_HEIGHT-1,X);
	for(int i=0; i<CANVAS_HEIGHT; i++) setMatrixPixel(testBuffer,0,i,X), setMatrixPixel(testBuffer,CANVAS_WIDTH-1,i,X);
	
	CanvasToBuffer( testBufferTranslated, testBuffer, bufferWidth);
}


void initTestBuffer(void){

	for (int i =0; i<MATRIX_SIZE; i++){
		int wid = ( N_PANEL_WIDTH * 32);
		int x = i % wid;
		int y = i / wid;

		int per = 27;
		int val =(x + 2 * y)%per;
		int c = ((x + 2 * y) / per) % 3;
		setMatrixPixel( testBuffer,  x,  y, (val )<<(c*8) );
	}
	uint32_t tempBuffer[MATRIX_SIZE] = {0};
	memcpy(tempBuffer, testBuffer, sizeof(tempBuffer));
	CanvasToBuffer( testBufferTranslated, tempBuffer, bufferWidth);
}


// ----- Timing definitions -------------------------------------------------


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
			bufferA[i] = 0x50;
		}else if(j==1){
			bufferA[i] = 0x50 << 8;
		}else if(j==2){
			bufferA[i] = 0x50 << 16;
			// bufferA[i] = 0x505050;
		}
		for (int j=0; j<5; j++) displayBuffer(bufferA);
		// showLine(10000000);
	}
	return j;
}



/*
Prepare a canvas array to displayBuffer,
@param: 
    destBuffer: displayBuffer
    srcBuffer: 2d array with index=x + y * width 
    width: width of srcBuffer
*/
void CanvasToBuffer(uint32_t* destBuffer, uint32_t* srcBuffer, int width){
for(int i=0; i<MATRIX_SIZE; i++){
	int x = i%width;
	int y = i/width;
	int h = y / 8 ;
	int p = x % 8 + (y / 4) % 2 * 8;
	int g = x / 8;
	int s = y % N_SCAN;
	int oi = p+ N_POSITION *(g+N_SEGMENT*(s+4*(h)));
	destBuffer[oi] = srcBuffer[i];
	}
}

/**
 * 
	Displays the buffer on the display using binary encoding (PWM equivalent).
	----
	S: Scan
	G: seGment
	P: Position
	H: HeightId
	MATRIX_WIDTH = N_SEGMENT * 8	
**/
void displayBuffer(uint32_t buffer[]) {
	for (int s=0; s<SCAN_ROWS; s++){
		setRow(s);
		for (int h=0; h<2; h++){
			for (int plane=0; plane < 8; plane ++) {
				for (int g=0; g < N_SEGMENT; g++){
					// TODO: shiftDataForSegment( p, g, s,h)
					for (int p=0; p < N_POSITION; p++) {
						// TODO: shiftDataForPosition( p, g, s,h)
						// setRGB( buffer[ p + N_POSITION * (g + N_SEGMENT * s) ],  0,  plane);
						uint32_t v1 = buffer[ p + N_POSITION * (g + N_SEGMENT * (s + N_SCAN * h)) ];
						// uint32_t v2 = buffer[ p + N_POSITION * (g + N_SEGMENT * s) ];
						// setRGB1(v1,plane);
						// setRGB2(v1,plane);
						// if (h==1) setRGB1(v1,plane);
						// else      setRGB2(v1,plane);
						if (h==0)	setRGB(   v1,   0,  plane);
						else 		setRGB(   0,   v1,  plane);
						CLK_TOGGLE;
					}
				}
				showLine(waits[plane]);
			}
			// binary code modulation del  ay
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
void setRGB(uint32_t rgb1, uint32_t rgb2, uint8_t plane){
	// using bitshifting seems to be faster due to gcc optimization
	// than using a bitmask lookup table here.	
	if (rgb1 & (1 << plane))        MTX_PORT->BSRRL = MTX_PR0;
	else                            MTX_PORT->BSRRH = MTX_PR0;

	if (rgb1 & (1 << (plane + 8))) 	MTX_PORT->BSRRL = MTX_PG0;
	else                            MTX_PORT->BSRRH = MTX_PG0;

	if (rgb1 & (1 << (plane + 16))) MTX_PORT->BSRRL = MTX_PB0;
	else                            MTX_PORT->BSRRH = MTX_PB0;	
	// using bitshifting seems to be faster due to gcc optimization
	// than using a bitmask lookup table here.


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
	// precalculate the gamma lookup table
	for (int i=0; i < 256; i++) gammaTable[i] = 255 * pow((i / 256.0), 1.6);
	
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
