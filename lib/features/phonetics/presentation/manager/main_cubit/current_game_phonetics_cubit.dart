import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../../core/assets_animation.dart';
import '../../../../../core/phonetics/basic_of_phonetics.dart';

part 'current_game_phonetics_state.dart';

class CurrentGamePhoneticsCubit extends Cubit<CurrentGamePhoneticsState> {
  CurrentGamePhoneticsCubit() : super(CurrentGamePhoneticsState(index: 0));

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
          // emit(state.copyWith(avatarArtboard: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
  }
  updateIndexOfCurrentGame(){
    int currentIndex = state.index;
    currentIndex = currentIndex+1;
    emit(state.copyWith(index: currentIndex));
  }

  updateDataOfCurrentGame({required MainDataOfPhonetics basicData}){
    emit(state.copyWith(basicData:basicData));
  }
}
