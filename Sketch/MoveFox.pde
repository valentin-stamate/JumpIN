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
     printArray();
}

void updateSecondFoxPositions(int tmp){
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
void moveFox( int j){
  println(j);
  if(j == obstacolStanga){
     j++;
  }else if(j == obstacolDreapta){
     j--; 
  }
  int pozitieJ = cellDistX * (j) + 30;
  coordonateFoxHJ = pozitieJ;
}

void moveSecondFox( int j){
  if(j == obstacolJos){
     j++;
  }else if(j == obstacolSus -1){
     j--; 
  }
  println(j);
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

void determinaObstacolJos(){
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
