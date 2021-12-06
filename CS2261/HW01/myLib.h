#define MY_LIB_H
#define MY_LIB_H

// common typedefs
typedef unsigned short u16;

// common macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// display control register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// display status registers

// display constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// video buffer
extern volatile unsigned short *videoBuffer;

// color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)

// mode 3 drawing functions
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);

// miscellaneous drawing functions
void waitForVBlank();


