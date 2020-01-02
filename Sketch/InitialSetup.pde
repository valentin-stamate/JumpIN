// incarca imaginile svg
void loadAssets(){
  rabbitOrange = loadShape("RabbitOrange.svg");
  rabbitGrey = loadShape("RabbitGray.svg");
  rabbitWhite = loadShape("RabbitWhite.svg");
  mushroom = loadShape("Mushroom.svg");
  foxH = loadShape("FoxH.svg");
  foxV = loadShape("FoxV.svg");
  
  //rom = loadShape("./Flags/romania.svg");
  //chi = loadShape("./Flags/china.svg");
  //ind = loadShape("./Flags/india.svg");
  //ger = loadShape("./Flags/germany.svg");
  //fra = loadShape("./Flags/france.svg");

  ch_1 = loadShape("./Challenges/Challenge_1.svg");
  ch_2 = loadShape("./Challenges/Challenge_2.svg");
  ch_3 = loadShape("./Challenges/Challenge_3.svg");
  ch_4 = loadShape("./Challenges/Challenge_4.svg");
  ch_5 = loadShape("./Challenges/Challenge_5.svg");
  ch_6 = loadShape("./Challenges/Challenge_6.svg");
  ch_7 = loadShape("./Challenges/Challenge_7.svg");
  ch_8 = loadShape("./Challenges/Challenge_8.svg");
  ch_9 = loadShape("./Challenges/Challenge_9.svg");

  instructionsBackground = loadShape("InstructionsBackground.svg");

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}
