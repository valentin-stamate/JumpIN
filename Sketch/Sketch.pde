int x, y, r;

// setup se ruleaza o singura data
void setup(){
  size(600, 800, P2D);// al trilea argument adica render-ul
  background(20);

  x = 100;
  y = width / 2;
  r = 50;
}


// iar draw la fiecare frame
void draw(){
  background(20);

  fill(255); // aka fill(255, 255, 255) // r g b
  rect(x, y, 100, 100, r);
  
  if(r > 0 && frameCount % 2 == 0) // adica la fiecare 2 frame-uri scad din r
    r--;

  if(x < width - 100)
    x++;
  
}
