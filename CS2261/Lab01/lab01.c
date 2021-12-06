// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define REG_DISPCNT (unsigned short *)0x04000000
#define PIXEL_00 0x06000000

typedef unsigned short u16;
// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawLetter(int, int);
void drawRect(int, int);

// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {
    *REG_DISPCNT = 0x403; 
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    //TODO 1.1: Test your setPixel function
    setPixel(50, 50, CYAN); //shows that setPixel function works

    //TODO 2.1: Call your drawRect function once
    drawRect(3, 5);

    //TODO 3.1: Call your drawLetter function twice
    drawLetter(20, 10);
    drawLetter(50, 50);
    while(1);
}


void setPixel(int col, int row, u16 color) { 
    
    // TODO 1: Complete this function
    videoBuffer[OFFSET(col, row, 240)] = color;
    
}

void drawRect(int col, int row) {

    // TODO 2: Complete this function
    int length = 9;
    int width = 6;
    int i, j;
    for (i = 0; i < length; i++) {
        for (j = 0; j < width; j++) {
            videoBuffer[OFFSET(col + i, row + j, 240)] = CYAN;
        }
    }

}

void drawLetter(int col, int row) {

    // TODO 3: Complete this function
    int length = 50;
    int i;
    for (i = 0; i < length; i++) {
        videoBuffer[OFFSET(col + i, row + i, 240)] = RED;
    }
    for (i = 0; i < length; i++) {
        videoBuffer[OFFSET(col + 50 + i, row + 50 - i, 240)] = RED;
    }
   
}


