import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sketch extends PApplet {



SoundFile file;

PShape rabbitGrey, rabbitOrange, rabbitWhite;
PShape fox, mushroom;

boolean gameStart = false, mouseOver = false, options = false, quit = false, lockedFox = false;
boolean lockedFirstRabbit = false, lockedSecondRabbit = false, lockedThirdRabbit = false, rabbitMoveUp =false, rabbitMoveLeft = false ;
String MouseFlag;
int gameMenuSize = 50;
int startTime = 14;
int min, second;
int obstacolStanga = 5, obstacolDreapta = 0;


public void setup(){
  
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();

  rectMode(CENTER);
  textAlign(CENTER);
  textMode(SHAPE);
  shapeMode(CENTER);

  file = new SoundFile(this, "./Music/bckMusic2.wav");
  file.loop();
}


public void draw(){
  if(gameStart == true){
    background(gameBkgColor);


    drawTable();

    drawPositions();
    drawGameMenu();
    drawGamewButtons();

    //create timer
    drawTimer();

    checkSelected();
    drawFoxes();


  } else if (options == true){
    background(gameBkgColor);

    drawButtonIesireOption();

  }else if(quit == true){
    exit();
  }else{
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

public void enterOptionButton(){
    options = true;
}

public void exitOptionButton(){
  options = false;
}

public void quitButton(){
   quit = true;
}
//muta vulpile
public void mouseDragged(){
 if(lockedFox){
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga+ 20) &&(mouseX - xOffset < height -200 -cellDistX*obstacolDreapta))){
     int tmp = coordonateFoxJ;
     coordonateFoxJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iFirstRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jFirstRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 }else if(lockedSecondRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iSecondRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jSecondRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 }else if(lockedThirdRabbit){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -cellDistX ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width -60)){
      if(rabbitMoveUp){
        iThirdRabbit = mouseY - yOffset;
      }else if(rabbitMoveLeft){
         jThirdRabbit = mouseX - xOffset;
      }else{
        determinareDirectie();
      }
   }
 }
}

public void determinareDirectie(){
   float directie = directieMouse();
   if((directie < 0) || (directie == 90)){
       rabbitMoveUp = true;
   }else{
      rabbitMoveLeft = true;
   }
}

public void printArray(){
   for(int i = 0; i < 5; i++){
    for(int j = 0 ; j < 5; j++){
        print(tableArray[i][j] + " ");
    }
    println();
   }
}

public void updateFoxPositions(int tmp){
   if(tmp > coordonateFoxJ){
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX -1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-1] == "0"){
         tableArray[fOneI -1][i+1] = "0";
         tableArray[fOneI -1][i] = "F";
         tableArray[fOneI -1][i-1] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
     }else{
       int i =  (coordonateFoxJ + 50 + 80)/cellDistX - 1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-2] == "F"){
         tableArray[fOneI -1][i-2] = "0";
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }

     }
     printArray();
}

public void mouseReleased(){
 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
}


public void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   while(j <= 4){
    if(tableArray[i][j] != "0"){
     obstacolDreapta = 5-(j);
    }
    j++;
   }
}

