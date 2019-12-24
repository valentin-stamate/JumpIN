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
SoundFile click;
public void setup(){
  
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();
  InitializeIntroAnimation();

  rectMode(CENTER);
  textAlign(CENTER);
  shapeMode(CENTER);

  file = new SoundFile(this, "./Music/bckMusic1.wav");
  click = new SoundFile(this, "./Music/Click.mp3");
  file.loop();
}


public void draw(){

   if(gameStart == true){
    background(gameBkgColor);

    drawTable();

    drawPositions();
    drawGameMenu();
    drawGameButtons();

    //create timer
    drawTimer();

    checkSelected();
    drawFoxes();
    drawNextMoves();


  } else if (options == true){
    background(gameBkgColor);

    drawButtonIesireOption();

  } else if (selectLevel == true){
    drawSelectLevels();

  } else if(quit == true){
    exit();
  } else {

    drawIntroAnimation();
    drawStartMenu();

  }

}
// button functions
public void startButton(){
  gameStart = true;
  intro = false;
}

public void exitButton(){
  gameStart = false;
  intro = false;
  selectLevel = false;
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

public void enterSelectLevel(){
  gameStart = false;
  options = false;
  selectLevel = true;
}


// butoane
public void drawGameButtons(){
  drawButtonIesire();
}

public void drawButtonStart(){
  drawButton(width / 4 , height / 2 + 150, 90, 50, normalBtnCol_2, startString);
}

public void drawButtonSelectLevel(){
  drawButton(width / 2 , height / 2 + 150, 150, 50, normalBtnCol_2, selectLevelString);
}

public void drawButtonOption(){
   drawButton(width / 2, height / 2 + 250, 90,50, normalBtnCol_2, optionsString);
}

public void drawQuitButton(){
   drawButton(width * 3 / 4, height / 2 + 150, 90,50, normalBtnCol_2, quitString);
}

public void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol_2, exitString);
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
int normalBtnCol = color(48, 63, 159);
int normalBtnCol_2 = color(0, 105, 92);
int gameBkgColor = color(67, 160, 71);
int startMenuBkgCol = color(38, 50, 56);
int tableBkgCol = color(67, 160, 71);
int gameMenuCol = color(38, 50, 56);
int titleColor = color(0, 121, 107);

