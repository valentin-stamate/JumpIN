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
  romaniaFirstIns = line[0];
  romaniaSecondIns = line[1];
  romaniaThirdIns = line[2];
  romaniaThirdIns = line[3];

  indiaFirstIns = line[5];
  indiaSecondIns = line[6];
  indiaThirdIns = line[7];
  indiaThirdIns = line[8];

  chinaFirstIns = line[10];
  chinaSecondIns = line[11];
  chinaThirdIns = line[12];
  chinaThirdIns = line[13];

  franceFirstIns = line[15];
  franceSecondIns = line[16];
  franceThirdIns = line[17];
  franceThirdIns = line[18];

  germanyFirstIns = line[20];
  germanySecondIns = line[21];
  germanyThirdIns = line[22];
  germanyThirdIns = line[23];

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
