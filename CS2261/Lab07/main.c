#include "myLib.h"
#include "pikminBg.h"
// TODO 1.0: Include the spritesheet's .h file here.
#include "spritesheet.h"

void initialize();


unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE pikmin;
ANISPRITE buriedPikmin[4];
#define BURIEDCOUNT 4
// States used for pikmin.aniState
// Idle does not have an actual image associated with it;
// Whenever pikmin is idle, just show whatever state pikmin was before (prevAniState)
enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize(); 

	while(1) {

        // TODO 2.1: Set previous state to current state (if not idle)
		//           then reset pikmin's state to idle
		// NOTE: We reset pikmin's state to idle at the beginning of every
		//       frame so that we can easily check to see if any button was pressed.
		// Look for the TODO past the button input section for more explanation, but don't complete it yet
		if (pikmin.aniState != SPRITEIDLE) {
			pikmin.prevAniState = pikmin.aniState; 
			pikmin.aniState = SPRITEIDLE;
		}
        // Change the animation frame every 15 frames of gameplay
		if(pikmin.aniCounter % 15 == 0) {
			// TODO 2.2: Change the frame here
			//           Remember that there are only numFrames number of frames
			for (int i = 0; i < pikmin.numFrames; i++) {
				pikmin.curFrame++;
			}
		}	
        // Control movement and change animation state
		if(BUTTON_HELD(BUTTON_UP)) {
			// TODO 2.3: Set pikmin's aniState here accordingly
			pikmin.aniState = SPRITEFRONT;
			vOff--;
		}
		if(BUTTON_HELD(BUTTON_DOWN)) {
			// TODO 2.4: Set pikmin's aniState here accordingly
			pikmin.aniState = SPRITEBACK;
			vOff++;
		}
		if(BUTTON_HELD(BUTTON_LEFT)) {
			// TODO 2.5: Set pikmin's aniState here accordingly
			pikmin.aniState = SPRITELEFT;
			hOff--;
		}
		if(BUTTON_HELD(BUTTON_RIGHT)) {
			// TODO 2.6: Set pikmin's aniState here accordingly 
			pikmin.aniState = SPRITERIGHT;
			hOff++;
		}

		// TODO 2.7: If the pikmin aniState is idle (thus no key is held), 
		//           we want the frame to be pikmin standing (frame 0)
		//           in whatever direction pikmin was facing (set aniState to prevAniState)
        //           Else, if pikmin aniState is not idle, we want to increment aniCounter
		if (pikmin.aniState == SPRITEIDLE) {
			pikmin.curFrame = 0;
			pikmin.aniState = pikmin.prevAniState;
		} else {
			pikmin.aniCounter++;
		}


        // TODO 2.8: Using the proper flags from myLib.h, set up all of your sprite attributes.
        //           (seriously, go look in myLib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
        //           Hint: since this sprite is 32x32, you are going to have to do some multiplication...
        //				   (each tile is 8x8)
        //           Hint: When pikmin is idle (the aniState SPRITEIDLE), the frame should be 0
		

		
		// === Buried pikmin ===

		// TODO 3.1: For every buried pikmin, change the frame of animation
		//			 Remember that there are only numFrames number of frames
		// Change animation frame of buried pikmin every 12 frames of gameplay
		// Refer to TODO 2.2 for basic structure
		// You will also need to increment each pikmin's aniCounter here
		


		// TODO 3.2: Using the proper flags from myLib.h, set up all of your sprite attributes.
        //           (seriously, go look in myLib.h for sprite stuff)
        //           Remember, you will want to consider your current frame and animation state
        //           when telling attr2 which tile index to find the image at.
        //           Hint: frames are the rows of the spritesheet, and animation states are the columns
		//				   ** buried pikmin sprites start at (0,12) **
        //           Hint: since this sprite is 16x16, you are going to have to do some multiplication to get to the next row,
		//				   similar to TODO 2.8
        //				   (each tile is 8x8)
		//			 Hint: only the rows(frames) are changing since we only have a single state for buried pikmin
		

		waitForVBlank();
        // TODO 2.9: Copy the shadowOAM into the OAM
		dma[3].cnt = 0;
		dma[3].src = shadowOAM;
		dma[3].src = OAM;
		dma[3].cnt = 1 << 31 | (sizeof(shadowOAM) / 2);

        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
	}

	return 0;
}


void initialize() {

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, pikminBgPal, PALETTE, 256);
    DMANow(3, pikminBgTiles, &CHARBLOCK[0], pikminBgTilesLen / 2);
    DMANow(3, pikminBgMap, &SCREENBLOCK[28], 1024 * 4);

    // Tell the BG0 control register where to look for its tiles and tile map AND
    // 		how to read them from this location (using the given settings)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    
    // TODO 1.1: Load the spritesheet Tiles and Pal into THEIR desired spaces in memory
    // (Sprite Palette and Background Palette are 2 different things)
	DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
	//DMANow(3, spritesheetTiles, 0x06014000, 256);
	dma[3].cnt = 0;
	dma[3].src = spritesheetTiles;
	dma[3].dst = 0x06014000;
	dma[3].cnt = 1 << 31 | 256;
    // TODO 1.2: Hide all sprites with hideSprites().  You must complete this function yourself in myLib.c.
	hideSprites();
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // TODO 1.3: Enable Sprites here    
	// Player's pikmin
    pikmin.width = 32;
    pikmin.height = 32;
    pikmin.cdel = 1;
    pikmin.rdel = 1;
    pikmin.col = SCREENWIDTH/2 - (pikmin.width/2);
	pikmin.row = SCREENHEIGHT/2 - (pikmin.height/2) + 36;

	// TODO 2.0: Just read this (carefully).  No code needs to be edited here.
	/*	=== Animation Variables ===
	*	aniCounter: Used to count how many frames have passed
	*	curFrame: which frame of animation pikmin is in (frames go down the rows in spritesheet)
    *   numFrames: the total number of frames
	*	aniState: which state of animation pikmin is in (states are in different columns of spritesheet)
	*/
	pikmin.aniCounter = 0;
    pikmin.curFrame = 0;
    pikmin.numFrames = 3;
	pikmin.aniState = SPRITEFRONT; 

	// Buried pikmin
	for(int i = 0; i < BURIEDCOUNT; i++){
		buriedPikmin[i].width = 16;
		buriedPikmin[i].height = 16;
		// Place pikmin at center-bottom of screen
		buriedPikmin[i].col = SCREENWIDTH/2 - (buriedPikmin[i].width/2 * i * 4) + 36;
		buriedPikmin[i].row = SCREENHEIGHT - (buriedPikmin[i].height) - 2;
		// TODO 3.0: Just read this (carefully).  No code needs to be edited here.
		/*	=== Animation Variables ===
		*	aniCounter: Used to count how many frames have passed
		*	curFrame: which frame of animation pikmin is in (frames go down the rows in spritesheet)
		* 		- buried pikmin will start at row 12 of the spritesheet (start counting at 0, tile 12 is where it begins)
		*		- curFrame will count from 0 to indicate 0th frame of the buried pikmin animation
		*   numFrames: the total number of frames
		*	aniState: which state of animation pikmin is in (states are in different columns of spritesheet)
		*/
		buriedPikmin[i].aniCounter = 0;
		buriedPikmin[i].curFrame = 0;
		buriedPikmin[i].numFrames = 3;
		buriedPikmin[i].aniState = SPRITEFRONT; // this can also be seen as aniState = 0
	}

    buttons = BUTTONS;
    
    // Because why not start here?
	hOff = 134;
	vOff = 172;

}