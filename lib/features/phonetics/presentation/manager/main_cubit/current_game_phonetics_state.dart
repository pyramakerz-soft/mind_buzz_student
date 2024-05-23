part of 'current_game_phonetics_cubit.dart';

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboard;
  Artboard? avatarArtboardIdle;
  Artboard? avatarArtboardSuccess;
  Artboard? avatarArtboardSad;
  Artboard? avatarArtboardLoading;
  Map<int, Offset>? touchPositions = <int, Offset>{};
  String? stateOfAvatar;
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
      this.stateOfAvatar,
      this.avatarArtboardIdle,
      this.avatarArtboardSad,
      this.touchPositions,
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
      Map<int, Offset>? touchPositions,
      Artboard? avatarArtboardLoading,
      String? currentAvatar,
      String? stateOfAvatar,
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
        stateOfAvatar: stateOfAvatar ?? this.stateOfAvatar,
        currentAvatar: currentAvatar ?? this.currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? this.avatarArtboardSad,
        avatarArtboardSuccess:
            avatarArtboardSuccess ?? this.avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? this.avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? this.countOfCorrectAnswer,
        countOfStar: countOfStar ?? this.countOfStar,
        avatarArtboard: avatarArtboard ?? this.avatarArtboard);
  }

  updateTouchPositions({Map<int, Offset>? touchPositions}) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? basicData,
        index: index ?? index,
        avatarArtboardLoading: avatarArtboardLoading ?? avatarArtboardLoading,
        gameData: gameData ?? gameData,
        touchPositions: touchPositions,
        statesOfAddStars: statesOfAddStars ?? statesOfAddStars,
        stateOfAvatar: stateOfAvatar ?? stateOfAvatar,
        currentAvatar: currentAvatar ?? currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? avatarArtboardSad,
        avatarArtboardSuccess: avatarArtboardSuccess ?? avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? countOfCorrectAnswer,
        countOfStar: countOfStar ?? countOfStar,
        avatarArtboard: avatarArtboard ?? avatarArtboard);
  }

  clearStateOfAvatar() {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? basicData,
        index: index ?? index,
        avatarArtboardLoading: avatarArtboardLoading ?? avatarArtboardLoading,
        gameData: gameData ?? gameData,
        statesOfAddStars: statesOfAddStars ?? statesOfAddStars,
        stateOfAvatar: null,
        currentAvatar: currentAvatar ?? currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? avatarArtboardSad,
        avatarArtboardSuccess: avatarArtboardSuccess ?? avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? countOfCorrectAnswer,
        countOfStar: countOfStar ?? countOfStar,
        avatarArtboard: avatarArtboard ?? avatarArtboard);
  }

  @override
  List<Object?> get props => [
        basicData,
        currentAvatar,
        avatarArtboardIdle,
        avatarArtboardSad,
        avatarArtboardSuccess,
        gameData,
        avatarArtboardLoading,
        touchPositions,
        countOfCorrectAnswer,
        stateOfAvatar,
        statesOfAddStars,
        avatarArtboard,
        index,
        countOfStar
      ];
}
