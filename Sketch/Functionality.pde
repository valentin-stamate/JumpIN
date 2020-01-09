//muta vulpile
void mouseDragged(){
 if(lockedFox){
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga+ 20) &&(mouseX - xOffset < height -150 -cellDistX*obstacolDreapta))){
     int tmp = coordonateFoxHJ;
     coordonateFoxHJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedSecondFox){
   if(((mouseY - yOffset > 150+cellDistY*obstacolJos) &&(mouseY - yOffset < width-100 -cellDistY*obstacolSus))){
      int tmp = coordonateFoxVJ;
     coordonateFoxVJ = mouseY - yOffset;
     println(coordonateFoxVJ + " " + (150+cellDistY*obstacolJos));
     //face update pozitiilor vulpii in matrice
     updateSecondFoxPositions(tmp);
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
  if(tableArray[i][j] != "0"){
    if(tableArray[i][j] =="5" && dif < 2){
       return false;
    }else{
       return true;
    }
  }else return false;
}

void determinareDirectie(){
   float directie = directieMouse();
   println(directie + " !!!!!!!!!!!");
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
  resetNextMoveArray();

 int i = 0, j = 0;
      if(lockedFirstRabbit){
          i = convertCoordToI(iFirstRabbit);
          j = convertCoordToJ(jFirstRabbit);
          println( i + " !!!!!!!! " + j + " !!! " + iInitialFirstRabbit + " " + jInitialFirstRabbit + " " + count );
          if(iesirePoz(i,j) && (count > 1 || count < -1) && tableArray[i][j] == "5" && (i != iInitialFirstRabbit || j != jInitialFirstRabbit) && !iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit)){
             tableArray[i][j] = "R1";
             tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
             score+=100;
          }else if((iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit) && (count > 1 || count < -1))  && (i != iInitialFirstRabbit || j != jInitialFirstRabbit) && (determinareCasutaGoala(i, j))){
              tableArray[i][j] = "R1";
              tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
          }else if((determinareCasutaGoala(i, j) && (count != 0) )&& (i != iInitialFirstRabbit || j != jInitialFirstRabbit)){
              tableArray[i][j] = "R1";
              tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
            }else if((count > 1 || count < -1) || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R1"))) {
             i = iInitialFirstRabbit;
             j = jInitialFirstRabbit;
          }
          if( i != iInitialFirstRabbit || j != jInitialFirstRabbit){
            putDataInList("R1", iInitialFirstRabbit, jInitialFirstRabbit);
          }
      }else if(lockedSecondRabbit){
          i = convertCoordToI(iSecondRabbit);
          j = convertCoordToJ(jSecondRabbit);
          if(iesirePoz(i,j) && (count > 1 || count < -1) && tableArray[i][j] == "5" && (i != iInitialSecondRabbit || j != jInitialSecondRabbit) && !iesirePoz(iInitialSecondRabbit,jInitialSecondRabbit)){
             tableArray[i][j] = "R2";
             tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
             score+=100;
          }else if((iesirePoz(iInitialSecondRabbit,jInitialSecondRabbit) && (count > 1 || count < -1))  && (i != iInitialSecondRabbit || j != jInitialSecondRabbit) && (determinareCasutaGoala(i, j))){
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "5";
          }else if((determinareCasutaGoala(i, j)&& (count != 0))&& (i != iInitialSecondRabbit || j != jInitialSecondRabbit)){
              tableArray[i][j] = "R2";
              tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
          }else if((count > 1 || count < -1) ||  ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R2"))) {
             i = iInitialSecondRabbit;
             j = jInitialSecondRabbit;
          }
          if( i != iInitialSecondRabbit || j != jInitialSecondRabbit){
            putDataInList("R2", iInitialSecondRabbit, jInitialSecondRabbit);
          }
      }else if(lockedThirdRabbit){
          i = convertCoordToI(iThirdRabbit);
          j = convertCoordToJ(jThirdRabbit);
          if( (count > 1 || count < -1) && iesirePoz(i,j) && tableArray[i][j] == "5" && (i != iInitialThirdRabbit || j != jInitialThirdRabbit ) && !iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
             tableArray[i][j] = "R3";
             tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
             score+=100;
          }else if(((count > 1 || count < -1) && iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)) && (i != iInitialThirdRabbit || j != jInitialThirdRabbit )  && (determinareCasutaGoala(i, j))){
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
          }else if((determinareCasutaGoala(i, j) && count != 0) && (i != iInitialThirdRabbit || j != jInitialThirdRabbit )){
              tableArray[i][j] = "R3";
              tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
          }if((count > 1 || count < -1) || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R3"))) {
             i = iInitialThirdRabbit;
             j = jInitialThirdRabbit;
          }
          if( i != iInitialThirdRabbit || j != jInitialThirdRabbit){
            putDataInList("R3", iInitialThirdRabbit, jInitialThirdRabbit);
          }
      }else if(lockedFox){
        j = (coordonateFoxHJ - 25) / cellDistY;
      }else if(lockedSecondFox){
        i = ( coordonateFoxVJ - 25) / cellDistX;
      }
      if((lockedFirstRabbit) || (lockedSecondRabbit) ||(lockedThirdRabbit)){
        moveRabbit(i,j);
      }else if(lockedFox && showHorizontalFox){
        moveFox(j);
      }else if(lockedSecondFox && showVerticalFox){
        moveSecondFox(i);
      }

      if(rabbitsInHoles() == countRabbits && gameStart == true){
        gameFinished = true;
        gameStart = false;
      }


 lockedFox = false;
 lockedSecondFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
 rabbitMoveDown = false;
 rabbitMoveRight = false;

 if(gameStart == true){

  if(showHorizontalFox){
    determinaObstacolStanga();
    determinaObstacolDreapta();
  }

  if(showVerticalFox){
    determinaObstacolSus();
    determinaObstacolJos();
  }

 }
 printArray();
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
    int iN = i - 1, jN = j;
    while(iN > 0 && tableArray[iN][jN] != "0"){
      iN--;
    }
    if(iN != i - 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){

      nextMoveArray[iN][jN] = "P";
    }
    // pentru celula din mjloc
    iN = i - 1; jN = j;

    if(j == 2){
        while(iN > 0 && !tableArray[iN][jN].equals("5") && !tableArray[iN][jN].equals("0")){
          iN--;
        }
    }
    if(i - 1 != iN && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }

    // jos
    iN = i + 1; jN = j;
    while(iN < 4 && tableArray[iN][jN] != "0"){
      iN++;
    }
    if(iN != i + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }
    // pentru celula din mjloc
    iN = i + 1; jN = j;

    if(j == 2){
        while(iN < 4 && !tableArray[iN][jN].equals("5") && !tableArray[iN][jN].equals("0")){
          iN++;
        }
    }
    if(i + 1 != iN && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }

    // stanga
    iN = i; jN = j - 1;
    while(jN > 0 && !tableArray[iN][jN].equals("0")){
      jN--;
    }
    if(jN != j - 1 &&  (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }

    // pentru celula din mjloc
    iN = i; jN = j - 1;

    if(i == 2){
        while(jN > 0 && !tableArray[iN][jN].equals("5") && !tableArray[iN][jN].equals("0")){
          jN--;
        }
    }
    if(j - 1 != jN && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }



    // dreapta
    iN = i; jN = j + 1;
    while(jN < 4 && tableArray[iN][jN] != "0"){
      jN++;
    }
    if(jN != j + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }
    // pentru celula din mjloc
    iN = i; jN = j + 1;

    if(i == 2){
        while(jN < 4 && !tableArray[iN][jN].equals("5") && !tableArray[iN][jN].equals("0")){
          jN++;
        }
    }
    if(j + 1 != jN  && (tableArray[iN][jN] == "0" || tableArray[iN][jN].equals("5")) ){
      nextMoveArray[iN][jN] = "P";
    }

}

