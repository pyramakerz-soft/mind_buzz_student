import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/app_color.dart';
import '../../../calender/presentation/widgets/calender_header.dart';
import '../manager/bottom_cubit/bottom_cubit.dart';

class BottomSheetSelectDay extends StatelessWidget {
  final bool isFrom;
  late PageController pageController;

   BottomSheetSelectDay({Key? key, required this.isFrom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.now().month <= 7
              ? DateTime(DateTime.now().year - 1, 9, 1)
              : DateTime(DateTime.now().year, 9, 1),
          lastDay: DateTime.now().month <= 12 && DateTime.now().month > 8
              ? DateTime(DateTime.now().year + 1, 8, 31)
              : DateTime(DateTime.now().year + 1, 8, 31),
          focusedDay: DateTime.now(),
          currentDay: DateTime.now(),
          headerVisible: true,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onDaySelected: (day, focused) {
            print('selected:${day.toString().split(' ').first}');
            if(isFrom==true) {
              context.read<BottomCubit>().submitAssignmentFromDate(
                  newStatus: day
                      .toString()
                      .split(' ')
                      .first);
            }else {
              context.read<BottomCubit>().submitAssignmentToDate(newStatus: day
                  .toString()
                  .split(' ')
                  .first);
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
