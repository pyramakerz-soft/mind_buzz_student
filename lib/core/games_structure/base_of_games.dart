import 'phonetics/basic_of_chapter.dart';

abstract class BaseOfGames {
  static String phonics = 'Phonics';
  static String arabic = 'Arabic';
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

  static List<Type> listOfChapterOfPhonetics = [
    SPhonetics,
    APhonetics,
    FPhonetics,
    MPhonetics,
    TPhonetics,
    CPhonetics,
    RPhonetics,
    IPhonetics,
    PPhonetics,
    HPhonetics,
    JPhonetics,
    UPhonetics,
    LPhonetics,
    BPhonetics,
    OPhonetics,
    GPhonetics,
    DPhonetics,
    WPhonetics,
    EPhonetics,
    NPhonetics,
    SpellTheWord,
    ConnectionSortingCups,
    ConnectionWithoutSortingCups
  ];
  static bool isPhonetics({required Type chapter}) {
    return listOfChapterOfPhonetics.contains(chapter);
  }

  static List<Type> listOfChapterOfArabic = [RedPhonetics];
  static bool isArabic({required Type chapter}) {
    return listOfChapterOfArabic.contains(chapter);
  }
}
