import 'package:flutter/cupertino.dart' hide FontWeight;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/dice_cubit.dart';
import 'dice_widget3.dart';

class DicePopUp extends StatelessWidget {
  const DicePopUp({Key? key, required this.functionOfSaveWords})
      : super(key: key);
  final void Function(String currentAlphabet) functionOfSaveWords;

  @override
  Widget build(BuildContext context) {
    final diceLetters = context.watch<DiceCubit>().state.letterDices;
    int countOfPlayed = context
        .select((DiceCubit value) => value.state.correctIndexes?.length ?? 0);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: DiceWidget3(
          diceLetters: diceLetters ?? [],
          countOfPlayed: countOfPlayed,
          functionOfSaveWords: functionOfSaveWords),
    );
  }
}
