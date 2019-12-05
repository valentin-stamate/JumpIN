import controlP5.*;

PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false;
String buttonFlag;
int gameMenuSize = 50;

ControlP5 buttons;

void setup(){
  size(800, 850, P2D);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);

}


void draw(){

  if(gameStart == true){
    background(gameBkgColor);

    drawTable();
    drawRabbits();
    drawFoxes();
    drawMushrooms();
    drawGameMenu();
    drawGamewButtons();

  } else {
    background(startMenuBkgCol);

    drawStartMenu();
  }

}
