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

<<<<<<< HEAD
  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);
=======
  rectMode(CENTER);
  // some code in graphics branch
>>>>>>> 0195df4571d5e1edccc47219206cb7c8a90633ed
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
