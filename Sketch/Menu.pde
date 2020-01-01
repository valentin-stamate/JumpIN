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
  fill(gameMenuCol);
  rect(width / 2, gameMenuSize / 2, width, gameMenuSize);
}




// TODO
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
