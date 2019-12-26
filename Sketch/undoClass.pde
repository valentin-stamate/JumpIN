public class Undo {
    private String animal;
    private int xPosition, yPosition;

    public Undo(String animal, int xPosition, int yPosition) {
        this.animal = animal;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
    }

    public String getAnimal() {
        return animal;
    }

    public int getxPosition() {
        return xPosition;
    }

    public int getyPosition() {
        return yPosition;
    }
}

void putDataInList(String name, int xPosition, int yPosition){
  if(undo.size() > 0 &&(undo.get(undo.size()-1).getAnimal() != name || undo.get(undo.size()-1).getxPosition() != xPosition || undo.get(undo.size()-1).getyPosition() != yPosition)){
   Undo tmp = new Undo(name, xPosition, yPosition);
   undo.add(tmp);
  }else if(undo.size() == 0){
    println("Enter here" );
   Undo tmp = new Undo(name, xPosition, yPosition);
   undo.add(tmp);
  }
}

void pressedUndo(){
  String animal = undo.get(undo.size()-1).getAnimal();
  int xPosition = undo.get(undo.size()-1).getxPosition();
  int yPosition = undo.get(undo.size()-1).getyPosition();
  if(animal == "R1"){
   for(int i = 0; i < 5; i++){
     for(int j = 0; j < 5; j++){
       if(tableArray[i][j] == "R1"){
         iInitialFirstRabbit = i;
         jInitialFirstRabbit = j;
       }
     }
   }
    if(iesirePoz(xPosition, yPosition)){
      tableArray[xPosition][yPosition] = "R1";
      tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      score -= 100;
    }else {
      tableArray[xPosition][yPosition] = "R1";
      if(iesirePoz(iInitialFirstRabbit,jInitialFirstRabbit)){
      tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "5";
      }else{
        tableArray[iInitialFirstRabbit][jInitialFirstRabbit] = "0";
      }
    }
    undoRabbit(xPosition, yPosition, "R1");
  }else if(animal == "R2"){
   for(int i = 0; i < 5; i++){
     for(int j = 0; j < 5; j++){
       if(tableArray[i][j] == "R2"){
         iInitialSecondRabbit = i;
         jInitialSecondRabbit = j;
       }
     }
   }
    if(iesirePoz(xPosition, yPosition)){
      tableArray[xPosition][yPosition] = "R2";
      tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
      score -= 100;
    }else {
      tableArray[xPosition][yPosition] = "R2";
      if(iesirePoz(iInitialSecondRabbit,jInitialSecondRabbit)){
      tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "5";
      }else{
        tableArray[iInitialSecondRabbit][jInitialSecondRabbit] = "0";
      }
    }
    undoRabbit(xPosition, yPosition, "R2");
  }else if(animal == "R3"){
   for(int i = 0; i < 5; i++){
     for(int j = 0; j < 5; j++){
       if(tableArray[i][j] == "R3"){
         iInitialThirdRabbit = i;
         jInitialThirdRabbit = j;
       }
     }
   }
    if(iesirePoz(xPosition, yPosition)){
      tableArray[xPosition][yPosition] = "R3";
      tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      score -= 100;
    }else {
      tableArray[xPosition][yPosition] = "R3";
      if(iesirePoz(iInitialThirdRabbit,jInitialThirdRabbit)){
      tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "5";
      }else{
        tableArray[iInitialThirdRabbit][jInitialThirdRabbit] = "0";
      }
    }
    undoRabbit(xPosition, yPosition, "R3");
  }else if(animal == "F"){
    tableArray[fOneI-1][fOneJ -2] = "0";
    tableArray[fOneI-1][fOneJ -1] = "0";
    undoFox(yPosition);
    updateFoxPositions(coordonateFoxHJ);
  }else if(animal == "FV"){
    tableArray[fSecondJ-1][fSecondI] = "0";
    tableArray[fSecondJ][fSecondI] = "0";
    undoSecondFox(yPosition);
    updateSecondFoxPositions(coordonateFoxVJ);
  }
  undo.remove(undo.size() -1);
}

void undoRabbit(int i, int j, String name){
  if( i == 5){
     i--;
  }
  if( j== 5){
     j--;
  }
  int pozitieI = cellDistX * (i+1) -10;
  int pozitieJ = cellDistX * (j+1) -50;
   println(pozitieJ + " ____" + pozitieI);

  if(iesirePoz(i,j)){
       score += 100;
   }
  if(name == "R1"){
      iFirstRabbit = pozitieI;
      jFirstRabbit = pozitieJ;
  }else if(name == "R2"){
      iSecondRabbit = pozitieI;
      jSecondRabbit = pozitieJ;
  }else if(name == "R3"){
     iThirdRabbit = pozitieI;
     jThirdRabbit = pozitieJ;
  }
}

void undoFox( int j){
  println(j);
  if(j == obstacolStanga){
     j++;
  }else if(j == 5 -obstacolDreapta){
     j--;
  }
  int pozitieJ = cellDistX * (j) + 30;
  coordonateFoxHJ = pozitieJ;
}

void undoSecondFox( int j){
  if(j == obstacolJos || j == 0){
     j++;
  }else if(j == 5 - obstacolSus){
     j--;
  }
  int pozitieJ = cellDistX * (j) + 50;
  coordonateFoxVJ = pozitieJ;
}

void afisareLista(){
  for(int i = 0; i < undo.size(); i++){
    println(undo.get(i).getAnimal() + " " + undo.get(i).getxPosition() + " " + undo.get(i).getyPosition());
  }
}
