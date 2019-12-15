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
     int tmp = coordonateFoxJ;
     coordonateFoxJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   moveFirstRabbit();
 }else if(lockedSecondRabbit){
   moveSecondRabbit();
 }else if(lockedThirdRabbit){
  moveThirdRabbit();
 }
}

void moveFirstRabbit(){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iFirstRabbit - 25) / cellDistX;
     int j = (jFirstRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialFirstRabbit - i)){
           iFirstRabbit = mouseY - yOffset;
           count = iInitialFirstRabbit - i;
        }else if(determinareCasutaIesire(i,j)&& count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialFirstRabbit)){
           iFirstRabbit = mouseY - yOffset;
           count = i - iInitialFirstRabbit;
        }else if(determinareCasutaIesire(i,j)&& count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j)&& count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j,jInitialFirstRabbit - j)){
             jFirstRabbit = mouseX - xOffset;
           count =  jInitialFirstRabbit - j ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialFirstRabbit ][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit ][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit )){
           jFirstRabbit = mouseX - xOffset;
           count = j - jInitialFirstRabbit ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
           
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else {
        determinareDirectie();
      }
   }
   
}
// muta iepurele si modifica pozita sa
void moveSecondRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iSecondRabbit - 25) / cellDistX;
     int j = (jSecondRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
       if(determinareCasutaObstacol(i,j,iInitialSecondRabbit - i)){
           iSecondRabbit = mouseY - yOffset;
           count = iInitialSecondRabbit - i;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialSecondRabbit)){
           iSecondRabbit = mouseY - yOffset;
           count = i - iInitialSecondRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[i][j] = "R2"; 
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j, jInitialSecondRabbit - j)){
             jSecondRabbit = mouseX - xOffset;
           count =  jInitialSecondRabbit - j;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[i][j] = "R2"; 
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            
            tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialSecondRabbit -1)){
             jSecondRabbit = mouseX - xOffset;
           count = j - jInitialSecondRabbit -1;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
           
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else {
        determinareDirectie();
      }
   }
}

void moveThirdRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iThirdRabbit - 25) / cellDistX ;
     int j = (jThirdRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
     
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialThirdRabbit - i)){
           iThirdRabbit = mouseY - yOffset;
           count = iInitialThirdRabbit - i;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialThirdRabbit)){
           iThirdRabbit = mouseY - yOffset;
           count = i - iInitialThirdRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j, jInitialThirdRabbit  - j)){
             jThirdRabbit = mouseX - xOffset;
           count = jInitialThirdRabbit  - j ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit -1)){
             jThirdRabbit = mouseX - xOffset;
           count =  j - jInitialFirstRabbit -1;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
        
      }else {
        determinareDirectie();
      }
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

void updateFoxPositions(int tmp){
   if(tmp > coordonateFoxJ){
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX -1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-1] == "0"){
         tableArray[fOneI -1][i+1] = "0";
         tableArray[fOneI -1][i] = "F";
         tableArray[fOneI -1][i-1] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
       fOneJ = i+3;
     }else{
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX - 1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-2] == "F"){
         tableArray[fOneI -1][i-2] = "0";
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
        fOneJ = i+1;
     }
     printArray();
}

void mouseReleased(){
 int i = 0, j = 0;
  if(lockedFirstRabbit){
      i = (iFirstRabbit - 25) / cellDistX;
      j = (jFirstRabbit - 25) / cellDistY;
      if(iesirePoz(i,j) && count > 1){
         tableArray[i][j] = "R1";
         tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      }else if(iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit) && count > 1){
          tableArray[i][j] = "R1";
          tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
      }else if(count <=1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R1"))) {
         i = iInitialFirstRabbit;
         j = jInitialFirstRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();
  }else if(lockedSecondRabbit){
      i = (iSecondRabbit - 25) / cellDistX;
      j = (jSecondRabbit - 25) / cellDistY;
      println(iSecondRabbit + " " + jSecondRabbit);
      if(iesirePoz(i,j) && count > 1){
         tableArray[i][j] = "R2";
         tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
      }else if(iesirePoz(iSecondRabbit,jSecondRabbit) && count > 1){
          tableArray[i][j] = "R2";
          tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "5";
      }else if(count <=1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R2"))) {
         i = iInitialSecondRabbit;
         j = jInitialSecondRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();
     
  }else if(lockedThirdRabbit){
      i = (iThirdRabbit - 25) / cellDistX;
      j = (jThirdRabbit - 25) / cellDistY;
      println(j);
      println(count);
      if( count >1 &&  iesirePoz(i,j) ){
        println("Enter");
         tableArray[i][j] = "R3";
         tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      }else if(count > 1 && iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
        println("Enter1");
          tableArray[i][j] = "R3";
          tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
      }if(count <=1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R3"))) {
         i = iInitialThirdRabbit;
         j = jInitialThirdRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();
  }else if(lockedFox){
    j = (coordonateFoxJ - 25) / cellDistY;
    
  }
  
  if((lockedFirstRabbit) || (lockedSecondRabbit) ||(lockedThirdRabbit)){
     println(i + " " + j);
     
     moveRabbit(i,j);
  }else if(lockedFox){
    moveFox(j);
  }
  
 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
 rabbitMoveDown = false;
 rabbitMoveRight = false;
}

boolean iesirePoz(int i, int j){
   if(((i == 0) && (j == 0)) || ((i ==0) &&(j==4))|| ((i == 2) &&(j == 2)) || (( i == 4) && (j==0)) || ((i == 4) &&( j == 4))){
     return true;
   }
   return false;
}

//muta iepurii in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
void moveRabbit(int i, int j){
  if( i == 5){
     i--; 
  }else if( j== 5){
     j--; 
  }
  int pozitieI = cellDistX * (i+1) -10;
  int pozitieJ = cellDistX * (j+1) -60;
  
  if(iesirePoz(i,j)){
       score += 100; 
   }
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

//muta vulpea in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
void moveFox( int j){
  println(j);
  if(j == obstacolStanga){
     j++;
  }else if(j == obstacolDreapta){
     j--; 
  }
  int pozitieJ = cellDistX * (j) + 30;
  coordonateFoxJ = pozitieJ;
}

void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   obstacolDreapta = 0;
   while(j <= 4){
   
    if(tableArray[i][j] != "0"){
     obstacolDreapta = 5-(j);
    }
    j++;
   }  
}

void determinaObstacolStanga(){
   int j =  fOneJ -3;
   int i =  fOneI -1;
   obstacolStanga = 5;
   while(obstacolStanga == 5 && j >=0  ){
     println(obstacolStanga +"+++++"+j + " ____" + i);
    if(tableArray[i][j] != "0"){
      if(tableArray[i][j] != "0" && j == 0){
        obstacolStanga = j+1;
      }else {
         obstacolStanga = j;
      }
    }
    j--;
   }
   println(obstacolStanga +"-----"+j);
   if(obstacolStanga == 5){
      obstacolStanga = 0;
   }
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
