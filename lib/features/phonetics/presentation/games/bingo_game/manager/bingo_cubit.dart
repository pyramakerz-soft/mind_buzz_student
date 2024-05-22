import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'bingo_state.dart';

class BingoCubit extends Cubit<BingoInitial> {
  final GameModel gameData;

  BingoCubit({required this.gameData}) : super(BingoInitial(gameData: gameData)){
    List<GameLettersModel> supList = gameData.gameLetters??[];
    supList.add(GameLettersModel());
    supList.addAll(List.from(supList));

   emit(state.copyWith(cardsLetters: supList.toList()));
  }
}
