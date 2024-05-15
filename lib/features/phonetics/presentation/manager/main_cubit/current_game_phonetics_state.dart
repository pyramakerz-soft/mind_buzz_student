part of 'current_game_phonetics_cubit.dart';

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboard;
  int index;
  MainDataOfPhonetics? basicData;
  CurrentGamePhoneticsState({this.basicData, this.avatarArtboard, required this.index});
  CurrentGamePhoneticsState copyWith({
    MainDataOfPhonetics? basicData,
    Artboard? avatarArtboard,
    int? index
  }) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? this.basicData,
        index: index ?? this.index,
        avatarArtboard: avatarArtboard ?? this.avatarArtboard);
  }

  @override
  List<Object?> get props => [basicData, avatarArtboard, index];
}
