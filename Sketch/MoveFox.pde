void updateFoxPositions(int tmp){
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
    // printArray();
}

void updateSecondFoxPositions(int tmp){
  int i =  (coordonateFoxVJ + 50 + 80)/cellDistX-1;
  if(i>0){
   if(tmp > coordonateFoxVJ){ 
       
         if(tableArray[i][fSecondI] == "F2" && tableArray[i-1][fSecondI] == "0"){
          tableArray[i + 1][fSecondI] = "0";
           tableArray[i][fSecondI] = "F2";
           tableArray[i-1][fSecondI] = "F2";
         }else{
           if(tableArray[i-1][fSecondI] == "0"){
           tableArray[i][fSecondI] = "F2";
           tableArray[i-1][fSecondI] = "F2";
           }
         }
             fSecondJ = i;
        //printArray();
     }else{
       if(i > 1 && tableArray[i][fSecondI] == "F2" && tableArray[i-2][fSecondI] == "F2"){
         tableArray[i-2][fSecondI] = "0";
         tableArray[i-1][fSecondI] = "F2";
         tableArray[i][fSecondI] = "F2";
       }else{
        tableArray[i-1][fSecondI] = "F2";
         tableArray[i][fSecondI] = "F2";
       }
        fSecondJ = i;
     }
     //printArray();
  }
}

//muta vulpea in casutele in care ar trebui sa fie atunci cand se elibereaza mouse-ul
void moveFox( int j){
  println(j);
  if(j == obstacolStanga){
     j++;
  }else if(j == 5 -obstacolDreapta){
     j--;
  }
  int pozitieJ = cellDistX * (j) + 30;
  coordonateFoxHJ = pozitieJ;
}

void moveSecondFox( int j){
  if(j == obstacolJos || j == 0){
     j++;
  }else if(j == 5 - obstacolSus){
     j--;
  }
  int pozitieJ = cellDistX * (j) + 50;
  coordonateFoxVJ = pozitieJ;
}


void determinaObstacolDreapta(){
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

void determinaObstacolStanga(){
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

void determinaObstacolSus(){
   int j =  fSecondJ;
   int i =  fSecondI;
   obstacolSus = 0;
   while(j <= 4 && obstacolSus == 0){
    if(tableArray[j][i] != "0" && tableArray[j][i] != "F2"){
     obstacolSus = 5-(j);
    }
    j++;
   }
}

void determinaObstacolJos(){
   int j =  fSecondJ;
   int i =  fSecondI;
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
}