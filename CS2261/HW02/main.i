# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 42 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 67 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[];
# 3 "main.c" 2


u16 backgroundColor;
unsigned short buttons;
unsigned short oldButtons;
int time;
int score;

int pCol, pRow, pHeight, pWidth, pOldRow, pOldCol;
unsigned short pColor;

int brCol, brRow, brHeight, brWidth, brOldRow, brOldCol, brVelX, brVelY;
unsigned short brColor;

int grCol, grRow, grHeight, grWidth, grOldRow, grOldCol, grVelX, grVelY;
unsigned short grColor;

void initialize();
void updateGame();
void draw();
void drawChar(int col, int row, char ch, u16 color);


enum State {LOSE = -1, WIN = 5} gameState;


int main() {

    initialize();

    while(1) {

        int skipFrames = 3;
  if (time % skipFrames == 0) {
   updateGame();
  }

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        waitForVBlank();
        draw();
        time++;
    }

}

void drawChar(int col, int row, char ch, u16 color) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[48*ch + j + 6*i]) {
                setPixel(col + j, row + i, color);
            }
        }
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    buttons = (*(volatile unsigned short *)0x04000130);
 oldButtons = 0;
    backgroundColor = 0;
    fillScreen(backgroundColor);




    pCol = 120;
    pRow = 230;
    pHeight = 10;
    pWidth = 35;
    pOldRow = pRow;
    pOldCol = pCol;
    pColor = ((0) | (31)<<5 | (31)<<10);


    brCol = (240 / 2) - (brWidth / 2);
    brRow = 0;
    brHeight = 20;
    brWidth = 30;
    brOldRow = brRow;
    brOldCol = brCol;
    brColor = ((31) | (0)<<5 | (0)<<10);
    brVelX = 3;
    brVelY = 2;


    grCol = (240 / 4) - (grWidth / 2);
    grRow = 0;
    grHeight = 20;
    grWidth = 30;
    grOldRow = grRow;
    grOldCol = grCol;
    grColor = ((0) | (31)<<5 | (0)<<10);
    grVelX = -3;
    grVelY = 2;


    time = 0;
}

void updateGame() {
    if (score == -1) {

        brColor = 0;
        brVelY = 0;
        brVelX = 0;

        grColor = 0;
        grVelY = 0;
        grVelX = 0;

        return;
    }
    if (score == 5) {

        brColor = 0;
        brVelY = 0;
        brVelX = 0;

        grColor = 0;
        grVelY = 0;
        grVelX = 0;

        pColor = 0;

        return;
    }


 if (pCol <= 1) {
  pOldCol = pCol;
  pCol = 1;
 }
 if (pCol + pWidth + 1 >= 240) {
  pOldCol = pCol;
  pCol -= pCol + 1 + pWidth - 240;
 }
 if (pRow < 0) {
  pOldRow = pRow;
  pRow = 0;
 }
 if (pRow + pHeight > 160) {
  pOldRow = pRow;
  pRow = (160 - 5) - (pHeight - 1);
 }


 if (grCol <= 1) {
  grOldCol = grCol;
  grCol = 1;
        grVelX *= -1;
 }
 if (grCol + grWidth >= 240 - 1) {
  grOldCol = grCol;
  grCol = (240 - 1) - (grWidth - 1);
        grVelX *= -1;
 }
    if (grRow > 160) {
  grOldRow = grRow;
  grRow = 0;
        grOldCol = grCol;
        grCol = 99999 % time;
        grVelX *= -1;
        waitForVBlank();
 }


 if (brCol <= 1) {
  brOldCol = brCol;
  brCol = 1;
        brVelX *= -1;
 }
 if (brCol + brWidth >= 240 - 1) {
  brOldCol = brCol;
  brCol -= brCol + 1 + brWidth - 240;
        brVelX *= -1;
 }
    if (brRow > 160) {
  brOldRow = brRow;
  brRow = 0;
        brOldCol = brCol;
        brCol = 99999 % time;
        waitForVBlank();
 }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
  pOldCol = pCol;
  pCol += 10;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
  pOldCol = pCol;
  pCol -= 10;
 }

    brRow += brVelY;
    brCol += brVelX;

    grRow += grVelY;
    grCol += grVelX;




 if (collision(pCol, pRow, pWidth, pHeight, brCol, brRow, brWidth, brHeight) == 1) {

  pRow = 230;
  pCol = 100;
        score = -1;
        gameState = LOSE;
        if (gameState == LOSE) {
            int c = 120;
            int r = 80;
            char ch = 'L';
            drawChar(c, r, ch, ((31) | (0)<<5 | (0)<<10));
        }
 }
    if (collision(pCol, pRow, pWidth, pHeight, grCol, grRow, grWidth, grHeight) == 1) {
        grRow = 0;
        grCol = (240 / 2) - (grWidth / 2);
        score++;
        gameState = score;
        if (gameState == WIN) {
            int c = 120;
            int r = 80;
            char ch = 'W';
            drawChar(c, r, ch, ((0) | (31)<<5 | (0)<<10));
        }
 }


    if (collision(grCol, grRow, grWidth, grHeight, brCol, brRow, brWidth, brHeight) == 1) {

  grVelX *= -1;
        brVelX *= -1;
 }

}

void draw() {

    drawRect(pOldCol, pOldRow, pWidth, pHeight, backgroundColor);
    drawRect(brOldCol, brOldRow, brWidth, brHeight, backgroundColor);
    drawRect(grOldCol, grOldRow, grWidth, grHeight, backgroundColor);


    drawRect(pCol, pRow, pWidth, pHeight, pColor);
    drawRect(brCol, brRow, brWidth, brHeight, brColor);
    drawRect(grCol, grRow, grWidth, grHeight, grColor);


 pOldRow = pRow;
    pOldCol = pCol;

    grOldRow = grRow;
    grOldCol = grCol;

    brOldRow = brRow;
    brOldCol = brCol;
}
