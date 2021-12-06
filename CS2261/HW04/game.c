#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "heart.h"
#include "bird.h"
#include "predator.h"

// variables
PLAYER player;
BALL balls[NUMBALLS];
int health;
int score;

// initialize the game
void initGame() {

	initPlayer();
    initBalls();

    // initialize the health and score
	health = 20;
    score = 0;

    // initialize some colors to use in mode 4
    unsigned short colors[NUMCOLORS] = {BLACK, GREEN, PERSIAN, RED, WHITE, GRAY};

    //Load the heart and (predatory) bird image's colors
    dma[3].cnt = 0;
    dma[3].src = heartPal;
    dma[3].dst = PALETTE;
    dma[3].cnt = 1 << 31 | 256;

    dma[3].cnt = 0;
    dma[3].src = birdPal + 16;
    dma[3].dst = PALETTE + 16;
    dma[3].cnt = 1 << 31 | 16;

    dma[3].cnt = 0;
    dma[3].src = predatorPal + 32;
    dma[3].dst = PALETTE + 32;
    dma[3].cnt = 1 << 31 | 16;
      
    // add our previously stated colors to the end of the palette
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

}

// updates game each frame
void updateGame() {

	updatePlayer();

	// Update all the balls
	for (int i = 0; i < NUMBALLS; i++)
		updateBall(&balls[i]);
}

// draws game each frame
void drawGame() {

    fillScreen4(WHITEID);

	drawPlayer();

	// Draw all the balls
	for (int i = 0; i < NUMBALLS; i++) {
		drawBall(&balls[i]);
    }

}


// initialize player bird 
void initPlayer() {

	player.row = 130;
    player.rdel = 3;
	player.col = 118;
	player.cdel = 3;
	player.height = 16;
	player.width = 16;
}

// update player for every frame
void updatePlayer() {

	// controls to move the player bird
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {

		player.col -= player.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;

	} else if (BUTTON_HELD(BUTTON_UP)
		&& player.row > 2) {

		player.row -= player.rdel;

	} else if (BUTTON_HELD(BUTTON_DOWN)
		&& player.row + player.height < SCREENHEIGHT - 2) {

		player.row += player.rdel;

	}

}

// draws the player bird
void drawPlayer() {
    drawImage4(player.col, player.row, player.width, player.height, birdBitmap);
}



// initialize the balls
void initBalls() {
	
	for (int i = 0; i < NUMBALLS; i++) {
		balls[i].row = rand() % 100;
		balls[i].col = rand() % 130 + 10;
		balls[i].rdel = 2;
		balls[i].cdel = 2;
		balls[i].active = 1;
		balls[i].isHeart = 0;

		// Make every even indexed ball a heart
		if(i % 2 == 0){
			balls[i].isHeart = 1;
			balls[i].height = 16;
			balls[i].width = 16;
		} else {
			balls[i].height = 16;
			balls[i].width = 16;
		    balls[i].cdel = 1;
		}
	}
}

// updates the balls every frame
void updateBall(BALL* b) {

	if (b->active) {
        // Makes the balls change direction randomly 
        if (rand() % 50 == 0)
            b->cdel *= -1;
		// Lets the balls pass through the screen and reappear on top
        if (b->row + b->height-1 >= SCREENHEIGHT - 1)
			b->row = 1;
        // Bounces the balls off the screen boundaries 
		if (b->col <= 1 || b->col + b->width-1 >= SCREENWIDTH - 2)
			b->cdel *= -1;    
    
		// moves the ball down and left/right
		b->row += b->rdel;
		b->col += b->cdel;

        //collision check for balls and player
        if (b->active && b->isHeart && collision(b->col, b->row, b->width, b->height, player.col, player.row, player.width, player.height)) {
            health += 15;
            score = health;
            b->active = 0;

        } else if (b->active && !b->isHeart && collision(b->col, b->row, b->width, b->height, player.col, player.row, player.width, player.height)) {
            health -= 1;
        }
        //collision check for a ball and other balls
        for (int i = 0; i < NUMBALLS; i++) {
            if (b->active && &b != &balls[i] && balls[i].active && collision(b->col, b->row, b->width, b->height, balls[i].col, balls[i].row, balls[i].width, balls[i].height)) {
                b->cdel *= -1;
                balls[i].cdel *= -1;
            }
        }  
	}
    if (!b->active) {
        if (rand() % 100 == 0) {
            b->row = 1;
            b->active = 1;
        }
    }
}

// draws a ball
void drawBall(BALL* b) {
	if(b->active) {
	 	if (b->isHeart)
	 		drawImage4(b->col, b->row, b->width, b->height, heartBitmap);
	 	else
	 		drawImage4(b->col, b->row, b->width, b->height, predatorBitmap);
	}
}

