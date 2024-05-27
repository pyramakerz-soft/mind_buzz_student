part of 'spelling_cubit.dart';

@immutable
class SpellingInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  List<String> correctAnswers;
  int? correctAnswer;
  GameLettersModel? chooseWord;
  String? woodenBackground;

  SpellingInitial(
      {this.gameData,
     required this.correctAnswers,
      this.cardsLetters,
      this.correctAnswer,
      this.chooseWord,
      this.woodenBackground});

  SpellingInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      List<String>? indexOfCorrectAnswers,
      List<String>? correctAnswers,
      String? woodenBackground}) {
    return SpellingInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      woodenBackground: woodenBackground ?? this.woodenBackground,
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctAnswers, cardsLetters, correctAnswer, chooseWord,woodenBackground];
}
