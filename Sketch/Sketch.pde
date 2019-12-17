import processing.sound.*;
SoundFile file;
SoundFile click;
void setup(){
  size(800, 850);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();
  InitializeIntroAnimation();

  rectMode(CENTER);
  textAlign(CENTER);
  shapeMode(CENTER);

  file = new SoundFile(this, "./Music/bckMusic2.wav");
  click = new SoundFile(this, "./Music/Click.mp3");
  file.loop();
}


void draw(){

   if(gameStart == true){
    background(gameBkgColor);

    drawTable();

    drawPositions();
    drawGameMenu();
    drawGameButtons();

    //create timer
    drawTimer();

    checkSelected();
    drawFoxes();
    drawNextMoves();


  } else if (options == true){
    background(gameBkgColor);

    drawButtonIesireOption();

  } else if (selectLevel == true){
    drawSelectLevels();

  } else if(quit == true){
    exit();
  } else {

    drawIntroAnimation();
    drawStartMenu();

  }

}
