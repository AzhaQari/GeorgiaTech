# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 53 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 79 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 90 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 130 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel(int col, int row, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}


void drawRect(int col, int row, int width, int height, unsigned short color) {
# 25 "myLib.c"
   for (int x = 0; x < height; x++) {
  dma[3].src = &color;
  dma[3].dst = &videoBuffer[((row + x)*(240)+(col))];
  dma[3].cnt = (width) | (2 << 23) | (1 << 31);
 }


}


void fillScreen(unsigned short color) {

    volatile u16 c = color;
    dma[3].src = &c;
    dma[3].dst = videoBuffer;
    dma[3].cnt = 38400 | (2 << 23) | (1 << 31);

}


void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {



    dma[3].cnt = 0;

    dma[3].src = src;
    dma[3].dst = dst;


    cnt = 1 << 31 | (1 << 31);
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
