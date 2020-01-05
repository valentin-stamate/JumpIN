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

// void drawSupportVer(int j, int i){
//   fill(tableBkgColor);
//   strokeWeight(2);
//   stroke(255);
//   rect(cellDistX * j - 50, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
// }
//
// void drawSupportHor(int j, int i){
//   fill(tableBkgColor);
//   strokeWeight(2);
//   stroke(255);
//   rect(cellDistX * j - 50 - cellDistX / 2, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
// }
