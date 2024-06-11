import '../arabic/assets_images_arabic.dart';
import '../arabic/game_arabic_types.dart';
import '../arabic/game_phonatics_types.dart';
import 'assets_images_phonetics.dart';
import 'basic_of_chapter.dart';


abstract class BasicOfGame {
  late bool isRound;
  late String titleImageEn;
  late String? titleImageAr;
  late String? completeBasket;
  static String connect = 'Connect';
  static String stateOIdle = 'idle';
  static String stateOfWin = 'win';
  static String stateOfSad = 'sad';
  bool isConnect = false;

  static getTheGameType({required String gameType, required int audioFlag}) {
    print("gameType:$gameType");
    gameType.toLowerCase();
    if (gameType == GameTypes.dragOut.text()) {
      return BasicDragOutGame();
    }
    else if ((gameType == GameTypes.clickPicture.text()|| gameType == GameArabicTypes.clickPictureArabic.text()) && audioFlag == 1) {
      ///audio flag == 1 say the word
      return ClickPicture();
    }
    else if (gameType == GameTypes.clickPicture.text() && audioFlag == 0) {
      return ClickPictureOfWord();
    }
    else if (gameType == GameTypes.clickTheSound.text()) {
      return BasicClickTheSoundGame();
    }
    else if (gameType == GameTypes.bingo.text()) {
      return BingoGame();
    }
    else if (gameType == GameTypes.sortingCups.text()) {
      return SortingCupsGame();
    }
    else if (gameType == GameTypes.sortingPictures.text()) {
      return SortingPicturesGame();
    }
    else if (gameType == GameTypes.spelling.text()) {
      return SpellingGame();
    }
    else if (gameType == GameTypes.xOut.text()) {
      return XOutGame();
    }
    else if (gameType == GameTypes.dice.text()) {
      return DiceGame();
    }
    else if (gameType == GameTypes.tracing.text()) {
      return Tracking();
    }
    else if (gameType == GameTypes.video.text()) {
      return Video();
    }
  }


  static List listOfConnectGames = [
    GameTypes.bingo.text(),
    GameTypes.sortingPictures.text(),
    GameTypes.sortingCups.text(),
    GameTypes.dice.text(),
    GameTypes.xOut.text(),
    GameTypes.spelling.text()
  ];

  static bool isConnectGame({required String game}) {
    if (listOfConnectGames.contains(game)) {
      return true;
    } else {
      return false;
    }
  }

  static List<String> customOrderOfGamesPhonetics = [
    "${GameTypes.video.text().toLowerCase()}_0",
    "${GameTypes.tracing.text().toLowerCase()}_1",
    "${GameTypes.clickTheSound.text().toLowerCase()}_1",
    "${GameTypes.clickPicture.text().toLowerCase()}_1",
    "${GameTypes.dragOut.text().toLowerCase()}_1",
    "${GameTypes.clickPicture.text().toLowerCase()}_0",
  ];

  static List<String> customOrderOfGamesConnect = [
    "${GameTypes.sortingCups.text().toLowerCase()}_1",
    "${GameTypes.bingo.text().toLowerCase()}_1",
    "${GameTypes.sortingPictures.text().toLowerCase()}_1",
    "${GameTypes.dice.text().toLowerCase()}_1",
    "${GameTypes.xOut.text().toLowerCase()}_1",
    "${GameTypes.spelling.text().toLowerCase()}_1",
  ];
}

class BasicDragOutGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.dragOut;

  // @override
  // String keyGame = BasicOfEveryGame.;

  @override
  String? completeBasket = AppImagesPhonetics.imageBasketComplete;

  @override
  bool isConnect = false;

  @override
  String? titleImageAr;
}

class ClickPicture implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.clickPicture;

  // @override
  // String keyGame = 'Click the picture';

  @override
  String? completeBasket;

  List<String> backgroundImages = [
    AppImagesPhonetics.circleShape,
    AppImagesPhonetics.cloudShape,
    AppImagesPhonetics.diamondShape,
    AppImagesPhonetics.hexagonShape,
  ];

  List<String> getBackGround(int length) {
    if (length <= backgroundImages.length) {
      return backgroundImages.sublist(0, length);
    } else {
      List<String> newList = [];
      for (int i = 0; i < backgroundImages.length; i++) {
        newList.add(backgroundImages[i]);
        if (i == backgroundImages.length - 1) {
          i = 0;
        }
        if (newList.length == length) {
          break;
        }
      }

      return newList;
    }
  }

  @override
  bool isConnect = false;

  @override
  String? titleImageAr = AppImagesArabic.titleOfClickThePicture;
}

class Tracking implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.tracingWithFinger;

  // @override
  // String keyGame = 'Click the picture';

  @override
  String? completeBasket;

  @override
  bool isConnect = false;

  @override
  String? titleImageAr;
}
class Video implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.tracingWithFinger;

  // @override
  // String keyGame = 'Click the picture';

  @override
  String? completeBasket;

  @override
  bool isConnect = false;

  @override
  String? titleImageAr;
}

class BasicClickTheSoundGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.clickTheSound;

  @override
  String? completeBasket;

  @override
  bool isConnect = false;

  @override
  String? titleImageAr;
}

class ClickPictureOfWord implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.clickPicture;

  @override
  String? completeBasket;

  List<String> backgroundImages = [
    AppImagesPhonetics.circleShape,
    AppImagesPhonetics.cloudShape,
    AppImagesPhonetics.diamondShape,
    AppImagesPhonetics.hexagonShape,
  ];

  List<String> getBackGround(int length) {
    if (length <= backgroundImages.length) {
      return backgroundImages.sublist(0, length);
    } else {
      List<String> newList = [];
      for (int i = 0; i < backgroundImages.length; i++) {
        newList.add(backgroundImages[i]);
        if (i == backgroundImages.length - 1) {
          i = 0;
        }
        if (newList.length == length) {
          break;
        }
      }

      return newList;
    }
  }

  @override
  bool isConnect = false;

  @override
  String? titleImageAr;
}

class BingoGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.bingoNameGame;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}

class SortingCupsGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.sortingCupsNameGame;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}

class SortingPicturesGame implements BasicOfGame {
  @override
  bool isRound = true;

  @override
  String titleImageEn = AppImagesPhonetics.sortingGame;
  String woodenBackground = AppImagesPhonetics.woodBackground;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}

class SpellingGame implements BasicOfGame {
  @override
  bool isRound = true;

  @override
  String titleImageEn = AppImagesPhonetics.spellingNameGame;

  String woodenBackground = AppImagesPhonetics.woodBackground;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}

class XOutGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.xOutGameName;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}

class DiceGame implements BasicOfGame {
  @override
  bool isRound = false;

  @override
  String titleImageEn = AppImagesPhonetics.diceNameGame;

  @override
  String? completeBasket;

  @override
  bool isConnect = true;

  @override
  String? titleImageAr;
}
