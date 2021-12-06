// Player Struct
typedef struct {
	int row;
    int rdel;
	int col;
	int cdel;
	int height;
	int width;
	int lives;
} PLAYER;

// coRona troop struct 
typedef struct {
	int row;
	int col;
	int cdel;
    int rdel;
	int height;
	int width;
	int active;
	int erased;
} RONA;


// Constants
#define RONACOUNT 1

// Gravity stuff
#define GRAVITY 150
#define JUMPPOWER 1500
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)

// Variables
extern PLAYER player;
extern RONA rona[RONACOUNT]; 

extern int health;
extern int score;

// Custom color and implementation
#define NUMCOLORS 6
enum {BLACKID=(256-NUMCOLORS), GREENID, PERSIANID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initRona();
void updateRona(RONA *);
void drawRona(RONA *);

