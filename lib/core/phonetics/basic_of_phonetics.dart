import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'assets_images_phonetics.dart';
import 'basic_of_every_game.dart';

abstract class MainDataOfPhonetics {
  late String basicAvatar;
  late String winAvatar;
  late String idelAvatar;
  late String sadAvatar;
  late String background;
  BasicOfEveryGame? gameData;
  late Color backGroundOfStarBar;
  static String letterS = 's';
  static String letterA = 'a';
  static String letterF = 'f';
  static String letterM = 'm';
  static String letterT = 't';
  static String letterC = 'c';
  static String letterI = 'i';
  static String letterR = 'r';
  static String letterP = 'p';
  static String letterH = 'h';
  static String letterJ = 'j';
  static String letterU = 'u';
  static String letterL = 'l';
  static String letterB = 'b';
  static String letterO = 'o';
  static String letterG = 'g';
  static String smat = 'smat';
}

class SPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfS;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  SPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class APhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfA;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  APhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class FPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfA;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  FPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class MPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfM;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  MPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class TPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfT;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  TPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class CPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfC;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  CPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class RPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfR;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  RPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class IPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfI;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  IPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class PPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfP;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  PPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class HPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfH;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  HPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class JPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfJ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  JPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class UPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfJ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  UPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class LPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfL;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  LPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class BPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfL;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  BPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class OPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = Colors.white.withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfO;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  OPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class GPhonetics implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfG;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  GPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}

class SMATConnection implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.snowmanHappyRiv;

  SMATConnection({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.snowmanIdleRiv;
}
