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

  TracingCubit({required this.gameData})
      : super(TracingInitial(offsets: [], finalOffset: [])) {
    emit(state.clearData());

    TalkTts.startTalk(text: gameData.inst ?? '');
    emit(state.copyWith(gameData: gameData));
  }

  double calculateDistance(Offset point1, Offset point2) {
    num deltaX = point2.dx - point1.dx;
    num deltaY = point2.dy - point1.dy;
    double distance = sqrt(deltaX * deltaX + deltaY * deltaY);
    return distance;
  }

  saveFinalOffset({required List<Offset> finalOffset}) {
    emit(state.copyWith(finalOffset: finalOffset));
  }

  checkAndAddPoints(
      {required RenderBox renderBox,
      required Offset localPosition,
      required Offset details}) {
    List<Offset> tempOffset = state.offsets;
    if (state.offsets.isEmpty &&
        RPSCustomPainterLetterS()
            .isPointInside(localPosition, renderBox.size)) {
      if (calculateDistance(details, state.finalOffset.last) <= 150) {
        tempOffset.add(details);
        emit(state.copyWith(offsets: tempOffset));
      }
    } else if (RPSCustomPainterLetterS()
            .isPointInside(localPosition, renderBox.size) &&
        calculateDistance(details, state.offsets.last) <= 40) {
      tempOffset.add(details);
      emit(state.copyWith(offsets: tempOffset));
    }
  }
  saveCounter({required int count1, required int count2, required int count3}) {
    emit(state.copyWith(count1: count1,count2:count2, count3:count3));
  }

}
