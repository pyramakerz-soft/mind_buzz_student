part of 'spelling_cubit.dart';

@immutable
class SpellingInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  List<int>? correctIndexes;
  int? correctAnswer;
  GameLettersModel? chooseWord;
  String? woodenBackground;

  SpellingInitial(
      {this.gameData,
      this.correctIndexes,
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
      List<int>? correctIndexes,
      String? woodenBackground}) {
    return SpellingInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        correctIndexes: correctIndexes ?? this.correctIndexes,
      woodenBackground: woodenBackground ?? this.woodenBackground,
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctIndexes, cardsLetters, correctAnswer, chooseWord,woodenBackground];
}
