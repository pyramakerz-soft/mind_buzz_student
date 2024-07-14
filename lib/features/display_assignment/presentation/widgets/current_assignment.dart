import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cubit/total_assignment_cubit.dart';

class CurrentAssignment extends StatelessWidget {
  final List<GameFinalModel> data;

  const CurrentAssignment({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TotalAssignmentCubit(assignmentData: data),
        child: BlocConsumer<TotalAssignmentCubit, TotalAssignmentInitial>(
            listener: (context, state) {},
            builder: (context, stateOfGameData) {
              return MainScreenOfGames(
                  stateOfGameData: stateOfGameData.assignmentData ?? [],
                  dataOfBasesGame: context
                      .read<TotalAssignmentCubit>()
                      .getMainContactData(index: 0),
                  actionOfCompleteGame: (int countOfStars) {
                    // List<int> listOfIds = stateOfGameData.data;
                    // List<int> listOfIds =
                    //     stateOfGameData.data?.map((game) => game.id ?? 0).toList() ??
                    //         [];
                    // debugPrint('#########################################');
                    // debugPrint('the stars send: $listOfIds , $countOfStars');
                    context.read<TotalAssignmentCubit>().reFormatData();
                    debugPrint('#########################################');
                  },
                  showTheEditedGames: false,
                  backButton: () {
                    debugPrint(
                        'backButton#########################################');

                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
            }));
  }
}
