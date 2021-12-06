# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"







typedef unsigned short u16;
# 26 "lab01.c"
void setPixel(int, int, unsigned short);
void drawLetter(int, int);
void drawRect(int, int);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {
    *(unsigned short *)0x04000000 = 0x403;
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


    setPixel(50, 50, ((0) | (31)<<5 | (31)<<10));


    drawRect(3, 5);


    drawLetter(20, 10);
    drawLetter(50, 50);
    while(1);
}


void setPixel(int col, int row, u16 color) {


    videoBuffer[((row)*(240)+(col))] = color;

}

void drawRect(int col, int row) {


    int length = 9;
    int width = 6;
    int i, j;
    for (i = 0; i < length; i++) {
        for (j = 0; j < width; j++) {
            videoBuffer[((row + j)*(240)+(col + i))] = ((0) | (31)<<5 | (31)<<10);
        }
    }

}

void drawLetter(int col, int row) {


    int length = 50;
    int i;
    for (i = 0; i < length; i++) {
        videoBuffer[((row + i)*(240)+(col + i))] = ((31) | (0)<<5 | (0)<<10);
    }
    for (i = 0; i < length; i++) {
        videoBuffer[((row + 50 - i)*(240)+(col + 50 + i))] = ((31) | (0)<<5 | (0)<<10);
    }

}
