// variabile
int cellDistX;
int cellDistY;



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
int rOneI = 2, rOneJ = 3;
void drawRabbits(){
  shape(rabbitOrange, cellDistX * rOneJ - 99, cellDistY * rOneI - 115 + gameMenuSize, 76, 110);
}

int fOneJ = 4, fOneI = 3;
void drawFoxes(){
  drawSupportHor(fOneJ, fOneI);
  shape(fox, cellDistX * fOneJ - 280, cellDistY * fOneI - 97 + gameMenuSize, 260, 80);
}

int mOneJ = 2, mOneI = 2;
void drawMushrooms(){
  drawSupportOneCell(mOneJ, mOneI);
  shape(mushroom, cellDistX * mOneJ - 100, cellDistY * mOneI - 100 + gameMenuSize, 100, 100);
}



// meniu
void drawStartMenu(){

  drawButtonStart();
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
  drawButton(width / 2 , height / 2 + gameMenuSize, 90, 50, normalBtnCol, startString);
}

void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, exitString);
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
  rect(cellDistX * j - 50, cellDistY * i, cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
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



// interactiunea cu mouseul
void checkMouseOver(int x, int y, int bWidth, int bHeight, String s){
  // schimb ca puntul sa fie in stanga sus
  x = x - bWidth / 2;
  y = y - bHeight / 2;
  // daca mouse-ul este pozitionat pe buton pune flag = s pentru a sti ce buton este apasat
  if(mouseX >= x && mouseY >= y && mouseX <= x + bWidth && mouseY <= y + bHeight){
    mouseOver = true;
    buttonFlag = s;
    return;
  }
  // daca ultimul flag este egal cu textul butonului atunci setez flag la false
  if(buttonFlag == s){
    mouseOver = false;
  }
}

void mousePressed(){
  if(mouseOver){

    if( egal(buttonFlag, startString) == true ){
      startButton();
    } else if( egal(buttonFlag, exitString) == true ){
      exitButton();
    }
    buttonFlag = "";
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
