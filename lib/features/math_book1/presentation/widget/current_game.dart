import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection_container.dart' as di;
import '../../../../core/connection.dart';
import '../../../../core/utils.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../beads/match/manager/beads_matching_cubit.dart';
import '../beads/match/page/matching_screen.dart';
import '../beads/sum/manager/beads_sum_mcq_cubit.dart';
import '../manager/current_game_state.dart';
import '../manager/get_contact/contact_lesson_bloc.dart';
import '../beads/sum/pages/mathematical_transactions_screen.dart';
import '../manager/current_game_cubit.dart';

class CurrentGame extends StatelessWidget {
  final String lessonId;

  const CurrentGame({Key? key, required this.lessonId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final currentIndex = context.watch<CurrentGameCubit>().state.index ?? 0;
    return BlocProvider<ContactLessonBloc>(
        create: (_) => di.sl<ContactLessonBloc>()
          ..add(GetContactLessonRequest(programId: int.parse(lessonId))),
        child: BlocConsumer<ContactLessonBloc, ContactLessonState>(
            listener: (context, state) {
          if (state is CompleteGameState) {
            Utils.navigateAndRemoveUntilTo(
                BlocProvider(
                    create: (_) => WhoAmICubit(), child: const WhoAmIScreen()),
                context);
          }
        }, builder: (context, state) {
          if (state is GetContactInitial) {

            return BlocConsumer<CurrentGameCubit, CurrentGameInitial>(
              listener: (context, stateOfTheGeneral) {},
              builder: (context, stateOfTheGeneral) {
                  log('currentIndex:${stateOfTheGeneral.index}');
                  int index = stateOfTheGeneral.index??1;
                  if(state.data[index].secType == SecType.beads){
                    if(state.data[index].secType ==Type.mCQ) {
                      return BlocProvider(
                          create: (_) =>
                              BeadsSumMcqCubit(
                                  questionData: state.data[index]),
                          child: MathematicalTransactionsScreen(
                            defaultActionOfSuccessAnswer: () =>
                                context
                                    .read<CurrentGameCubit>()
                                    .defaultActionOfSuccessAnswer(),
                            defaultActionOfWrongAnswer: () =>
                                context
                                    .read<CurrentGameCubit>()
                                    .defaultActionOfWrongAnswer(),
                          ));
                    }else {
                     return BlocProvider(
                          create: (_) => BeadsMatchingCubit(
                              questionData: state.data[index]),
                          child: MatchingScreen(
                            defaultActionOfSuccessAnswer: () => context
                                .read<CurrentGameCubit>()
                                .defaultActionOfSuccessAnswer(),
                            defaultActionOfWrongAnswer: () => context
                                .read<CurrentGameCubit>()
                                .defaultActionOfWrongAnswer(),
                          ));
                    }
                  }else{
                    return const SizedBox();
                  }

              });
          } else if (state is GetContactLoadingInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
          }
        }));
  }
}
