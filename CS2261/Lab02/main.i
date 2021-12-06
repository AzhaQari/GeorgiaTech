# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 65 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2



void initialize();
void update();
void draw();


unsigned short buttons;
unsigned short oldButtons;


unsigned short bgColor;


int eRow0, eRow1, eCol0, eCol1, eHeight, eWidth;
unsigned short eColor;


int mCol, mRow, mHeight, mWidth, mOldRow, mOldCol, mRDel, mCDel;
unsigned short mColor;


int bRow, bCol, bOldRow, bOldCol, bRDel, bCDel, bHeight, bWidth;

int main() {

 initialize();

 while (1) {

  update();
  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
  waitForVBlank();
  draw();
 }
}


void initialize() {
 (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


 buttons = (*(volatile unsigned short *)0x04000130);
 oldButtons = 0;





 bgColor = ((0) | (31)<<5 | (31)<<10);
 eColor = ((31) | (31)<<5 | (31)<<10);
 mColor = 0;
 fillScreen(bgColor);



 eHeight = 60;
 eWidth = 25;
 eRow0 = (160 / 2) - eHeight;
 eCol0 = eWidth * 2;
 eRow1 = (160 / 2) - eHeight;
 eCol1 = 240 - eWidth * 3;


    mHeight = 15;
 mWidth = 50;
 mRow = 160 - 40;
 mCol = 240 / 3;
 mRDel = 1;
 mCDel = 1;
 mColor = 0;


 bHeight = 20;
 bWidth = 15;
 bRow = (160 / 2) - (bHeight / 2);
 bCol = (240 / 2) - (bWidth / 2);
 bOldRow = bRow;
 bOldCol = bCol;
 bRDel = 1;
 bCDel = 1;
}


void update() {




 if (((!(~oldButtons & ((1<<0)))) && (~buttons & ((1<<0))))) {
  if (eColor == ((31) | (31)<<5 | (31)<<10))
   eColor = 0;
  else
   eColor = ((31) | (31)<<5 | (31)<<10);
 }



 if (bCol < 0) {
  bOldCol = bCol;
  bCol = 0;
 }
 if (bCol + bWidth > 240) {
  bOldCol = bCol;
  bCol = (240 - 1) - (bWidth - 1);
 }
 if (bRow < 0) {
  bOldRow = bRow;
  bRow = 0;
 }
 if (bRow + bHeight > 160) {
  bOldRow = bRow;
  bRow = (160 - 1) - (bHeight - 1);
 }



 if ((~((*(volatile unsigned short *)0x04000130)) & (1<<4))) {
  bOldCol = bCol;
  bCol += 1;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & (1<<5))) {
  bOldCol = bCol;
  bCol -= 1;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & (1<<6))) {
  bOldRow = bRow;
  bRow -= 1;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & (1<<7))) {
  bOldRow = bRow;
  bRow += 1;
 }





 if (mCol <= 0) {
  mCDel *= -1;
 }
 if (mCol + mWidth > 240) {
  mCDel *= -1;
 }


 mCol += mCDel;




 if (collision(bCol, bRow, bWidth, bHeight, eCol0, eRow0, eWidth, eHeight) == 1) {

  bRow = (160 / 2) - (bHeight / 2);
  bCol = (240 / 2) - (bWidth / 2);
 }
 if (collision(bCol, bRow, bWidth, bHeight, eCol1, eRow1, eWidth, eHeight) == 1) {

  bRow = (160 / 2) - (bHeight / 2);
  bCol = (240 / 2) - (bWidth / 2);
 }





 if (collision(bCol, bRow, bWidth, bHeight, mCol, mRow, mWidth, mHeight) == 1) {

  if (mColor == 0) {
   mColor = ((31) | (0)<<5 | (0)<<10);
  } else {
   mColor = 0;
  }
  bRow = (160 / 2) - (bHeight / 2);
  bCol = (240 / 2) - (bWidth / 2);
 }

}


void draw() {





 drawRect(bOldCol, bOldRow, bWidth, bHeight, bgColor);


 drawRect(mOldCol, mOldRow, mWidth, mHeight, bgColor);


 drawRect(bCol, bRow, bWidth, bHeight, ((0) | (0)<<5 | (31)<<10));


 drawRect(eCol0, eRow0, eWidth, eHeight, eColor);
 drawRect(eCol1, eRow1, eWidth, eHeight, eColor);

 drawRect(mCol, mRow, mWidth, mHeight, mColor);



 bOldRow = bRow;
 bOldCol = bCol;

 mOldRow = mRow;
 mOldCol = mCol;
}
