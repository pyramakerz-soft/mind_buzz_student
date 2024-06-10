import 'assets_images_arabic.dart';

enum GameTypes {
  tracingArabic,
  clickPictureArabic,
  clickTheSoundArabic,
  dragOutArabic,
  repeatCharArabic,
  chooseCorrectWordArabic,
  chooseFormationArabic,
  matchingArabic,
  sortingCupsArabic,
  chooseTheCorrectCharArabic,
  createWordArabic,
  videoArabic,
}

extension TypeExtension on GameTypes {
  String text() {
    switch (this) {
      case GameTypes.videoArabic:
        return 'Video'.toLowerCase();
      case GameTypes.tracingArabic:
        return 'تتبع بإصبعين'.toLowerCase();
      case GameTypes.clickPictureArabic:
        return 'اضغط علي الصورة'.toLowerCase();
      case GameTypes.clickTheSoundArabic:
        return 'لون الحرف'.toLowerCase();
      case GameTypes.dragOutArabic:
        return 'استبعد'.toLowerCase();
      case GameTypes.repeatCharArabic:
        return 'كرر خلفي'.toLowerCase();
      case GameTypes.chooseCorrectWordArabic:
        return 'اختر الكلمة الصحيحة'.toLowerCase();
      case GameTypes.chooseFormationArabic:
        return 'اختر التشكيل'.toLowerCase();
      case GameTypes.matchingArabic:
        return 'صل'.toLowerCase();
      case GameTypes.sortingCupsArabic:
        return 'صنف'.toLowerCase();
      case GameTypes.chooseTheCorrectCharArabic:
        return 'اخترالحرف الصحيح'.toLowerCase();
      case GameTypes.createWordArabic:
        return 'كون الكلمات'.toLowerCase();
    }
  }
}

abstract class BasicOfEveryGameArabic {
  late bool isRound;
  late String titleImage;
  late String? completeBasket;
  static String arabic = 'Arabic';
  static String connect = 'Connect';
  static String stateOIdle = 'idle';
  static String stateOfWin = 'win';
  static String stateOfSad = 'sad';
  bool isConnect = false;

  static getTheGameType({required String gameType, required int audioFlag}) {
    gameType.toLowerCase();
    if (gameType == GameTypes.clickPictureArabic.text() && audioFlag == 1) {
      ///audio flag == 1 say the word
      return ClickPicture();
    }
  }


}


class ClickPicture implements BasicOfEveryGameArabic {
  @override
  bool isRound = false;

  @override
  String titleImage = AppImagesArabic.titleOfClickThePicture;

  // @override
  // String keyGame = 'Click the picture';

  @override
  String? completeBasket;

  List<String> backgroundImages = [
    AppImagesArabic.circleShape,
    AppImagesArabic.cloudShape,
    AppImagesArabic.diamondShape,
    AppImagesArabic.hexagonShape,
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
}
