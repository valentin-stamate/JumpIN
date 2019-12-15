
  
// deseneaza tabla de joc
void drawTable(){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2 + gameMenuSize / 2, width - 50, height - gameMenuSize - 50, 40);

  noStroke();

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){

      int x = cellDistX * j - 50;
      int y = cellDistY * i - 50;

      fill(color(46,125,50));

      int vf = (i - 1) * 5 + j;
      if(vf == 1 || vf == 5 || vf == 13 || vf == 21 || vf == 25){
        int tl = 8, tr = 8, br = 8, bl = 8;
        // aici desenez casutele pentru iesiri
        if(vf == 1){
          tl = 40;
        } else if(vf == 5){
          tr = 40;
        } else if(vf == 21){
          bl = 40;
        } else if(vf == 25){
          br = 40;
        }
        fill(color(62,39,35));
        circle(x, y + gameMenuSize, 110);
        fill(color(20, 20, 20, 90));
        circle(x, y + gameMenuSize, 90);

        fill(color(255, 255, 255, 30));
        strokeWeight(2);
        stroke(255);
        rect(cellDistX * j - 50, cellDistY * i, cellDistX / 2 + 75, cellDistY / 2 + 75, tl, tr, br, bl);
        noStroke();
        continue;
      }

      circle(x, y + gameMenuSize, 90);
    }
  }

}


// deseneza animalele

void drawPositions(){

  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if( tableArray[i][j] == "R1" ){
        if(iFirstRabbit == 0 && jFirstRabbit == 0){
         iFirstRabbit = convertCoordToY(i);
         jFirstRabbit = convertCoordToX(j);

         //rOneI = i;
         //rOneJ = j;
        }

        drawRabbit(jFirstRabbit, iFirstRabbit, rabbitOrange, flagROne);
      }
      else if( tableArray[i][j] == "R2" ){
       if(iSecondRabbit == 0 && jSecondRabbit == 0){
           iSecondRabbit = convertCoordToY(i);
           jSecondRabbit = convertCoordToX(j);
        }
        drawRabbit(jSecondRabbit, iSecondRabbit, rabbitGrey, flagRTwo);
      }
      else if( tableArray[i][j] == "R3" ){
        if(iThirdRabbit == 0 && jThirdRabbit == 0){
           iThirdRabbit = convertCoordToY(i);
           jThirdRabbit = convertCoordToX(j);
        }
        drawRabbit(jThirdRabbit,iThirdRabbit, rabbitWhite, flagRThree);
      }
      else if( tableArray[i][j] == "M" ){
        drawMushroom(j, i);
      }
    }
  }

}

void drawFoxes(){
  if((coordonateFoxI == 0) && (coordonateFoxJ == 0)){
    int i = 0, j = 0;
    while(((fOneI == 0) || (fOneJ == 0)) &&(i < 5)){
      if( j ==4){
        j = 0;
        i++;
      }
      if((tableArray[i][j] =="0") && (tableArray[i][j+1] == "0")){
        fOneJ = j+2;
        fOneI = i+1;
      }
      j++;

    }
    determinaObstacolDreapta();
    determinaObstacolStanga();
    tableArray[fOneI-1][fOneJ -2] = "F";
    tableArray[fOneI-1][fOneJ -1] = "F";
   coordonateFoxI = convertCoordToY(fOneI - 1) + 8;
   coordonateFoxJ =  convertCoordToX(fOneJ - 1) - 80;
  }
  drawFox(coordonateFoxJ, coordonateFoxI, 260, 80,flagFOne, foxH);


  // TODO
  // just a demo position
  drawFox(convertCoordToX(3), convertCoordToY(4) - 72, 80, 260, flagFTwo, foxV);
}

void drawRabbit(int j, int i, PShape p, String flag){
  int x = j;
  int y = i;
  shape(p, x, y, 100, 100);
  checkMouseOver(x, y, 80, 120 ,flag);
}

void drawFox(int j, int i, int w, int h, String flag, PShape f){

  int x = j;
  int y = i;

  shape(f, x, y, w, h);
  checkMouseOver(x, y, w, h , flag);
}

void drawMushroom(int j, int i){
  int x = cellDistX * (j + 1) - 50;
  int y = cellDistY * (i + 1) - 50 + gameMenuSize;

  drawSupportOneCell(j, i);
  shape(mushroom, x, y, 100, 100);
}







// posibilele mutari
void drawNextMoves(){
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(nextMoveArray[i][j] == "P"){
        drawPossibleMoveSquare(i, j);
      }
    }
  }
}

void drawPossibleMoveSquare(int i, int j){
  fill( color(57,73,171, 60) );
  if(tableArray[i][j] == "5")
    fill(color(142,36,170, 60));

  noStroke();
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
}



// functii auxiliare
boolean egal(String a, String b){
  if(a.length() != b.length())
    return false;
  int n = a.length();

  for(int i = 0; i < n; i++){
    if(a.charAt(i) != b.charAt(i)){
      return false;
    }
  }

  return true;
}


// One - Orange
// Two - Grey
// Three - White
