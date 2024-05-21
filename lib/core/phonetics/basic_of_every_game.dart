

import 'assets_images_phonetics.dart';
import 'basic_of_phonetics.dart';

enum GameTypes {
  dragOut,
  clickPicture,
  clickTheSound,
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

  static getTheGameType({required String gameType}){
    gameType.toLowerCase();
    if (gameType == GameTypes.dragOut.text()) {
      return BasicDragOutGame();
    } else if (gameType == GameTypes.clickPicture.text()) {
      return ClickPictureS();
    }
    else if (gameType == GameTypes.clickTheSound.text()) {
      return BasicClickTheSoundGame();
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
}

class BasicClickTheSoundGame implements BasicOfEveryGame {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesPhonetics.clickTheSound;
  
  @override
  String? completeBasket;
}
