#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "splashScreen.h"
#include "pauseScreen.h"
#include "background.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "collMap.h"
#include "courseFull.h"


// variables
PLAYER player;
RONA rona;
int jumped;
int ground;
int health;
int score;

int sbb = 8;
int hoff;
int voff;

// initialize the game
void initGame() {
    health = 3;
    jumped = 1;
	initPlayer();
    initRona();
}

// updates game each frame
void updateGame() {
    if (BUTTON_HELD(BUTTON_LEFT)) hoff -= 3;
    if (BUTTON_HELD(BUTTON_RIGHT)) hoff += 3;
    if (voff > 0x40) voff = 0x40;
    if (voff < 0) voff = 0;

    waitForVBlank();
    if (hoff > 256) {
        hoff -= 256;
        sbb++;
        }
    if (hoff < 0 && sbb > 8) {
        hoff += 256;
        sbb--;
    }
        if (hoff < 0 && sbb == 8) hoff = 0;
        REG_BG0HOFF = hoff;
        REG_BG0VOFF = voff;

        REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(sbb);
        DMANow(3, courseFullMap, &SCREENBLOCK[sbb], courseFullMapLen/2);
	updatePlayer();
    updateRona();
}

// draws game each frame
void drawGame() {
	drawPlayer();
    drawRona();

}


// initialize player 
void initPlayer() {

	player.row = SHIFTUP(142);
    player.rdel = 0;
	player.col = 20;
	player.cdel = 1;
	player.height = 8;
	player.width = 8;
	player.lives = 3;
}

// update player for every frame
void updatePlayer() {
	
	// controls to move the player bird
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= 1) {

		player.col -= player.cdel;
	

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;
	
	} 

    // Gravity implementation
    if (SHIFTDOWN(player.row + player.rdel) < 144) {
        player.row += player.rdel;
    } else {

        player.rdel = 0;
        jumped = 0;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && !jumped) {
        player.rdel -= JUMPPOWER;
        jumped = 1;
    }
    player.rdel += GRAVITY;

// ATTEMPT AT COLLISION MAP (MADE FOR M2)
    // if (BUTTON_HELD(BUTTON_LEFT)) {
    //     if (player.col > 0 && collMapBitmap[OFFSET(player.col - player.cdel, player.height + SHIFTDOWN(player.row) - 1, 240)] &&
    //         collMapBitmap[OFFSET(player.col - player.cdel, SHIFTDOWN(player.row), 240)]) {

    //         player.col -= 0;

    //     }
    // }
    // if(BUTTON_HELD(BUTTON_RIGHT)) {
    //     if (player.col < 240 - player.width && collMapBitmap[OFFSET(player.col + player.cdel + player.width - 1, player.height + SHIFTDOWN(player.row) - 1, 240)] &&
    //         collMapBitmap[OFFSET(player.width + player.col + player.cdel - 1, SHIFTDOWN(player.row), 240)]) {

    //         player.col += 0;
    //     }
    // }
    
}

// draws the player
void drawPlayer() {
	shadowOAM[0].attr0 = ATTR0_SQUARE | (ROWMASK & SHIFTDOWN(player.row));
	shadowOAM[0].attr1 = ATTR1_TINY | (COLMASK & player.col);
	waitForVBlank();
}

void initRona() {
    rona.row = 10;
    rona.rdel = 1;
	rona.col = 230;
	rona.cdel = 1;
	rona.height = 8;
	rona.width = 8;
}

void updateRona() {

    rona.col -= rona.cdel;
    if (rona.col < 0) {
        rona.col += 230;
        rona.row = SHIFTDOWN(player.row) - 8;
    }
    if (player.row + 5 < rona.row) {
        rona.row -= 2;
    } else if (rona.row + rona.height < 144) {
        rona.row += 2;
    }
    if (player.col - 5 < rona.col) {
        rona.col -= 2;
    }

    if (!BUTTON_HELD(BUTTON_DOWN) && collision(rona.col, rona.row, rona.width, rona.height, player.col, SHIFTDOWN(player.row), player.width, player.height)) {
        health -= 3;
    }
}

void drawRona() {
    shadowOAM[1].attr0 = ATTR0_SQUARE | (ROWMASK & rona.row);
	shadowOAM[1].attr1 = ATTR1_TINY | (COLMASK & rona.col);
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);
	waitForVBlank();
}



