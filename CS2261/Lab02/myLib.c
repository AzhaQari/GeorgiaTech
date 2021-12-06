#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
    int i, j;
    for (i = 0; i < width; i++) {
        for (j = 0; j < height; j++) {
            videoBuffer[OFFSET(col + i, row + j, 240)] = color; 
        }
    }
}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    // TODO #5.0: Implement this function
    if ((colA + widthA > colB && colA < colB + widthB) && (rowA + heightA > rowB && rowA < rowB + heightB)) {
        return 1;
    } else {
        return 0;
    }
}