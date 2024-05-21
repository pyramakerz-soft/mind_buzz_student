import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/game_model.dart';

part 'click_the_sound_state.dart';


class ClickTheSoundCubit extends Cubit<ClickTheSoundInitial> {
  final GameModel gameData;
  ClickTheSoundCubit({required this.gameData}) : super(ClickTheSoundInitial(gameData: gameData)) {
   // TalkTts.startTalk(text: gameData.mainLetter ?? '');
  }
}
