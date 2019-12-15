// interactiunea cu mouseul
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

    } else if( egal(MouseFlag, flagROne) == true ){
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
      println(iInitialFirstRabbit + " _____" + jInitialFirstRabbit);
    } else if( egal(MouseFlag, flagRThree) == true ){
      println("rabbit three  selectd");
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;
      iInitialThirdRabbit = (iThirdRabbit - 25) / cellDistX;
      jInitialThirdRabbit = (jThirdRabbit - 25) / cellDistY; 
    } else if( egal(MouseFlag, flagFOne) == true ){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxJ;
      yOffset = mouseY - coordonateFoxI;

    }
    MouseFlag = "";
  }
}
