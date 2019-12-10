// variabile
int cellDistX;
int cellDistY;

int coordonateFoxI =0, coordonateFoxJ =0;
int iFirstRabbit = 0, jFirstRabbit = 0, iSecondRabbit = 0, jSecondRabbit = 0,iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;

boolean ROraneSelected = false;

// incarca imaginile svg
void loadAssets(){
  rabbitOrange = loadShape("rabbitOrange.svg");
  rabbitGrey = loadShape("rabbitGrey.svg");
  rabbitWhite = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  fox = loadShape("fox.svg");

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}



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
         iFirstRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
         jFirstRabbit = cellDistX * (j + 1) - 50 - 11;

         rOneI = i;
         rOneJ = j;
        }


        drawRabbit(jFirstRabbit, iFirstRabbit, rabbitOrange, flagROne);
      }
      else if( tableArray[i][j] == "R2" ){
       if(iSecondRabbit == 0 && jSecondRabbit == 0){
           iSecondRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
           jSecondRabbit = cellDistX * (j + 1) - 50 - 11;
        }
        drawRabbit(jSecondRabbit, iSecondRabbit, rabbitGrey, flagRTwo);
      }
      else if( tableArray[i][j] == "R3" ){
        if(iThirdRabbit == 0 && jThirdRabbit == 0){
           iThirdRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
           jThirdRabbit = cellDistX * (j + 1) - 50 - 11;
        }
        drawRabbit(jThirdRabbit,iThirdRabbit, rabbitWhite, flagRThree);
      }
      else if( tableArray[i][j] == "M" ){
        drawMushroom(j, i);
      }
    }
  }

}

int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;

int fOneJ = 0, fOneI = 0;
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
   coordonateFoxI = cellDistY * fOneI - 50 - 6 + gameMenuSize;
   coordonateFoxJ =  cellDistX * fOneJ - 50 - 80;
  }
  drawFox(coordonateFoxJ, coordonateFoxI, flagFOne);
}

void drawRabbit(int j, int i, PShape p, String flag){
  int x = j;
  int y = i;
  shape(p, x, y, 76, 110);
  checkMouseOver(x, y, 80, 120 ,flag);
}

void drawFox(int j, int i, String flag){

  int x = j;
  int y = i;

  shape(fox, x, y, 260, 80);
  checkMouseOver(x, y, 260, 80 ,flag);
}

void drawMushroom(int j, int i){
  int x = cellDistX * (j + 1) - 50;
  int y = cellDistY * (i + 1) - 50 + gameMenuSize;

  drawSupportOneCell(j, i);
  shape(mushroom, x, y, 100, 100);
}




// meniu
void drawStartMenu(){

  drawButtonStart();
  drawButtonOption();
  drawQuitButton();

  startTime = (millis()/1000 );
}

void drawGameMenu(){
  noStroke();
  fill(gameMenuCol);
  rect(width / 2, gameMenuSize / 2, width, gameMenuSize);
}



// butoane
void drawGamewButtons(){
  drawButtonIesire();
}

void drawButtonStart(){
  drawButton(width / 2 , height / 2 + gameMenuSize-150, 90, 50, normalBtnCol, startString);
}

void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, exitString);
}

void drawButtonOption(){
   drawButton(width / 2, height / 2+ gameMenuSize , 90,50, normalBtnCol, optionsString);
}

void drawQuitButton(){
   drawButton(width / 2, height / 2  + gameMenuSize+ 150, 90,50, normalBtnCol, quitString);
}

void drawButtonIesireOption(){
  text("Pagina pentru optiuni", 400, 425);

  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, optionsExitString);
}

void drawButton(int x, int y, int bWidth, int bHeight, color col, String s){
  noStroke();
  fill(col);
  rect(x, y, bWidth, bHeight, 8);
  fill( color(255) );
  textSize(15);
  text(s, x, y + 5);

  checkMouseOver(x, y, bWidth, bHeight, s);
}

void drawSupportOneCell(int j, int i){
  fill(color(255, 255, 255, 30));
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
}

void drawSupportVer(int j, int i){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * j - 50, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
}

void drawSupportHor(int j, int i){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * j - 50 - cellDistX / 2, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
}




// miscari
void moveRabbitOne(int newX, int newY){

}

void moveRabbitTwo(int newX, int newY){

}

void moveRabbitThree(int newX, int newY){

}



// user interaction
void selectRabbitOne(int newX, int newY){

}

void selectRabbitTwo(int newX, int newY){

}

void selectRabbitThree(int newX, int newY){

}

//cronometrul
void drawTimer(){
    second = (millis()/1000 ) - startTime;
    if(second % 60 == 0){
        min = second / 60;
    }
    int offset = 270;
    text("Timer : ", 400 + offset, gameMenuSize / 2 + 6);
    text(second %60 ,450 + offset, gameMenuSize / 2 + 6);
    text(":", 475 + offset, gameMenuSize / 2 + 6);
    text(min, 500 + offset, gameMenuSize / 2 + 6);
}



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

      ROraneSelected = !ROraneSelected;

      lockedFirstRabbit = true;
      xOffset = mouseX - jFirstRabbit;
      yOffset = mouseY - iFirstRabbit;
    } else if( egal(MouseFlag, flagRTwo) ==true ){
      println("rabbit two selectd");
      lockedSecondRabbit = true;
      xOffset = mouseX - jSecondRabbit;
      yOffset = mouseY - iSecondRabbit;
    } else if( egal(MouseFlag, flagRThree) == true ){
      println("rabbit three  selectd");
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;

    } else if( egal(MouseFlag, flagFOne) == true ){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxJ;
      yOffset = mouseY - coordonateFoxI;

    }
    MouseFlag = "";
  }
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
