#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER >= 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}

void swap(u16 *a, u16 *b) {  
    u16 temp = *a;
    *a = *b;  
    *b = temp;
}