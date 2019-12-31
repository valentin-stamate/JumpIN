void moveFirstRabbit(){
   if(determinareTabelJoc()){
     int i = convertCoordToI(iFirstRabbit);
     int j = convertCoordToJ(jFirstRabbit);
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
      println(casutaGoalaSus + " !!!! " + (mouseY - yOffset)  + "  " + convertCoordToY(casutaGoalaSus));
      if(mouseY - yOffset >= convertCoordToY(casutaGoalaSus)- 30){
        if(determinareCasutaObstacol(i,j, iInitialFirstRabbit - i)){
           iFirstRabbit = mouseY - yOffset;
           count = iInitialFirstRabbit - i;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
          if(determinareCasutaObstacol(i,j, i - iInitialFirstRabbit)){
             iFirstRabbit = mouseY - yOffset;
             count = i - iInitialFirstRabbit;
          }else if(determinareCasutaGoala(i, j)&& count>0){
              tableArray[i][j] = "R1";
              tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
          }
        }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX - xOffset > convertCoordToX(casutaGoalaStanga)){
           if(determinareCasutaObstacol(i,j,jInitialFirstRabbit - j)){
             jFirstRabbit = mouseX - xOffset;
             count =  jInitialFirstRabbit - j ;
          }else if(determinareCasutaGoala(i, j) && count>0){
              tableArray[i][j] = "R1";
              tableArray[iInitialFirstRabbit ][ jInitialFirstRabbit]= "0";
          }
        }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
           if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit )){
             jFirstRabbit = mouseX - xOffset;
             count = j - jInitialFirstRabbit ;
          }else if(determinareCasutaGoala(i, j) && count>0){
             
              tableArray[i][j] = "R1";
              tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
          }
        }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j);
        casutaGoalaJos = determinareCasutaGoalaSus(i,j);
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j);
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j);
      }
   }
   
}
// muta iepurele si modifica pozita sa
void moveSecondRabbit(){
  if(determinareTabelJoc()){
    int i = convertCoordToI(iSecondRabbit);
    int j = convertCoordToJ(jSecondRabbit);
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
      if(mouseY - yOffset > convertCoordToY(casutaGoalaSus)){
          if(determinareCasutaObstacol(i,j, iInitialSecondRabbit - i)){
             iSecondRabbit = mouseY - yOffset;
             count = iInitialSecondRabbit - i;
          }else if(determinareCasutaGoala(i, j) && count>0){
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
          }
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
          if(determinareCasutaObstacol(i,j, i - iInitialSecondRabbit)){
             iSecondRabbit = mouseY - yOffset;
             count = i - iInitialSecondRabbit;
          }else if(determinareCasutaGoala(i, j)&& count>0){
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
          }
        }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX -xOffset > convertCoordToX(casutaGoalaStanga)){
           if(determinareCasutaObstacol(i,j,jInitialSecondRabbit - j)){
             jSecondRabbit = mouseX - xOffset;
             count =  jInitialSecondRabbit - j ;
          }else if(determinareCasutaGoala(i, j) && count>0){
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
          }
        }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
           if(determinareCasutaObstacol(i,j, j - jInitialSecondRabbit )){
              jSecondRabbit = mouseX - xOffset;
             count = j - jInitialSecondRabbit ;
          }else if(determinareCasutaGoala(i, j) && count>0){        
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
          }
        }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j);
        casutaGoalaJos = determinareCasutaGoalaSus(i,j);
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j);
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j);
      }
   } 
}

void moveThirdRabbit(){
   if(determinareTabelJoc()){
    int i = convertCoordToI(iThirdRabbit);
    int j = convertCoordToJ(jThirdRabbit);
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
        if(mouseY - yOffset > convertCoordToY(casutaGoalaSus)){
          if(determinareCasutaObstacol(i,j, iInitialThirdRabbit - i)){
               iThirdRabbit = mouseY - yOffset;
             count = iInitialThirdRabbit - i;
          }else if(determinareCasutaGoala(i, j) && count>0){
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
          }
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
          if(determinareCasutaObstacol(i,j, i - iInitialThirdRabbit)){
               iThirdRabbit = mouseY - yOffset;
             count = i - iInitialThirdRabbit;
          }else if(determinareCasutaGoala(i, j)&& count>0){
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
          }
        }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX - xOffset > convertCoordToX(casutaGoalaStanga)){
           if(determinareCasutaObstacol(i,j,jInitialThirdRabbit - j)){
               jThirdRabbit = mouseX - xOffset;
             count =  jInitialThirdRabbit - j ;
          }else if(determinareCasutaGoala(i, j) && count>0){
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
          }
        }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
           if(determinareCasutaObstacol(i,j, j - jInitialThirdRabbit )){
              jThirdRabbit = mouseX - xOffset;
             count = j - jInitialThirdRabbit ;
          }else if(determinareCasutaGoala(i, j) && count>0){        
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
          }
        }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j);
        casutaGoalaJos = determinareCasutaGoalaSus(i,j);
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j);
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j);
      }
   } 
}

void moveRabbit(int i, int j){
  if( i == 5){
     i--; 
  }
  if( j== 5){
     j--; 
  }
  int pozitieI = cellDistX * (i+1) -10;
  int pozitieJ = cellDistX * (j+1) -50;
   println(pozitieJ + " ____" + pozitieI);
  
  if(lockedFirstRabbit){
      iFirstRabbit = pozitieI;
      jFirstRabbit = pozitieJ;
  }else if(lockedSecondRabbit){
      iSecondRabbit = pozitieI;
      jSecondRabbit = pozitieJ;
  }else if(lockedThirdRabbit){
     iThirdRabbit = pozitieI;
     jThirdRabbit = pozitieJ;
  }
}

boolean determinareTabelJoc(){
  if(((mouseX - xOffset > 75 ) &&(mouseX - xOffset < width-70)) && ((mouseY - yOffset > 130) && (mouseY - yOffset < height -70))){
    return true;
  }
  return false;
}
