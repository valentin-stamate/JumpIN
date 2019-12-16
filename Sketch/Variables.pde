// --== IMAGINI SVG ==--

PShape rabbitGrey, rabbitOrange, rabbitWhite,foxH, foxV, mushroom;
PShape rabbitWhiteIntro, GameTitle;

// --== VARIABILE DE LOGICA ==--
// JOC
boolean intro = true;
boolean gameStart = false;
boolean quit = false;
boolean options = false;
boolean mouseOver = false;

// ANIMALE
boolean lockedFirstRabbit = false;
boolean lockedSecondRabbit = false;
boolean lockedThirdRabbit = false;

boolean rabbitMoveUp = false;
boolean rabbitMoveRight = false;
boolean rabbitMoveLeft = false;
boolean rabbitMoveDown = false;

boolean lockedFox = false;

boolean ROraneSelected = false;

String MouseFlag;

// --== VARIABILE DE JOC ==--
int gameMenuSize = 50;
int startTime = 14;
int min, second;
int obstacolStanga = 5;
int obstacolDreapta = 0;

int cellDistX;
int cellDistY;

int score  = 0;

// --== POZITII ANIMALE ==--

int coordonateFoxI = 0, coordonateFoxJ = 0;

int coordonateFoxVI = 0, coordonateFoxVJ = 0;

int iFirstRabbit = 0, jFirstRabbit = 0;
int iSecondRabbit = 0, jSecondRabbit = 0;
int iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;
int iInitialFirstRabbit = 0, jInitialFirstRabbit = 0;
int iInitialSecondRabbit = 0, jInitialSecondRabbit = 0;
int iInitialThirdRabbit = 0, jInitialThirdRabbit = 0;

int count = 0;

// TODO
int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;
int fOneJ = 0, fOneI = 0;
