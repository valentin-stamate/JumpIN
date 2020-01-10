// deseneaza tabla de joc
void drawTable(){
  fill(tableBkgColor);
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2 + gameMenuSize / 2, width - 50, height - gameMenuSize - 50, 40);


  drawSupportOneCell(0, 0);
  drawSupportOneCell(4, 0);
  drawSupportOneCell(0, 4);
  drawSupportOneCell(4, 4);
  drawSupportOneCell(2, 2);

  drawSupportOneCell(2, 0);
  drawSupportOneCell(0, 2);
  drawSupportOneCell(4, 2);
  drawSupportOneCell(2, 4);
  noStroke();

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){

      int x = cellDistX * j - 50;
      int y = cellDistY * i - 50;

      fill( emptyHoleColor );

      int vf = (i - 1) * 5 + j - 1;
      if(vf == 0 || vf == 4 || vf == 12 || vf == 20 || vf == 24){

        // aici desenez casutele pentru iesiri
        fill( rabbitHoleStroke );
        circle(x, y + gameMenuSize, 100);
        fill( rabbitHoleCenter );
        circle(x, y + gameMenuSize, 85);

        continue;
      }

      circle(x, y + gameMenuSize, 90);
    }
  }



}


// deseneza animalele

void drawPositions(){
  // deseneaza mai intai ciupercile ca sa nu se suprapuna cu iepurii
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if( tableArray[i][j].equals("M") ){
        drawMushroom(j, i);
      }
    }
  }

  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){

      if( tableArray[i][j].equals("R1") ){
        if(!lockedFirstRabbit){
         iFirstRabbit = convertCoordToY(i);
         jFirstRabbit = convertCoordToX(j);
        }

        drawRabbit(jFirstRabbit, iFirstRabbit, rabbitOrange, flagROne);
      }
      else if( tableArray[i][j].equals("R2") ){
       if(!lockedSecondRabbit){
           iSecondRabbit = convertCoordToY(i);
           jSecondRabbit = convertCoordToX(j);
        }
        drawRabbit(jSecondRabbit, iSecondRabbit, rabbitGrey, flagRTwo);
      }
      else if( tableArray[i][j].equals("R3") ){
        if(!lockedThirdRabbit){
           iThirdRabbit = convertCoordToY(i);
           jThirdRabbit = convertCoordToX(j);
        }
        drawRabbit(jThirdRabbit,iThirdRabbit, rabbitWhite, flagRThree);
      }

    }
  }

}

void drawFoxes(){
  if(showHorizontalFox){
    drawFox(coordonateFoxHJ, coordonateFoxHI, 260, 80,flagFOne, foxH);
    determinaObstacolDreapta();
    determinaObstacolStanga();
  }
  if(showVerticalFox){
    drawFox(coordonateFoxVI, coordonateFoxVJ, 80, 260, flagFTwo, foxV);
    determinaObstacolSus();
    determinaObstacolJos();
  }
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

  shape(mushroom, x, y, 100, 100);
}

void drawSupportOneCell(int j, int i){
  fill( supportCellColor );
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 32);
}


// --=== ===---

int distX = width / 4;
int distY = (height - 50) / 4;
int scale = 140;

void drawSelectLevels(){

  background( instructionsBackgroundColor );
  distX = width / 4;
  distY = (height - 50) / 4;

  drawTitle(selectLevelString, 200, 50);

  drawLevel(ch_1, 1, 1, scale, challenge_1);
  drawLevel(ch_2, 2, 1, scale, challenge_2);
  drawLevel(ch_3, 3, 1, scale, challenge_3);
  drawLevel(ch_4, 1, 2, scale, challenge_4);
  drawLevel(ch_5, 2, 2, scale, challenge_5);
  drawLevel(ch_6, 3, 2, scale, challenge_6);
  drawLevel(ch_7, 1, 3, scale, challenge_7);
  drawLevel(ch_8, 2, 3, scale, challenge_8);
  drawLevel(ch_9, 3, 3, scale, challenge_9);

  drawButton(width / 2, 760, 170, 60, normalBtnColor2, randomLevel);

  drawButtonIesire();

}

void drawInstructions() {
  background( instructionsBackgroundColor );
  shape(instructionsBackground, width / 2, height / 2, 800, 850);
  drawTitle(instructionString, 160, 50);

  drawText(firstIns, width / 2, 120);
  drawText(secondIns, width / 2, 330);
  drawText(thirdIns, width / 2, 595);
  drawText(fourthIns, width / 2, 760);

  drawButtonIesire();

}

void drawText(String s, int x, int y){
  textSize(18);
  fill(255);
  text(s, x, y);
}

void drawLevel(PShape p, int j, int i, int scale, String s){
  int x = distX * j;
  int y = distY * i;
  shape(p, x, y, scale, scale);
  fill(255);
  textSize(15);
  text(s, x, y + 90);

  drawTitle(selectLevelString, 280, 60);
  checkMouseOver(x, y, scale, scale, s);
}

void drawTitle(String s, int w, int h){
  int x = width / 2;
  int y = 50;
  fill( normalBtnColor3 );
  rect(x, y, w, h, 24);
  fill(255);
  textSize(24);
  text(s, x , y + 8);
}

// posibilele mutari
void drawNextMoves(){

  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(nextMoveArray[i][j].equals("P")){
        drawPossibleMoveSquare(i, j);
      }
    }
  }
}

void drawPossibleMoveSquare(int i, int j){

  fill( color(57,73,171, 60) );
  if( tableArray[i][j].equals("5") )
    fill(color(142,36,170, 60));

  noStroke();
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 40);
}

void drawFlags(){
  drawSubTitle(languageStringTitle, width / 2, 140, 120, 60);

  drawButton(100,250, 100, 75,normalBtnColor1, romania, rom);
  drawButton(250,250, 100, 75,normalBtnColor1, india, ind);
  drawButton(400,250, 100, 75,normalBtnColor1, china, chi);
  drawButton(550,250, 100, 75,normalBtnColor1, france, fra);
  drawButton(700,250, 100, 75,normalBtnColor1, germany, ger);
}

void drawMusicButtons(){
  drawSubTitle(musicStringTitle, width / 2, 440, 300, 60);

  drawButton(width / 4, 550, 150, 60, normalBtnColor1, firstMusic);
  drawButton(width * 2 / 4, 550, 150, 60, normalBtnColor1, secondMusic);
  drawButton(width * 3 / 4, 550, 150, 60, normalBtnColor1, noSoundString);
}

void drawSubTitle(String s, int x, int y, int w, int h){
  fill( normalBtnColor3 );
  rect(x, y, w, h, 24);
  fill(255);
  textSize(24);
  text(s, x , y + 8);
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
