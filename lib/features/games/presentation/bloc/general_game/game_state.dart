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
  final int currentIndex;
  final List<int> dataQuestions;
  GameState(
      {this.riveSuccessDogBoard,
      this.riveThinkingDogBoard,
      this.riveTalkingBoard,
      this.ttsState = TtsState.stopped,
      DateTime? screenOpenTime,
      int? currentIndex,
      List<int>? dataQuestions,
      Map<int, Offset>? touchPositions,
      this.stateOfAvatar = StateOfAvatar.stop,
      this.riveWrongDogBoard})
      : touchPositions = touchPositions ?? {},
        dataQuestions = [0],
        currentIndex = 0,
        screenOpenTime = DateTime.now();

  GameState copyWith(
      {Artboard? riveSuccessDogBoard,
      Artboard? riveTalkingBoard,
      Artboard? riveThinkingDogBoard,
      StateOfAvatar? stateOfAvatar,
      TtsState? ttsState,
      DateTime? screenOpenTime,
      List<int>? dataQuestions,
      int? currentIndex,
      Artboard? riveWrongDogBoard,
      Map<int, Offset>? touchPositions}) {
    return GameState(
        riveSuccessDogBoard: riveSuccessDogBoard ?? this.riveSuccessDogBoard,
        stateOfAvatar: stateOfAvatar ?? this.stateOfAvatar,
        ttsState: ttsState ?? this.ttsState,
        currentIndex: currentIndex ?? this.currentIndex,
        dataQuestions: dataQuestions ?? this.dataQuestions,
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
        dataQuestions,
        currentIndex,
        riveTalkingBoard
      ];
}
