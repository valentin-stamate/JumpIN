// interactiunea cu mouseul, butoane iepuri, etc;
void checkMouseOver(int x, int y, int bWidth, int bHeight, String s){
  // schimb ca puntul sa fie in stanga sus
  x = x - bWidth / 2;
  y = y - bHeight / 2;
  // daca mouse-ul este pozitionat pe buton pune flag = s pentru a sti ce buton este apasat
  if(mouseX >= x && mouseY >= y && mouseX <= x + bWidth && mouseY <= y + bHeight){
    mouseOver = true;
    MouseFlag = s;
    return;
  }
  // daca ultimul flag este egal cu textul butonului atunci setez flag la false
  if(MouseFlag.equals(s) ){
    mouseOver = false;
  }
}

void mousePressed(){
   click.play();
  if(mouseOver){

    if(MouseFlag.equals(startString)){
      resetAutoSolving();
      pickRandomLevel();
      println(challengeSixteenSteps);
      startButton();

    } else if(MouseFlag.equals(exitString)){
      exitButton();
    } else if(MouseFlag.equals(optionsString)){
     enterOptionButton();
    } else if(MouseFlag.equals(optionsExitString)){
      exitOptionButton();
    } else if(MouseFlag.equals(quitString)){
       quitButton();
    } else if(MouseFlag.equals(selectLevelString)){
      enterSelectLevel();
    } else if(MouseFlag.equals(instructionString)){
      enterInstructions();
    } if(MouseFlag.equals(undoString)){
      pressedUndo();
    } else if(MouseFlag.equals(solveString)){
      println("Solving");
      levelSolving = true;
    }
    // level selectin
    else if(MouseFlag.equals(challenge_1)){
      println("Challenge 1 Selected");
      setGameTable(challengeOneTable);
      Challenge = 1;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_2)){
      println("Challenge 2 Selected");
      setGameTable(challengeTwoTable);
      Challenge = 2;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_3)){
      println("Challenge 3 Selected");
      setGameTable(challengeThreeTable);
      Challenge = 3;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if( MouseFlag.equals(challenge_4)){
      println("Challenge 4 Selected");
      setGameTable(challengeFourTable);
      Challenge = 4;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_5)){
      println("Challenge 5 Selected");
      setGameTable(challengeFiveTable);
      Challenge = 5;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_6)){
      println("Challenge 6 Selected");
      setGameTable(challengeSixTable);
      Challenge = 6;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_7)){
      println("Challenge 7 Selected");
      setGameTable(challengeSevenTable);
      Challenge = 7;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_8)){
      println("Challenge 8 Selected");
      setGameTable(challengeEightTable);
      Challenge = 8;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(challenge_9)){
      println("Challenge 9 Selected");
      setGameTable(challengeNineTable);
      Challenge = 9;
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    } else if(MouseFlag.equals(randomLevel)){
      randomLevelsIn = true;
      pickRandomLevel();
      selectLevel = false;
      gameStart = true;
      countRabbitsBegining();
    }

    else if(MouseFlag.equals(nextLevel)){
      gameStart  = true;
      gameFinished = false;
      score = 0;
      emptyList();
      determinareNivel(Challenge);
      countRabbitsBegining();
    }
    //animals
    else if(MouseFlag.equals(flagROne)){
      lockedFirstRabbit = true;
      xOffset = mouseX - jFirstRabbit;
      yOffset = mouseY - iFirstRabbit;
      iInitialFirstRabbit = convertCoordToI(iFirstRabbit);
      jInitialFirstRabbit = convertCoordToJ(jFirstRabbit);
      // TODO
      drawPossibleMoves(iInitialFirstRabbit, jInitialFirstRabbit);

    } else if(MouseFlag.equals(flagRTwo)){
      lockedSecondRabbit = true;
      xOffset = mouseX - jSecondRabbit;
      yOffset = mouseY - iSecondRabbit;
      iInitialSecondRabbit = convertCoordToI(iSecondRabbit);
      jInitialSecondRabbit = convertCoordToJ(jSecondRabbit);

      // TODO
      drawPossibleMoves(iInitialSecondRabbit, jInitialSecondRabbit);

    } else if(MouseFlag.equals(flagRThree)){
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;
      iInitialThirdRabbit = convertCoordToI(iThirdRabbit);
      jInitialThirdRabbit = convertCoordToJ(jThirdRabbit);

      // TODO
      drawPossibleMoves(iInitialThirdRabbit, jInitialThirdRabbit);

    } else if(MouseFlag.equals(flagFOne)){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxHJ;
      yOffset = mouseY - coordonateFoxHI;
      if((coordonateFoxHJ - 25) / cellDistY == 0){
         putDataInList("FH", fOneI, 1);
      }else{
       putDataInList("FH", fOneI, (coordonateFoxHJ - 25) / cellDistY);
      }
    }else if(MouseFlag.equals(flagFTwo)){
      lockedSecondFox = true;
      xOffset = mouseX - coordonateFoxVI;
      yOffset = mouseY - coordonateFoxVJ;
      if(( coordonateFoxVJ - 25) / cellDistX == 0){
        putDataInList("FV", fSecondI, 1);
      }else{
        putDataInList("FV", fSecondI, ( coordonateFoxVJ - 25) / cellDistX);
      }
    }
    //changeLanguage
    else if(MouseFlag.equals(romania)){
      changeRomaniaLanguage();
    } else if(MouseFlag.equals(india)){
      changeIndiaLanguage();
    } else if(MouseFlag.equals(china)){
      changeChinaLanguage();
    } else if(MouseFlag.equals(france)){
     changeFranceLanguage();
    } else if(MouseFlag.equals(germany)){
     changeGermanyLanguage();
    } else if(MouseFlag.equals(firstMusic)){
      backgroundMusic.stop();
      backgroundMusic = new SoundFile(this, "./Music/bckMusic1.wav");
      backgroundMusic.loop();
    } else if(MouseFlag.equals(secondMusic)){
      backgroundMusic.stop();
      backgroundMusic = new SoundFile(this, "./Music/bckMusic2.wav");
      backgroundMusic.loop();
    } else if(MouseFlag.equals(noSoundString)){
      backgroundMusic.stop();
    }
    // dark button
    else if(MouseFlag.equals(darkSwitcher)){
      darkMode = !darkMode;
      if(darkMode){
        changeToDark();
      } else {
        changeToNormal();
      }

    }

    MouseFlag = "";
  }
}
