import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

part 'click_picture_state.dart';

class ClickPictureCubit extends Cubit<ClickPictureInitial> {
  final GameModel gameData;
  final List<String> background;
  List<int> correctIndexes = [];
  ClickPictureCubit({required this.gameData, required this.background})
      : super(ClickPictureInitial(
            gameData: gameData, backGround: background, correctIndexes: [])) {
    TalkTts.startTalk(text: gameData.mainLetter ?? '');
  }

  bool addAnswer(int index) {

      if (gameData.gameImages?[index].correct == 1) {
        emit(state);
        correctIndexes.add(index);
        emit(state.copyWith(correctIndexes: correctIndexes.toSet().toList()));
        return true;
      } else {
        return false;
      }

  }



}
