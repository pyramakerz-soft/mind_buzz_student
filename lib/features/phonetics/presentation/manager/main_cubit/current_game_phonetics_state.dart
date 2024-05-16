part of 'current_game_phonetics_cubit.dart';

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboard;
  Artboard? avatarArtboardIdle;
  Artboard? avatarArtboardSuccess;
  Artboard? avatarArtboardSad;
  Artboard? avatarArtboardLoading;

  String? currentAvatar;
  int index;
  List<GameModel>? gameData;
  List<int>? statesOfAddStars;
  int? countOfStar = 0;
  int? countOfCorrectAnswer = 0;
  MainDataOfPhonetics? basicData;
  CurrentGamePhoneticsState(
      {this.basicData,
      this.avatarArtboard,
      this.gameData,
      this.avatarArtboardLoading,
      this.avatarArtboardIdle,
      this.avatarArtboardSad,
      this.avatarArtboardSuccess,
      this.statesOfAddStars,
      this.currentAvatar,
      this.countOfCorrectAnswer,
      required this.index,
      this.countOfStar});
  CurrentGamePhoneticsState copyWith(
      {MainDataOfPhonetics? basicData,
      Artboard? avatarArtboard,
      Artboard? avatarArtboardSuccess,
      Artboard? avatarArtboardIdle,
      Artboard? avatarArtboardSad,
      Artboard? avatarArtboardLoading,
      String? currentAvatar,
      List<GameModel>? gameData,
      List<int>? statesOfAddStars,
      int? index,
      int? countOfCorrectAnswer,
      int? countOfStar}) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? this.basicData,
        index: index ?? this.index,
        avatarArtboardLoading:
            avatarArtboardLoading ?? this.avatarArtboardLoading,
        gameData: gameData ?? this.gameData,
        statesOfAddStars: statesOfAddStars ?? this.statesOfAddStars,
        currentAvatar: currentAvatar ?? this.currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? this.avatarArtboardSad,
        avatarArtboardSuccess: avatarArtboardSuccess ?? this.avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? this.avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? this.countOfCorrectAnswer,
        countOfStar: countOfStar ?? this.countOfStar,
        avatarArtboard: avatarArtboard ?? this.avatarArtboard);
  }

  @override
  List<Object?> get props => [
        basicData,
        currentAvatar,
    avatarArtboardIdle, avatarArtboardSad,avatarArtboardSuccess,
        gameData,
        avatarArtboardLoading,
        countOfCorrectAnswer,
        statesOfAddStars,
        avatarArtboard,
        index,
        countOfStar
      ];
}
