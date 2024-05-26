import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'assets_images_phonetics.dart';
import 'basic_of_every_game.dart';

enum MainDataOfPhoneticsTypes { s, a, f, m, t, c, i, r, p, h, j, u, l, b, o, g }

extension TypeExtension on MainDataOfPhoneticsTypes {
  String text() {
    switch (this) {
      case MainDataOfPhoneticsTypes.a:
        return "a".toLowerCase();
      case MainDataOfPhoneticsTypes.b:
        return 'b'.toLowerCase();
      case MainDataOfPhoneticsTypes.f:
        return 'f'.toLowerCase();
      case MainDataOfPhoneticsTypes.m:
        return 'm'.toLowerCase();
      case MainDataOfPhoneticsTypes.t:
        return 't'.toLowerCase();
      case MainDataOfPhoneticsTypes.c:
        return 'c'.toLowerCase();
      case MainDataOfPhoneticsTypes.i:
        return 'i'.toLowerCase();
      case MainDataOfPhoneticsTypes.g:
        return 'g'.toLowerCase();
      case MainDataOfPhoneticsTypes.o:
        return 'o'.toLowerCase();
      case MainDataOfPhoneticsTypes.j:
        return 'j'.toLowerCase();
      case MainDataOfPhoneticsTypes.l:
        return 'l'.toLowerCase();
      case MainDataOfPhoneticsTypes.u:
        return 'u'.toLowerCase();
      case MainDataOfPhoneticsTypes.h:
        return 'h'.toLowerCase();
      case MainDataOfPhoneticsTypes.p:
        return 'p'.toLowerCase();
      case MainDataOfPhoneticsTypes.r:
        return 'r'.toLowerCase();
      case MainDataOfPhoneticsTypes.s:
        return 's'.toLowerCase();
    }
  }
}

abstract class MainDataOfPhonetics {
  late String basicAvatar;
  late String winAvatar;
  late String idelAvatar;
  late String sadAvatar;
  late String background;
  BasicOfEveryGame? gameData;
  late Color backGroundOfStarBar;
  static getGameDataType(
      {required String subLetter,
      required String subGame,
      required int audioFlag}) {
    if (BasicOfEveryGame.isConnectGame(game:subGame.toLowerCase()) ==true) {
      if(subGame.toLowerCase() == GameTypes.sortingCups.text()){
        return ConnectionSortingCups(
            mineGameData: SortingCupsGame());
      }
     else if(subGame.toLowerCase() == GameTypes.spelling.text()){
        return SpellTheWord(
            mineGameData: SpellingGame());
      }
      else {
        return ConnectionWithoutSortingCups(
            mineGameData: BasicOfEveryGame.getTheGameType(
                gameType: subGame.toLowerCase(), audioFlag: audioFlag));
      }
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.s.text()) {
      return SPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.a.text()) {
      return APhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.f.text()) {
      return FPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.m.text()) {
      return MPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.t.text()) {
      return TPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.c.text()) {
      return CPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.r.text()) {
      return RPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.i.text()) {
      return IPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.p.text()) {
      return PPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.h.text()) {
      return HPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.j.text()) {
      return JPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.u.text()) {
      return UPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.l.text()) {
      return LPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.b.text()) {
      return BPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.o.text()) {
      return OPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    else if (subLetter.toLowerCase() == MainDataOfPhoneticsTypes.g.text()) {
      return GPhonetics(
          mineGameData: BasicOfEveryGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
  }
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

class ConnectionWithoutSortingCups implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String basicAvatar = AppImagesPhonetics.basicBess;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ConnectionWithoutSortingCups({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;
}

class ConnectionSortingCups implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String basicAvatar = AppImagesPhonetics.basicBess;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ConnectionSortingCups({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;
}

class SpellTheWord implements MainDataOfPhonetics {
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String basicAvatar = AppImagesPhonetics.basicBess;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  SpellTheWord({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;
}