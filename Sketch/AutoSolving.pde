boolean initialState = true;
int StepI = 0;
String[] steps = null;


void autoSolve(String table[][], int challenge) {

    int oneSecond = 60;

    if(initialState){

      steps = getStep(challenge);
      initialState = false;

    }

    if(frameCount % oneSecond  == 0){
      if(StepI < steps.length){
        String step = steps[StepI];
        makeStep(step);
        StepI++;
      } else {
        levelSolving = false;
        initialState = true;
        gameStart = false;
        gameFinished = true;
        StepI = 0;

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

    if( rabbitInsideHole(animal, newI, newJ) ){
      score += 100;
    }

}

boolean rabbitInsideHole(String animal, int i, int j){

  if(egal(animal, "FV") || egal(animal, "FH")){
    return false;
  }

  if( (i == 0 && (j == 0 || j == 4)) || (i == 2 && j == 2) || (i == 4 && (j == 0 || j == 4) ) ){
    return true;
  }
  return false;
}

String[] getStep(int challenge){
  if (challenge == 1)
    return challengeOneSteps;
  if (challenge == 2)
    return challengeTwoSteps;
  if (challenge == 3)
    return challengeThreeSteps;
  if (challenge == 4)
    return challengeFourSteps;
  if (challenge == 5)
    return challengeFiveSteps;
  if (challenge == 6)
    return challengeSixSteps;
  if (challenge == 7)
    return challengeSevenSteps;
  if (challenge == 8)
    return challengeEightSteps;

  return challengeNineSteps;

}

void resetAutoSolving(){
  levelSolving = false;
  initialState = true;
  StepI = 0;
}
