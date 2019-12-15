import processing.sound.*;
SoundFile file;

void setup(){
  size(800, 850, P2D);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);
  shapeMode(CENTER);

  //file = new SoundFile(this, "./Music/bckMusic2.wav");
  //file.loop();
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

    checkSelected();
    drawFoxes();
    drawNextMoves();


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
