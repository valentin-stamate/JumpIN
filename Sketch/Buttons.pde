// button functions
void startButton(){
  gameStart = true;
  intro = false;
}

void exitButton(){
  gameStart = false;
  intro = false;
  selectLevel = false;
  instructions = false;
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

void enterInstructions(){
  instructions = true;
  gameStart = false;
  options = false;
  selectLevel = false;
}


// butoane
void drawGameButtons(){
  drawButtonIesire();
}

void drawButtonStart(){
  drawButton(width / 4 , height / 2 + 150, 90, 50, normalBtnCol_2, startString);
}

void drawButtonSelectLevel(){
  drawButton(width / 2 , height / 2 + 150, 190, 50, normalBtnCol_2, selectLevelString);
}

void drawButtonOption(){
   drawButton(width * 1 / 3, height / 2 + 250, 90, 50, normalBtnCol_2, optionsString);
}

void drawInstructionsButton(){
   drawButton(width * 2 / 3, height / 2 + 250, 120, 50, normalBtnCol_2, instructionString);
}

void drawQuitButton(){
   drawButton(width * 3 / 4, height / 2 + 150, 90,50, normalBtnCol_2, quitString);
}

void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 90, 30, normalBtnCol_2, exitString);
}

void drawButtonIesireOption(){
  drawButton(40, gameMenuSize / 2, 90, 30, normalBtnCol, optionsExitString);
}

void drawUndo(){
  drawButton(150, gameMenuSize / 2, 120, 30, normalBtnCol, undoString);
}

void drawSolve(){
  drawButton(275, gameMenuSize / 2,115, 30, normalBtnCol, solveString);
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
