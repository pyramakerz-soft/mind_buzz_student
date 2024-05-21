part of 'click_the_sound_cubit.dart';


class ClickTheSoundInitial extends Equatable {
    final GameModel gameData;
   List<String>? letters;
  int? correctAnswers = 0;
     List<int>? correctIndexes = [];


  ClickTheSoundInitial({required this.gameData,this.letters,this.correctAnswers,this.correctIndexes});
  
    ClickTheSoundInitial copyWith({
     GameModel? gameData,
         List<String>? letters,
         int? correctAnswers,
        List<int>? correctIndexes,
  }) {
    return ClickTheSoundInitial(
        gameData: gameData ?? this.gameData,
        letters: letters ?? this.letters,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        correctIndexes: correctIndexes ?? this.correctIndexes,
    
    );
    
    
  }

  @override
  List<Object?> get props => [gameData,letters,correctAnswers,correctIndexes];

  
}
