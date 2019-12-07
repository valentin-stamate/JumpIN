PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false, options = false, quit = false, locked = false;
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

  } else if (options == true){
    background(gameBkgColor);
    text("Pagina pentru optiuni", 400, 425);
    drawButtonIesireOption();
  }else if(quit == true){
    exit();
  }else{
    background(startMenuBkgCol);
    drawStartMenu();
    }

}
