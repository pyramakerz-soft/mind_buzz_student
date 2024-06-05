import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../widget/letter_m.dart';
import '../widget/letter_s.dart';

part 'tracing_state.dart';

class TracingCubit extends Cubit<TracingInitial> {
  final GameModel _gameData;
  final CurrentGamePhoneticsState _stateOfGame;
  TracingCubit(
      {required GameModel gameData,
      required CurrentGamePhoneticsState stateOfGame})
      : _stateOfGame = stateOfGame,
        _gameData = gameData,
        super(TracingInitial(colorsOfPaths: [])) {
    List<Color?> bgOfPaths = List.generate(
        _stateOfGame.basicData?.countOfPartsOfLettersForTracing ?? 0,
        (index) => null);
    emit(state.clearData());

    TalkTts.startTalk(text: _gameData.inst ?? '');
    emit(state.copyWith(
        gameData: _gameData,
        colorsOfPaths: bgOfPaths,
        stateOfGame: _stateOfGame));
  }

  checkTheLocationOfPoint({required Offset point, required Size size}) async {
    if(state.stateOfGame?.basicData?.checkTheIndexOfPath != null) {
      int? indexOfPoint = state.stateOfGame?.basicData?.checkTheIndexOfPath!(point, size) ?? 0;
      print('indexOfPoint:$indexOfPoint');
      print('##:${state.colorsOfPaths
          .where((element) => element == null)
          .isNotEmpty}');
      print('before:${state.colorsOfPaths}');

      if (indexOfPoint == 1 &&
          state.colorsOfPaths
              .where((element) => element == null)
              .isNotEmpty) {
        indexOfPoint = indexOfPoint - 1;
        List<Color?> tempColors = state.colorsOfPaths;
        tempColors[indexOfPoint] = AppColor.lightBlueColor4;
        emit(state.copyWith(
            colorsOfPaths: tempColors));
      } else if (state.colorsOfPaths[indexOfPoint - 2] != null) {
        indexOfPoint = indexOfPoint - 1;
        List<Color?> tempColors = state.colorsOfPaths;
        tempColors[indexOfPoint] = AppColor.lightBlueColor4;
        emit(state.copyWith(
            colorsOfPaths: tempColors));
      }
      print('after:${state.colorsOfPaths}');
        }
  }

  saveCurrentPosition({required Offset? position}) {
    if (position != null) {
      emit(state.copyWith(currentPosition: position));
    } else {
      emit(state.clearPosition());
    }
  }
}