public void drawTimer(){
    second = (millis()/1000 ) - startTime;
    if(second % 60 == 0){
        min = second / 60;
    }
    int offset = 270;
    text("Score : ", 350, gameMenuSize / 2 + 6);
    text(score, 390, gameMenuSize / 2 + 6);
    text("Timer : ", 400 + offset, gameMenuSize / 2 + 6);
    text(second %60 ,450 + offset, gameMenuSize / 2 + 6);
    text(":", 475 + offset, gameMenuSize / 2 + 6);
    text(min, 500 + offset, gameMenuSize / 2 + 6);
}
//muta vulpile
public void mouseDragged(){
 if(lockedFox){
   if(((mouseX - xOffset > 150+cellDistX*obstacolStanga+ 20) &&(mouseX - xOffset < height -200 -cellDistX*obstacolDreapta))){
     int tmp = coordonateFoxHJ;
     coordonateFoxHJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedSecondFox){
   println("Is here now" );
   println(mouseY - yOffset );
   println( 150 + cellDistY*obstacolJos);
   println(cellDistY*obstacolSus);
   if(((mouseY - yOffset > 150+cellDistY*obstacolJos) &&(mouseY - yOffset < width-100 -cellDistY*obstacolSus))){
    int tmp = coordonateFoxVJ;
     coordonateFoxVJ = mouseY - yOffset;
     //face update pozitiilor vulpii in matrice
     //updateSecondFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   moveFirstRabbit();
 }else if(lockedSecondRabbit){
   moveSecondRabbit();
 }else if(lockedThirdRabbit){
  moveThirdRabbit();
 }
}


public boolean determinareCasutaGoala(int i, int j){
  if(tableArray[i][j] == "0"){
    return true;
  }
  else return false;
}

public boolean determinareCasutaIesire(int i, int j){
  if(tableArray[i][j] == "5"){
    return true;
  }
  else return false;
}

public boolean determinareCasutaObstacol(int i, int j, int dif){
  println(dif + " ___ " + j);
  if(tableArray[i][j] != "0"){
    if(tableArray[i][j] =="5" && dif < 1){
       return false;
    }else{
       return true;
    }
  }
  else return false;
}

public void determinareDirectie(){
   float directie = directieMouse();
   if((directie < 0)){
       rabbitMoveUp = true;
   }else if(directie == 0){
      rabbitMoveRight = true;
   }else if(directie == 180){
      rabbitMoveLeft = true;
   }else{
     rabbitMoveDown = true;
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



public void mouseReleased(){
 int i = 0, j = 0;
 println(count + " )))))))");
  if(lockedFirstRabbit){
      i = (iFirstRabbit - 25) / cellDistX;
      j = (jFirstRabbit - 25) / cellDistY;
      if(iesirePoz(i,j) && count > 0){
         tableArray[i][j] = "R1";
         tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      }else if(iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit) && count > 0){
          tableArray[i][j] = "R1";
          tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
      }else if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R1"))) {
         i = iInitialFirstRabbit;
         j = jInitialFirstRabbit;
      }
  }else if(lockedSecondRabbit){
      i = (iSecondRabbit - 25) / cellDistX;
      j = (jSecondRabbit - 25) / cellDistY;
      println(iSecondRabbit + " ___ " + jSecondRabbit);
       println(iInitialSecondRabbit + " ___ " + jInitialSecondRabbit);
      if(iesirePoz(i,j) && count > 0){
        println("enter here " ) ;
         tableArray[i][j] = "R2";
         tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
      }else if(iesirePoz(iSecondRabbit,jSecondRabbit) && count > 0){
        println("enter here 1 " ) ;
          tableArray[i][j] = "R2";
          tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "5";
      }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
       }else if(count <=1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R2"))) {
        println("enter here 2 " ) ;
         i = iInitialSecondRabbit;
         j = jInitialSecondRabbit;
      }

  }else if(lockedThirdRabbit){
      i = (iThirdRabbit - 25) / cellDistX;
      j = (jThirdRabbit - 25) / cellDistY;
      println(j);
      println(count);
      if( count >0 &&  iesirePoz(i,j) ){
        println("Enter");
         tableArray[i][j] = "R3";
         tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      }else if(count > 0 && iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
        println("Enter1");
          tableArray[i][j] = "R3";
          tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
      }if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R3"))) {
         i = iInitialThirdRabbit;
         j = jInitialThirdRabbit;
      }
  }else if(lockedFox){
    j = (coordonateFoxHJ - 25) / cellDistY;

  }else if(lockedSecondFox){
    i = ( coordonateFoxVJ - 25) / cellDistX;
  }

  if((lockedFirstRabbit) || (lockedSecondRabbit) ||(lockedThirdRabbit)){
     println(i + " " + j);

     moveRabbit(i,j);
  }else if(lockedFox){
    moveFox(j);
  }else if(lockedSecondFox){
    moveSecondFox(i);
  }

 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
 rabbitMoveDown = false;
 rabbitMoveRight = false;

 if(gameStart == true){
   determinaObstacolStanga();
   determinaObstacolDreapta();
   determinaObstacolSus();
   determinaObstacolJos();
   println(obstacolStanga + " " + obstacolDreapta);
  }
}


public boolean iesirePoz(int i, int j){
   if(((i == 0) && (j == 0)) || ((i ==0) &&(j==4))|| ((i == 2) &&(j == 2)) || (( i == 4) && (j==0)) || ((i == 4) &&( j == 4))){
     return true;
   }
   return false;
}

public float directieMouse(){
   float angle = atan2(mouseY - pmouseY,mouseX - pmouseX);
   return degrees(angle);
}

// verifica ce animal e selectat si deseneaza pozittile pe care se poate muta
public void checkSelected(){
  if(ROraneSelected){
    drawPossibleMoves(rOneI, rOneJ);
  }
}


