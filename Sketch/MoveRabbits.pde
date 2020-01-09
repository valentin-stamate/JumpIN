void moveFirstRabbit(){
   if(determinareTabelJoc()){
     int i = convertCoordToI(iFirstRabbit);
     int j = convertCoordToJ(jFirstRabbit);
     int tmp;
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
      if(mouseY - yOffset >= convertCoordToY( casutaGoalaSus)){
           tmp = iFirstRabbit;
           iFirstRabbit = mouseY - yOffset;
           count = iInitialFirstRabbit - i;
           if(iFirstRabbit > tmp){
             rabbitMoveDown = true;
             rabbitMoveUp = false;;
           }
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
             tmp = iFirstRabbit;
             iFirstRabbit = mouseY - yOffset;
             count = i - iInitialFirstRabbit;
             if(iFirstRabbit < tmp){
               rabbitMoveDown = false;
               rabbitMoveUp = true;
             }
        }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX - xOffset > convertCoordToX(casutaGoalaStanga)){
             tmp = jFirstRabbit;
             jFirstRabbit = mouseX - xOffset;
             count =  jInitialFirstRabbit - j ;
             if(jFirstRabbit > tmp){
               rabbitMoveRight = true;
               rabbitMoveLeft = false;
             }
          }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
           if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit )){
             tmp = jFirstRabbit;
             jFirstRabbit = mouseX - xOffset;
             count = j - jInitialFirstRabbit ;
             if(jFirstRabbit < tmp){
               rabbitMoveRight = false;
               rabbitMoveLeft = true;
             }
          }
        }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j, "R1");
        casutaGoalaJos = determinareCasutaGoalaSus(i,j, "R1");
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j, "R1");
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j, "R1");
      }
   }
   
}
// muta iepurele si modifica pozita sa
void moveSecondRabbit(){
  if(determinareTabelJoc()){
    int i = convertCoordToI(iSecondRabbit);
    int j = convertCoordToJ(jSecondRabbit);
    int tmp;
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
      if(mouseY - yOffset >= convertCoordToY(casutaGoalaSus)){
            tmp = iSecondRabbit;
             iSecondRabbit = mouseY - yOffset;
             count = iInitialSecondRabbit - i;
             if(iSecondRabbit > tmp){
               rabbitMoveDown = true;
               rabbitMoveUp = false;;
             }
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
             tmp = iSecondRabbit;
             iSecondRabbit = mouseY - yOffset;
             count = i - iInitialSecondRabbit;
             if(iSecondRabbit < tmp){
               rabbitMoveDown = false;
               rabbitMoveUp = true;
             }
          }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX -xOffset > convertCoordToX(casutaGoalaStanga)){
             tmp = jSecondRabbit;
             jSecondRabbit = mouseX - xOffset;
             count =  jInitialSecondRabbit - j ;
             if(jSecondRabbit > tmp){
               rabbitMoveRight = true;
               rabbitMoveLeft = false;
             }
          }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
              tmp = jSecondRabbit;
              jSecondRabbit = mouseX - xOffset;
              count = j - jInitialSecondRabbit ;
              if(jSecondRabbit < tmp){
               rabbitMoveRight = false;
               rabbitMoveLeft = true;
              }
          }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j, "R2");
        casutaGoalaJos = determinareCasutaGoalaSus(i,j,"R2");
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j,"R2");
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j,"R2");
      }
   } 
}

void moveThirdRabbit(){
   if(determinareTabelJoc()){
    int i = convertCoordToI(iThirdRabbit);
    int j = convertCoordToJ(jThirdRabbit);
    int tmp;
     //printArray();
     //println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
        if(mouseY - yOffset > convertCoordToY(casutaGoalaSus)){
             tmp = iThirdRabbit;
             iThirdRabbit = mouseY - yOffset;
             count = iInitialThirdRabbit - i;
             if(iThirdRabbit > tmp){
               rabbitMoveDown = true;
               rabbitMoveUp = false;;
             }
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(mouseY - yOffset < convertCoordToY(casutaGoalaJos)){
               tmp = iThirdRabbit;
               iThirdRabbit = mouseY - yOffset;
               count = i - iInitialThirdRabbit;
               if(iThirdRabbit < tmp){
                 rabbitMoveDown = false;
                 rabbitMoveUp = true;
               }
        }
      }else if(rabbitMoveLeft &&  j >= 0){
        if(mouseX - xOffset > convertCoordToX(casutaGoalaStanga)){
             tmp = jThirdRabbit;
             jThirdRabbit = mouseX - xOffset;
             count =  jInitialThirdRabbit - j ;
             if(jThirdRabbit > tmp){
               rabbitMoveRight = true;
               rabbitMoveLeft = false;
             }
        }
      }else if(rabbitMoveRight  && j <= 4 ){
        if(mouseX - xOffset < convertCoordToX(casutaGoalaDreapta)){
             tmp = jThirdRabbit;
             jThirdRabbit = mouseX - xOffset;
             count = j - jInitialThirdRabbit ;
             if(jThirdRabbit < tmp){
               rabbitMoveRight = false;
               rabbitMoveLeft = true;
             }
        }
      }else {
        determinareDirectie();
        casutaGoalaSus = determinareCasutaGoalaJos(i,j,"R3");
        casutaGoalaJos = determinareCasutaGoalaSus(i,j,"R3");
        casutaGoalaDreapta = determinareCasutaGoalaDreapta(i,j,"R3");
        casutaGoalaStanga = determinareCasutaGoalaStanga(i,j,"R3");
        println(casutaGoalaSus + " Sus");
        println(casutaGoalaJos + " Jos");
        println(casutaGoalaDreapta + " Dreapta");
        println(casutaGoalaStanga + " Stanga");    
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