public void determinaObstacolStanga(){
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

public float directieMouse(){
   float angle = atan2(mouseY - pmouseY,mouseX - pmouseX);
    println(degrees(angle));
   return degrees(angle);
}

// verifica ce animal e selectat si deseneaza pozittile pe care se poate muta
public void checkSelected(){
  if(ROraneSelected){
    drawPossibleMoves(rOneI, rOneJ);
  }
}

public void drawPossibleMoves(int i, int j){


    int iN = i, jN = j;

    // verifica pe toate directiile cand e posibile o nutare

    // sus
    while(iN > 0 && tableArray[iN][jN] != "0"){
      iN--;
    }
    if(iN != i && iN != i - 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
    }

    // jos
    iN = i; jN = j;
    while(iN < 4 && tableArray[iN][jN] != "0"){
      iN++;
    }
    if(iN != i && iN != i + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
    }

    // stanga
    iN = i; jN = j;
    while(jN > 0 && tableArray[iN][jN] != "0"){
      jN--;
    }
    if(jN != j && jN != j - 1 &&  (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
    }

    // dreapta
    iN = i; jN = j;
    while(jN < 4 && tableArray[iN][jN] != "0"){
      jN++;
    }
    if(jN != j && jN != j + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
    }



}

public void drawPossibleMoveSquare(int i, int j){
  fill( color(57,73,171, 60) );
  if(tableArray[i][j] == "5")
    fill(color(142,36,170, 60));

  noStroke();
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
}
// variabile
int cellDistX;
int cellDistY;

int coordonateFoxI =0, coordonateFoxJ =0;
int iFirstRabbit = 0, jFirstRabbit = 0, iSecondRabbit = 0, jSecondRabbit = 0,iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;

boolean ROraneSelected = false;

// incarca imaginile svg
public void loadAssets(){
  rabbitOrange = loadShape("rabbitOrange.svg");
  rabbitGrey = loadShape("rabbitGrey.svg");
  rabbitWhite = loadShape("rabbitWhite.svg");
  mushroom = loadShape("mushroom.svg");
  fox = loadShape("fox.svg");

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}



// deseneaza tabla de joc
public void drawTable(){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(width / 2, height / 2 + gameMenuSize / 2, width - 50, height - gameMenuSize - 50, 40);

  noStroke();

  for(int i = 1; i <= 5; i++){
    for(int j = 1; j <= 5; j++){

      int x = cellDistX * j - 50;
      int y = cellDistY * i - 50;

      fill(color(46,125,50));

      int vf = (i - 1) * 5 + j;
      if(vf == 1 || vf == 5 || vf == 13 || vf == 21 || vf == 25){
        int tl = 8, tr = 8, br = 8, bl = 8;
        // aici desenez casutele pentru iesiri
        if(vf == 1){
          tl = 40;
        } else if(vf == 5){
          tr = 40;
        } else if(vf == 21){
          bl = 40;
        } else if(vf == 25){
          br = 40;
        }
        fill(color(62,39,35));
        circle(x, y + gameMenuSize, 110);
        fill(color(20, 20, 20, 90));
        circle(x, y + gameMenuSize, 90);

        fill(color(255, 255, 255, 30));
        strokeWeight(2);
        stroke(255);
        rect(cellDistX * j - 50, cellDistY * i, cellDistX / 2 + 75, cellDistY / 2 + 75, tl, tr, br, bl);
        noStroke();
        continue;
      }

      circle(x, y + gameMenuSize, 90);
    }
  }

}



// deseneza animalele

public void drawPositions(){

  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if( tableArray[i][j] == "R1" ){
        if(iFirstRabbit == 0 && jFirstRabbit == 0){
         iFirstRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
         jFirstRabbit = cellDistX * (j + 1) - 50 - 11;

         rOneI = i;
         rOneJ = j;
        }


        drawRabbit(jFirstRabbit, iFirstRabbit, rabbitOrange, flagROne);
      }
      else if( tableArray[i][j] == "R2" ){
       if(iSecondRabbit == 0 && jSecondRabbit == 0){
           iSecondRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
           jSecondRabbit = cellDistX * (j + 1) - 50 - 11;
        }
        drawRabbit(jSecondRabbit, iSecondRabbit, rabbitGrey, flagRTwo);
      }
      else if( tableArray[i][j] == "R3" ){
        if(iThirdRabbit == 0 && jThirdRabbit == 0){
           iThirdRabbit = cellDistY * (i + 1) - 50 + gameMenuSize - 10;
           jThirdRabbit = cellDistX * (j + 1) - 50 - 11;
        }
        drawRabbit(jThirdRabbit,iThirdRabbit, rabbitWhite, flagRThree);
      }
      else if( tableArray[i][j] == "M" ){
        drawMushroom(j, i);
      }
    }
  }

}

int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;

int fOneJ = 0, fOneI = 0;
public void drawFoxes(){
  if((coordonateFoxI == 0) && (coordonateFoxJ == 0)){
    int i = 0, j = 0;
    while(((fOneI == 0) || (fOneJ == 0)) &&(i < 5)){
      if( j ==4){
        j = 0;
        i++;
      }
      if((tableArray[i][j] =="0") && (tableArray[i][j+1] == "0")){
        fOneJ = j+2;
        fOneI = i+1;
      }
      j++;

    }
    determinaObstacolDreapta();
    determinaObstacolStanga();
    tableArray[fOneI-1][fOneJ -2] = "F";
    tableArray[fOneI-1][fOneJ -1] = "F";
   coordonateFoxI = cellDistY * fOneI - 50 - 6 + gameMenuSize;
   coordonateFoxJ =  cellDistX * fOneJ - 50 - 80;
  }
  drawFox(coordonateFoxJ, coordonateFoxI, flagFOne);
}

public void drawRabbit(int j, int i, PShape p, String flag){
  int x = j;
  int y = i;
  shape(p, x, y, 76, 110);
  checkMouseOver(x, y, 80, 120 ,flag);
}

public void drawFox(int j, int i, String flag){

  int x = j;
  int y = i;

  shape(fox, x, y, 260, 80);
  checkMouseOver(x, y, 260, 80 ,flag);
}

