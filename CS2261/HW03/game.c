#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
ASTEROID asteroids[ACOUNT];

// initialize the game
void initGame() {
	initPlayer();
	initBullets();
	initAsteroid();
}

// Updates the game
void updateGame() {
	updatePlayer();
	// update bullets 
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]); 
	}
	// update asteroids
	for (int i = 0; i < ACOUNT; i++) {
		updateAsteroid(&asteroids[i]); 
	}
}

// Draws the game
void drawGame() {
	drawPlayer();
	for (int i = 0; i < BULLETCOUNT; i++) {
		drawBullet(&bullets[i]);
	}
	for (int i = 0; i < ACOUNT; i++) {
		drawAsteroid(&asteroids[i]); 
	}
}

// initializes the player
void initPlayer() {
 	player.row = 80;
 	player.col = 30;
 	player.oldRow = player.row;
 	player.oldCol = player.col;
 	player.cdel = 1;
	player.rdel = 1;
 	player.height = 5;
 	player.width = 10;
 	player.color = GREEN;
 	player.bulletTimer = 20;
	player.dead = 0;
}

// update player 
void updatePlayer() {

// button controls for moving player
 	if (BUTTON_HELD(BUTTON_LEFT)
 		&& player.col >= player.cdel) {
 		player.col -= player.cdel;
 	} else if (BUTTON_HELD(BUTTON_RIGHT)
 		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
 		player.col += player.cdel;
 	} else if (BUTTON_HELD(BUTTON_UP)
 		&& player.row >= player.rdel) {
 		player.row -= player.rdel;
 	} else if (BUTTON_HELD(BUTTON_DOWN)
 		&& player.row + player.height - 1 < SCREENHEIGHT - player.rdel) {
 		player.row += player.rdel;
 	}
	
// fire bullets
 	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {
 		fireBullet(); 
 		player.bulletTimer = 0;
 	}
 	player.bulletTimer++;
}

// draws the player
void drawPlayer() {
	//erase old position
 	drawRect(player.oldCol, player.oldRow, player.width, player.height, BLACK);
	//draw to new position
 	drawRect(player.col, player.row, player.width, player.height, player.color);

 	player.oldRow = player.row;
 	player.oldCol = player.col;
}


// initialize bullet pool
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 1;
		bullets[i].width = 2;
		bullets[i].row = -(bullets[i].height);
		bullets[i].col = 0;
		bullets[i].oldRow = player.row;
		bullets[i].oldCol = player.col;
		bullets[i].cdel = 2;
		bullets[i].color = WHITE;
		bullets[i].active = 0;
	}
}

// create bullets
void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
			bullets[i].row = player.row + (player.height / 2) + (bullets[i].height / 2);
			bullets[i].col = player.col + player.width;
			bullets[i].active = 1;
			bullets[i].erased = 0;
			break; 
		}
	}
}

// update bullet
void updateBullet(BULLET* b) {
	if (b->active != 0) {
		b->col += 4;
		if (b->col > 239) {
			b->active = 0;
		}
	}
}

// draws a bullet
void drawBullet(BULLET* b) {
 	if(b->active) {
 		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
 		drawRect(b->col, b->row, b->width, b->height, b->color);
 	} else if (!b->erased) {
 		drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
 		b->erased = 1;
 	}
 	b->oldRow = b->row;
 	b->oldCol = b->col;
}


void initAsteroid() {
	for (int i = 0; i < ACOUNT; i++) {
		asteroids[i].height = 10;
		asteroids[i].width = 10;
		asteroids[i].row = rand() % 100;
		asteroids[i].col = 229;
		asteroids[i].oldRow = asteroids[i].row;
		asteroids[i].oldCol = asteroids[i].col;
		asteroids[i].cdel = 0;
		asteroids[i].active = 1;
	}
	asteroids[0].color = YELLOW;
	asteroids[1].color = RED;
}
void updateAsteroid(ASTEROID* a) {
	if (a->active) {
		a->col -= 2;
		if (a->col < 0) {
			a->oldCol = a->col;
			a->col = 239 - a->width;
			a->row = rand() % 100;
			waitForVBlank();
		}
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active != 0) {
				if (collision(bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height, asteroids[0].col, asteroids[0].row, asteroids[0].width, asteroids[0].height)) {
					asteroids[0].row = rand() % 100;
					asteroids[0].col = 229;
					bullets[i].active = 0;
				}
				if (collision(bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height, asteroids[1].col, asteroids[1].row, asteroids[1].width, asteroids[1].height)) {
					bullets[i].active = 0;
				}
			}
		}
		if (asteroids[0].active && asteroids[1].active) {
			if (collision(asteroids[0].col, asteroids[0].row, asteroids[0].width, asteroids[0].height, asteroids[1].col, asteroids[1].row, asteroids[1].width, asteroids[1].height)) {
				asteroids[0].row = 40;
				asteroids[1].row = 90;
			}
		}
		//crappy collision check
		for (int i = 0; i < ACOUNT; i++) {
			if (asteroids[i].active) {
				if (collision(asteroids[i].col, asteroids[i].row, asteroids[i].width, asteroids[i].height, player.col, player.row, player.width, player.height)) {
					fillScreen(BLACK);
					asteroids[0].color = BLACK;
					asteroids[1].color = BLACK; 
					player.color = BLACK;
				}
			}
		}
	}
}
// draws asteroids
void drawAsteroid(ASTEROID* a) {
	if(a->active) {
		drawRect(a->oldCol, a->oldRow, a->width + 50, a->height, BLACK);
		drawRect(a->col, a->row, a->width, a->height, a->color);
	} else if (!a->erased) {
		drawRect(a->oldCol, a->oldRow, a->width, a->height, BLACK);
		a->erased = 1;
	} else if (!a->active) {
		drawRect(a->oldCol, a->oldRow, a->width, a->height, BLACK);
	}
	a->oldRow = a->row;
	a->oldCol = a->col;
}

