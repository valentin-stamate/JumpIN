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

public void setup(){
  
  frameRate(60);
  background(startMenuBkgCol);

  loadAssets();
  InitializeIntroAnimation();

  rectMode(CENTER);
  textAlign(CENTER);
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
    drawNextMoves();


  } else if (options == true){
    background(gameBkgColor);

    drawButtonIesireOption();

  }else if(quit == true){
    exit();
  } else {

    //background(startMenuBkgCol);
    drawIntroAnimation();
    drawStartMenu();

  }

}
int normalBtnCol = color(48, 63, 159);
int normalBtnCol_2 = color(0, 105, 92);
int gameBkgColor = color(67, 160, 71);
int startMenuBkgCol = color(38, 50, 56);
int tableBkgCol = color(67, 160, 71);
int gameMenuCol = color(38, 50, 56);

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
// button functions
public void startButton(){
  gameStart = true;
  intro = false;
}

public void exitButton(){
  gameStart = false;
  intro = false;
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
     int tmp = coordonateFoxHJ;
     coordonateFoxHJ = mouseX - xOffset;
     //face update pozitiilor vulpii in matrice
     updateFoxPositions(tmp);
   }
 }else if(lockedFirstRabbit){
   moveFirstRabbit();
 }else if(lockedSecondRabbit){
   moveSecondRabbit();
 }else if(lockedThirdRabbit){
  moveThirdRabbit();
 }
}

