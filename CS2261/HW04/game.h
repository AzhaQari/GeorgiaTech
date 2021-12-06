// Player Struct
typedef struct {
	int row;
    int rdel;
	int col;
	int cdel;
	int height;
	int width;
	unsigned char color;
} PLAYER;

// Ball struct for predatory birds and hearts
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int isHeart;
	int active;
} BALL;

// Constants
#define NUMBALLS 5

// Variables
extern PLAYER player;
extern BALL balls[NUMBALLS];
extern int ballsRemaining;
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
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);

