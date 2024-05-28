part of 'sorting_cubit.dart';

@immutable
class sortingInitial extends Equatable {
  GameModel? gameData;
  List<GameImagesModel> correctAnswers;
  int? correctAnswer;
  String? woodenBackground;
  int countOfWrong;
  int step = 1;
  List<GameImagesModel>? currentImages;

  sortingInitial(
      {this.gameData,
     required this.correctAnswers,
      this.correctAnswer,
      this.woodenBackground,
        this.countOfWrong = 0,
        this.step = 1,
        this.currentImages,
      });

  sortingInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      int? correctAnswer,
      int? countOfWrong,
      List<String>? indexOfCorrectAnswers,
      List<GameImagesModel>? correctAnswers,
      List<GameImagesModel>? currentImages,
        int? step,
      String? woodenBackground}) {
    return sortingInitial(
        gameData: gameData ?? this.gameData,
        correctAnswer: correctAnswer ?? this.correctAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      woodenBackground: woodenBackground ?? this.woodenBackground,
      countOfWrong: countOfWrong ?? this.countOfWrong,
      currentImages: currentImages ?? this.currentImages,
      step: step ?? this.step,
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctAnswers, correctAnswer,woodenBackground,countOfWrong,currentImages];
}
