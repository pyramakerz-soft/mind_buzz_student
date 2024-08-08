import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../phonetics/presentation/manager/bloc/contact_lesson_bloc.dart';
import '../manager/bloc/assignment_bloc.dart';
import '../manager/cubit/total_assignment_cubit.dart';
import '../../../../core/injection/injection_container.dart' as di;

class DisplayAssignment extends StatefulWidget {
  final int testId;
  final int assignmentId;
  final Function() action;

  const DisplayAssignment(
      {super.key,
      required this.testId,
      required this.action,
      required this.assignmentId});
  @override
  State<StatefulWidget> createState() {
    return _DisplayAssignment();
  }
}

class _DisplayAssignment extends State<DisplayAssignment> {
  @override
  void initState() {
    super.initState();
    // context.read<CurrentGameCubit>().getTheBackGround();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AssignmentBloc, AssignmentState>(
            listener: (context, state) {
      if (state is AssignmentErrorInitial) {
        if (state.message == RELOGIN_FAILURE_MESSAGE) {
          Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
        } else {
          final snackBar = SnackBar(
            content: Text(state.message ?? ''),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }, builder: (context, stateOfGameData) {
      if (stateOfGameData is AssignmentLoadingInitial) {
        return Center(child: CupertinoActivityIndicator());
      } else if (stateOfGameData is AssignmentDataInitial) {
        return BlocProvider(
            create: (_) =>
                TotalAssignmentCubit(assignmentData: stateOfGameData.data),
            child: BlocConsumer<TotalAssignmentCubit, TotalAssignmentInitial>(
                listener: (context, state) {},
                builder: (childContext, stateOfGameData) {
                  return MainScreenOfGames(
                      stateOfGameData: stateOfGameData.assignmentData ?? [],
                      dataOfBasesGame: context
                          .read<AssignmentBloc>()
                          .getMainContactData(
                              index: stateOfGameData.index,
                              data: (stateOfGameData.assignmentData ?? [])),
                      actionOfCompleteGame: (int countOfStars) {
                        int tries =
                            stateOfGameData.assignmentData.first.numOfTrials ??
                                0;
                        int mistakeCount = 0;
                        if (tries == 3) {
                          mistakeCount = tries - countOfStars;
                        } else if (tries == 5) {
                          if (countOfStars == 1) {
                            mistakeCount = 4;
                          } else if (countOfStars == 2) {
                            mistakeCount = 2;
                          } else if (countOfStars == 3) {
                            mistakeCount = 0;
                          }
                        }
                        di.sl<AssignmentBloc>().add(PostAssignmentDataEvent(
                              stars: countOfStars,
                              assignmentId: widget.assignmentId,
                              mistakeCount: mistakeCount,
                              testId: widget.testId,
                            ));
                        if (countOfStars != 0) {
                          widget.action();
                        }
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
      } else {
        return SizedBox();
      }
      //
    }));
  }
}
