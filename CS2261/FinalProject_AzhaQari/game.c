#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "splashScreen.h"
#include "pauseScreen.h"
#include "background.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "collMap.h"


// variables
PLAYER player;
RONA rona[RONACOUNT];
int jumped;
int ground;
int health;
int score;


// initialize the game
void initGame() {
    health = 3;
    jumped = 1;
	initPlayer();
    initRona();
}

// updates game each frame
void updateGame() {
	updatePlayer();
    for (int i = 0; i < RONACOUNT; i++) {
		updateRona(&rona[i]);
	}
}

// draws game each frame
void drawGame() {
	drawPlayer();
    for (int i = 0; i < RONACOUNT; i++) {
		drawRona(&rona[i]);
	}

}


// initialize player 
void initPlayer() {

	player.row = SHIFTUP(60);
    player.rdel = 1;
	player.col = 20;
	player.cdel = 1;
	player.height = 8;
	player.width = 8;
	player.lives = 3;
}

// update player for every frame
void updatePlayer() {

	
	// controls to move the player bird
	// if (BUTTON_HELD(BUTTON_LEFT)
	// 	&& player.col >= 1) {

	// 	player.col -= player.cdel;
	

	// } else if (BUTTON_HELD(BUTTON_RIGHT)
	// 	&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

	// 	player.col += player.cdel;
	
	// } 

    // Gravity implementation
    if (collMapBitmap[OFFSET(player.col, SHIFTDOWN(player.row + player.rdel) + player.height - 1, 240)] && collMapBitmap[OFFSET(player.col + player.width - 1, SHIFTDOWN(player.row + player.rdel) + player.height - 1, 240)]) {
        player.row += player.rdel;
    } else {
        player.rdel = 0;
        jumped = 0;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && !jumped && player.row > 10) {
        player.rdel -= JUMPPOWER;
        jumped = 1;
    }
    player.rdel += GRAVITY;
    
    // ATTEMPT AT COLLISION MAP (MADE FOR M2)
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.col > 2 && collMapBitmap[OFFSET(player.col - player.cdel, player.height + SHIFTDOWN(player.row) - 1, 240)] &&
            collMapBitmap[OFFSET(player.col - player.cdel, SHIFTDOWN(player.row), 240)]) {

            player.col -= player.cdel;

        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.col <= 232 && collMapBitmap[OFFSET(player.col + player.cdel + player.width - 1, player.height + SHIFTDOWN(player.row) - 1, 240)] &&
            collMapBitmap[OFFSET(player.width + player.col + player.cdel - 1, SHIFTDOWN(player.row), 240)]) {

            player.col += player.cdel;
        }
    }
    if(collMapBitmap[OFFSET(player.col, SHIFTDOWN(player.row + player.rdel) + player.height - 1, 240)] && collMapBitmap[OFFSET(player.col + player.width - 1, SHIFTDOWN(player.row + player.rdel) + player.height - 1, 240)]) {
        player.row += player.rdel;
    }
}

// draws the player
void drawPlayer() {
	shadowOAM[0].attr0 = ATTR0_SQUARE | (ROWMASK & SHIFTDOWN(player.row));
	shadowOAM[0].attr1 = ATTR1_TINY | (COLMASK & player.col);
	waitForVBlank();
}

void initRona() {
    for (int i = 0; i < RONACOUNT; i++) { 
        rona[i].row = rand() % 140 + i;
        rona[i].rdel = 1;
        rona[i].col = rand() % 230 + i;
        rona[i].cdel = 1;
        rona[i].height = 8;
        rona[i].width = 8;
        rona[i].active = 1;
    }
}

void updateRona(RONA* r) {
    if (r->active) {
        r->col -= r->cdel;
        if (r->col < 0 || r->col > 232) {
            r->cdel *= -1;
            r->row = SHIFTDOWN(player.row) - 20;
        }
        if (r->row < 1 || r->row > 140) {
            r->rdel *= -1;
        }
        if (collision(r->col, r->row, r->width, r->height, player.col, SHIFTDOWN(player.row), player.width, player.height)) {
            health -= 3;
            r->active = 0;

        }
        if (r->row < player.row + 5) {
            r->row += r->rdel;
        } else if (r->row > player.row - 5) {
            r->row -= r->rdel;
        }

    }
    
}

void drawRona(RONA* r) {
    
    if (r->active) {
        shadowOAM[1].attr0 = ATTR0_SQUARE | (ROWMASK & r->row);
        shadowOAM[1].attr1 = ATTR1_TINY | (COLMASK & r->col);
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);
        waitForVBlank();
    }
    
}



