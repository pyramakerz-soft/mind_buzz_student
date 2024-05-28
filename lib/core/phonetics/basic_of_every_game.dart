

import 'assets_images_phonetics.dart';
import 'basic_of_phonetics.dart';

enum GameTypes {
  dragOut,
  clickPicture,
  clickTheSound,
  bingo,
  sortingCups,
  sortingPictures,
  dice,
  xOut,
  spelling
}

extension TypeExtension on GameTypes {
  String text() {
    switch (this) {
      case GameTypes.dragOut:
        return "Drag Out".toLowerCase();
      case GameTypes.clickPicture:
        return 'Click the picture'.toLowerCase();
      case GameTypes.clickTheSound:
        return 'Click the sound'.toLowerCase();
      case GameTypes.bingo:
        return 'Bingo'.toLowerCase();
      case GameTypes.sortingCups:
        return 'Sorting Cups'.toLowerCase();
      case GameTypes.sortingPictures:
        return 'Sorting Pictures'.toLowerCase();
      case GameTypes.dice:
        return 'Dice'.toLowerCase();
      case GameTypes.xOut:
        return 'X-Out'.toLowerCase();
      case GameTypes.spelling:
        return 'Spelling'.toLowerCase();
    }
  }
}

abstract class BasicOfEveryGame {
  late bool isRound;
  late String titleImage;
  late String? completeBasket;
  static String phonics = 'Phonics';
  static String stateOIdle = 'idle';
  static String stateOfWin = 'win';
  static String stateOfSad = 'sad';
  bool isConnect = false;

  static getTheGameType({required String gameType, required int audioFlag}){
    gameType.toLowerCase();
    if (gameType == GameTypes.dragOut.text()) {
      return BasicDragOutGame();
    }
    else if (gameType == GameTypes.clickPicture.text() && audioFlag == 1) {
      return ClickPictureS();
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
  }
  static List<int> getTheStarsAddState(int number) {
    if (number % 3 == 0) {
      return List.generate(3, (index) => (number / 3).round()).toList();
    } else {
      int lower = (number ~/ 3) * 3;
      int upper = lower + 3;
      int result = (number - lower < upper - number) ? lower : upper;
      if (result < number) {
        return [
          (result / 3).round(),
          (result / 3 + 1).round(),
          (result / 3).round()
        ];
      } else {
        return [
          (result / 3 - 1).round(),
          (result / 3).round(),
          (result / 3).round()
        ];
      }
    }
  }

  static List listOfConnectGames = [ GameTypes.bingo.text(),
    GameTypes.sortingPictures.text(),
    GameTypes.sortingCups.text(),
    GameTypes.dice.text(),
    GameTypes.xOut.text(),
    GameTypes.spelling.text()];

  static bool isConnectGame({required String game}){
    if(listOfConnectGames.contains(game)) {
      return true;
    }else{
      return false;
    }
  }
}

class BasicDragOutGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.dragOut;

  // @override
  // String keyGame = BasicOfEveryGame.;

  @override
  String? completeBasket = AppImagesPhonetics.imageBasketComplete;

  @override
  bool isConnect = false;
}

class ClickPictureS implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.clickPicture;

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

  List<String> getBackGround(int length){
    if(length <= backgroundImages.length){
      return backgroundImages.sublist(0,length);
    }
    else{

      List<String> newList = [];
      for(int i = 0; i < backgroundImages.length ; i++ ){
        newList.add(backgroundImages[i]);
        if(i == backgroundImages.length - 1) {
          i = 0;
        }
        if(newList.length  == length){
          break;
        }
      }

      return newList;
    }
  }

  @override
  bool isConnect = false;
}

class BasicClickTheSoundGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.clickTheSound;

  @override
  String? completeBasket;

  @override
  bool isConnect = false;
}

class ClickPictureOfWord implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.clickPicture;


  @override
  String? completeBasket;

  List<String> backgroundImages = [
    AppImagesPhonetics.circleShape,
    AppImagesPhonetics.cloudShape,
    AppImagesPhonetics.diamondShape,
    AppImagesPhonetics.hexagonShape,
  ];

  List<String> getBackGround(int length){
    if(length <= backgroundImages.length){
      return backgroundImages.sublist(0,length);
    }
    else{

      List<String> newList = [];
      for(int i = 0; i < backgroundImages.length ; i++ ){
        newList.add(backgroundImages[i]);
        if(i == backgroundImages.length - 1) {
          i = 0;
        }
        if(newList.length  == length){
          break;
        }
      }

      return newList;
    }
  }

  @override
  bool isConnect = false;
}

class BingoGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.bingoNameGame;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}

class SortingCupsGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.bingoNameGame;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}

class SortingPicturesGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.bingoNameGame;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}

class SpellingGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.spellingNameGame;

  String woodenBackground = AppImagesPhonetics.woodBackground;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}
class XOutGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.xOutGameName;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}
class DiceGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.bingoNameGame;


  @override
  String? completeBasket;

  @override
  bool isConnect = true;

}
