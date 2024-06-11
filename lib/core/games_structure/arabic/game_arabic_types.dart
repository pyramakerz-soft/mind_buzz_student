enum GameArabicTypes {
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

extension TypeExtension on GameArabicTypes {
  String text() {
    switch (this) {
      case GameArabicTypes.videoArabic:
        return 'Video'.toLowerCase();
      case GameArabicTypes.tracingArabic:
        return 'تتبع بإصبعين'.toLowerCase();
      case GameArabicTypes.clickPictureArabic:
        return 'اضغط علي الصورة'.toLowerCase();
      case GameArabicTypes.clickTheSoundArabic:
        return 'لون الحرف'.toLowerCase();
      case GameArabicTypes.dragOutArabic:
        return 'استبعد'.toLowerCase();
      case GameArabicTypes.repeatCharArabic:
        return 'كرر خلفي'.toLowerCase();
      case GameArabicTypes.chooseCorrectWordArabic:
        return 'اختر الكلمة الصحيحة'.toLowerCase();
      case GameArabicTypes.chooseFormationArabic:
        return 'اختر التشكيل'.toLowerCase();
      case GameArabicTypes.matchingArabic:
        return 'صل'.toLowerCase();
      case GameArabicTypes.sortingCupsArabic:
        return 'صنف'.toLowerCase();
      case GameArabicTypes.chooseTheCorrectCharArabic:
        return 'اخترالحرف الصحيح'.toLowerCase();
      case GameArabicTypes.createWordArabic:
        return 'كون الكلمات'.toLowerCase();
    }
  }
}
