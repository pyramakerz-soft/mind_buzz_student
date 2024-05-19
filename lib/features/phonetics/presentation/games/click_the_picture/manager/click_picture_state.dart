part of 'click_picture_cubit.dart';

// @immutable
// abstract class DragOutState {}

class ClickPictureInitial extends Equatable {
  final GameModel gameData;
  final List<String> backGround;
  List<int> correctIndexes;
  ClickPictureInitial({required this.gameData, required this.backGround,required this.correctIndexes});

  ClickPictureInitial copyWith({
     GameModel? gameData,
     List<String>? backGround,
    List<int>? correctIndexes,
  }) {
    return ClickPictureInitial(
        gameData: gameData ?? this.gameData,
        backGround: backGround ?? this.backGround,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  @override
  List<Object?> get props => [gameData,correctIndexes];


}
