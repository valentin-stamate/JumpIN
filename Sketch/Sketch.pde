
// setup se ruleaza o singura data
void setup(){
  size(800, 800, P2D);// al trilea argument adica render-ul
  background(color(76, 175, 80));

  rectMode(CENTER);
  // some code in graphics branch
}


// iar draw la fiecare frame
void draw(){
  background(color(76, 175, 80));
  drawTable();


}

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
      int x = distBetweenCircles * j - 50;
      int y = distBetweenCircles * i - 50;
      circle(x, y, 90);
    }
  }

}
