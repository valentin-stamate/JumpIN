import java.util.ArrayList;
import java.util.List;
import processing.sound.*;

// TODO autosolve bug

void setup(){
  size(800, 850);
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();
  InitializeIntroAnimation();

  rectMode(CENTER);
  textAlign(CENTER);
  shapeMode(CENTER);

  //backgroundMusic = new SoundFile(this, "./Music/bckMusic1.wav");
  //click = new SoundFile(this, "./Music/Click.mp3");
  //backgroundMusic.loop();

  countRabbitsBegining();

  setGameTable(challengeOneTable);
  Challenge = 1;
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

    if(!levelSolving){
      drawSolve();
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

  } else if (instructions == true){
    drawInstructions();

  } else if(quit == true){
    exit();
  } else {

    drawIntroAnimation();
    drawStartMenu();
    //println(countRabbits + " rabb");
  }

  int oneSecond = 60;

  if(levelSolving){
    if(frameCount % oneSecond == 0){
      if(undo.size() > 0){
        pressedUndo();

      } else{
        autoSolve(tableArray, Challenge);
      }
    }
  }


  if(frameCount == 300){
    //setGameTable(challengeSixTable);
  }

}
