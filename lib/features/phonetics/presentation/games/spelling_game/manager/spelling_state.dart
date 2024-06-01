part of 'spelling_cubit.dart';

@immutable
class SpellingInitial extends Equatable {
  List<GameLettersModel>? cardsLetters;
  List<GameModel>? gameData;
  List<String> correctAnswers;
  int? correctAnswer;
  String? woodenBackground;
  int countOfWrong;
  int index = 0;

  SpellingInitial(
      {this.gameData,
     required this.correctAnswers,
      this.cardsLetters,
      this.index =0,
      this.correctAnswer,
      this.woodenBackground,
        this.countOfWrong = 0});

  SpellingInitial copyWith(
      {List<GameModel>? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      int? countOfWrong,
      int? index,
      List<String>? indexOfCorrectAnswers,
      List<String>? correctAnswers,
      String? woodenBackground}) {
    return SpellingInitial(
        gameData: gameData ?? this.gameData,
      index: index ?? this.index,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        correctAnswer: correctAnswer ?? this.correctAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      woodenBackground: woodenBackground ?? this.woodenBackground,
      countOfWrong: countOfWrong ?? this.countOfWrong,
    );
  }

  @override
  List<Object?> get props =>
      [gameData,index,  correctAnswers, cardsLetters, correctAnswer,woodenBackground,countOfWrong];
}
