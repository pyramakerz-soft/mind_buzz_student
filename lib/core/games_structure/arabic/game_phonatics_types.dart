enum GameTypes {
  dragOut,
  clickPicture,
  clickTheSound,
  bingo,
  sortingCups,
  sortingPictures,
  dice,
  xOut,
  spelling,
  tracing,
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
  video,
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
      case GameTypes.tracing:
        return 'trace'.toLowerCase();
      case GameTypes.video:
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
