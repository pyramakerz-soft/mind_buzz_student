import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/widgets/switch_bar.dart';
import '../../../login/presentation/page/login_screen.dart';
// import '../notification_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../manager/bloc/notification_bloc.dart';
import '../manager/cubit/switch_notification_cubit.dart';
import '../widget/switch_title.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context, title: 'Notifications'),
        body: Column(
          children: [
            Container(
              height: 20,
              width: 1.sw,
              color: Colors.white,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: BlocProvider<NotificationsBloc>(
                  create: (_) => di.sl<NotificationsBloc>()
                    ..add(GetNotificationsRequest()),
                  child: BlocConsumer<NotificationsBloc, NotificationsState>(
                    listener: (context, state) {
                      if (state is GetNotificationsErrorInitial) {
                        if (state.message == RELOGIN_FAILURE_MESSAGE) {
                          Utils.navigateAndRemoveUntilTo(
                              LoginScreen(), context);
                        } else {
                          final snackBar = SnackBar(
                            content: Text(state.message),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    builder: (context, state) {
                      return  BlocProvider<SwitchNotificationCubit>(
                          create: (_) => SwitchNotificationCubit(),
                          child:BlocConsumer<SwitchNotificationCubit, int>(
                        listener: (context, state) {},
                        builder: (BuildContext context, int state) {
                          return Column(
                            children: [
                              Row(children: [
                                SwitchTitle(
                                  title: 'All',
                                  index: 0,
                                  currentIndex: state,
                                  onTap: () {
                                    context
                                        .read<SwitchNotificationCubit>()
                                        .updateSwitch(index: 0);
                                  },
                                ),
                                10.pw,
                                SwitchTitle(
                                  title: 'Unread',
                                  index: 1,
                                  currentIndex: state,
                                  onTap: () {
                                    context
                                        .read<SwitchNotificationCubit>()
                                        .updateSwitch(index: 1);
                                  },
                                ),
                              ]),
                              20.ph,
                              Container(
                                width: 381,
                                height: 96,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFE6EDF2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x14000000),
                                      blurRadius: 8,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child:
                                     Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Check your child’s progress',
                                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,

                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                'See the last report of the assignment taken on 1 August 2024.',
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,

                                                ),


                                              ),
                                            ),
                                          ],
                                        ),


                              )
                            ],
                          );
                        },
                      ));
                    },
                  ),
                )),
          ],
        ));
  }
}
