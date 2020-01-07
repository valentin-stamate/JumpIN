// meniu
void drawStartMenu(){

  drawButtonStart();
  drawButtonSelectLevel();
  drawInstructionsButton();
  drawButtonOption();
  drawQuitButton();

  startTime = (millis()/1000 );
}

void drawGameMenu(){
  noStroke();
  fill(gameMenuColor);
  rect(width / 2, gameMenuSize / 2, width, gameMenuSize);
}
