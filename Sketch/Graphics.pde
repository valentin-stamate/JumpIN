<<<<<<< HEAD
// incarca imaginile svg
void loadAssets(){
  rabbitOrange = loadShape("rabbitWhite.svg");
  rabbitGrey = loadShape("rabbitGrey.svg");
  rabbitWhite = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  fox = loadShape("fox.svg");

=======
void f(){
  // graphics
>>>>>>> 0195df4571d5e1edccc47219206cb7c8a90633ed
}



// deseneaza tabla de joc
void drawTable(){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2 + gameMenuSize / 2, width - 50, height - gameMenuSize - 50, 40);


  noStroke();
  int distBetweenCirclesX = (width + 100) / 6;
  int distBetweenCirclesY = (height + 100 - gameMenuSize) / 6;

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){

      int x = distBetweenCirclesX * j - 50;
      int y = distBetweenCirclesY * i - 50;

      fill(color(46,125,50));

      int vf = (i - 1) * 5 + j;
      if(vf == 1 || vf == 5 || vf == 13 || vf == 21 || vf == 25){
        fill(color(62,39,35));
        circle(x, y + gameMenuSize, 100);
        fill(color(20, 20, 20, 90));
        circle(x, y + gameMenuSize, 80);
        continue;
      }

      circle(x, y + gameMenuSize, 90);
    }
  }
}



// deseneza animalele
void drawRabbits(){

}
void drawFoxes(){

}
void drawMushrooms(){

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
