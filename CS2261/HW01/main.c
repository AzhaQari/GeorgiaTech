#include "myLib.h"

// prototypes
void initialize();
void update();
void draw();

int time;
int bRow, bCol, bOldRow, bOldCol, bRDel, bCDel, bHeight, bWidth, bVx, bVy;
u16 bgColor;
u16 bColor = BLUE; 

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

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;	
	bgColor = CYAN;
	fillScreen(bgColor);

	bHeight = 6;
	bWidth = 8;
	bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	bOldRow = bRow;
	bOldCol = bCol;
	bVx = 2;
	bVy = 6;
	time = 0;
}

void update() {
	bOldCol = bCol;
	bOldRow = bRow;
	 
	// boundary checks
	if (bCol <= 1) { // left
		bOldCol = bCol;
		bCol = 1;
		if (bColor == MAGENTA) {
			bColor = YELLOW;
		} else {
			bColor = RED;
		}
		bVx = -bVx;

	}
	if (bCol + bWidth >= SCREENWIDTH - 1) { // right
		bOldCol = bCol;
		bCol -= bCol + 1 + bWidth - SCREENWIDTH;
		bColor = GREEN; 
		bVx = -bVx;
	}
	if (bRow <= 3) { // top
		bOldRow = bRow;
		bRow = 3;
		bColor = BLUE;
		bVy = -bVy;
	}
	if (bRow + bHeight >= SCREENHEIGHT - 3) { // bottom
		bOldRow = bRow;
		bRow -= 3 + bRow + bHeight - SCREENHEIGHT;
		bColor = MAGENTA;
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
