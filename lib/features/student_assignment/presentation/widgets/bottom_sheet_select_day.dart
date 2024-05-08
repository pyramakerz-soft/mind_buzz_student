import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/app_color.dart';

class BottomSheetSelectDay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.now().month <= 7
          ? DateTime(DateTime.now().year - 1, 9, 1)
          : DateTime(DateTime.now().year, 9, 1),
      lastDay:
      DateTime.now().month <= 12 && DateTime.now().month > 8
          ? DateTime(DateTime.now().year + 1, 8, 31)
          : DateTime(DateTime.now().year + 1, 8, 31),
      focusedDay: DateTime.now(),
      currentDay: DateTime.now(),
      headerVisible: false,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onDaySelected: (day, focused) {
        // bloc.add(SelectDayEvent(day: day.day));
      },
      // onCalendarCreated: (controller) =>
      // bloc.pageController = controller,
      // onPageChanged: (focusedDay) {
      //   bloc.add(SelectMonthEvent(currentTime: focusedDay));
      // },
      rowHeight: 40.h,
      calendarBuilders: CalendarBuilders(
        // markerBuilder: (context, day, events) {
        //   if (state.testsData.tests
        //       ?.map((e) => Utils.parseStringToDate(e.createdAt!))
        //       .toList()
        //       .contains(Utils.formatDate(day)) ??
        //       false) {
        //     return Align(
        //       alignment: Alignment.topRight,
        //       child: Container(
        //         padding: EdgeInsets.all(5.h),
        //         decoration: BoxDecoration(
        //             color: Utils.formatDate(state.currentDate)== Utils.formatDate(day) ? Colors.white : AppColor.darkBlueColor,
        //             shape: BoxShape.circle,
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.black12,
        //                   blurRadius: 1,
        //                   spreadRadius: 1
        //               )
        //             ]
        //         ),
        //         child: Text(
        //           state.testsData.tests!
        //               .where((element) =>
        //           Utils.parseStringToDate(element.createdAt!) ==
        //               Utils.formatDate(day)    )
        //               .toList()
        //               .length
        //               .toString(),
        //           style: TextStyle(color: Utils.formatDate(state.currentDate)== Utils.formatDate(day) ? AppColor.darkBlueColor: Colors.white),
        //         ),
        //       ),
        //     );
        //   }
        // },
        outsideBuilder: (context, day, date) => const SizedBox(),
        // dowBuilder: (context, day) {
        //   // final text = DateFormat.E().format(day);
        //   // return Center(
        //   //   child: Text(
        //   //     text,
        //   //     style: TextStyle(
        //   //         color: AppColor.calenderDayText.withOpacity(0.3)),
        //   //   ),
        //   // );
        // },
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
      ),
    );
  }

}