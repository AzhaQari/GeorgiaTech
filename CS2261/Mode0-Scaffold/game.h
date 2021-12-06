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

// Log struct 
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	int active;
} LOG;


// Constants
#define NUMLOGS 2

// Variables
extern PLAYER player;
extern LOG logs[NUMLOGS];
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
void initLogs();
void updateLog(LOG *);
void drawLog(LOG *);

