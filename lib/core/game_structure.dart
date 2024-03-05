import 'dart:math';
import '../features/games/domain/entities/game_letters_model.dart';
import '../features/games/domain/entities/result_model.dart';

abstract class GameStructure {
  static Future<GameLettersModel?> getRandomValueOfGame2(
      {required List<GameLettersModel> cardsLetters}) async {
    List<GameLettersModel> visibleLetters =
        cardsLetters.where((letter) => (letter.hide != true)).toList();

    if (visibleLetters.isNotEmpty) {
      Random random = Random();
      int randomIndex = random.nextInt(visibleLetters.length);
      GameLettersModel? tempRandomVisibleLetter = visibleLetters[randomIndex];
      return tempRandomVisibleLetter;
    }
    return null;
  }

  static bool checkCompleted({required List<GameLettersModel> cardsLetters}) {
    int countOfCompleted = 0;
    for (var element in cardsLetters) {
      if (element.hide == true) {
        ++countOfCompleted;
      }
    }
    return countOfCompleted == cardsLetters.length;
  }

  static int getCountOfCompleteQuestions(
      {required List<GameLettersModel> cardsLetters}) {
    int countOfCompleted = 0;
    for (var element in cardsLetters) {
      if (element.hide == true) {
        ++countOfCompleted;
      }
    }
    return countOfCompleted;
  }

  static int closeScreen(
      {required DateTime screenCloseTime, required DateTime screenOpenTime}) {
    int secondsDifference =
        screenCloseTime.difference(screenOpenTime).inSeconds;
    return secondsDifference;
  }

  static getTheDifferentTimeOfAnswers({required  ResultModel lastResultModel, required DateTime screenOpenTime}) {
    return ((lastResultModel.detailsOfAnswers?.isEmpty ?? true)
        ? closeScreen(
        screenCloseTime: DateTime.now(), screenOpenTime: screenOpenTime)
        : closeScreen(
        screenCloseTime: DateTime.now(),
        screenOpenTime: ((lastResultModel
            .detailsOfAnswers?[
        (lastResultModel.detailsOfAnswers?.length ?? 0) - 1]
            .dateTimeOfAnswer ??
            screenOpenTime))))
        .toString();
  }
}
