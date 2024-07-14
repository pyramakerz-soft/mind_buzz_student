import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/assignment_bloc.dart';
import '../manager/cubit/total_assignment_cubit.dart';
import '../widgets/current_assignment.dart';

class DisplayAssignment extends StatefulWidget {
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
        return CurrentAssignment(
          data: stateOfGameData.data,
        );
      } else {
        return SizedBox();
      }
      //
    }));
  }
}
