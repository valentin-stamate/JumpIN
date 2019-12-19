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
  if(MouseFlag == s){
    mouseOver = false;
  }
}

void mousePressed(){
   click.play();
  if(mouseOver){

    if( egal(MouseFlag, startString) == true ){
      startButton();
    } else if( egal(MouseFlag, exitString) == true ){
      exitButton();
    }else if( egal(MouseFlag, optionsString) == true ){
     enterOptionButton();
    }else if(egal(MouseFlag, optionsExitString) == true){
      exitOptionButton();
    }else if(egal(MouseFlag, quitString) == true){
       quitButton();
    } else if( egal(MouseFlag, selectLevelString) == true ){
      enterSelectLevel();
    }
    // level selectin
    else if( egal(MouseFlag, challenge_1) == true){
      println("Challenge 1 Selected");
    } else if( egal(MouseFlag, challenge_2) == true){
      println("Challenge 2 Selected");
    } else if( egal(MouseFlag, challenge_3) == true){
      println("Challenge 3 Selected");
    } else if( egal(MouseFlag, challenge_4) == true){
      println("Challenge 4 Selected");
    } else if( egal(MouseFlag, challenge_5) == true){
      println("Challenge 5 Selected");
    } else if( egal(MouseFlag, challenge_6) == true){
      println("Challenge 6 Selected");
    } else if( egal(MouseFlag, challenge_7) == true){
      println("Challenge 7 Selected");
    } else if( egal(MouseFlag, challenge_8) == true){
      println("Challenge 8 Selected");
    } else if( egal(MouseFlag, challenge_9) == true){
      println("Challenge 9 Selected");
    }

    else if( egal(MouseFlag, flagROne) == true ){
      println("rabit one selected");

      //ROraneSelected = !ROraneSelected;
      //if(!ROraneSelected){
      //  resetNextMoveArray();
      //}
      lockedFirstRabbit = true;
      xOffset = mouseX - jFirstRabbit;
      yOffset = mouseY - iFirstRabbit;
      iInitialFirstRabbit = (iFirstRabbit - 25) / cellDistX;
      jInitialFirstRabbit = (jFirstRabbit - 25) / cellDistY; 
      
    } else if( egal(MouseFlag, flagRTwo) ==true ){
      println("rabbit two selectd");
      lockedSecondRabbit = true;
      xOffset = mouseX - jSecondRabbit;
      yOffset = mouseY - iSecondRabbit;
      iInitialSecondRabbit = (iSecondRabbit - 25) / cellDistX;
      jInitialSecondRabbit = (jSecondRabbit - 25) / cellDistY; 
      println(iInitialSecondRabbit + " _____++" + jInitialSecondRabbit);
    } else if( egal(MouseFlag, flagRThree) == true ){
      println("rabbit three  selectd");
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;
      iInitialThirdRabbit = (iThirdRabbit - 25) / cellDistX;
      jInitialThirdRabbit = (jThirdRabbit - 25) / cellDistY; 
    } else if( egal(MouseFlag, flagFOne) == true ){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxHJ;
      yOffset = mouseY - coordonateFoxHI;
    }else if(egal(MouseFlag, flagFTwo) == true){
      println("Second Fox is true");
      lockedSecondFox = true;
      xOffset = mouseX - coordonateFoxVI;
      yOffset = mouseY - coordonateFoxVJ;
    }
    MouseFlag = "";
  }
}
