// --== IMAGINI SVG ==--
PShape rabbitGrey, rabbitOrange, rabbitWhite, fox, mushroom;

// --== VARIABILE DE LOGICA ==--
// JOC
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

// --== POZITII ANIMALE ==--
int coordonateFoxI = 0, coordonateFoxJ = 0;

int iFirstRabbit = 0, jFirstRabbit = 0;
int iSecondRabbit = 0, jSecondRabbit = 0;
int iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;

// TODO
int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;
int fOneJ = 0, fOneI = 0;
