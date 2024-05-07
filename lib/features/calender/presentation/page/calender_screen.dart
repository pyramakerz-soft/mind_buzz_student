import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/widgets/switch_bar.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/calender_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: customAppBar( context: context,title: 'Calendar'),
        body: Column(
          children: [
            Container(
              height: 50,
              width: 1.sw,
              color: Colors.white,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: BlocProvider<CalenderBloc>(
                  create: (_) =>
                      di.sl<CalenderBloc>()..add(GetCalenderRequest()),
                  child: BlocConsumer<CalenderBloc, CalenderState>(
                    listener: (context, state) {
                      if (state is GetCalenderErrorInitial) {
                        if (state.message == RELOGIN_FAILURE_MESSAGE) {
                          Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                        } else {
                          final snackBar = SnackBar(
                            content: Text(state.message),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [

                        ],
                      );
                    },
                  ),
                )),
          ],
        ));
  }
}
