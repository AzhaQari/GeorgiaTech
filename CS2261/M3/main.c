/*
finished: collision map, collision detection for killing player, player jumping/gravity

pending: omg so much... i just wanna drop out :( 
        -larger map 
        -having multiple rona troops that use active/erased variable functionality
        -fix bug where player falls thru left side of map when jumping
        -collision detection that gives the player a point and kills the rona troop when the player jumps ON TOP OF troop
        -cheat (ability to fly)
        -powerup (consumable)
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "splashScreen.h"
#include "background.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "instructionsScreen.h"
#include "winScreen.h"
#include "player.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToInstructions();
void instructions();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    GAME,
    INSTRUCTIONS, 
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case INSTRUCTIONS:
            instructions();
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
        DMANow(3, shadowOAM, OAM, sizeof(shadowOAM) / 2);
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites

    // Don't forget to set up whatever BGs you enabled in the line above!
    DMANow(3, playerPal, SPRITEPALETTE, 256);
    DMANow(3, playerTiles, &CHARBLOCK[4], playerTilesLen/2);
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// Sets up the start state
void goToStart() {
    printf("hello");
    DMANow(3, splashScreenPal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, splashScreenTiles, &CHARBLOCK[0], splashScreenTilesLen/2);
    DMANow(3, splashScreenMap, &SCREENBLOCK[28], splashScreenMapLen/2);
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }

    waitForVBlank();
}

// Sets up the game state
void goToGame() {
    DMANow(3, backgroundPal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundMapLen/2);
    state = GAME;
}
// Runs every frame of the game state
void game() {
    if (BUTTON_PRESSED(BUTTON_START)){
        goToPause();
    }
    if (health <= 0) {
        goToLose();
    }

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void goToInstructions() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen/2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[28], instructionsScreenMapLen/2);

    state = INSTRUCTIONS;
}
void instructions() {
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)){
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)){
        goToStart();
    }
}

// Sets up the pause state
void goToPause() {
    
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    // Load win screen palette
    DMANow(3, winScreenPal, PALETTE, 256);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);

    state = WIN;
}

// Runs every frame of the win state
void win() {
    hideSprites();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    DMANow(3, loseScreenPal, PALETTE, 256);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/2);

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}