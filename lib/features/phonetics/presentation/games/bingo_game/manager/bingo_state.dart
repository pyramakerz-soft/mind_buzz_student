part of 'bingo_cubit.dart';

@immutable
class BingoInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  List<int>? correctIndexes;
  int? correctAnswer;
  bool stopAction = false;
  GameLettersModel? chooseWord;

  BingoInitial(
      {this.gameData,
      this.correctIndexes,
      this.cardsLetters,
      required this.stopAction,
      this.correctAnswer,
      this.chooseWord});

  BingoInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      bool? stopAction,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctIndexes}) {
    return BingoInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        stopAction: stopAction ?? this.stopAction,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  BingoInitial clearAllData() {
    return BingoInitial(stopAction: stopAction);
  }

  @override
  List<Object?> get props => [
        gameData,
        correctIndexes,
        cardsLetters,
        correctAnswer,
        chooseWord,
        stopAction
      ];
}
