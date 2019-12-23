import java.util.ArrayList;
import java.util.List;
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
  countRabbitsBegining(); 
}


void draw(){

   if(gameStart == true){
    background(gameBkgColor);

    drawTable();
    drawFoxes();
    drawPositions();
    drawGameMenu();
    drawGameButtons();

    //create timer
    drawTimer();

    checkSelected();
    drawNextMoves();
    if(undo.size() > 0){
      drawUndo();
    }
  }else if(gameFinished){
    background(gameBkgColor);
    text("Felicitari ai castigat nivelul si ai obtinut " + score + " points", width/2, height/2);
    drawButtonIesireOption();
   
  }else if (options == true){
    background(gameBkgColor);
    text("Pagina pentru optiuni", 400, 425);
    drawButtonIesireOption();

  } else if (selectLevel == true){
    drawSelectLevels();

  } else if(quit == true){
    exit();
  } else {

    drawIntroAnimation();
    drawStartMenu(); 
    //println(countRabbits + " rabb");
  }

}
