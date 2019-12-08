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
  file = new SoundFile(this, "Muzica.mp3");
  file.play();
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
    //create timer
    second = (millis()/1000 )- startTime;
    if(second % 60 == 0){
      min = second /60;
    }
    drawTimer();
  } else if (options == true){
    background(gameBkgColor);
    text("Pagina pentru optiuni", 400, 425);
    drawButtonIesireOption();
  }else if(quit == true){
    exit();
  }else{
    background(startMenuBkgCol);
    drawStartMenu();
    startTime = (millis()/1000 );
    }

}
