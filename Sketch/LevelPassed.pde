

void countRabbitsBegining(){
  int i, j;
   for(i = 0; i < 5; i++){
     for(j = 0; j < 5; j++){
       if((tableArray[i][j] == "R1") || (tableArray[i][j] == "R2") || (tableArray[i][j] == "R3")){
         println(tableArray[i][j] );
         countRabbits++;
       }
        println(i + " " + j);
     }
   }
}

int rabbitsInHoles(){
  int count =0;
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(iesirePoz(i,j)){
        if(tableArray[i][j] == "R1" || tableArray[i][j] == "R2" || tableArray[i][j] == "R3"){
          count++;
        }
      }
    }
  }
  return count;
}
