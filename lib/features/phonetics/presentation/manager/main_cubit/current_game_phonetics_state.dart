part of 'current_game_phonetics_cubit.dart';

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboard;
  Artboard? avatarArtboardIdle;
  Artboard? avatarArtboardSuccess;
  Artboard? avatarArtboardSad;
  Artboard? avatarArtboardLoading;
  bool? touchPositions = false;
  String? stateOfAvatar;
  String? currentAvatar;
  int index;
  int? countOfTries;
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
      this.countOfTries,
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
      bool? touchPositions,
      Artboard? avatarArtboardLoading,
      String? currentAvatar,
      String? stateOfAvatar,
      List<GameModel>? gameData,
      List<int>? statesOfAddStars,
      int? index,
      int? countOfTries,
      int? countOfCorrectAnswer,
      int? countOfStar}) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? this.basicData,
        index: index ?? this.index,
        touchPositions:touchPositions??this.touchPositions,
        avatarArtboardLoading:
            avatarArtboardLoading ?? this.avatarArtboardLoading,
        gameData: gameData ?? this.gameData,
        statesOfAddStars: statesOfAddStars ?? this.statesOfAddStars,
        stateOfAvatar: stateOfAvatar ?? this.stateOfAvatar,
        currentAvatar: currentAvatar ?? this.currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? this.avatarArtboardSad,
        countOfTries: countOfTries ?? this.countOfTries,
        avatarArtboardSuccess:
            avatarArtboardSuccess ?? this.avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? this.avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? this.countOfCorrectAnswer,
        countOfStar: countOfStar ?? this.countOfStar,
        avatarArtboard: avatarArtboard ?? this.avatarArtboard);
  }

  clearStateOfAvatar() {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? basicData,
        index: index ?? index,
        avatarArtboardLoading: avatarArtboardLoading ?? avatarArtboardLoading,
        gameData: gameData ?? gameData,
        statesOfAddStars: statesOfAddStars ?? statesOfAddStars,
        stateOfAvatar: null,
        touchPositions: touchPositions,
        currentAvatar: currentAvatar ?? currentAvatar,
        countOfTries: countOfTries ?? countOfTries,
        avatarArtboardSad: avatarArtboardSad ?? avatarArtboardSad,
        avatarArtboardSuccess: avatarArtboardSuccess ?? avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? avatarArtboardIdle,
        countOfCorrectAnswer: countOfCorrectAnswer ?? countOfCorrectAnswer,
        countOfStar: countOfStar ?? countOfStar,
        avatarArtboard: avatarArtboard ?? avatarArtboard);
  }


  CurrentGamePhoneticsState clearAllData() {
    return CurrentGamePhoneticsState(
      index: index ?? index,
    );
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
        countOfTries,
        countOfCorrectAnswer,
        stateOfAvatar,
        statesOfAddStars,
        avatarArtboard,
        index,
        countOfStar
      ];
}
