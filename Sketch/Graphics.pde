  // draw stuff
void drawTable(){
  noFill();
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2, width - 50, height - 50, 40);


  fill(color(56, 142, 60));
  noStroke();
  int distBetweenCircles = (width + 100) / 6;

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){
      if(((i == j) && (j == 5/2+1)) || (( i == 1 ) && (j ==1)) || (( i ==1) && (j ==5)) || ((i == 5) &&(j ==5)) || (( i == 5) && (j == 1))){
        fill(color(128,0,0));
      }else{
        fill(color(56, 142, 60));
      }
      int x = distBetweenCircles * j - 50;
      int y = distBetweenCircles * i - 50;
      circle(x, y, 90);
    }
  }
}

void drawRabbits(){

}

void drawFoxes(){

}

void drawMushrooms(){

}

// moving
void moveRabbitOne(int newX, int newY){

}

void moveRabbitTwo(int newX, int newY){

}

void moveRabbitThree(int newX, int newY){

}

// user interaction
void selectRabbitOne(int newX, int newY){

}

void selectRabbitTwo(int newX, int newY){

}

void selectRabbitThree(int newX, int newY){

}
