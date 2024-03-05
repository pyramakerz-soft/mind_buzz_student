part of 'game_cubit.dart';

class GameState extends Equatable {
  Artboard? riveTalkingBoard;
  Artboard? riveSuccessDogBoard;
  Artboard? riveThinkingDogBoard;
  Artboard? riveWrongDogBoard;
  final StateOfAvatar stateOfAvatar;
  final Map<int, Offset> touchPositions;
  final TtsState ttsState;
  final DateTime screenOpenTime;

  GameState(
      {this.riveSuccessDogBoard,
      this.riveThinkingDogBoard,
      this.riveTalkingBoard,
      this.ttsState = TtsState.stopped,
      DateTime? screenOpenTime,
      Map<int, Offset>? touchPositions,
      this.stateOfAvatar = StateOfAvatar.stop,
      this.riveWrongDogBoard})
      : touchPositions = touchPositions ?? {},
        screenOpenTime = DateTime.now();

  GameState copyWith(
      {Artboard? riveSuccessDogBoard,
      Artboard? riveTalkingBoard,
      Artboard? riveThinkingDogBoard,
      StateOfAvatar? stateOfAvatar,
      TtsState? ttsState,
      DateTime? screenOpenTime,
      Artboard? riveWrongDogBoard,
      Map<int, Offset>? touchPositions}) {
    return GameState(
        riveSuccessDogBoard: riveSuccessDogBoard ?? this.riveSuccessDogBoard,
        stateOfAvatar: stateOfAvatar ?? this.stateOfAvatar,
        ttsState: ttsState ?? this.ttsState,
        riveThinkingDogBoard: riveThinkingDogBoard ?? this.riveThinkingDogBoard,
        riveWrongDogBoard: riveWrongDogBoard ?? this.riveWrongDogBoard,
        screenOpenTime: screenOpenTime ?? this.screenOpenTime,
        touchPositions: touchPositions ?? this.touchPositions,
        riveTalkingBoard: riveTalkingBoard ?? this.riveTalkingBoard);
  }

  @override
  List<Object?> get props => [
        stateOfAvatar,
        riveSuccessDogBoard,
        ttsState,
        riveThinkingDogBoard,
        screenOpenTime,
        riveWrongDogBoard,
        riveTalkingBoard
      ];
}
