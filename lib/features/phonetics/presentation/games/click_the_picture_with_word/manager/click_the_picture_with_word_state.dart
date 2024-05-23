part of 'click_the_picture_with_word_cubit.dart';

class ClickThePictureWithWordInitial extends Equatable {
  final GameModel gameData;
  final List<GameImagesModel>? gameDataPartOne;
  final List<GameImagesModel>? gameDataPartTwo;
  List<String> backGround;
  List<int> correctIndexes;
  GameImagesModel? chooseWord;
  int? correctAnswer;
  ClickThePictureWithWordInitial(
      {this.gameDataPartOne,
      this.gameDataPartTwo,
      required this.gameData,
      this.correctAnswer,
      required this.backGround,
      required this.correctIndexes,
      this.chooseWord});

  ClickThePictureWithWordInitial copyWith(
      {GameModel? gameData,
      List<String>? backGround,
      List<int>? correctIndexes,
      int? correctAnswer,
      List<GameImagesModel>? gameDataPartOne,
      List<GameImagesModel>? gameDataPartTwo,
      GameImagesModel? chooseWord}) {
    return ClickThePictureWithWordInitial(
        gameData: gameData ?? this.gameData,
        backGround: backGround ?? this.backGround,
        gameDataPartOne: gameDataPartOne ?? this.gameDataPartOne,
        gameDataPartTwo: gameDataPartTwo ?? this.gameDataPartTwo,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  @override
  List<Object?> get props => [
        chooseWord,
        correctIndexes,
        gameData,
        backGround,
        correctAnswer,
        gameDataPartTwo,
        gameDataPartOne
      ];
}
