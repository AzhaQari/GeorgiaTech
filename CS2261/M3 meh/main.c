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
#include "courseFull.h"

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

// hoff/voff
int temph;
int tempv;


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

        // if (BUTTON_HELD(BUTTON_LEFT) && state == GAME) hoff -= 3;
        // if (BUTTON_HELD(BUTTON_RIGHT) && state == GAME) hoff += 3;
        // if (voff > 0x40) voff = 0x40;
        // if (voff < 0) voff = 0;

        // waitForVBlank();
        // if (hoff > 256) {
        //     hoff -= 256;
        //     sbb++;
        // }
        // if (hoff < 0 && sbb > 8) {
        //     hoff += 256;
        //     sbb--;
        // }
        // if (hoff < 0 && sbb == 8) hoff = 0;
        // REG_BG0HOFF = hoff;
        // REG_BG0VOFF = voff;

        // REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(sbb);
        // DMANow(3, courseFullMap, &SCREENBLOCK[sbb], courseFullMapLen/2);
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
    DMANow(3, splashScreenPal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    DMANow(3, splashScreenTiles, &CHARBLOCK[0], splashScreenTilesLen/2);
    DMANow(3, splashScreenMap, &SCREENBLOCK[8], splashScreenMapLen/2);
    state = START;
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        voff = 50;
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
    DMANow(3, courseFullPal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(sbb);
    DMANow(3, courseFullTiles, &CHARBLOCK[0], courseFullTilesLen/2);
    DMANow(3, courseFullMap, &SCREENBLOCK[sbb], courseFullMapLen/2);
    state = GAME;
}
// Runs every frame of the game state
void game() {
    if (BUTTON_PRESSED(BUTTON_START)){
        goToPause();
        temph = hoff;
        tempv = voff;
        hoff = 0;
        voff = 0;
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
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen/2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[8], instructionsScreenMapLen/2);

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
    
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[8], pauseScreenMapLen/2);

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        hoff = temph;
        voff = tempv;
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    // Load win screen palette
    DMANow(3, winScreenPal, PALETTE, 256);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[8], winScreenMapLen/2);

    state = WIN;
}

// Runs every frame of the win state
void win() {
    hoff = 0;
    voff = 0;
    hideSprites();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    DMANow(3, loseScreenPal, PALETTE, 256);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);

    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[8], loseScreenMapLen/2);

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    hoff = 0;
    voff = 0;
    hideSprites();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}