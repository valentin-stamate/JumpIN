void startButton(){
  gameStart = true;
}

void exitButton(){
  gameStart = false;
}

void enterOptionButton(){
    options = true;
}

void exitOptionButton(){
  options = false;
}

void quitButton(){
   quit = true; 
}
//muta vulpile
void mouseDragged(){
 if(locked){
   if((mouseX - xOffset > 150) &&(mouseX - xOffset < height -200)){
    coordonateFoxJ = mouseX - xOffset;
    //coordonateFoxI = mouseY - yOffset;
   }
 }
}

void mouseReleased(){
 locked = false; 
}
