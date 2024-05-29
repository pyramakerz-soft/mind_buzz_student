import 'dart:developer';
import 'dart:math' hide log;
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';
import '../widget/letter_s.dart';

part 'tracing_state.dart';

class TracingCubit extends Cubit<TracingInitial> {
  final GameModel gameData;

  TracingCubit({required this.gameData}) : super(TracingInitial(offsets: [])) {
    TalkTts.startTalk(text: gameData.inst ?? '');
    emit(state.copyWith(gameData: gameData));
  }

  double calculateDistance(Offset point1, Offset point2) {
    num deltaX = point2.dx - point1.dx;
    num deltaY = point2.dy - point1.dy;
    double distance = sqrt(deltaX * deltaX + deltaY * deltaY);
    return distance;
  }


  checkAndAddPoints(
      {required RenderBox renderBox,
        required Offset localPosition,
        required Offset details}) {
    // try {
    //   log('e:${RPSCustomPainterLetterS()
    //       .isPointInside(localPosition, renderBox.size)}');
    //   log('${calculateDistance(details, state.offsets.last)}:${calculateDistance(details, state.offsets.last) <= 40}');
    //
    // }catch(e){
    //   print("***");
    // }
    log('##:${state.offsets.length}');
    List<Offset> tempOffset = state.offsets;
    bool x = RPSCustomPainterLetterS()
        .isPointInside(localPosition, renderBox.size);
    log('====:$x');
    // if (state.offsets.isEmpty &&
    //     RPSCustomPainterLetterS()
    //         .isPointInside(localPosition, renderBox.size)) {
    //     tempOffset.add(details);
    //
    //   emit(state.copyWith(offsets: tempOffset));
    //   emit(state.copyWith(offsets: RPSCustomPainterLetterS().getPointsWithSameDx(localPosition, renderBox.size)));
    //
    // } else if (RPSCustomPainterLetterS()
    //     .isPointInside(localPosition, renderBox.size) &&
    //     calculateDistance(details, state.offsets.last) <= 40) {
      tempOffset.add(details);
      emit(state.copyWith(offsets: tempOffset));
      emit(state.copyWith(offsets: RPSCustomPainterLetterS().getPointsWithSameDx(localPosition, renderBox.size)));

    // }
    log('---:${state.offsets.length}');
  }
}