int determinareCasutaGoalaJos(int c, int j, String caracter){
  for(int i = c; i >= 0; i--){
    if (i >= 0 && i < 4 && tableArray[i][j] == "0" && tableArray[i +1][j] == caracter){
      return i +1;
    }else if(tableArray[i][j] == "0"){
     return i;
    }
  }
  return 0;
}

int determinareCasutaGoalaSus(int c, int j, String caracter){
  for(int i = c; i <= 4; i++){
    if (i > 0 && i <= 4){
      println(tableArray[i][j] + " !!!!!!!  " + tableArray[i - 1][j]);
    }
    if (i > 0 && i <= 4 && tableArray[i][j] == "0" && tableArray[i - 1][j] == caracter){
      return i -1;
    }else if(tableArray[i][j] == "0"){
     return i;
    }
  }
  return 4;
}

int determinareCasutaGoalaDreapta(int c, int j, String caracter){
  for(int i = j; i <= 4; i++){
    if(i > 0 && i <= 4 && tableArray[c][i] =="0" && tableArray[c][i-1] == caracter){
      return i-1;
    }else if(tableArray[c][i] == "0"){
     return i;
    }
  }
  return 4;
}

int determinareCasutaGoalaStanga(int c, int j, String caracter){
  for(int i = j; i >= 0; i--){
     if(i >= 0 && i < 4 && tableArray[c][i] =="0" && tableArray[c][i+1] == caracter){
      return i+1;
    }else if(tableArray[c][i] == "0"){
     return i;
    }
  }
  return 0;
}

void determinareNivel(int challenge){
  switch(challenge){
    case 1:
      println("Challenge 2 Selected");
      setGameTable(challengeTwoTable);
      break;
    case 2:
      println("Challenge 3 Selected");
      setGameTable(challengeThreeTable);
      break;
    case 3:
      println("Challenge 4 Selected");
      setGameTable(challengeFourTable);
      break;
    case 4:
      println("Challenge 5 Selected");
      setGameTable(challengeFiveTable);
      break;
    case 5:
      println("Challenge 6 Selected");
      setGameTable(challengeSixTable);
      break;
    case 6:
      println("Challenge 7 Selected");
      setGameTable(challengeSevenTable);
      break;
    case 7:
      println("Challenge 8 Selected");
      setGameTable(challengeEightTable);
      break;
    case 8:
      println("Challenge 9 Selected");
      setGameTable(challengeNineTable);
      break;
  }
  Challenge++;
}

void resetTable(){
  switch(Challenge){
    case 1:
      println("Challenge 1 Selected");
      setGameTable(challengeOneTable);
      break;
    case 2:
      println("Challenge 2 Selected");
      setGameTable(challengeTwoTable);
      break;
    case 3:
      println("Challenge 3 Selected");
      setGameTable(challengeThreeTable);
      break;
    case 4:
      println("Challenge 4 Selected");
      setGameTable(challengeFourTable);
      break;
    case 5:
      println("Challenge 5 Selected");
      setGameTable(challengeFiveTable);
      break;
    case 6:
      println("Challenge 6 Selected");
      setGameTable(challengeSixTable);
      break;
    case 7:
      println("Challenge 7 Selected");
      setGameTable(challengeSevenTable);
      break;
    case 8:
      println("Challenge 8 Selected");
      setGameTable(challengeEightTable);
      break;
    case 9:
      println("Challenge 9 Selected");
      setGameTable(challengeNineTable);
      break;
  }
  score = 0;
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

void emptyList(){
 undo = new ArrayList<Undo>();
}
