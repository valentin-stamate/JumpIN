// incarca imaginile svg
void loadAssets(){
  rabbitOrange = loadShape("RabbitOrange.svg");
  rabbitGrey = loadShape("RabbitGray.svg");
  rabbitWhite = loadShape("RabbitWhite.svg");
  mushroom = loadShape("Mushroom.svg");
  foxH = loadShape("FoxH.svg");
  foxV = loadShape("FoxV.svg");

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}
