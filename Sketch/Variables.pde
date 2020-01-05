import java.util.ArrayList;
import java.util.List;
// --== IMAGINI SVG ==--
PShape rabbitGrey, rabbitOrange, rabbitWhite, foxH, foxV, mushroom;
PShape ch_1, ch_2, ch_3, ch_4, ch_5, ch_6, ch_7, ch_8, ch_9;
PShape instructionsBackground;
PImage rom, chi, fra, ger, ind;

PShape rabbitWhiteIntro, GameTitle;

// --== MUZICA SI SUNETE ==--
SoundFile backgroundMusic;
SoundFile click;

// --== VARIABILE DE LOGICA ==--
// JOC
boolean intro = true;
boolean gameStart = false;
boolean selectLevel = false;
boolean quit = false;
boolean options = false;
boolean mouseOver = false;
boolean gameFinished = false;
boolean undoMoves = false;
boolean instructions = false;
boolean changeLevel = false;

boolean showVerticalFox = false;
boolean showHorizontalFox = false;

//Countries

boolean romaniaClick = false;
boolean indiaClick = false;
boolean chinaClick = false;
boolean germanyClick = false;
boolean franceClick = false;

// ANIMALE
boolean lockedFirstRabbit = false;
boolean lockedSecondRabbit = false;
boolean lockedThirdRabbit = false;

boolean rabbitMoveUp = false;
boolean rabbitMoveRight = false;
boolean rabbitMoveLeft = false;
boolean rabbitMoveDown = false;

boolean lockedFox = false;
boolean lockedSecondFox = false;

boolean levelSolving = false;

boolean ROraneSelected = false;

String MouseFlag;

// --== VARIABILE DE JOC ==--
int gameMenuSize = 50;
int startTime = 14;
int min, second;
int obstacolStanga = 5;
int obstacolDreapta = 0;
int obstacolJos = 5;
int obstacolSus = 0;
int countRabbits = 0;
int countRabbitsInHoles = 0;
int casutaGoalaSus = 0;
int casutaGoalaJos = 0;
int casutaGoalaDreapta = 0;
int casutaGoalaStanga = 0;

int Challenge = 0;

int cellDistX;
int cellDistY;

int score  = 0;

// --== POZITII ANIMALE ==--
int coordonateFoxHI = 0, coordonateFoxHJ = 0;
int coordonateFoxVI = 0, coordonateFoxVJ = 0;

int iFirstRabbit = 0, jFirstRabbit = 0;
int iSecondRabbit = 0, jSecondRabbit = 0;
int iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;
int iInitialFirstRabbit = 0, jInitialFirstRabbit = 0;
int iInitialSecondRabbit = 0, jInitialSecondRabbit = 0;
int iInitialThirdRabbit = 0, jInitialThirdRabbit = 0;

int count = 0;


int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;
int fOneJ = 0, fOneI = 0;
int fSecondJ =0, fSecondI = 0;

//UNDO
ArrayList<Undo> undo = new ArrayList<Undo>();
