void startButton(){
  gameStart = true;
}

void exitButton(){
  gameStart = false;
}

void enterOptionButton(){
    options = true;
}

void exitOptionButton(){
  options = false;
}

void quitButton(){
   quit = true;
}
//muta vulpile
void mouseDragged(){
 if(lockedFox){
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga+ 20) &&(mouseX - xOffset < height -200 -cellDistX*obstacolDreapta))){
     int tmp = coordonateFoxHJ;
     coordonateFoxHJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedSecondFox){
   println("Is here now" );
   println(mouseY - yOffset );
   println( 150 + cellDistY*obstacolJos);
   println(cellDistY*obstacolSus);
   if(((mouseY - yOffset > 150+cellDistY*obstacolJos) &&(mouseY - yOffset < width-100 -cellDistY*obstacolSus))){
    int tmp = coordonateFoxVJ;
     coordonateFoxVJ = mouseY - yOffset;
     //face update pozitiilor vulpii in matrice
     //updateSecondFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   moveFirstRabbit();
 }else if(lockedSecondRabbit){
   moveSecondRabbit();
 }else if(lockedThirdRabbit){
  moveThirdRabbit();
 }
}


boolean determinareCasutaGoala(int i, int j){
  if(tableArray[i][j] == "0"){
    return true;
  }
  else return false;
}

boolean determinareCasutaIesire(int i, int j){
  if(tableArray[i][j] == "5"){
    return true;
  }
  else return false;
}

boolean determinareCasutaObstacol(int i, int j, int dif){
  println(dif + " ___ " + j);
  if(tableArray[i][j] != "0"){
    if(tableArray[i][j] =="5" && dif < 1){
       return false;
    }else{
       return true;
    }
  }
  else return false;
}

void determinareDirectie(){
   float directie = directieMouse();
   if((directie < 0)){
       rabbitMoveUp = true;
   }else if(directie == 0){
      rabbitMoveRight = true;
   }else if(directie == 180){
      rabbitMoveLeft = true;
   }else{
     rabbitMoveDown = true;
   }
}

void printArray(){
   for(int i = 0; i < 5; i++){
    for(int j = 0 ; j < 5; j++){
        print(tableArray[i][j] + " ");
    }
    println();
   }
}



void mouseReleased(){
 int i = 0, j = 0;
 println(count + " )))))))");
  if(lockedFirstRabbit){
      i = (iFirstRabbit - 25) / cellDistX;
      j = (jFirstRabbit - 25) / cellDistY;
      if(iesirePoz(i,j) && count > 0){
         tableArray[i][j] = "R1";
         tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      }else if(iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit) && count > 0){
          tableArray[i][j] = "R1";
          tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
      }else if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R1"))) {
         i = iInitialFirstRabbit;
         j = jInitialFirstRabbit;
      }
  }else if(lockedSecondRabbit){
      i = (iSecondRabbit - 25) / cellDistX;
      j = (jSecondRabbit - 25) / cellDistY;
      println(iSecondRabbit + " ___ " + jSecondRabbit);
       println(iInitialSecondRabbit + " ___ " + jInitialSecondRabbit);
      if(iesirePoz(i,j) && count > 0){
        println("enter here " ) ;
         tableArray[i][j] = "R2";
         tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
      }else if(iesirePoz(iSecondRabbit,jSecondRabbit) && count > 0){
        println("enter here 1 " ) ;
          tableArray[i][j] = "R2";
          tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "5";
      }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
       }else if(count <=1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R2"))) {
        println("enter here 2 " ) ;
         i = iInitialSecondRabbit;
         j = jInitialSecondRabbit;
      }
     
  }else if(lockedThirdRabbit){
      i = (iThirdRabbit - 25) / cellDistX;
      j = (jThirdRabbit - 25) / cellDistY;
      println(j);
      println(count);
      if( count >0 &&  iesirePoz(i,j) ){
        println("Enter");
         tableArray[i][j] = "R3";
         tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      }else if(count > 0 && iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
        println("Enter1");
          tableArray[i][j] = "R3";
          tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
      }if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R3"))) {
         i = iInitialThirdRabbit;
         j = jInitialThirdRabbit;
      }
  }else if(lockedFox){
    j = (coordonateFoxHJ - 25) / cellDistY;
    
  }else if(lockedSecondFox){
    i = ( coordonateFoxVJ - 25) / cellDistX;
  }
  
  if((lockedFirstRabbit) || (lockedSecondRabbit) ||(lockedThirdRabbit)){
     println(i + " " + j);
     
     moveRabbit(i,j);
  }else if(lockedFox){
    moveFox(j);
  }else if(lockedSecondFox){
    moveSecondFox(i);
  }
  
 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
 rabbitMoveDown = false;
 rabbitMoveRight = false;
 
 determinaObstacolStanga();
 determinaObstacolDreapta();
 determinaObstacolSus();
 determinaObstacolJos();
 println(obstacolStanga + " " + obstacolDreapta);
}


boolean iesirePoz(int i, int j){
   if(((i == 0) && (j == 0)) || ((i ==0) &&(j==4))|| ((i == 2) &&(j == 2)) || (( i == 4) && (j==0)) || ((i == 4) &&( j == 4))){
     return true;
   }
   return false;
}

float directieMouse(){
   float angle = atan2(mouseY - pmouseY,mouseX - pmouseX);
   return degrees(angle);
}

// verifica ce animal e selectat si deseneaza pozittile pe care se poate muta
void checkSelected(){
  if(ROraneSelected){
    drawPossibleMoves(rOneI, rOneJ);
  }
}


// verifica pe toate directiile cand e posibile o nutare
void drawPossibleMoves(int i, int j){

    // sus
    int iN = i, jN = j;
    while(iN > 0 && tableArray[iN][jN] != "0"){
      iN--;
    }
    if(iN != i && iN != i - 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
      nextMoveArray[iN][jN] = "P";
    }

    // jos
    iN = i; jN = j;
    while(iN < 4 && tableArray[iN][jN] != "0"){
      iN++;
    }
    if(iN != i && iN != i + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

    // stanga
    iN = i; jN = j;
    while(jN > 0 && tableArray[iN][jN] != "0"){
      jN--;
    }
    if(jN != j && jN != j - 1 &&  (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

    // dreapta
    iN = i; jN = j;
    while(jN < 4 && tableArray[iN][jN] != "0"){
      jN++;
    }
    if(jN != j && jN != j + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

}

void resetNextMoveArray(){
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      nextMoveArray[i][j] = "0";
    }
  }
}

// I <-> Y , J <-> X
int convertCoordToI(int y){
  return (y - gameMenuSize - 50) / cellDistY;
}

int convertCoordToJ(int x){
  return (x - 50) / cellDistX;
}

int convertCoordToX(int j){
  return (cellDistX * (j + 1) - 50);
}

int convertCoordToY(int i){
  return (cellDistY * (i + 1) - 50 + gameMenuSize - 8);
}
