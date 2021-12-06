#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
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


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here
        switch(state) {
            case START:
                goToStart();
                startState();  
                break;
            case GAME:
                goToGame();
                gameState();
                break;
            case PAUSE:
                goToPause();
                pauseState();
                break;   
            case LOSE:
                goToLose();
                loseState();
                break;
            default:
                break;  
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();
}

// TODO 1.1: Make your state and state transition functions

void goToStart() {
    fillScreen(MAGENTA);
    state = START;
}
void startState() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        gameState();
        //include the step that seeds the random number generator
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
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    } 
}


