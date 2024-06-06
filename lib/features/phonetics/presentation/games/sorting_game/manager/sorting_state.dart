part of 'sorting_cubit.dart';

@immutable
class sortingInitial extends Equatable {
  GameModel? gameData;
  List<int> correctAnswers;
  List<GameImagesModel>? wrongAnswers;
  String? woodenBackground;
  int step = 1;
  List<GameImagesModel> currentImages;
  List<GameImagesModel> correctAnswersData;

  sortingInitial(
      {this.gameData,
     required this.correctAnswers,
     required this.currentImages,
     required this.correctAnswersData,
      this.wrongAnswers,
      this.woodenBackground,
        this.step = 1,
      });

  sortingInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctAnswers,
      List<GameImagesModel>? currentImages,
      List<GameImagesModel>? correctAnswersData,
      List<GameImagesModel>? wrongAnswers,
        int? step,
      String? woodenBackground}) {
    return sortingInitial(
        gameData: gameData ?? this.gameData,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      woodenBackground: woodenBackground ?? this.woodenBackground,
      currentImages: currentImages ?? this.currentImages,
      step: step ?? this.step,
        correctAnswersData: correctAnswersData ?? this.correctAnswersData
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctAnswers, woodenBackground,currentImages,wrongAnswers, correctAnswersData];
}
