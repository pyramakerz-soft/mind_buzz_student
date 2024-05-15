import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';

part 'drag_out_state.dart';

class DragOutCubit extends Cubit<DragOutInitial> {
  final GameModel gameData;
  DragOutCubit({required this.gameData})
      : super(DragOutInitial(gameData: gameData)) {
    TalkTts.startTalk(text: gameData.mainLetter ?? '');
  }
}