// verifica pe toate directiile cand e posibile o nutare
public void drawPossibleMoves(int i, int j){

    // sus
    int iN = i, jN = j;
    while(iN > 0 && tableArray[iN][jN] != "0"){
      iN--;
    }
    if(iN != i && iN != i - 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      drawPossibleMoveSquare(iN, jN);
      nextMoveArray[iN][jN] = "P";
    }

    // jos
    iN = i; jN = j;
    while(iN < 4 && tableArray[iN][jN] != "0"){
      iN++;
    }
    if(iN != i && iN != i + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

    // stanga
    iN = i; jN = j;
    while(jN > 0 && tableArray[iN][jN] != "0"){
      jN--;
    }
    if(jN != j && jN != j - 1 &&  (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

    // dreapta
    iN = i; jN = j;
    while(jN < 4 && tableArray[iN][jN] != "0"){
      jN++;
    }
    if(jN != j && jN != j + 1 && (tableArray[iN][jN] == "0" || tableArray[iN][jN] == "5") ){
      nextMoveArray[iN][jN] = "P";
    }

}

public void resetNextMoveArray(){
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      nextMoveArray[i][j] = "0";
    }
  }
}

// I <-> Y , J <-> X
public int convertCoordToI(int y){
  return (y - gameMenuSize - 50) / cellDistY;
}

public int convertCoordToJ(int x){
  return (x - 50) / cellDistX;
}

public int convertCoordToX(int j){
  return (cellDistX * (j + 1) - 50);
}

public int convertCoordToY(int i){
  return (cellDistY * (i + 1) - 50 + gameMenuSize - 8);
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
         iFirstRabbit = convertCoordToY(i);
         jFirstRabbit = convertCoordToX(j);

         //rOneI = i;
         //rOneJ = j;
        }

        drawRabbit(jFirstRabbit, iFirstRabbit, rabbitOrange, flagROne);
      }
      else if( tableArray[i][j] == "R2" ){
       if(iSecondRabbit == 0 && jSecondRabbit == 0){
           iSecondRabbit = convertCoordToY(i);
           jSecondRabbit = convertCoordToX(j);
        }
        drawRabbit(jSecondRabbit, iSecondRabbit, rabbitGrey, flagRTwo);
      }
      else if( tableArray[i][j] == "R3" ){
        if(iThirdRabbit == 0 && jThirdRabbit == 0){
           iThirdRabbit = convertCoordToY(i);
           jThirdRabbit = convertCoordToX(j);
        }
        drawRabbit(jThirdRabbit,iThirdRabbit, rabbitWhite, flagRThree);
      }
      else if( tableArray[i][j] == "M" ){
        drawMushroom(j, i);
      }
    }
  }

}

public void drawFoxes(){
  if((coordonateFoxHI == 0) && (coordonateFoxHJ == 0)){
     fOneJ = 3;
     fOneI = 1;
    determinaObstacolDreapta();
    determinaObstacolStanga();
    tableArray[fOneI-1][fOneJ -2] = "F";
    tableArray[fOneI-1][fOneJ -1] = "F";
   coordonateFoxHI = convertCoordToY(fOneI - 1) + 8;
   coordonateFoxHJ =  convertCoordToX(fOneJ - 1) - 80;

    fSecondI = 4;
    fSecondJ = 5;
    determinaObstacolSus();
    determinaObstacolJos();
   coordonateFoxVI = convertCoordToY(fSecondI - 1) - 40;
   coordonateFoxVJ =  convertCoordToX(fSecondJ - 1) - 25;
   tableArray[fSecondJ-2][fSecondI -1] = "F2";
    tableArray[fSecondJ-1][fSecondI -1] = "F2";


    printArray();
  }
  drawFox(coordonateFoxHJ, coordonateFoxHI, 260, 80,flagFOne, foxH);


  // TODO
  // just a demo position
  drawFox(coordonateFoxVI, coordonateFoxVJ, 80, 260, flagFTwo, foxV);
}

public void drawRabbit(int j, int i, PShape p, String flag){
  int x = j;
  int y = i;
  shape(p, x, y, 100, 100);
  checkMouseOver(x, y, 80, 120 ,flag);
}

public void drawFox(int j, int i, int w, int h, String flag, PShape f){

  int x = j;
  int y = i;

  shape(f, x, y, w, h);
  checkMouseOver(x, y, w, h , flag);
}

