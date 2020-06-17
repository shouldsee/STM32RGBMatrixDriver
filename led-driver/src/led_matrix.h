
#ifndef __LED_MATRIX_H
#define __LED_MATRIX_H



#include "config_led_matrix.h"
typedef enum { KILL, COPY, NEW } CellAction;
void initTestBuffer(void);
void CanvasToBuffer(uint32_t* destBuffer, uint32_t* srcBuffer, int width);
void matrix_init(void);
void setupRGBMatrixPorts(void);
void displayBuffer(uint32_t buffer[]);
void randomizeFramebuffer(uint32_t buffer[]);
void setRow(int row);
void setRGB(uint32_t rgb1, uint32_t rgb2, uint8_t plane);
void showLine(int amount);
void initTestBuffer(void);
void initTestBuffer_line(void);
int led_clear_buffer(uint32_t buffer[]);

void processBuffer(uint32_t src[], uint32_t dst[]);
CellAction analyzeCell(int offset, uint32_t buffer[]);

extern uint8_t gammaTable[256];
extern uint32_t bufferA[MATRIX_SIZE];
extern uint32_t testBufferTranslated[MATRIX_SIZE];
extern uint32_t bufferB[MATRIX_SIZE];
extern uint32_t testBuffer[MATRIX_SIZE];

#endif