public void drawMushroom(int j, int i){
  int x = cellDistX * (j + 1) - 50;
  int y = cellDistY * (i + 1) - 50 + gameMenuSize;

  drawSupportOneCell(j, i);
  shape(mushroom, x, y, 100, 100);
}




// meniu
public void drawStartMenu(){

  drawButtonStart();
  drawButtonOption();
  drawQuitButton();

  startTime = (millis()/1000 );
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
  drawButton(width / 2 , height / 2 + gameMenuSize-150, 90, 50, normalBtnCol, startString);
}

public void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, exitString);
}

public void drawButtonOption(){
   drawButton(width / 2, height / 2+ gameMenuSize , 90,50, normalBtnCol, optionsString);
}

public void drawQuitButton(){
   drawButton(width / 2, height / 2  + gameMenuSize+ 150, 90,50, normalBtnCol, quitString);
}

public void drawButtonIesireOption(){
  text("Pagina pentru optiuni", 400, 425);

  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, optionsExitString);
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

public void drawSupportOneCell(int j, int i){
  fill(color(255, 255, 255, 30));
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
}

public void drawSupportVer(int j, int i){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * j - 50, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
}

public void drawSupportHor(int j, int i){
  fill(tableBkgCol);
  strokeWeight(2);
  stroke(255);
  rect(cellDistX * j - 50 - cellDistX / 2, cellDistY * i, cellDistX + 150, cellDistY / 2 + 75, 8);
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

//cronometrul
public void drawTimer(){
    second = (millis()/1000 ) - startTime;
    if(second % 60 == 0){
        min = second / 60;
    }
    int offset = 270;
    text("Timer : ", 400 + offset, gameMenuSize / 2 + 6);
    text(second %60 ,450 + offset, gameMenuSize / 2 + 6);
    text(":", 475 + offset, gameMenuSize / 2 + 6);
    text(min, 500 + offset, gameMenuSize / 2 + 6);
}



// interactiunea cu mouseul
public void checkMouseOver(int x, int y, int bWidth, int bHeight, String s){
  // schimb ca puntul sa fie in stanga sus
  x = x - bWidth / 2;
  y = y - bHeight / 2;
  // daca mouse-ul este pozitionat pe buton pune flag = s pentru a sti ce buton este apasat
  if(mouseX >= x && mouseY >= y && mouseX <= x + bWidth && mouseY <= y + bHeight){
    mouseOver = true;
    MouseFlag = s;
    return;
  }
  // daca ultimul flag este egal cu textul butonului atunci setez flag la false
  if(MouseFlag == s){
    mouseOver = false;
  }
}

public void mousePressed(){
  if(mouseOver){

    if( egal(MouseFlag, startString) == true ){
      startButton();
    } else if( egal(MouseFlag, exitString) == true ){
      exitButton();
    }else if( egal(MouseFlag, optionsString) == true ){
     enterOptionButton();
    }else if(egal(MouseFlag, optionsExitString) == true){
      exitOptionButton();
    }else if(egal(MouseFlag, quitString) == true){
       quitButton();

    } else if( egal(MouseFlag, flagROne) == true ){
      println("rabit one selected");

      ROraneSelected = !ROraneSelected;

      lockedFirstRabbit = true;
      xOffset = mouseX - jFirstRabbit;
      yOffset = mouseY - iFirstRabbit;
    } else if( egal(MouseFlag, flagRTwo) ==true ){
      println("rabbit two selectd");
      lockedSecondRabbit = true;
      xOffset = mouseX - jSecondRabbit;
      yOffset = mouseY - iSecondRabbit;
    } else if( egal(MouseFlag, flagRThree) == true ){
      println("rabbit three  selectd");
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;

    } else if( egal(MouseFlag, flagFOne) == true ){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxJ;
      yOffset = mouseY - coordonateFoxI;

    }
    MouseFlag = "";
  }
}



// functii auxiliare
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
String flagROne = "r1";
String flagRTwo = "r2";
String flagRThree = "r3";
String flagFOne = "f1";
String flagFTwo = "f2";
String quitString = "Quit";
String optionsString = "Optiuni";
String optionsExitString = "Menu";
String tableArray[][] = {
  {"5", "0", "0", "0", "5"},
  {"M", "0", "0", "0", "0"},
  {"0", "R3", "5", "0", "M"},
  {"0", "0", "0", "0", "0"},
  {"5", "0", "R1", "R2", "5"}
};

// 5 means RabbitHole
// R Rabit
// M Mushroom
// F Fox
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
