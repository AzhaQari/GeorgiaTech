#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
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

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
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

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    fillScreen(PORTAGE);

     //TODO 1.1: UNCOMMENT #1
    // Spells out GAME BOY on the start screen in different colors
    char letters[8] = {'G', 'A', 'M', 'E', ' ', 'B', 'O', 'Y'};
    unsigned short colors[8] = {ROGUE, VIORED, HOTPINK, LAVPINK, PORTAGE, TURQUOISE, PERSIAN, TEAL};
    int col = 72;
    int spacing = 12;
    for(int i = 0; i < 8; i++){
        drawChar(col + (i * spacing), 70, letters[i], colors[i]);
    }
    

    // TODO 2.1: draw "CS 2261" at (99,96)
    drawString(99, 96, "CS 2261", GRAY);
    state = START;
    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    fillScreen(BLACK);

    // TODO 3.0: Write "Ball Count: " in a free area
    drawString(5, 145, "Ball Count: ", CYAN); 

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();

    // TODO 3.1: Update the buffer string with the current balls remaining
    sprintf(buffer, "%d", ballsRemaining);

    waitForVBlank();
    drawGame();

    // TODO 3.2: Erase the old number and write the new one
    drawRect(76, 145, 6, 8, BLACK);
    drawString(76, 145, buffer, ROGUE);


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (ballsRemaining == 0)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    fillScreen(TEAL);

    // TODO 2.4: Write "PAUSE" at (12,12)
    drawString(12, 12, "PAUSE", GRAY);
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen(SKYBLUE);

    // TODO 2.2: Write "WIN" at (12,12)
    drawString(12, 12, "WIN", GREEN);

    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen(CADILLAC);

    // TODO 2.3: Write "LOSE" at (12,12)
    drawString(12, 12, "LOSE", RED);

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}