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
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga) &&(mouseX - xOffset < height -200 -cellDistX*obstacolDreapta))){
    coordonateFoxJ = mouseX - xOffset;
    //coordonateFoxI = mouseY - yOffset;
   }
 }
}

void mouseReleased(){
 locked = false; 
}

void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   while(j <= 4){
    if(tableArray[i][j] != "0"){
     obstacolDreapta = 5-(j); 
    }
    j++;
   }
}

void determinaObstacolStanga(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   while(j >=0 && obstacolStanga == 5 ){
    if(tableArray[i][j] != "0"){
     obstacolStanga = j+1; 
    }
    j--;
   }
   if(obstacolStanga == 5){
      obstacolStanga = 0; 
   }
}
