import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
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
        super(TracingInitial(offsets: [], finalOffset: [], colorsOfPaths: [])) {
    List<Color> bgOfPaths = List.generate(_stateOfGame.basicData?.countOfPartsOfLettersForTracing??0, (index) => AppColor.lightBlueColor2);
    print("bgOfPaths:${bgOfPaths.length}");
    emit(state.clearData());

    TalkTts.startTalk(text: _gameData.inst ?? '');
    emit(state.copyWith(gameData: _gameData,colorsOfPaths: bgOfPaths));
  }

  checkTheLocationOfPoint({required Offset point,required Size size}) {
    int? indexOfPoint = FlipBookPainterLetterS.indexOfPointInside(point, Size(400, 200));
    print('indexOfPoint:$indexOfPoint');
  }
}