public void drawMushroom(int j, int i){
  int x = cellDistX * (j + 1) - 50;
  int y = cellDistY * (i + 1) - 50 + gameMenuSize;

  drawSupportOneCell(j, i);
  shape(mushroom, x, y, 100, 100);
}


// --=== ===---
// TODO variables

int distX = width / 4;
int distY = (height - 50) / 4;
int scale = 140;

public void drawSelectLevels(){
  // TODO , adauga ca si string pentru limba

  background(color(76,175,80));
  distX = width / 4;
  distY = (height - 50) / 4;

  drawTitle("Selectare Nivel", 200, 50);

  drawLevel(ch_1, 1, 1, scale, challenge_1);
  drawLevel(ch_2, 2, 1, scale, challenge_2);
  drawLevel(ch_3, 3, 1, scale, challenge_3);
  drawLevel(ch_4, 1, 2, scale, challenge_4);
  drawLevel(ch_5, 2, 2, scale, challenge_5);
  drawLevel(ch_6, 3, 2, scale, challenge_6);
  drawLevel(ch_7, 1, 3, scale, challenge_7);
  drawLevel(ch_8, 2, 3, scale, challenge_8);
  drawLevel(ch_9, 3, 3, scale, challenge_9);

  drawButtonIesire();

}

public void drawLevel(PShape p, int j, int i, int scale, String s){
  int x = distX * j;
  int y = distY * i;
  shape(p, x, y, scale, scale);
  fill(255);
  textSize(15);
  text(s, x, y + 90);

  checkMouseOver(x, y, scale, scale, s);
}

public void drawTitle(String s, int w, int h){
  int x = width / 2;
  int y = 50;
  fill(titleColor);
  rect(x, y, w, h, 16);
  fill(255);
  textSize(24);
  text(s, x , y + 8);
}

// posibilele mutari
public void drawNextMoves(){
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(nextMoveArray[i][j] == "P"){
        drawPossibleMoveSquare(i, j);
      }
    }
  }
}