public void moveFirstRabbit(){
   if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iFirstRabbit - 25) / cellDistX;
     int j = (jFirstRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j)){
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
        if(determinareCasutaObstacol(i,j)){
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
         if(determinareCasutaObstacol(i,j)){
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
         if(determinareCasutaObstacol(i,j)){
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
     int i = (iSecondRabbit - 25) / cellDistX;
     int j = (jSecondRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
       if(determinareCasutaObstacol(i,j)){
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
        if(determinareCasutaObstacol(i,j)){
           iSecondRabbit = mouseY - yOffset;
           count = i - iInitialSecondRabbit;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[i][j] = "R2";
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
            tableArray[i][j] = "R2";
            tableArray[iInitialSecondRabbit][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveLeft &&  j >= 0){
         if(determinareCasutaObstacol(i,j)){
             jSecondRabbit = mouseX - xOffset;
           count =  jInitialSecondRabbit - j;
        }else if(determinareCasutaIesire(i,j) && count>0){
           tableArray[i][j] = "R2";
           tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){

            tableArray[iInitialSecondRabbit ][ jInitialSecondRabbit]= "0";
        }
      }else if(rabbitMoveRight  && j <= 4 ){
         if(determinareCasutaObstacol(i,j)){
             jSecondRabbit = mouseX - xOffset;
           count = j - jInitialSecondRabbit;
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
        if(determinareCasutaObstacol(i,j)){
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
        if(determinareCasutaObstacol(i,j)){
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
         if(determinareCasutaObstacol(i,j)){
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
         if(determinareCasutaObstacol(i,j)){
             jThirdRabbit = mouseX - xOffset;
           count =  j - jInitialFirstRabbit;
           println("Is here1");
        }else if(determinareCasutaIesire(i,j) && count>0){
          println("Is here2");
           tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
           score+=100;
        }else if(determinareCasutaGoala(i, j) && count>0){
          println("Is here3");
            tableArray[i][j] = "R3";
            tableArray[iInitialThirdRabbit][ jInitialThirdRabbit]= "0";
        }

      }else {
        determinareDirectie();
      }
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

public boolean determinareCasutaObstacol(int i, int j){
  if(tableArray[i][j] != "0"){
    return true;
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
       fOneJ = i+3;
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

public void mouseReleased(){
 int i = 0, j = 0;
  if(lockedFirstRabbit){
      i = (iFirstRabbit - 25) / cellDistX;
      j = (jFirstRabbit - 25) / cellDistY;
      if(iesirePoz(i,j)){
         tableArray[i][j] = "R1";
         tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      }else if(iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit)){
          tableArray[i][j] = "R1";
          tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
      }else if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R1"))) {
         i = iInitialFirstRabbit;
         j = jInitialFirstRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();
  }else if(lockedSecondRabbit){
      i = (iSecondRabbit - 25) / cellDistX;
      j = (jSecondRabbit - 25) / cellDistY;
      if(iesirePoz(i,j)){
         tableArray[i][j] = "R2";
         tableArray[iSecondRabbit][jSecondRabbit] = "0";
      }else if(iesirePoz(iSecondRabbit,jSecondRabbit)){
          tableArray[i][j] = "R2";
          tableArray[iSecondRabbit][jSecondRabbit] = "5";
      }else if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R2"))) {
         i = iInitialSecondRabbit;
         j = jInitialSecondRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();

  }else if(lockedThirdRabbit){
      i = (iThirdRabbit - 25) / cellDistX;
      j = (jThirdRabbit - 25) / cellDistY;
      println(j);
      if(iesirePoz(i,j)){
         tableArray[i][j] = "R3";
         tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      }else if(iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
          tableArray[i][j] = "R3";
          tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
      }if(count <1 || ((i < 5) && (j < 5) && (tableArray[i][j] != "0") && (tableArray[i][j] != "R3"))) {
         i = iInitialThirdRabbit;
         j = jInitialThirdRabbit;
      }
      determinaObstacolStanga();
      determinaObstacolDreapta();
  }else if(lockedFox){
    j = (coordonateFoxHJ - 25) / cellDistY;

  }

  if((lockedFirstRabbit) || (lockedSecondRabbit) ||(lockedThirdRabbit)){
     println(i + " " + j);

     moveRabbit(i,j);
  }else if(lockedFox){
    moveFox(j);
  }

 lockedFox = false;
 lockedFirstRabbit = false;
 lockedSecondRabbit = false;
 lockedThirdRabbit = false;
 rabbitMoveUp = false;
 rabbitMoveLeft = false;
 rabbitMoveDown = false;
 rabbitMoveRight = false;
}

public boolean iesirePoz(int i, int j){
   if(((i == 0) && (j == 0)) || ((i ==0) &&(j==4))|| ((i == 2) &&(j == 2)) || (( i == 4) && (j==0)) || ((i == 4) &&( j == 0))){
     return true;
   }
   return false;
}

//muta iepurii in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
public void moveRabbit(int i, int j){
  if( i == 5){
     i--;
  }else if( j== 5){
     j--;
  }
  int pozitieI = convertCoordToY(i);
  int pozitieJ = convertCoordToX(j);

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

public void determinaObstacolDreapta(){
   int j =  fOneJ -2;
   int i =  fOneI -1;
   obstacolDreapta = 0;
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
   obstacolStanga = 5;
   while(obstacolStanga == 5 && j >=0  ){
    if(tableArray[i][j] != "0"){
      if(tableArray[i][j] != "0" && j == 0){
        obstacolStanga = j+1;
      }else {
         obstacolStanga = j;
      }
    }if(tableArray[i][j] != "0" && j == 0){
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
   coordonateFoxHI = convertCoordToY(fOneI - 1) + 8;
   coordonateFoxHJ =  convertCoordToX(fOneJ - 1) - 80;
  }
  drawFox(coordonateFoxHJ, coordonateFoxHI, 260, 80,flagFOne, foxH);


  // TODO
  // just a demo position
  drawFox(convertCoordToX(3), convertCoordToY(4) - 72, 80, 260, flagFTwo, foxV);
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
  drawTitle();
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


public void drawTitle(){

  pushMatrix();
  translate(width / 2, 70);
  changeScale();

  scale( sc - offScale );


  fill(color(0, 121, 107));
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
  drawButton(width / 4 , height / 2 + 150, 90, 50, normalBtnCol_2, startString);
}


public void drawButtonOption(){
   drawButton(width / 2, height / 2 + 150, 90,50, normalBtnCol_2, optionsString);
}

public void drawQuitButton(){
   drawButton(width * 3 / 4, height / 2 + 150, 90,50, normalBtnCol_2, quitString);
}

public void drawButtonIesire(){
  drawButton(40, gameMenuSize / 2, 60, 30, normalBtnCol, exitString);
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
      println(iInitialFirstRabbit + " _____" + jInitialFirstRabbit);
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

    }
    MouseFlag = "";
  }
}
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
  {"M", "0", "0", "0", "R2"},
  {"0", "R3", "5", "0", "M"},
  {"0", "0", "0", "0", "R1"},
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

PShape rabbitWhiteIntro, GameTitle;

// --== VARIABILE DE LOGICA ==--
// JOC
boolean intro = true;
boolean gameStart = false;
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

boolean ROraneSelected = false;

String MouseFlag;

// --== VARIABILE DE JOC ==--
int gameMenuSize = 50;
int startTime = 14;
int min, second;
int obstacolStanga = 5;
int obstacolDreapta = 0;

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
