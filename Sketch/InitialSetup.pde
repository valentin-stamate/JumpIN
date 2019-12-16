// incarca imaginile svg
void loadAssets(){

  rabbitOrange = loadShape("rabbitOrange.svg");
  rabbitGrey = loadShape("rabbitGrey.svg");
  rabbitWhite = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  foxH = loadShape("FoxH.svg");
  foxV = loadShape("FoxV.svg");
  
  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}
