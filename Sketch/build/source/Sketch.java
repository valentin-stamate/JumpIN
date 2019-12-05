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

PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false;
String buttonFlag;
int gameMenuSize = 50;

public void setup(){
  
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);

}


public void draw(){

  if(gameStart == true){
    background(gameBkgColor);

    drawTable();
    drawRabbits();
    drawFoxes();
    drawMushrooms();
    drawGameMenu();
    drawGamewButtons();

  } else {
    background(startMenuBkgCol);

    drawStartMenu();
  }

}
public void startButton(){
  gameStart = true;
}

public void exitButton(){
  gameStart = false;
}
// incarca imaginile svg
public void loadAssets(){
  rabbitOrange = loadShape("rabbitWhite.svg");
  rabbitGrey = loadShape("rabbitGrey.svg");
  rabbitWhite = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  fox = loadShape("fox.svg");

}



// deseneaza tabla de joc
public void drawTable(){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2 + gameMenuSize / 2, width - 50, height - gameMenuSize - 50, 40);


  noStroke();
  int distBetweenCirclesX = (width + 100) / 6;
  int distBetweenCirclesY = (height + 100 - gameMenuSize) / 6;

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){

      int x = distBetweenCirclesX * j - 50;
      int y = distBetweenCirclesY * i - 50;

      fill(color(46,125,50));

      int vf = (i - 1) * 5 + j;
      if(vf == 1 || vf == 5 || vf == 13 || vf == 21 || vf == 25){
        fill(color(62,39,35));
        circle(x, y + gameMenuSize, 100);
        fill(color(20, 20, 20, 90));
        circle(x, y + gameMenuSize, 80);
        continue;
      }

      circle(x, y + gameMenuSize, 90);
    }
  }
}



// deseneza animalele
public void drawRabbits(){

}
public void drawFoxes(){

}
public void drawMushrooms(){

}



// meniu
public void drawStartMenu(){

  drawButtonStart();
}

public void drawGameMenu(){
  noStroke();
  fill(gameMenuCol);
  rect(width / 2, gameMenuSize / 2, width, gameMenuSize);
}



// butoane
public void drawGamewButtons(){
  drawButtonIesire();
}

public void drawButtonStart(){
  drawButton(width / 2 , height / 2 + gameMenuSize, 90, 50, normalBtnCol, startString);
}

public void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, exitString);
}

public void drawButton(int x, int y, int bWidth, int bHeight, int col, String s){
  noStroke();
  fill(col);
  rect(x, y, bWidth, bHeight, 8);
  fill( color(255) );
  textSize(15);
  text(s, x, y + 5);

  checkMouseOver(x, y, bWidth, bHeight, s);
}



// miscari
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



// interactiunea cu mouseul
public void checkMouseOver(int x, int y, int bWidth, int bHeight, String s){
  // schimb ca puntul sa fie in stanga sus
  x = x - bWidth / 2;
  y = y - bHeight / 2;
  // daca mouse-ul este pozitionat pe buton pune flag = s pentru a sti ce buton este apasat
  if(mouseX >= x && mouseY >= y && mouseX <= x + bWidth && mouseY <= y + bHeight){
    mouseOver = true;
    buttonFlag = s;
    return;
  }
  // daca ultimul flag este egal cu textul butonului atunci setez flag la false
  if(buttonFlag == s){
    mouseOver = false;
  }
}

public void mousePressed(){
  if(mouseOver){

    if( egal(buttonFlag, startString) == true ){
      startButton();
    } else if( egal(buttonFlag, exitString) == true ){
      exitButton();
    }
    buttonFlag = "";
  }
}

public boolean egal(String a, String b){
  if(a.length() != b.length())
    return false;
  int n = a.length();

  for(int i = 0; i < n; i++){
    if(a.charAt(i) != b.charAt(i)){
      return false;
    }
  }

  return true;
}


// One - Orange
// Two - Grey
// Three - White
int normalBtnCol = color(48, 63, 159);
int gameBkgColor = color(67, 160, 71);
int startMenuBkgCol = color(38, 50, 56);
int tableBkgCol = color(67, 160, 71);
int gameMenuCol = color(38, 50, 56);
String startString = "Intrare";
String exitString = "Iesire";
  public void settings() {  size(800, 850, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
