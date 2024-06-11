import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mind_buzz_refactor/features/phonetics/domain/entities/game_model.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/games_structure/arabic/game_phonatics_types.dart';
import '../../../../../../core/talk_tts.dart';

part 'x_out_state.dart';

class XOutCubit extends Cubit<XOutInitial> {
  final List<GameModel> gameData;

  XOutCubit({required this.gameData}) : super(XOutInitial(gameData: gameData)) {
    List<GameModel> tempGameData = gameData.where((element) {
      print(element.isEdited == 0);
      print('element.isEdited:${element.isEdited}, ${element.gameTypes?.name}');
      return element.isEdited == 0 &&
          element.gameTypes?.name?.toLowerCase() ==
              GameTypes.xOut.text().toLowerCase();
    }).toList();
    print('tempGameData:${tempGameData.length}');
    emit(state.copyWith(gameData: tempGameData));
    startSayGame();
  }

  Future<int> increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswers ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswers: sub));
    return Future.value(state.correctAnswers);
  }

  Future<void> selectItem(int index) async {
    final selectedItems = state.selectedItems ?? [];

    if (!selectedItems.contains(index)) {
      final updatedSelectedItems = List<int>.from(selectedItems)..add(index);

      emit(state.copyWith(
        selectedItems: updatedSelectedItems,
      ));
      Future.delayed(Duration(seconds: 1), () {
        resetSelectedItems();
      });
    }
  }

  void resetSelectedItems() {
    emit(state.copyWith(selectedItems: []));
  }

  updateGameIndex() {
    int currentIndex = state.currentGameIndex ?? 0;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(currentGameIndex: currentIndex));
    sayTheLetter();
  }

  bool isLastGame() {
    int currentIndex = state.currentGameIndex ?? 0;
    currentIndex = currentIndex + 1;
    print('state.gameData?.length : ${state.gameData?.length}');
    if ((state.gameData?.length ?? 0) > currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  void startInteraction() {
    emit(state.copyWith(isInteracting: true));
  }

  void stopInteraction() {
    emit(state.copyWith(isInteracting: false));
  }

  startSayGame() async {
    await TalkTts.startTalk(
        text: state.gameData?[state.currentGameIndex ?? 0].inst ?? '');
    await AudioPlayerClass.startPlaySound(
        soundPath: AppSound.getSoundOfLetter(
            mainGameLetter:
                (state.gameData?[state.currentGameIndex ?? 0].mainLetter ??
                    '')));
  }

  Future sayTheInstruction() async {
    await TalkTts.startTalk(
        text: state.gameData?[state.currentGameIndex ?? 0].inst ?? '');
  }

  sayTheLetter() async {
    await AudioPlayerClass.startPlaySound(
        soundPath: AppSound.getSoundOfLetter(
            mainGameLetter:
                (state.gameData?[state.currentGameIndex ?? 0].mainLetter ??
                    '')));
  }
}