public void drawPossibleMoveSquare(int i, int j){
  fill( color(57,73,171, 60) );
  if(tableArray[i][j] == "5")
    fill(color(142,36,170, 60));

  noStroke();
  rect(cellDistX * (j + 1) - 50, cellDistY * (i + 1), cellDistX / 2 + 75, cellDistY / 2 + 75, 8);
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
// incarca imaginile svg
public void loadAssets(){
  rabbitOrange = loadShape("RabbitOrange.svg");
  rabbitGrey = loadShape("RabbitGray.svg");
  rabbitWhite = loadShape("RabbitWhite.svg");
  mushroom = loadShape("Mushroom.svg");
  foxH = loadShape("FoxH.svg");
  foxV = loadShape("FoxV.svg");

  ch_1 = loadShape("./Challenges/Challenge_1.svg");
  ch_2 = loadShape("./Challenges/Challenge_2.svg");
  ch_3 = loadShape("./Challenges/Challenge_3.svg");
  ch_4 = loadShape("./Challenges/Challenge_4.svg");
  ch_5 = loadShape("./Challenges/Challenge_5.svg");
  ch_6 = loadShape("./Challenges/Challenge_6.svg");
  ch_7 = loadShape("./Challenges/Challenge_7.svg");
  ch_8 = loadShape("./Challenges/Challenge_8.svg");
  ch_9 = loadShape("./Challenges/Challenge_9.svg");

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}


float rX, rY, fX, fY, mX, mY;
float speedRateY, speedRateX;

float degreeX = 0, degreeY = 0;
int phaze = 0;

public void InitializeIntroAnimation(){

  rabbitWhiteIntro = loadShape("RabbitWhite.svg");
  mushroom = loadShape("Mushroom.svg");
  GameTitle = loadShape("GameTitle.svg");

  rX = cellDistX * 1 - 50;
  rY = cellDistY * 3 - 50;

  fX = cellDistX * 2 - 50;
  fY = cellDistY * 3 - 50;

  mX = cellDistX * 4 - 50;
  mY = cellDistY * 3 - 50;

  shapeMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
}
public void drawIntroAnimation(){
  background(color(67,160,71));

  drawCells();

  shape(mushroom, fX, fY, 100, 100);
  shape(mushroom, mX, mY, 100, 100);
  shape(rabbitWhite, 1.32f * (rX + 6) - 44, (rY - 8), 100, 100);


  animate();
  drawAnimationTitle();
}

float dirY = -2;
float dirX = 2;

public void animate(){

  if(radians(degreeX) < 3 * PI && phaze <= 1){

    if(radians(degreeX) > PI && phaze == 1){
      phaze++;
    }

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

    rY += sin( radians( degreeY ) ) * dirY;
    rX += sin( radians( degreeX ) ) * dirX;

    degreeY += 2;
    degreeX += 1;

  } else {
    degreeX = 0;
    degreeY = 0;
    phaze++;
  }

}


public void drawCells(){
  noStroke();

  int x, y;

  x = cellDistX * 1 - 50;
  y = cellDistY * 3 - 50;

  fill(color(46,125,50));
  circle(x, y, 90);

  x = cellDistX * 3 - 50;
  y = cellDistY * 3 - 50;

  fill(color(46,125,50));
  circle(x, y, 90);


  x = cellDistX * 5 - 50;
  y = cellDistY * 3 - 50;

  fill(color(62,39,35));
  circle(x, y , 110);
  fill(color(20, 20, 20, 90));
  circle(x, y, 90);

  fill(color(255, 255, 255, 30));
  strokeWeight(2);
  stroke(255);

  noStroke();

}

float sc = 1;
float offScale = 0;
int ScaleDegree = 180;


public void drawAnimationTitle(){

  pushMatrix();
  translate(width / 2, 70);
  changeScale();

  scale( sc - offScale );


  fill(titleColor);
  rect(0, 0, 250, 90, 20);

  textSize(48);
  fill(255);
  shape(GameTitle, 0, 5, 200, 100);

  popMatrix();
}

public void changeScale(){
  offScale = sin(radians(ScaleDegree)) * 0.1f;
  ScaleDegree+=2;
}
// meniu
public void drawStartMenu(){

  drawButtonStart();
  drawButtonSelectLevel();
  drawButtonOption();
  drawQuitButton();

  startTime = (millis()/1000 );
}

public void drawGameMenu(){
  noStroke();
  fill(gameMenuCol);
  rect(width / 2, gameMenuSize / 2, width, gameMenuSize);
}




// TODO
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
// interactiunea cu mouseul, butoane iepuri, etc;
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
  click.play();
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
    } else if( egal(MouseFlag, selectLevelString) == true ){
      enterSelectLevel();
    }
    // level selectin
    else if( egal(MouseFlag, challenge_1) == true){
      println("Challenge 1 Selected");
    } else if( egal(MouseFlag, challenge_2) == true){
      println("Challenge 2 Selected");
    } else if( egal(MouseFlag, challenge_3) == true){
      println("Challenge 3 Selected");
    } else if( egal(MouseFlag, challenge_4) == true){
      println("Challenge 4 Selected");
    } else if( egal(MouseFlag, challenge_5) == true){
      println("Challenge 5 Selected");
    } else if( egal(MouseFlag, challenge_6) == true){
      println("Challenge 6 Selected");
    } else if( egal(MouseFlag, challenge_7) == true){
      println("Challenge 7 Selected");
    } else if( egal(MouseFlag, challenge_8) == true){
      println("Challenge 8 Selected");
    } else if( egal(MouseFlag, challenge_9) == true){
      println("Challenge 9 Selected");
    }

    else if( egal(MouseFlag, flagROne) == true ){
      println("rabit one selected");

      //ROraneSelected = !ROraneSelected;
      //if(!ROraneSelected){
      //  resetNextMoveArray();
      //}
      lockedFirstRabbit = true;
      xOffset = mouseX - jFirstRabbit;
      yOffset = mouseY - iFirstRabbit;
      iInitialFirstRabbit = (iFirstRabbit - 25) / cellDistX;
      jInitialFirstRabbit = (jFirstRabbit - 25) / cellDistY; 
      
    } else if( egal(MouseFlag, flagRTwo) ==true ){
      println("rabbit two selectd");
      lockedSecondRabbit = true;
      xOffset = mouseX - jSecondRabbit;
      yOffset = mouseY - iSecondRabbit;
      iInitialSecondRabbit = (iSecondRabbit - 25) / cellDistX;
      jInitialSecondRabbit = (jSecondRabbit - 25) / cellDistY; 
      println(iInitialFirstRabbit + " _____++" + jInitialFirstRabbit);
    } else if( egal(MouseFlag, flagRThree) == true ){
      println("rabbit three  selectd");
      lockedThirdRabbit = true;
      xOffset = mouseX - jThirdRabbit;
      yOffset = mouseY - iThirdRabbit;
      iInitialThirdRabbit = (iThirdRabbit - 25) / cellDistX;
      jInitialThirdRabbit = (jThirdRabbit - 25) / cellDistY; 
    } else if( egal(MouseFlag, flagFOne) == true ){
      lockedFox = true;
      xOffset = mouseX - coordonateFoxHJ;
      yOffset = mouseY - coordonateFoxHI;
    }else if(egal(MouseFlag, flagFTwo) == true){
      println("Second Fox is true");
      lockedSecondFox = true;
      xOffset = mouseX - coordonateFoxVI;
      yOffset = mouseY - coordonateFoxVJ;
    }
    MouseFlag = "";
  }
}
public void updateFoxPositions(int tmp){
   if(tmp > coordonateFoxHJ){
       int i =  (coordonateFoxHJ + 50 + 80)/cellDistX -1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-1] == "0"){
         tableArray[fOneI -1][i+1] = "0";
         tableArray[fOneI -1][i] = "F";
         tableArray[fOneI -1][i-1] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
       fOneJ = i+1;
     }else{
       int i =  (coordonateFoxHJ + 50 + 80)/cellDistX - 1;
       if(tableArray[fOneI -1][i] == "F" && tableArray[fOneI -1][i-2] == "F"){
         tableArray[fOneI -1][i-2] = "0";
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }else{
         tableArray[fOneI -1][i-1] = "F";
         tableArray[fOneI -1][i] = "F";
       }
        fOneJ = i+1;
     }
     printArray();
}

