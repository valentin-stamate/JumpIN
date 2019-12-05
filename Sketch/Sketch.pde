

void setup(){
  size(1000, 1000, P3D);
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
