void moveFirstRabbit(){
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
void moveSecondRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iSecondRabbit - 25) / cellDistX;
     int j = (jSecondRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
    if(rabbitMoveUp && i >= 0){
       if(determinareCasutaObstacol(i,j,iInitialSecondRabbit - i)){
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
        if(determinareCasutaObstacol(i,j, i - iInitialSecondRabbit)){
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
         if(determinareCasutaObstacol(i,j, jInitialSecondRabbit - j)){
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
         if(determinareCasutaObstacol(i,j, j - jInitialSecondRabbit -1)){
             jSecondRabbit = mouseX - xOffset;
           count = j - jInitialSecondRabbit -1;
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

void moveThirdRabbit(){
  if((mouseX - xOffset > 75 ) &&(mouseX - xOffset < height -25 ) && (mouseY - yOffset > 130) && (mouseY - yOffset < width-10)){
     int i = (iThirdRabbit - 25) / cellDistX ;
     int j = (jThirdRabbit - 25) / cellDistY;
     printArray();
     println(i + "  "  + j );
     
    if(rabbitMoveUp && i >= 0){
        if(determinareCasutaObstacol(i,j, iInitialThirdRabbit - i)){
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
        if(determinareCasutaObstacol(i,j, i - iInitialThirdRabbit)){
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
         if(determinareCasutaObstacol(i,j, jInitialThirdRabbit  - j)){
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
           count =  j - jInitialFirstRabbit -1;
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

//muta iepurii in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
void moveRabbit(int i, int j){
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
