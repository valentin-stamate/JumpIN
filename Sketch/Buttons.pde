// button functions
void startButton(){
  gameStart = true;
  intro = false;
}

void exitButton(){
  gameStart = false;
  intro = false;
  selectLevel = false;
}

void enterOptionButton(){
    options = true;
}

void exitOptionButton(){
  options = false;
  gameFinished = false;
}

void quitButton(){
   quit = true;

}

void enterSelectLevel(){
  gameStart = false;
  options = false;
  selectLevel = true;
}


// butoane
void drawGameButtons(){
  drawButtonIesire();
}

void drawButtonStart(){
  drawButton(width / 4 , height / 2 + 150, 90, 50, normalBtnCol_2, startString);
}

void drawButtonSelectLevel(){
  drawButton(width / 2 , height / 2 + 150, 150, 50, normalBtnCol_2, selectLevelString);
}

void drawButtonOption(){
   drawButton(width / 2, height / 2 + 250, 90,50, normalBtnCol_2, optionsString);
}

void drawQuitButton(){
   drawButton(width * 3 / 4, height / 2 + 150, 90,50, normalBtnCol_2, quitString);
}

void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol_2, exitString);
}
void drawButtonIesireOption(){
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
