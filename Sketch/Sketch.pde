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
  imageMode(CENTER);

  backgroundMusic = new SoundFile(this, "./Music/bckMusic1.wav");
  //backgroundMusic.loop();
  //click = new SoundFile(this, "./Music/Click.mp3");

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
    text(winningLevel + score + end,height/2, 200);
    drawButton(300,350, 150,100,normalBtnCol_2, optionsExitString);
    if(Challenge < 9){
      drawButton(500,350, 150,100,normalBtnCol_2, nextLevel);
    }
  }else if (options == true){
    background(gameBkgColor);
    drawFlags();
    drawMusicButtons();
    drawButtonIesireOption();

  } else if (selectLevel == true){
    drawSelectLevels();

  } else if (instructions == true){
    drawInstructions();

  } else if(quit == true){
    exit();
  } else {
    countRabbitsBegining();
    drawIntroAnimation();
    drawStartMenu();
    emptyList();
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
