# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 24 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 38 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 2 "myLib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {

    int i, j;
    for (i = 0; i < width; i++) {
        for (j = 0; j < height; j++) {
            videoBuffer[((row + j)*(240)+(col + i))] = color;
        }
    }
}

void fillScreen(unsigned short color) {


    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}
