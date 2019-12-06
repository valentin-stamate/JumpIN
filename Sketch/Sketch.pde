PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false;
String MouseFlag;
int gameMenuSize = 50;

void setup(){
  size(800, 850, P2D);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);
  shapeMode(CENTER);

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
