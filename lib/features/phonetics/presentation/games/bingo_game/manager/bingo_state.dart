part of 'bingo_cubit.dart';

@immutable
class BingoInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  List<int>? correctIndexes;
  int? correctAnswer;
  GameLettersModel? chooseWord;

  BingoInitial(
      {this.gameData,
      this.correctIndexes,
      this.cardsLetters,
      this.correctAnswer,
      this.chooseWord});

  BingoInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctIndexes}) {
    return BingoInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  @override
  List<Object?> get props =>
      [gameData, correctIndexes, cardsLetters, correctAnswer, chooseWord];
}
