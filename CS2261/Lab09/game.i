# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 198 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 209 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 249 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE pikachu;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2


# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[65536];
# 6 "game.c" 2

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE pikachu;


enum {PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};


void initGame() {


    vOff = 96;
    hOff = 9;

    initPlayer();
}


void updateGame() {

 updatePlayer();
}


void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void initPlayer() {

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;


    pikachu.worldRow = 160 / 2 - pikachu.width / 2 + vOff;
    pikachu.worldCol = 240 / 2 - pikachu.height / 2 + hOff;
    pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;
    pikachu.aniState = PIKAFRONT;
}


void updatePlayer() {



    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (pikachu.worldRow > 0 && collisionmapBitmap[((pikachu.worldRow - pikachu.rdel)*(256)+(pikachu.width + pikachu.worldCol - 1))] &&
            collisionmapBitmap[((pikachu.worldRow - pikachu.rdel)*(256)+(pikachu.worldCol))]



                                                            ) {


            pikachu.worldRow -= pikachu.rdel;


            if (pikachu.worldRow - vOff < 80 && vOff > 0


                                                                                      ) {

                vOff -= 1;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (pikachu.worldRow + pikachu.height < 256 && collisionmapBitmap[((pikachu.worldRow + pikachu.height + pikachu.rdel - 1)*(256)+(pikachu.width + pikachu.worldCol - 1))] &&
            collisionmapBitmap[((pikachu.worldRow + pikachu.rdel + pikachu.height - 1)*(256)+(pikachu.worldCol))]


                                                            ) {


            pikachu.worldRow += pikachu.rdel;


            if (256 - 160 > vOff && pikachu.worldRow - vOff > 80


                                                                                      ) {

                vOff += 1;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (pikachu.worldCol > 0 && collisionmapBitmap[((pikachu.height + pikachu.worldRow - 1)*(256)+(pikachu.worldCol - pikachu.cdel))] &&
            collisionmapBitmap[((pikachu.worldRow)*(256)+(pikachu.worldCol - pikachu.cdel))]


                                                            ) {


            pikachu.worldCol -= pikachu.cdel;


            if (hOff > 0 && pikachu.worldCol - hOff < 120


                                                                                      ) {

                hOff -= 1;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (pikachu.worldCol < 256 - pikachu.width && collisionmapBitmap[((pikachu.height + pikachu.worldRow - 1)*(256)+(pikachu.worldCol + pikachu.cdel + pikachu.width - 1))] &&
            collisionmapBitmap[((pikachu.worldRow)*(256)+(pikachu.width + pikachu.worldCol + pikachu.cdel - 1))]


                                                            ) {


            pikachu.worldCol += pikachu.cdel;


            if (pikachu.worldCol + hOff > 120 && hOff < 16


                                                                                      ) {

                hOff += 1;
            }
        }
    }

    animatePlayer();
}


void animatePlayer() {


    pikachu.prevAniState = pikachu.aniState;
    pikachu.aniState = PIKAIDLE;


    if(pikachu.aniCounter % 20 == 0) {
        pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))))
        pikachu.aniState = PIKABACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))))
        pikachu.aniState = PIKAFRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))))
        pikachu.aniState = PIKALEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))))
        pikachu.aniState = PIKARIGHT;


    if (pikachu.aniState == PIKAIDLE) {
        pikachu.curFrame = 0;
        pikachu.aniCounter = 0;
        pikachu.aniState = pikachu.prevAniState;
    } else {
        pikachu.aniCounter++;
    }
}


void drawPlayer() {

    if (pikachu.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & (pikachu.worldRow - vOff) ) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & (pikachu.worldCol - hOff)
                                                     ) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((pikachu.curFrame * 2)*32+(pikachu.aniState * 2));
    }
}
