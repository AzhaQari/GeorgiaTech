# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 24 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 38 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 64 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2


void initialize();
void update();
void draw();

int time;
int bRow, bCol, bOldRow, bOldCol, bRDel, bCDel, bHeight, bWidth, bVx, bVy;
u16 bgColor;
u16 bColor = ((0) | (0)<<5 | (31)<<10);

volatile u16* scanlineCounter = (u16*) 0x04000006;

int main() {

 initialize();

 while (1) {
  int skipFrames = 3;
  if (time % skipFrames == 0) {
   update();
  }
  waitForVBlank();
  draw();
  time++;
 }
}


void initialize() {
 (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
 bgColor = ((0) | (31)<<5 | (31)<<10);
 fillScreen(bgColor);

 bHeight = 6;
 bWidth = 8;
 bRow = (160 / 2) - (bHeight / 2);
 bCol = (240 / 2) - (bWidth / 2);
 bOldRow = bRow;
 bOldCol = bCol;
 bVx = 2;
 bVy = 6;
 time = 0;
}

void update() {
 bOldCol = bCol;
 bOldRow = bRow;


 if (bCol <= 1) {
  bOldCol = bCol;
  bCol = 1;
  if (bColor == ((31) | (0)<<5 | (31)<<10)) {
   bColor = ((31) | (31)<<5 | (0)<<10);
  } else {
   bColor = ((31) | (0)<<5 | (0)<<10);
  }
  bVx = -bVx;

 }
 if (bCol + bWidth >= 240 - 1) {
  bOldCol = bCol;
  bCol -= bCol + 1 + bWidth - 240;
  bColor = ((0) | (31)<<5 | (0)<<10);
  bVx = -bVx;
 }
 if (bRow <= 3) {
  bOldRow = bRow;
  bRow = 3;
  bColor = ((0) | (0)<<5 | (31)<<10);
  bVy = -bVy;
 }
 if (bRow + bHeight >= 160 - 3) {
  bOldRow = bRow;
  bRow -= 3 + bRow + bHeight - 160;
  bColor = ((31) | (0)<<5 | (31)<<10);
  bVy = -bVy;
 }
 bCol += bVx;
 bRow += bVy;

}

void draw() {

 drawRect(bOldCol, bOldRow, bWidth, bHeight, bgColor);
 drawRect(bCol, bRow, bWidth, bHeight, bColor);

 bOldRow = bRow;
 bOldCol = bCol;

}

void waitForVBlank() {
 while (*scanlineCounter >= 160);
 while (*scanlineCounter < 160);
}
