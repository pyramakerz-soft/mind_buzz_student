part of 'click_picture_cubit.dart';

// @immutable
// abstract class DragOutState {}

class ClickPictureInitial extends Equatable {
  final GameModel gameData;
  final List<String> backGround;
  List<int> correctIndexes;
  DateTime? currentPressTime;
  bool isArabic;
  ClickPictureInitial(
      {required this.gameData,
      required this.backGround,
      required this.correctIndexes,
      this.currentPressTime,
      required this.isArabic});

  ClickPictureInitial copyWith(
      {GameModel? gameData,
      List<String>? backGround,
      List<int>? correctIndexes,
      DateTime? currentPressTime,
      bool? isArabic}) {
    return ClickPictureInitial(
      gameData: gameData ?? this.gameData,
      backGround: backGround ?? this.backGround,
      correctIndexes: correctIndexes ?? this.correctIndexes,
      currentPressTime: currentPressTime ?? this.currentPressTime,
      isArabic: isArabic ?? this.isArabic,
    );
  }

  @override
  List<Object?> get props =>
      [gameData, correctIndexes, currentPressTime, isArabic];
}
