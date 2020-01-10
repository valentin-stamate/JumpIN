void loadAssets(){
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

  rom = loadImage("./Flags/RomaniaFlag.png");
  chi = loadImage("./Flags/ChinaFlag.png");
  fra = loadImage("./Flags/FranceFlag.png");
  ger = loadImage("./Flags/GermanyFlag.png");
  ind = loadImage("./Flags/IndiaFlag.png");

  instructionsBackground = loadShape("InstructionsBackground.svg");

  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      nextMoveArray[i][j] = "0";
    }
  }

  changeRomaniaLanguage();

  cellDistX = (width + 100) / 6;
  cellDistY = (height + 100 - gameMenuSize) / 6;
}

void initializeStrings(){
  nextMoveArray = new String[5][5];
  tableArray = new String[5][5];

  challengeOneTable = new String[5][5];
  challengeTwoTable = new String[5][5];
  challengeThreeTable = new String[5][5];
  challengeFourTable = new String[5][5];
  challengeFiveTable = new String[5][5];
  challengeSixTable = new String[5][5];
  challengeSevenTable = new String[5][5];
  challengeEightTable = new String[5][5];
  challengeNineTable = new String[5][5];
  challengeTenTable = new String[5][5];
  challengeElevenTable = new String[5][5];
  challengeTwelveTable = new String[5][5];
  challengeThirteenTable = new String[5][5];
  challengeFourteenTable = new String[5][5];
  challengeFifteenTable = new String[5][5];

}

int levels = 15;

void loadFiles(){
  // levels
  String[] line = loadStrings("./data/Strings/Challenges");
  for(int i = 0; i < levels; i++){
    String level = line[i];
    String[] cells = level.split(" ");
    if(i == 0) initializeLevel(challengeOneTable, cells);
    else if(i == 1) initializeLevel(challengeTwoTable, cells);
    else if(i == 2) initializeLevel(challengeThreeTable, cells);
    else if(i == 3) initializeLevel(challengeFourTable, cells);
    else if(i == 4) initializeLevel(challengeFiveTable, cells);
    else if(i == 5) initializeLevel(challengeSixTable, cells);
    else if(i == 6) initializeLevel(challengeSevenTable, cells);
    else if(i == 7) initializeLevel(challengeEightTable, cells);
    else if(i == 8) initializeLevel(challengeNineTable, cells);
    else if(i == 9) initializeLevel(challengeTenTable, cells);
    else if(i == 10) initializeLevel(challengeElevenTable, cells);
    else if(i == 11) initializeLevel(challengeTwelveTable, cells);
    else if(i == 12) initializeLevel(challengeThirteenTable, cells);
    else if(i == 13) initializeLevel(challengeFourteenTable, cells);
    else if(i == 14) initializeLevel(challengeFifteenTable, cells);
  }

  for(int i = levels; i < 2 * levels; i++){
    String s = line[i];
    String[] steps = s.split(" ");
    int l = i - levels;
    if(l == 0) challengeOneSteps = steps;
    else if(l == 1) challengeTwoSteps = steps;
    else if(l == 2) challengeThreeSteps = steps;
    else if(l == 3) challengeFourSteps = steps;
    else if(l == 4) challengeFiveSteps = steps;
    else if(l == 5) challengeSixSteps = steps;
    else if(l == 6) challengeSevenSteps = steps;
    else if(l == 7) challengeEightSteps = steps;
    else if(l == 8) challengeNineSteps = steps;
    else if(l == 9) challengeTenSteps = steps;
    else if(l == 10) challengeElevenSteps = steps;
    else if(l == 11) challengeTwelveSteps = steps;
    else if(l == 12) challengeThirteenSteps = steps;
    else if(l == 13) challengeFourteenSteps = steps;
    else if(l == 14) challengeFifteenSteps = steps;

    int h = challengeOneSteps.length;

  }

  // languages
  line = loadStrings("./data/Strings/Languages");
  romaniaFirstIns = convertString(line[0]);
  romaniaSecondIns = convertString(line[1]);
  romaniaThirdIns = convertString(line[2]);
  romaniaFourthIns = convertString(line[3]);

  indiaFirstIns = convertString(line[5]);
  indiaSecondIns = convertString(line[6]);
  indiaThirdIns = convertString(line[7]);
  indiaFourthIns = convertString(line[8]);

  chinaFirstIns = convertString(line[10]);
  chinaSecondIns = convertString(line[11]);
  chinaThirdIns = convertString(line[12]);
  chinaFourthIns = convertString(line[13]);

  franceFirstIns = convertString(line[15]);
  franceSecondIns = convertString(line[16]);
  franceThirdIns = convertString(line[17]);
  franceFourthIns = convertString(line[18]);

  germanyFirstIns = convertString(line[20]);
  germanySecondIns = convertString(line[21]);
  germanyThirdIns = convertString(line[22]);
  germanyFourthIns = convertString(line[23]);

  println(germanyThirdIns);

}

String convertString(String line){
  String[] s = line.split("nL");
  String ins = "";

  for(int i = 0; i < s.length; i++){
    ins += s[i];
    if(i < s.length - 1){
      ins += "\n";
    }
  }
  return ins;

}

void initializeLevel(String[][] level, String[] cells){
  int sum = 0;
  for(String s : cells){
    int i = sum / 5;
    int j = sum % 5;
    level[i][j] = s;
    sum++;
  }
}