public void updateSecondFoxPositions(int tmp){
   if(tmp > coordonateFoxVJ){
       int i =  (coordonateFoxVJ + 50 + 80)/cellDistX -1;
       if(tableArray[i -1][fOneI] == "F2" && tableArray[fOneI -1][i-1] == "0"){
        tableArray[i +1][fOneI] = "0";
         tableArray[i][fOneI] = "F2";
         tableArray[i-1][fOneI] = "F2";
       }else{
         tableArray[i][fOneI] = "F2";
         tableArray[i-1][fOneI] = "F2";
       }
       fSecondJ = i+1;
     }else{
       int i =  (coordonateFoxVJ + 50 + 80)/cellDistX - 1;
       if( tableArray[i][fOneI] == "F2" && tableArray[i-2][fOneI] == "F2"){
         tableArray[i-2][fOneI] = "0";
         tableArray[i-1][fOneI] = "F2";
         tableArray[i][fOneI] = "F2";
       }else{
        tableArray[i-1][fOneI] = "F2";
         tableArray[i][fOneI] = "F2";
       }
        fSecondJ = i+1;
     }
     printArray();
}

//muta vulpea in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
public void moveFox( int j){
  println(j);
  if(j == obstacolStanga){
     j++;
  }else if(j == obstacolDreapta){
     j--;
  }
  int pozitieJ = cellDistX * (j) + 30;
  coordonateFoxHJ = pozitieJ;
}

public void moveSecondFox( int j){
  if(j == obstacolJos){
     j++;
  }else if(j == obstacolSus -1){
     j--;
  }
  println(j);
  int pozitieJ = cellDistX * (j) + 50;
  coordonateFoxVJ = pozitieJ;
}


public void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   obstacolDreapta = 0;
   while(j <= 4 && obstacolDreapta == 0){
    if(tableArray[i][j] != "0" && tableArray[i][j] != "F"){
     obstacolDreapta = 5-(j);
    }
    j++;
   }
}

