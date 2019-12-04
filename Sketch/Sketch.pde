

void setup(){
  size(800, 800, P2D);
  frameRate(60);
  background(color(76, 175, 80));

  rectMode(CENTER);
}


void draw(){
  background(color(76, 175, 80));

  drawTable();
  drawRabbits();
  drawFoxes();
  drawMushrooms();

}
