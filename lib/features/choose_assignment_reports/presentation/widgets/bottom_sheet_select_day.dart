import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/app_color.dart';

class BottomSheetSelectDay extends StatefulWidget {
  final void Function(String? date)? isReport;
  final DateTime currentDate;
  final DateTime? checkStartDate;
  final DateTime? checkEndDate;
  late PageController pageController;

  BottomSheetSelectDay(
      {Key? key,
      this.isReport,
      this.checkEndDate,
      required this.currentDate,
      this.checkStartDate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomSheetSelectDay();
  }
}

class _BottomSheetSelectDay extends State<BottomSheetSelectDay> {
  String? tempDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: widget.checkStartDate ??
              (DateTime.now().month <= 7
                  ? DateTime(DateTime.now().year - 1, 9, 1)
                  : DateTime(DateTime.now().year, 9, 1)),
          lastDay: widget.checkEndDate ??
              (widget.currentDate.month <= 12 && widget.currentDate.month > 8
                  ? DateTime(DateTime.now().year + 1, 8, 31)
                  : DateTime(DateTime.now().year + 1, 8, 31)),
          focusedDay: widget.checkStartDate ??
              widget.checkEndDate ??
              widget.currentDate,
          currentDay: widget.currentDate,
          headerVisible: true,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onDaySelected: (day, focused) {
            if (widget.isReport != null) {
              widget.isReport!(day.toString().split(' ').first);
            }
            Navigator.pop(context, day.toString().substring(0, 10));
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold) ??
                const TextStyle(),
          ),
          onCalendarCreated: (controller) => widget.pageController = controller,
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
      ],
    );
  }
}