public void determinaObstacolStanga(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   obstacolStanga = 5;
   while(obstacolStanga == 5 && j >0  ){
    if(tableArray[i][j -1] != "0"){
      //if(tableArray[i][j -1] != "0" && j == 1){
      //  obstacolStanga = j;
      //}else {
         obstacolStanga = j ;
      //}
    }
    j--;
   }
   if(obstacolStanga == 5){
      obstacolStanga = 0;
   }
}

public void determinaObstacolSus(){
   int j =  fSecondJ -2;
   int i =  fSecondI -1;
   obstacolSus = 0;
   while(j <= 4 && obstacolSus == 0){
     println(j);
    if(tableArray[j][i] != "0" && tableArray[j][i] != "F2"){
     obstacolSus = 5-(j);
    }
    j++;
   }
   println(obstacolSus);
}

public void determinaObstacolJos(){
   int j =  fSecondJ -2;
   int i =  fSecondI -1;
   obstacolJos = 1;
   while(obstacolJos == 1 && j >= 0  ){
    if(tableArray[j][i] != "0" && tableArray[j][i] != "F2"){
      if(j==0){
        obstacolJos++;
      }else{
         obstacolJos += j +1;
      }
    }
    j--;
   }
  obstacolJos--;
   println(obstacolJos);
}
public void moveFirstRabbit(){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iFirstRabbit - 25) / cellDistX;
     int j = (jFirstRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialFirstRabbit - i)){
           iFirstRabbit = mouseY - yOffset;
           count = iInitialFirstRabbit - i;
        }else if(determinareCasutaIesire(i,j)&& count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialFirstRabbit)){
           iFirstRabbit = mouseY - yOffset;
           count = i - iInitialFirstRabbit;
        }else if(determinareCasutaIesire(i,j)&& count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j)&& count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j,jInitialFirstRabbit - j)){
             jFirstRabbit = mouseX - xOffset;
           count =  jInitialFirstRabbit - j ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialFirstRabbit ][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit ][ jInitialFirstRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit )){
           jFirstRabbit = mouseX - xOffset;
           count = j - jInitialFirstRabbit ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
           
            tableArray[i][j] = "R1";
            tableArray[iInitialFirstRabbit][ jInitialFirstRabbit]= "0";
        }
      }else {
        determinareDirectie();
      }
   }
   
}
// muta iepurele si modifica pozita sa
public void moveSecondRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iSecondRabbit - 25) / cellDistX ;
     int j = (jSecondRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
     
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialSecondRabbit - 1)){
           iSecondRabbit = mouseY - yOffset;
           count = iInitialSecondRabbit - i;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialSecondRabbit -1)){
           iSecondRabbit = mouseY - yOffset;
           count = i - iInitialSecondRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j, jInitialSecondRabbit  - 1)){
             jSecondRabbit = mouseX - xOffset;
           count = jInitialSecondRabbit  - j ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialSecondRabbit -1)){
             jSecondRabbit = mouseX - xOffset;
           count =  j - jInitialSecondRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
        
      }else {
        determinareDirectie();
      }
   } 
}

public void moveThirdRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iThirdRabbit - 25) / cellDistX ;
     int j = (jThirdRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
     
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialThirdRabbit - 1)){
           iThirdRabbit = mouseY - yOffset;
           count = iInitialThirdRabbit - i;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveDown &&  i <= 4){
        if(determinareCasutaObstacol(i,j, i - iInitialThirdRabbit -1)){
           iThirdRabbit = mouseY - yOffset;
           count = i - iInitialThirdRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j, jInitialThirdRabbit  - 1)){
             jThirdRabbit = mouseX - xOffset;
           count = jInitialThirdRabbit  - j ;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit ][ jInitialThirdRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j, j - jInitialFirstRabbit -1)){
             jThirdRabbit = mouseX - xOffset;
           count =  j - jInitialFirstRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }
        
      }else {
        determinareDirectie();
      }
   } 
}

