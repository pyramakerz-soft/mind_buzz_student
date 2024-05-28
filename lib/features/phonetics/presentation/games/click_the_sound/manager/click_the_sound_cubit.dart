import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';

part 'click_the_sound_state.dart';

class ClickTheSoundCubit extends Cubit<ClickTheSoundInitial> {
  final GameModel gameData;
  List<String>? letters;
  List<int>? correctIndexes = [];
  int? correctAnswers = 0;


  ClickTheSoundCubit({required this.gameData, this.letters, this.correctAnswers, this.correctIndexes}) : super(ClickTheSoundInitial(gameData: gameData, letters: letters, correctAnswers: correctAnswers, correctIndexes: correctIndexes)) {
    generateRandomLetters2();
    TalkTts.startTalk(text: gameData.inst ?? '');
    Future.delayed(Duration(seconds: 2), () {
          sayTheLetter();
    });
  }

  sayTheLetter() async {
    await AudioPlayerClass.startPlaySound(soundPath: AppSound.getSoundOfLetter(mainGameLetter: state.gameData?.mainLetter ?? ''));
  }

  Future<void> generateRandomLetters() async {
    List<String> gameLetters = state.gameData.gameLetters?.map((e) => e.letter.toString()).toList() ?? [];

    String mainLetter = state.gameData.mainLetter ?? '';
    gameLetters.remove(mainLetter);
    gameLetters.shuffle();

    List<String> randomLetters = gameLetters.sublist(0, 3);
    int randomIndex = Random().nextInt(3);
    randomLetters.insert(randomIndex, mainLetter);
    while (randomLetters.length < 8) {
      randomLetters.add(mainLetter);
    }
    emit(state.copyWith(letters: randomLetters));
  }

Future<void> generateRandomLetters2() async {
  List<String> gameLetters = state.gameData.gameLetters?.map((e) => e.letter.toString()).toList() ?? [];
  String mainLetter = state.gameData.mainLetter ?? '';
  int numOfLetterRepeat = state.gameData.numOfLetterRepeat ?? 4;
  gameLetters.remove(mainLetter);
  gameLetters.shuffle();
  List<String> randomLetters = List.filled(numOfLetterRepeat, mainLetter, growable: true);
  // calc remaining bubbles to fill
  int remainingSlots = 8 - numOfLetterRepeat;
  if (gameLetters.length < remainingSlots) {
    throw Exception('Issue with the number of letters');
  }
  // addd other letters to the list until --> 8 letters
  randomLetters.addAll(gameLetters.sublist(0, remainingSlots));
  randomLetters.shuffle();
  emit(state.copyWith(letters: randomLetters));
}


  Future<void> incrementCorrectAnswerCount(int index) async {
    if (correctAnswers == null) correctAnswers = 0;
    correctAnswers = correctAnswers! + 1;
    if (correctIndexes == null) correctIndexes = [];
    correctIndexes?.add(index);
    emit(state.copyWith(correctAnswers: correctAnswers, correctIndexes: correctIndexes));
  }
  
  void startInteraction() {
   emit(state.copyWith(isInteracting: true));
  }

  void stopInteraction() {
    emit(state.copyWith(isInteracting: false));

  }
  
    Future<void> selectItem(int index) async {
      emit(state.copyWith(
        selectedItem: index,
      ));
  }
  
    void resetSelectedItems() {
      print('here in resetSelectedItems cubit');
    Future.delayed(Duration(seconds: 2), () {
    emit(state.copyWith(selectedItem: null));
      });
  }

}
