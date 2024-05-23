import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../domain/entities/game_model.dart';

part 'click_the_sound_state.dart';

class ClickTheSoundCubit extends Cubit<ClickTheSoundInitial> {
  final GameModel gameData;
  List<String>? letters;
  List<int>? correctIndexes = [];
  int? correctAnswers = 0;

  ClickTheSoundCubit({required this.gameData, this.letters, this.correctAnswers, this.correctIndexes}) : super(ClickTheSoundInitial(gameData: gameData, letters: letters, correctAnswers: correctAnswers, correctIndexes: correctIndexes)) {
    generateRandomLetters();
    sayTheLetter();

  }

  sayTheLetter() async {
    await AudioPlayerClass.startPlaySound(soundPath: AppSound.getSoundOfLetter(mainGameLetter: state.gameData?.mainLetter ?? ''));
  }

  Future<void> generateRandomLetters() async {
    List<String> alphabetRange = 'smatd'.split('');
    //TODO: Must be fixed form the model itself 'letter' instead of 'name'
    // List<String> gameLetters = state.gameData.gameLetters.map((e) => e.letter).toList();

    // Remove the mainLetter from alphabetRange if it exists
    String mainLetter = state.gameData.mainLetter ?? '';
    alphabetRange.remove(mainLetter);

    // Shuffle the alphabetRange to randomize it
    alphabetRange.shuffle();

    // Get two random letters from the shuffled alphabetRange
    List<String> randomLetters = alphabetRange.sublist(0, 3);

    // Add the main letter at a random position within the first three places
    int randomIndex = Random().nextInt(3);
    randomLetters.insert(randomIndex, mainLetter);

    // Fill the rest of the list with the main letter until the length is 8
    while (randomLetters.length < 8) {
      randomLetters.add(mainLetter);
    }

    // emit with  the new list of letters
    emit(state.copyWith(letters: randomLetters));
  }

  Future<void> incrementCorrectAnswerCount(int index) async {
    if (correctAnswers == null) correctAnswers = 0;
    correctAnswers = correctAnswers! + 1;
    if (correctIndexes == null) correctIndexes = [];
    correctIndexes?.add(index);
    emit(state.copyWith(correctAnswers: correctAnswers, correctIndexes: correctIndexes));
  }
  
}
