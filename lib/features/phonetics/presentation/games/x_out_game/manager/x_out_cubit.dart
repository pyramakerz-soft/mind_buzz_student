import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mind_buzz_refactor/features/phonetics/domain/entities/game_model.dart';

part 'x_out_state.dart';

class XOutCubit extends Cubit<XOutInitial> {
  final GameModel gameData;

  XOutCubit({required this.gameData}) : super(XOutInitial(gameData: gameData));

  Future<int> increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswers ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswers: sub));
    return Future.value(state.correctAnswers);
  }

  Future<void> selectItem(int index) async {
    final selectedItems = state.selectedItems ?? [];

    if (!selectedItems.contains(index)) {
      final updatedSelectedItems = List<int>.from(selectedItems)..add(index);

      emit(state.copyWith(
        selectedItems: updatedSelectedItems,
      ));
      Future.delayed(Duration(seconds: 1), () {
        resetSelectedItems();
      });
    }
  }

  void resetSelectedItems() {
    emit(state.copyWith(selectedItems: []));
  }
}
