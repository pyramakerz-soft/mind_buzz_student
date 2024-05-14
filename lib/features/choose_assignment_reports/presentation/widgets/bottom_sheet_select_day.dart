import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/app_color.dart';

import '../../../student_assignment/presentation/manager/filter_assignment_cubit/filter_assignment_cubit.dart';

class BottomSheetSelectDay extends StatefulWidget {
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
  State<StatefulWidget> createState() {
    return _BottomSheetSelectDay();
  }
}

class _BottomSheetSelectDay extends State<BottomSheetSelectDay> {
  String? tempDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
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
          focusedDay: widget.checkStartDate??widget.currentDate,
          currentDay: tempDate != null
              ? DateTime.parse(tempDate ?? '')
              : widget.checkStartDate!=null?
                (widget.checkStartDate??DateTime.now()).isAfter(widget.currentDate)
                    ?null
                    :widget.currentDate
                :widget.currentDate,
          headerVisible: true,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onDaySelected: (day, focused) {
            if (widget.isReport == null) {
              if (widget.isFrom == true) {
                context.read<FilterAssignmentCubit>().submitAssignmentFromDate(
                    newStatus: day.toString().split(' ').first);
              } else {
                context.read<FilterAssignmentCubit>().submitAssignmentToDate(
                    newStatus: day.toString().split(' ').first);
              }
              Navigator.pop(context);
            } else {
              setState(() {
                tempDate = day.toString().split(' ').first;
              });
            }
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
        if (widget.isReport != null) ...{
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<FilterAssignmentCubit>().clearReportFilter();
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.darkBlueColor),
                      color: Colors.white),
                  child: Text(
                    'Reset',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              20.pw,
              GestureDetector(
                onTap: () {
                  if (tempDate != null) {
                    if (widget.isReport != null) {
                      widget.isReport!(tempDate);
                    }
                    context
                        .read<FilterAssignmentCubit>()
                        .submitReportDate(newStatus: tempDate ?? '');
                  }
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.darkBlueColor),
                  child: Text(
                    'Done',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          35.ph
        } else ...{
          30.ph
        }
      ],
    );
  }
}
