import processing.sound.*;

SoundFile file;

PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false, options = false, quit = false, locked = false;
String MouseFlag;
int gameMenuSize = 50;
int startTime = 14;
int min, second;


void setup(){
  size(800, 850, P2D);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);
  shapeMode(CENTER);

  file = new SoundFile(this, "./Music/bckMusic2.wav");
  file.loop();
}


void draw(){
  if(gameStart == true){
    background(gameBkgColor);

    drawTable();

    drawPositions();

    drawGameMenu();
    drawGamewButtons();
    //create timer

    drawTimer();

  } else if (options == true){
    background(gameBkgColor);

    drawButtonIesireOption();

  }else if(quit == true){
    exit();
  }else{
    background(startMenuBkgCol);

    drawStartMenu();
    }

}
