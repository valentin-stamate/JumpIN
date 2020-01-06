boolean darkMode = false;

void drawDarkModeButton(){
  drawSubTitle(theme, width / 2, 650, 300, 60);
  int x = 400, y = 750;
  int radius = 70;
  noStroke();

  if(darkMode)
    fill(255);
  else
    fill(20);

  circle(x, y, radius);

  checkMouseOver(x, y, radius, radius, darkSwitcher);
}

void changeToDark(){
  println("Changed To Dark");

  gameBkgColor = gameBkgColorDark;
  tableBkgColor = tableBkgColorDark;
  supportCellColor = supportCellColorDark;
  emptyHoleColor = emptyHoleColorDark;
  instructionsBackgroundColor = instructionsBackgroundColorDark;
  rabbitHoleStroke = rabbitHoleStrokeDark;
  rabbitHoleCenter = rabbitHoleCenterDark;
  normalBtnColor1 = normalBtnColor1Dark;
  normalBtnColor2 = normalBtnColor2Dark;
  normalBtnColor3 = normalBtnColor3Dark;
  gameMenuColor = gameMenuColorDark;

}

void changeToNormal(){
  println("Changed To Normal");

  gameBkgColor = gameBkgColorNormal;
  tableBkgColor = tableBkgColorNormal;
  supportCellColor = supportCellColorNormal;
  emptyHoleColor = emptyHoleColorNormal;
  instructionsBackgroundColor = instructionsBackgroundColorNormal;
  rabbitHoleStroke = rabbitHoleStrokeNormal;
  rabbitHoleCenter = rabbitHoleCenterNormal;
  normalBtnColor1 = normalBtnColor1Normal;
  normalBtnColor2 = normalBtnColor2Normal;
  normalBtnColor3 = normalBtnColor3Normal;
  gameMenuColor = gameMenuColorNormal;
}
