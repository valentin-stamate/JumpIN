static String challengeOneTable[][] = {
    { "5", "M", "M", "0", "5" },
    { "0", "0", "0", "M", "0" },
    { "0", "0", "5", "R3", "0" },
    { "0", "0", "0", "0", "0" },
    { "5", "0", "0", "0", "5" }
  };

  static String challengeTwoTable[][] = {
    { "5", "R3", "0", "M", "5" },
    { "0", "0", "M", "0", "0" },
    { "0", "0", "5", "0", "0" },
    { "0", "0", "M", "0", "0" },
    { "5", "0", "R1", "0", "5" }
  };

  static String challengeThreeTable[][] = {
    { "5", "0", "0", "0", "5" },
    { "0", "0", "0", "0", "M" },
    { "R2", "M", "R3", "M", "R1" },
    { "0", "0", "0", "0", "0" },
    { "5", "0", "0", "0", "5" }
  };

  static String challengeFourTable[][] = {
    { "R2", "M", "0", "R1", "5" },
    { "0", "0", "M", "0", "0" },
    { "0", "0", "5", "0", "R3" },
    { "0", "0", "0", "M", "0" },
    { "5", "0", "0", "0", "5" }
  };

  static String challengeFiveTable[][] = {
    { "5", "0", "0", "M", "5" },
    { "0", "M", "R3", "FH", "FH" },
    { "0", "0", "M", "0", "0" },
    { "0", "0", "0", "0", "0" },
    { "5", "0", "0", "0", "5" }
  };

  static String challengeSixTable[][] = {
    { "5", "R3", "0", "0", "5" },
    { "M", "0", "0", "0", "0" },
    { "M", "0", "5", "0", "0" },
    { "0", "FV", "M", "0", "0" },
    { "5", "FV", "0", "0", "5" }
  };

  static String challengeSevenTable[][] = {
    { "5", "0", "M", "0", "5" },
    { "0", "0", "R3", "0", "0" },
    { "0", "0", "5", "FV", "M" },
    { "0", "0", "M", "FV", "0" },
    { "5", "0", "0", "0", "5" }
  };

  static String challengeEightTable[][] = {
    { "5", "0", "0", "R3", "M" },
    { "FH", "FH", "0", "0", "0" },
    { "0", "0", "5", "M", "0" },
    { "0", "FV", "0", "0", "0" },
    { "5", "FV", "M", "0", "5" }
  };

  static String challengeNineTable[][] = {
    { "5", "0", "M", "0", "5" },
    { "0", "0", "R3", "0", "0" },
    { "0", "0", "5", "FV", "0" },
    { "0", "0", "M", "FV", "0" },
    { "5", "0", "0", "0", "5" }
  };


  // PASI DE REZOLVARE
  String[] challengeOneSteps = {
    "R303", "R300"
  };

  String[] challengeTwoSteps = {
    "R122", "R102", "R304", "R122"
  };

  String[] challengeThreeSteps = {
    "R104", "R224", "R134", "R244", "R324", "R104", "R322"
  };

  String[] challengeFourSteps = {
    "R202", "R100", "R222", "R102", "R132", "R134", "R344", "R132", "R102", "R100"
  };

  String[] challengeFiveSteps = {
    "R332", "FH13", "R302", "R304"
  };

  String[] challengeSixSteps = {
    "FV21", "R331", "R333", "FV31", "R330", "R300"
  };

  String[] challengeSevenSteps = {
    "FV23", "R314", "R334", "FV43", "R331", "FV23", "R333", "R303", "R301", "FV13", "R304"
  };

  String[] challengeEightSteps = {
    "FH13", "R333", "FH12", "R313", "R310", "FH13", "FV21", "R314", "FV31", "R311", "R341", "R343", "FV41", "R340"
  };

  String[] challengeNineSteps = {
    "R212", "FV13", "R214", "R244", "R312", "R314", "R204", "R344"
  };
