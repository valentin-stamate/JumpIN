boolean initialState = true;
int StepI = 0;
String[] steps = null;


void autoSolve(String table[][], int challenge) {

    //if(tablesAreEqual(table, ))

    int oneSecond = 60;

    if(initialState){


      if (challenge == 1)
        steps = challengeOneSteps;
      else if (challenge == 2)
        steps = challengeTwoSteps;
      else if (challenge == 3)
        steps = challengeThreeSteps;
      else if (challenge == 4)
        steps = challengeFourSteps;
      else if (challenge == 5)
        steps = challengeFiveSteps;
      else if (challenge == 6)
        steps = challengeSixSteps;
      else if (challenge == 7)
        steps = challengeSevenSteps;
      else if (challenge == 8)
        steps = challengeEightSteps;
      else if (challenge == 9)
        steps = challengeNineSteps;

      initialState = false;

    }



    if(frameCount % oneSecond  == 0){
      if(StepI < steps.length){
        String step = steps[StepI];
        makeStep(step);
        StepI++;
      } else {

        levelSolving = false;
        StepI = 0;
        initialState = true;

        gameStart = false;
        gameFinished = true;

      }
    }

  }

 void makeStep(String step) {
    String animal = "";

    for (int i = 0; i < 2; i++) {
      if (step.charAt(i) != ' ') {
        animal += step.charAt(i);
      }
    }

    int i = 0, j = 0;

    boolean found = false;
    for (int l = 4; l >= 0 && !found; l--) {
      for (int m = 4; m >= 0; m--) {
        if (tableArray[l][m].equals(animal)) {
          i = l;
          j = m;
          found = true;
          break;
        }
      }
    }

    if( animal.equals("FV") ){
      tableArray[i - 1][j] = "0";
    } else if( animal.equals("FH") ){
      tableArray[i][j - 1] = "0";
    }

    tableArray[i][j] = "0";


    int newI = step.charAt(2) - '0';
    int newJ = step.charAt(3) - '0';

    tableArray[newI][newJ] = animal;

    if( animal.equals("FV") ){
      tableArray[newI - 1][newJ] = "FV";
      moveFoxVertical(newI, newJ);
    } else if( animal.equals("FH") ){
      tableArray[newI][newJ - 1] = "FH";
      moveFoxHorizontal(newI, newJ);
    }

    // get instant score
    score = 0;
    if(rabbitInsideHole("R1"))
      score += 100;
    if(rabbitInsideHole("R2"))
      score += 100;
    if(rabbitInsideHole("R3"))
      score += 100;

}

boolean rabbitInsideHole(String rabbit){
  if(tableArray[0][0].equals(rabbit) || tableArray[0][4].equals(rabbit) || tableArray[2][2].equals(rabbit) || tableArray[4][0].equals(rabbit) || tableArray[4][4].equals(rabbit)){
    return true;
  }
  return false;
}
