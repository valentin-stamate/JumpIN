import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sketch extends PApplet {



public void setup(){
  
  background(color(76, 175, 80));

  rectMode(CENTER);
}


public void draw(){
  background(color(76, 175, 80));

  drawTable();
  drawRabbits();
  drawFoxes();
  drawMushrooms();

}
// Intuitiv functiile pe care o sa le implementez:
// move Rabbit/Fox One/Two/Three (newX, newY)
// Cand plimbi mouse-ul si intalnesti un/o iepure/vulpe o sa am
// select Rabbit/Fox One/Two/Three() si o sa aiba posibilele mutari
// o sa mai adaug functii in Graphics
// draw stuff
public void drawTable(){
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

public void drawRabbits(){

}

public void drawFoxes(){

}

public void drawMushrooms(){

}

// moving
public void moveRabbitOne(int newX, int newY){

}

public void moveRabbitTwo(int newX, int newY){

}

public void moveRabbitThree(int newX, int newY){

}

// user interaction
public void selectRabbitOne(int newX, int newY){

}

public void selectRabbitTwo(int newX, int newY){

}

public void selectRabbitThree(int newX, int newY){

}
  public void settings() {  size(800, 800, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
