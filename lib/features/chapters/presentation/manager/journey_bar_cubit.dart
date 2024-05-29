import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../core/assets_animation.dart';
import 'journey_bar_state.dart';


class JourneyBarCubit extends Cubit<JourneyBarInitial> {
  int unitId;
  JourneyBarCubit({required this.unitId}) : super(JourneyBarInitial(currentUnitId: unitId)){
    getTheBackGround();
  }
  updateTheBar({required int completed, required int countOfLessons, required double width}){
    log('completed:$completed');
    log('countOfLessons:$countOfLessons');
    emit(state.copyWith(totalOfBar: (((width / 2)-4)/countOfLessons)*completed));
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

  changeUnit(List<int> allUnits,{bool next = true}){
    int index = allUnits.indexOf(state.currentUnitId) ;
    int nextId = next? allUnits[index + 1] : allUnits[index - 1];
    unitId = nextId;
    emit(state.copyWith(currentUnitId: nextId ));
  }

}
