import 'assets_images_phonetics.dart';
import 'basic_of_phonetics.dart';

abstract class BasicOfEveryGame {
  late bool isRound;
  late String titleImage;
  late String keyGame;
  late String completeBasket;

  static String phonics = 'Phonics';
  static String stateOIdle = 'idle';
  static String stateOfWin = 'win';
  static String stateOfSad = 'sad';
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

  @override
  String keyGame = 'Drag Out';

  @override
  String completeBasket = AppImagesPhonetics.imageBasketComplete;
}