public void moveRabbit(int i, int j){
  if( i == 5){
     i--; 
  }else if( j== 5){
     j--; 
  }
  int pozitieI = cellDistX * (i+1) -10;
  int pozitieJ = cellDistX * (j+1) -50;
  
  if(iesirePoz(i,j)){
       score += 100; 
   }
  if(lockedFirstRabbit){
      iFirstRabbit = pozitieI;
      jFirstRabbit = pozitieJ;
  }else if(lockedSecondRabbit){
      iSecondRabbit = pozitieI;
      jSecondRabbit = pozitieJ;
  }else if(lockedThirdRabbit){
     iThirdRabbit = pozitieI;
     jThirdRabbit = pozitieJ;
  }
}
String startString = "Intrare";
String selectLevelString = "Selectare Nivel";
String exitString = "Iesire";
String flagROne = "r1";
String flagRTwo = "r2";
String flagRThree = "r3";
String flagFOne = "f1";
String flagFTwo = "f2";
String quitString = "Quit";
String optionsString = "Optiuni";
String optionsExitString = "Menu";

String challenge_1 = "Challenge 1";
String challenge_2 = "Challenge 2";
String challenge_3 = "Challenge 3";
String challenge_4 = "Challenge 4";
String challenge_5 = "Challenge 5";
String challenge_6 = "Challenge 6";
String challenge_7 = "Challenge 7";
String challenge_8 = "Challenge 8";
String challenge_9 = "Challenge 9";
String tableArray[][] = {
  {"5", "0", "0", "0", "5"},
  {"M", "R3", "0", "R2", "0"},
  {"0", "R1", "5", "0", "M"},
  {"0", "0", "0", "0", "0"},
  {"5", "0", "0", "0", "5"}
};

String nextMoveArray[][] = {
  {"0", "0", "0", "0", "0"},
  {"0", "0", "0", "0", "0"},
  {"0", "0", "0", "0", "0"},
  {"0", "0", "0", "0", "0"},
  {"0", "0", "0", "0", "0"}
};

// 5 means RabbitHole
// R Rabit
// M Mushroom
// F Fox
// --== IMAGINI SVG ==--
PShape rabbitGrey, rabbitOrange, rabbitWhite, foxH, foxV, mushroom;
PShape ch_1, ch_2, ch_3, ch_4, ch_5, ch_6, ch_7, ch_8, ch_9; 

PShape rabbitWhiteIntro, GameTitle;

// --== VARIABILE DE LOGICA ==--
// JOC
boolean intro = true;
boolean gameStart = false;
boolean selectLevel = false;
boolean quit = false;
boolean options = false;
boolean mouseOver = false;

// ANIMALE
boolean lockedFirstRabbit = false;
boolean lockedSecondRabbit = false;
boolean lockedThirdRabbit = false;

boolean rabbitMoveUp = false;
boolean rabbitMoveRight = false;
boolean rabbitMoveLeft = false;
boolean rabbitMoveDown = false;

boolean lockedFox = false;
boolean lockedSecondFox = false;

boolean ROraneSelected = false;

String MouseFlag;

// --== VARIABILE DE JOC ==--
int gameMenuSize = 50;
int startTime = 14;
int min, second;
int obstacolStanga = 5;
int obstacolDreapta = 0;
int obstacolJos = 5;
int obstacolSus = 0;

int cellDistX;
int cellDistY;

int score  = 0;

// --== POZITII ANIMALE ==--
int coordonateFoxHI = 0, coordonateFoxHJ = 0;
int coordonateFoxVI = 0, coordonateFoxVJ = 0;

int iFirstRabbit = 0, jFirstRabbit = 0;
int iSecondRabbit = 0, jSecondRabbit = 0;
int iThirdRabbit = 0, jThirdRabbit = 0;
int xOffset, yOffset;
int iInitialFirstRabbit = 0, jInitialFirstRabbit = 0;
int iInitialSecondRabbit = 0, jInitialSecondRabbit = 0;
int iInitialThirdRabbit = 0, jInitialThirdRabbit = 0;

int count = 0;

// TODO
int rOneI = 1, rOneJ = 2;
int rTwoI = 1, rTwoJ = 3;
int rThreeI = 1, rThreeJ = 4;
int fOneJ = 0, fOneI = 0;
int fSecondJ =0, fSecondI = 0;
  public void settings() {  size(800, 850); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
