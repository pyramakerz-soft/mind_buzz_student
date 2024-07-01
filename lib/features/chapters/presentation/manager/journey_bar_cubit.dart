import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_buzz_refactor/features/unit/domain/entities/unit_model.dart';

import '../../../../core/assets_animation.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/use_cases/game_stars_use_cases.dart';
import 'journey_bar_state.dart';

class JourneyBarCubit extends Cubit<JourneyBarState> with ChangeNotifier {
  final GameStarsUseCases _gamesStarsUseCases;

  JourneyBarCubit({
    required GameStarsUseCases gamesStarsUseCases,
    required List<UnitModel> units,
    required int unitId,
    required int currentUnitIndex,
  })  : _gamesStarsUseCases = gamesStarsUseCases,
        super(JourneyBarState(
            currentUnitId: unitId,
            currentUnitIndex: currentUnitIndex,
            units: units)) {
    getTheBackGround();
  }
  updateTheBar(
      {required int completed,
      required int countOfLessons,
      required double width}) {
    log('completed:$completed');
    log('countOfLessons:$countOfLessons');
    emit(state.copyWith(
        totalOfBar: (((width / 2) - 4) / countOfLessons) * completed));
  }

  getTheBackGround() {
    rootBundle.load(AppAnimation.beeRive).then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(beeWinningArtboard: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
    // });
  }

  int nextUnit() {
    final index = state.currentUnitIndex + 1;
    final nextUnitId = state.units[index].id;
    emit(state.copyWith(currentUnitId: nextUnitId, currentUnitIndex: index));
    return nextUnitId!;
  }

  int backUnit() {
    final index = state.currentUnitIndex - 1;
    final backUnitId = state.units[index].id;
    emit(state.copyWith(currentUnitId: backUnitId, currentUnitIndex: index));
    return backUnitId!;
  }

  updateTheDataOfLesson({required List<ChapterModel> newData}) {
    emit(state.copyWith(dataOfLessons: newData));
  }

  sendStars({required List<int> gamesId, required int countOfStar}) {
    _gamesStarsUseCases(gameId: gamesId, countOfStars: countOfStar);

    List<ChapterModel> tempGamesModels = state.dataOfLessons ?? [];
    try {
      gamesId.forEach((gameIdData) {
        int index2 = tempGamesModels.indexWhere((obj) => obj.id == gameIdData);
        ChapterModel data = tempGamesModels[index2];
        data.star = (countOfStar ?? 0);
        tempGamesModels.removeAt(index2);
        tempGamesModels.insert(index2, data);
      });
    } catch (e) {}
    emit(state.copyWith(dataOfLessons: tempGamesModels));
  }
}
