import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';

part 'click_picture_state.dart';

class ClickPictureCubit extends Cubit<ClickPictureInitial> {
  final GameModel gameData;
  final List<String> background;
   List<int> correctIndexes = [];
  ClickPictureCubit({required this.gameData, required this.background})
      : super(ClickPictureInitial(gameData: gameData, backGround: background, correctIndexes: [])) {
    TalkTts.startTalk(text: gameData.mainLetter ?? '');
  }


  addAnswer(int index){
    emit(state);
    correctIndexes.add(index);
    emit(state.copyWith(correctIndexes: correctIndexes.toSet().toList()));
    print(correctIndexes);

  }

}
