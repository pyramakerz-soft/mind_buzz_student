import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';

part 'drag_out_state.dart';

class DragOutCubit extends Cubit<DragOutInitial> {
  final List<GameModel> gameData;
  DragOutCubit({required this.gameData})
      : super(DragOutInitial(gameData: gameData)) {
    // TalkTts.startTalk(text: gameData.mainLetter ?? '');
    getTheFirstDragOut();
  }
  getTheFirstDragOut(){
    log('getTheFirstDragOut');
    int tempIndex= state.index??0 ;
    gameData.forEach((element) {
      log("(element.gameTypes?.name == GameTypes.dragOut.text()):${(element.gameTypes?.name)}");
      log("(element.gameTypes?.name == GameTypes.dragOut.text()):${(GameTypes.dragOut.text())}");
      if(element.gameTypes?.name?.toLowerCase() == GameTypes.dragOut.text().toLowerCase()){
        emit(state.copyWith(index: tempIndex));
        return ;
      }else{
        tempIndex++;
      }
    });

  }

  Future<int>increaseCountOfCorrectAnswers()async{
    int sub = state.correctAnswer??0;
    sub = sub +1;
    emit(state.copyWith(correctAnswer: sub));
    return Future.value(state.correctAnswer);
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index??0;
    currentIndex = currentIndex + 1;

    if ((state.gameData.length ) > currentIndex && (state.gameData[currentIndex].gameTypes?.name?.toLowerCase() == GameTypes.dragOut.text().toLowerCase())) {
      return false;
    } else {
      return true;
    }
  }

  updateIndexOfCurrentGame() {
    int currentIndex = state.index??0;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(index: currentIndex));
  }
}
