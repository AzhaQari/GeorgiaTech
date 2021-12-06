// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
	int dead;
} PLAYER;


// Bullet Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BULLET;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} ASTEROID;




// Constants
#define BULLETCOUNT 20
#define ACOUNT 2


// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ASTEROID asteroids[ACOUNT];

// Prototypes
void initGame();
void updateGame();
void drawGame();

//player
void initPlayer();
void updatePlayer();
void drawPlayer();

//bullets
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

//asteroids
void initAsteroid();
void updateAsteroid(ASTEROID *);
void drawAsteroid(ASTEROID *);
