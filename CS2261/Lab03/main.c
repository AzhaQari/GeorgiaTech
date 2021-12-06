#include "myLib.h"
#include "kitty.h"

// variables
KITTY kitties[KITTYCOUNT];
u16 buttons;
u16 oldButtons;

// prototypes
void initialize();
void updateGame();
void reverseKitties();
void swap();
// TODO 3.1: add the function prototype for the swap method you wrote

int main() {
    // first, set up
    initialize();

    while(1) {
        // update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // mode 3 "workflow": updateGame, waitForVBlank, drawGame
        updateGame();
        waitForVBlank();
        for (int i = 0; i < KITTYCOUNT; i++) {
            drawKitty(&kitties[i], i);
        }
    }
}

// sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    initializeKitties();
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        reverseKitties();
    }
}

void reverseKitties() {
    // TODO 3.2: implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    int s = 0;
    int e = KITTYCOUNT - 1;
    while (s < e) {
        swap(&kitties[s] , &kitties[e]);
        s = s + 1;
        e = e - 1;
    }
}

// TODO 3.0: implement swap for two kitties
void swap(KITTY *k1, KITTY *k2) {
    KITTY temp = *k1;
    *k1 = *k2;
    *k2 = temp;
    
}
