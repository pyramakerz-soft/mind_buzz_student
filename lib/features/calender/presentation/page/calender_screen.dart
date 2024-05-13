import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';

import '../../../../core/enums/assignment_status.dart';
import '../../../../core/enums/direction.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../student_assignment/presentation/widgets/card_of_assignment.dart';
import '../bloc/calender_bloc.dart';
import '../widgets/assignment_widget.dart';
import '../widgets/empty_ests_widget.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Calender'),
      body: BlocProvider<CalenderBloc>(
        create: (_) => di.sl<CalenderBloc>()..add(GetCalenderRequest()),
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
        }, builder: (context, state) {
          CalenderBloc bloc = context.watch<CalenderBloc>();
          return Column(
            children: [
              if (state is GetCalenderLoadingInitial)
            SizedBox(
                height: 0.8.sh,
                width: 1.sw,
                child: const Center(child:  CupertinoActivityIndicator())),

              // if (state is GetCalenderCompleteInitial)
              //   Padding(
              //     padding:  EdgeInsets.symmetric(horizontal: 3.h),
              //     child: CalendarHeader(
              //       focusedDay: state.currentDate,
              //       onLeftArrowTap: () {
              //         bloc.add(SwapCalenderEvent(direction: Direction.right));
              //       },
              //       onRightArrowTap: () {
              //         bloc.add(SwapCalenderEvent(direction: Direction.left));
              //       },
              //     ),
              //   ),
              if (state is GetCalenderCompleteInitial)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.h),
                  child: TableCalendar(
                    firstDay: DateTime.now().month <= 7
                        ? DateTime(DateTime.now().year - 1, 9, 1)
                        : DateTime(DateTime.now().year, 9, 1),
                    lastDay:
                        DateTime.now().month <= 12 && DateTime.now().month > 8
                            ? DateTime(DateTime.now().year + 1, 8, 31)
                            : DateTime(DateTime.now().year, 8, 31),
                    focusedDay: state.currentDate,
                    currentDay: state.currentDate,
                    headerVisible: true,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    onDaySelected: (day, focused) {
                      bloc.add(SelectDayEvent(day: day.day));
                    },
                    onCalendarCreated: (controller) =>
                        bloc.pageController = controller,
                    onPageChanged: (focusedDay) {
                      bloc.add(SelectMonthEvent(currentTime: focusedDay));
                    },
                    rowHeight: 40.h,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                        if (bloc.tests.map((e) => Utils.parseStringToDate(e.createdAt!)).toList().contains(Utils.formatDate(day))) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                  color: Utils.formatDate(state.currentDate)== Utils.formatDate(day) ? Colors.white : AppColor.darkBlueColor,
                                  shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1
                                )
                              ]
                              ),
                              child: Text(
                                bloc.tests.where((element) =>
                                Utils.parseStringToDate(element.createdAt!) ==
                                    Utils.formatDate(day)    )
                                    .toList()
                                    .length
                                    .toString(),
                                style: TextStyle(color: Utils.formatDate(state.currentDate)== Utils.formatDate(day) ? AppColor.darkBlueColor: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                      outsideBuilder: (context, day, date) => const SizedBox(),
                      dowBuilder: (context, day) {
                        final text = DateFormat.E().format(day);
                        return Center(
                          child: Text(
                            text,
                            style: TextStyle(
                                color: AppColor.calenderDayText.withOpacity(0.3)),
                          ),
                        );
                      },
                      todayBuilder: (context, day, date) {
                        return Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: AppColor.darkBlueColor,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      headerTitleBuilder: (context , day){
                        return Center(
                          child: Text(
                            DateFormat.yMMM().format(day),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      }

                    ),
                  ),
                ),
              10.ph,
              if (state is GetCalenderCompleteInitial)
                state.tests.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tests.length,
                    itemBuilder: (context, index) {
                      return AssignmentWidget(
                        singleTest: state.tests[index],
                      );
                    },
                  ),
                ):
                const EmptyTestsWidget(),
              SizedBox(height: 0.1.sh,)
            ],
          );
        }),
      ),
    );
  }
}
