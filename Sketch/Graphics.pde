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
  if((coordonateFoxHI == 0) && (coordonateFoxHJ == 0)){
     fOneJ = 3;
     fOneI = 1;
    determinaObstacolDreapta();
    determinaObstacolStanga();
    tableArray[fOneI-1][fOneJ -2] = "F";
    tableArray[fOneI-1][fOneJ -1] = "F";
   coordonateFoxHI = convertCoordToY(fOneI - 1) + 8;
   coordonateFoxHJ =  convertCoordToX(fOneJ - 1) - 80;

    fSecondI = 4;
    fSecondJ = 5;
    determinaObstacolSus();
    determinaObstacolJos();
   coordonateFoxVI = convertCoordToY(fSecondI - 1) - 40;
   coordonateFoxVJ =  convertCoordToX(fSecondJ - 1) - 25;
   tableArray[fSecondJ-2][fSecondI -1] = "F2";
    tableArray[fSecondJ-1][fSecondI -1] = "F2";


    printArray();
  }
  drawFox(coordonateFoxHJ, coordonateFoxHI, 260, 80,flagFOne, foxH);


  // TODO
  // just a demo position
  drawFox(coordonateFoxVI, coordonateFoxVJ, 80, 260, flagFTwo, foxV);
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


// --=== ===---
// TODO variables

int distX = width / 4;
int distY = (height - 50) / 4;
int scale = 140;

void drawSelectLevels(){
  // TODO , adauga ca si string pentru limba

  background(color(76,175,80));
  distX = width / 4;
  distY = (height - 50) / 4;

  drawTitle("Selectare Nivel", 200, 50);

  drawLevel(ch_1, 1, 1, scale, challenge_1);
  drawLevel(ch_2, 2, 1, scale, challenge_2);
  drawLevel(ch_3, 3, 1, scale, challenge_3);
  drawLevel(ch_4, 1, 2, scale, challenge_4);
  drawLevel(ch_5, 2, 2, scale, challenge_5);
  drawLevel(ch_6, 3, 2, scale, challenge_6);
  drawLevel(ch_7, 1, 3, scale, challenge_7);
  drawLevel(ch_8, 2, 3, scale, challenge_8);
  drawLevel(ch_9, 3, 3, scale, challenge_9);

  drawButtonIesire();

}

void drawLevel(PShape p, int j, int i, int scale, String s){
  int x = distX * j;
  int y = distY * i;
  shape(p, x, y, scale, scale);
  fill(255);
  textSize(15);
  text(s, x, y + 90);

  checkMouseOver(x, y, scale, scale, s);
}

void drawTitle(String s, int w, int h){
  int x = width / 2;
  int y = 50;
  fill(titleColor);
  rect(x, y, w, h, 16);
  fill(255);
  textSize(24);
  text(s, x , y + 8);
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
