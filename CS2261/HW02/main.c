#include "myLib.h"
#include "font.h"


u16 backgroundColor;
unsigned short buttons;
unsigned short oldButtons;
int time;
int score;
// Player Rectangle variables:
int pCol, pRow, pHeight, pWidth, pOldRow, pOldCol;
unsigned short pColor;
// Bad Rectangle variables:
int brCol, brRow, brHeight, brWidth, brOldRow, brOldCol, brVelX, brVelY;
unsigned short brColor;
// Good Rectangle variables:
int grCol, grRow, grHeight, grWidth, grOldRow, grOldCol, grVelX, grVelY;
unsigned short grColor;
// prototypes
void initialize();
void updateGame();
void draw();
void drawChar(int col, int row, char ch, u16 color);

//enum that will be used to indicate when the game is either won or loss
enum State {LOSE = -1, WIN = 5} gameState;


int main() {
    
    initialize();

    while(1) {
        //make the objects on display move slower so they're easier to track
        int skipFrames = 3;
		if (time % skipFrames == 0) {
			updateGame();
		}

        oldButtons = buttons;
        buttons = BUTTONS;
        
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
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    buttons = BUTTONS;
	oldButtons = 0;
    backgroundColor = BLACK;
    fillScreen(backgroundColor);

    //initialize respective rectangles:

    // player rect
    pCol = 120;
    pRow = 230;
    pHeight = 10;
    pWidth = 35; 
    pOldRow = pRow;
    pOldCol = pCol;
    pColor = CYAN; 

    // bad rect
    brCol = (SCREENWIDTH / 2) - (brWidth / 2);
    brRow = 0;
    brHeight = 20;
    brWidth = 30; 
    brOldRow = brRow;
    brOldCol = brCol;
    brColor = RED;
    brVelX = 3;
    brVelY = 2;

    // good rect
    grCol = (SCREENWIDTH / 4) - (grWidth / 2);
    grRow = 0;
    grHeight = 20;
    grWidth = 30; 
    grOldRow = grRow;
    grOldCol = grCol;
    grColor = GREEN;  
    grVelX = -3;
    grVelY = 2;

    //time
    time = 0;
}

void updateGame() {
    if (score == -1) {
        //Game Lost
        brColor = BLACK;
        brVelY = 0; 
        brVelX = 0;

        grColor = BLACK;
        grVelY = 0;
        grVelX = 0;

        return;
    }
    if (score == 5) {
        //Game Won
        brColor = BLACK;
        brVelY = 0;
        brVelX = 0;

        grColor = BLACK;
        grVelY = 0; 
        grVelX = 0;

        pColor = BLACK;

        return; 
    }     
    
    // boundary checks for player rectangle
	if (pCol <= 1) { // left
		pOldCol = pCol;
		pCol = 1;
	}
	if (pCol + pWidth + 1 >= SCREENWIDTH) { // right
		pOldCol = pCol;
		pCol -= pCol + 1 + pWidth - SCREENWIDTH;
	}
	if (pRow < 0) { // top (not really needed)
		pOldRow = pRow;
		pRow = 0;
	}
	if (pRow + pHeight > SCREENHEIGHT) { // bottom
		pOldRow = pRow;
		pRow = (SCREENHEIGHT - 5) - (pHeight - 1);
	}

    // boundary checks for GOOD rectangle
	if (grCol <= 1) { // left
		grOldCol = grCol;
		grCol = 1;
        grVelX *= -1;
	}
	if (grCol + grWidth >= SCREENWIDTH - 1) { // right
		grOldCol = grCol;
		grCol = (SCREENWIDTH - 1) - (grWidth - 1);
        grVelX *= -1;
	}
    if (grRow > SCREENHEIGHT) { // bottom
		grOldRow = grRow;
		grRow = 0;
        grOldCol = grCol;
        grCol = 99999 % time;
        grVelX *= -1;
        waitForVBlank();
	}

    // boundary checks for BAD rectangle
	if (brCol <= 1) { // left
		brOldCol = brCol;
		brCol = 1;
        brVelX *= -1;
	}
	if (brCol + brWidth >= SCREENWIDTH - 1) { // right
		brOldCol = brCol;
		brCol -= brCol + 1 + brWidth - SCREENWIDTH;
        brVelX *= -1;
	}
    if (brRow > SCREENHEIGHT) { // bottom
		brOldRow = brRow;
		brRow = 0;
        brOldCol = brCol;
        brCol = 99999 % time;
        waitForVBlank();
	}

    //button control for player rectangle
    if (BUTTON_HELD(BUTTON_RIGHT)) {
		pOldCol = pCol;
		pCol += 10;
	}
	if (BUTTON_HELD(BUTTON_LEFT)) {
		pOldCol = pCol;
		pCol -= 10;
	}
   
    brRow += brVelY;
    brCol += brVelX;

    grRow += grVelY;
    grCol += grVelX;

    //COLLISION CONTROLS FOR...

    //Player Rectangle: 
	if (collision(pCol, pRow, pWidth, pHeight, brCol, brRow, brWidth, brHeight) == 1) {
		//return to og position... GAME OVER!
		pRow = 230;
		pCol = 100;
        score = -1;
        gameState = LOSE;
        if (gameState == LOSE) {
            int c = 120;
            int r = 80;
            char ch = 'L';
            drawChar(c, r, ch, RED);
        }
	}    
    if (collision(pCol, pRow, pWidth, pHeight, grCol, grRow, grWidth, grHeight) == 1) {
        grRow = 0;
        grCol = (SCREENWIDTH / 2) - (grWidth / 2);
        score++;
        gameState = score;
        if (gameState == WIN) {
            int c = 120;
            int r = 80;
            char ch = 'W';
            drawChar(c, r, ch, GREEN);
        }
	} 

    //Good/Bad Rectangles:
    if (collision(grCol, grRow, grWidth, grHeight, brCol, brRow, brWidth, brHeight) == 1) {
		//rectangles "bounce" off each other 
		grVelX *= -1;
        brVelX *= -1;
	}  

}

void draw() {
    //delete old pixels
    drawRect(pOldCol, pOldRow, pWidth, pHeight, backgroundColor);
    drawRect(brOldCol, brOldRow, brWidth, brHeight, backgroundColor);
    drawRect(grOldCol, grOldRow, grWidth, grHeight, backgroundColor);

    //draw new pixels
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

