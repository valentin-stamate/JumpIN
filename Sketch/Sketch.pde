boolean apasat = false;
int x = 450, y = 450, h = 100, w = 100;
int backX = 50, backY = 50, backH = 100, backW = 100;
void setup(){
  size(1000, 1000, P2D);
    frameRate(60);
  if(apasat == true){
    background(color(76, 175, 80));
  
    rectMode(CENTER);
    background(color(76, 175, 80));
  
    drawTable();
    drawRabbits();
    drawFoxes();
    drawMushrooms();
    drawButtonBack();
    
  }else{
    drawMenu();
  }
}


void draw(){
 
}

void mousePressed(){
   if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
       apasat = true;
       setup();
  }else if(mouseX>backX && mouseX <backX+backW && mouseY>backY && mouseY <backY+backH){
    apasat = false;
    setup();
  }
 }

  
