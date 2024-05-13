import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/app_color.dart';

import '../../../../core/error/failures_messages.dart';
import '../../../student_assignment/presentation/manager/filter_assignment_cubit/filter_assignment_cubit.dart';

class BottomSheetSelectDay extends StatelessWidget {
  final bool isFrom;
  final void Function(String? date)? isReport;
  final DateTime currentDate;
  final DateTime? checkStartDate;
  final DateTime? checkEndDate;
  late PageController pageController;

  BottomSheetSelectDay(
      {Key? key,
      required this.isFrom,
      this.isReport,
      this.checkEndDate,
      required this.currentDate,
      this.checkStartDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: checkStartDate ??
              (DateTime.now().month <= 7
                  ? DateTime(DateTime.now().year - 1, 9, 1)
                  : DateTime(DateTime.now().year, 9, 1)),
          lastDay: checkEndDate ??
              (currentDate.month <= 12 && currentDate.month > 8
                  ? DateTime(DateTime.now().year + 1, 8, 31)
                  : DateTime(DateTime.now().year + 1, 8, 31)),
          focusedDay: currentDate,
          currentDay: currentDate,
          headerVisible: true,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onDaySelected: (day, focused) {
            if (isReport == null) {
              if (isFrom == true) {
                context.read<FilterAssignmentCubit>().submitAssignmentFromDate(
                    newStatus: day.toString().split(' ').first);
              } else {
                context.read<FilterAssignmentCubit>().submitAssignmentToDate(
                    newStatus: day.toString().split(' ').first);
              }
            } else {
              if (isReport != null) {
                isReport!(day.toString().split(' ').first);
              }
              context.read<FilterAssignmentCubit>().submitAssignmentDate(
                  newStatus: day.toString().split(' ').first);
            }
            Navigator.pop(context);
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold) ??
                const TextStyle(),
          ),
          onCalendarCreated: (controller) => pageController = controller,
          rowHeight: 40.h,
          calendarBuilders: CalendarBuilders(
            outsideBuilder: (context, day, date) => const SizedBox(),
            todayBuilder: (context, day, date) {
              return Container(
                height: 40.h,
                decoration: const BoxDecoration(
                    color: AppColor.darkBlueColor, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        15.ph
      ],
    );
  }
}
