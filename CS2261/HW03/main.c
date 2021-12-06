#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void startState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToLose();
void loseState();


// States
enum {START, GAME, PAUSE, LOSE};
int state;

unsigned short buttons;
unsigned short oldButtons;

int seed;

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        //state machine
        switch(state) {
            case START:
                startState();  
                break;
            case GAME:
                gameState();
                break;
            case PAUSE:
                pauseState();
                break;   
            case LOSE:
                loseState();
                break;
            default:
                break;  
        }
               
    }
}

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    goToStart();
}

void goToStart() {
    fillScreen(CYAN);
    state = START;
}
void startState() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        gameState();
        srand(seed);
        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}
void gameState() {
    updateGame();
    
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
        pauseState();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        loseState();
    }
    waitForVBlank();
}

void goToPause() {
    fillScreen(BLUE);
    state = PAUSE;
}
void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
}
void loseState() {
    if (player.color == BLACK) {
        goToStart();
    } 
}


