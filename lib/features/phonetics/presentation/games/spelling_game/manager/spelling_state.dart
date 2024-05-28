part of 'spelling_cubit.dart';

@immutable
class SpellingInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  List<String> correctAnswers;
  int? correctAnswer;
  String? woodenBackground;
  int countOfWrong;

  SpellingInitial(
      {this.gameData,
     required this.correctAnswers,
      this.cardsLetters,
      this.correctAnswer,
      this.woodenBackground,
        this.countOfWrong = 0});

  SpellingInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      int? countOfWrong,
      List<String>? indexOfCorrectAnswers,
      List<String>? correctAnswers,
      String? woodenBackground}) {
    return SpellingInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        correctAnswer: correctAnswer ?? this.correctAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      woodenBackground: woodenBackground ?? this.woodenBackground,
      countOfWrong: countOfWrong ?? this.countOfWrong,
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctAnswers, cardsLetters, correctAnswer,woodenBackground,countOfWrong];
}
