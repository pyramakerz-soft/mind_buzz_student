import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/phonetics/basic_of_phonetics.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';

class PhoneticsBook extends StatefulWidget {
  final int lessonId;
  const PhoneticsBook({Key? key, required this.lessonId}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PhoneticsBook();
  }
}

class _PhoneticsBook extends State<PhoneticsBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<ContactLessonBloc>(
            create: (_) => di.sl<ContactLessonBloc>()
              ..add(GetContactLessonRequest(programId: widget.lessonId)),
            child: BlocConsumer<ContactLessonBloc, ContactLessonState>(
                listener: (context, state) {
              if (state is GetContactErrorInitial) {
                if (state.message == RELOGIN_FAILURE_MESSAGE) {
                  Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                } else {
                  final snackBar = SnackBar(
                    content: Text(state.message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else if (state is LogOutLoadingState) {
                Navigator.of(context).pop();
              } else if (state is GetContactInitial) {
                // context.
                // state.getMainContactData(index: index)
              }
            }, builder: (context, stateOfGameData) {
              if (stateOfGameData is GetContactInitial) {
                return BlocProvider<CurrentGamePhoneticsCubit>(
                    create: (_) => di.sl<CurrentGamePhoneticsCubit>(),
                    child: BlocConsumer<CurrentGamePhoneticsCubit,
                        CurrentGamePhoneticsState>(
                      listener: (contextOfGame, stateOfGame) {
                        // stateOfGame.index
                        MainDataOfPhonetics? dataType = stateOfGameData.getMainContactData(index: stateOfGame.index);
                        if(dataType!=null) {
                          context.read<CurrentGamePhoneticsCubit>()
                              .updateDataOfCurrentGame(basicData: dataType);
                        }else{
                          context.read<ContactLessonBloc>().add(ThisTypeNotSupportedRequest());
                        }
                      },
                      builder: (contextOfGame, stateOfGame) {

                        return Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                    // color:
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ));
              } else if (stateOfGameData is GetContactLoadingInitial) {
                return const CupertinoActivityIndicator();
              } else if (stateOfGameData is NotSupportTypeState) {
                return const Text('the data of game is not supported');
              } else {
                return const SizedBox();
              }
            })));
  }
}
