#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "screenStates.h"
#include "pauseScreen.h"
#include "background.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "frogger.h"
#include "log.h"


// variables
PLAYER player;
LOG logs[NUMLOGS];
int health;
int score;

enum {UP, DOWN, LEFT, RIGHT, IDLE};

// initialize the game
void initGame() {

	initPlayer();
	initLogs();
	
}

// updates game each frame
void updateGame() {
	updatePlayer();
	updateLog(&logs[0]);
}

// draws game each frame
void drawGame() {
	drawPlayer();
	drawLog(&logs[0]);

}


// initialize player 
void initPlayer() {

	player.row = 150;
    player.rdel = 13;
	player.col = 118;
	player.cdel = 13;
	player.height = 8;
	player.width = 8;
	player.lives = 3;
}

// update player for every frame
void updatePlayer() {
	
	// controls to move the player bird
	if (BUTTON_PRESSED(BUTTON_LEFT)
		&& player.col >= 13) {

		player.col -= player.cdel;
	

	} else if (BUTTON_PRESSED(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;
	
	} else if (BUTTON_PRESSED(BUTTON_UP)
		&& player.row > player.rdel) {

		player.row -= player.rdel;

	} else if (BUTTON_PRESSED(BUTTON_DOWN)
		&& player.row + player.height + 10 < SCREENHEIGHT - player.rdel) {

		player.row += player.rdel;

	}

}

// draws the player frog 
void drawPlayer() {
    //drawImage4(player.col, player.row, player.width, player.height, birdBitmap);
	shadowOAM[0].attr0 = ATTR0_SQUARE | (player.row);
	shadowOAM[0].attr1 = ATTR1_TINY | (player.col);
	//shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState);
	waitForVBlank();
}

void initLogs() {
	logs[0].col = 239;
	logs[0].cdel = 1;
	logs[0].height = 16;
	logs[0].width = 32;
	logs[0].row = 75;
	logs[0].active = 1;
}
void updateLog(LOG *l) {
	l->col -= l->cdel;
	//collision check for balls and player
    if (collision(l->col, l->row, l->width, l->height, player.col, player.row, player.width, player.height)) {
        player.col -= l->cdel;
	}
}

void drawLog(LOG *l) {
	shadowOAM[1].attr0 = ATTR0_WIDE | (l->row);
	shadowOAM[1].attr1 = ATTR1_MEDIUM | (l->col);
	shadowOAM[1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(1, 0);

	waitForVBlank();
}




