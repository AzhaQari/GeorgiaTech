#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "startScreen.h"
#include "heart.h"
#include "bird.h"
#include "predator.h"

// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// game states
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// button variables
unsigned short buttons;
unsigned short oldButtons;

// rand seed
int seed;

// buffers
char buffer[41];
char buffer2[41];

int main() {

    initialize();

    while(1) {

        // update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

// initialize the gba 
void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;
    goToStart();
}

// Sets up the start state
void goToStart() {

    DMANow(3, &startScreenPal, PALETTE, 256); 
    drawFullscreenImage4(startScreenBitmap);

    waitForVBlank();
    flipPage();

    state = START;
    seed = 0;
}

// runs the start state continuously 
void start() {
    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs the game state
void game() {

    updateGame();
    drawGame();

    sprintf(buffer, "HEALTH: %d", health);
    drawString4(5, 3, buffer, GRAYID);

    sprintf(buffer2, "SCORE: %d", score * 13);
    drawString4(5, 15, buffer2, GRAYID);

    drawRect4(5, 25, 40, 1, GRAYID);
    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    else if (health >= 250)
        goToWin();
    else if (health <= 0)
        goToLose();
}

// Sets up the pause menu
void goToPause() {
    //displays pause, health, and score text
    fillScreen4(GREENID);
    drawString4(90, 77, "Game Paused", BLACKID);
    drawString4(5, 3, buffer, GRAYID);
    drawString4(5, 15, buffer2, GRAYID);

    waitForVBlank();
    flipPage();


    state = PAUSE;
}

// Runs pause state
void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen4(PERSIANID);
    drawString4(103, 77, "You Win!", WHITEID);
    drawString4(95, 85, buffer2, WHITEID);
    waitForVBlank();
    flipPage();    

    state = WIN;
}
// Runs win state
void win() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen4(REDID);
    drawString4(100, 77, "You Lose!", WHITEID);
    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs lose state
void lose() {

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();

}