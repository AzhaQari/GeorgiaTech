# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "pikminBg.h" 1
# 22 "pikminBg.h"
extern const unsigned short pikminBgTiles[2448];


extern const unsigned short pikminBgMap[4096];


extern const unsigned short pikminBgPal[256];
# 3 "main.c" 2

# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "main.c" 2

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




enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

 while(1) {






  if (pikmin.aniState != SPRITEIDLE) {
   pikmin.prevAniState = pikmin.aniState;
   pikmin.aniState = SPRITEIDLE;
  }

  if(pikmin.aniCounter % 15 == 0) {


   for (int i = 0; i < pikmin.numFrames; i++) {
    pikmin.curFrame++;
   }
  }

  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {

   pikmin.aniState = SPRITEFRONT;
   vOff--;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {

   pikmin.aniState = SPRITEBACK;
   vOff++;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {

   pikmin.aniState = SPRITELEFT;
   hOff--;
  }
  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

   pikmin.aniState = SPRITERIGHT;
   hOff++;
  }





  if (pikmin.aniState == SPRITEIDLE) {
   pikmin.curFrame = 0;
   pikmin.aniState = pikmin.prevAniState;
  } else {
   pikmin.aniCounter++;
  }
# 129 "main.c"
  waitForVBlank();

  dma[3].cnt = 0;
  dma[3].src = shadowOAM;
  dma[3].src = ((OBJ_ATTR*)(0x7000000));
  dma[3].cnt = 1 << 31 | (sizeof(shadowOAM) / 2);

        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
 }

 return 0;
}


void initialize() {


    DMANow(3, pikminBgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pikminBgTiles, &((charblock *)0x6000000)[0], 4896 / 2);
    DMANow(3, pikminBgMap, &((screenblock *)0x6000000)[28], 1024 * 4);



    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (3<<14);



 DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);

 dma[3].cnt = 0;
 dma[3].src = spritesheetTiles;
 dma[3].dst = 0x06014000;
 dma[3].cnt = 1 << 31 | 256;

 hideSprites();
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    pikmin.width = 32;
    pikmin.height = 32;
    pikmin.cdel = 1;
    pikmin.rdel = 1;
    pikmin.col = 240/2 - (pikmin.width/2);
 pikmin.row = 160/2 - (pikmin.height/2) + 36;
# 181 "main.c"
 pikmin.aniCounter = 0;
    pikmin.curFrame = 0;
    pikmin.numFrames = 3;
 pikmin.aniState = SPRITEFRONT;


 for(int i = 0; i < 4; i++){
  buriedPikmin[i].width = 16;
  buriedPikmin[i].height = 16;

  buriedPikmin[i].col = 240/2 - (buriedPikmin[i].width/2 * i * 4) + 36;
  buriedPikmin[i].row = 160 - (buriedPikmin[i].height) - 2;
# 202 "main.c"
  buriedPikmin[i].aniCounter = 0;
  buriedPikmin[i].curFrame = 0;
  buriedPikmin[i].numFrames = 3;
  buriedPikmin[i].aniState = SPRITEFRONT;
 }

    buttons = (*(volatile unsigned short *)0x04000130);


 hOff = 134;
 vOff = 172;

}
