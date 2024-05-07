// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/calender_header.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  // late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  // final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  //   equals: isSameDay,
  //
  // );

  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    // _selectedDays.add(_focusedDay.value);
    // _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    // _selectedEvents.dispose();
    super.dispose();
  }

  // bool get canClearSelection =>
  //     _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  // List<Event> _getEventsForDay(DateTime day) {
  //   return kEvents[day] ?? [];
  // }
  //
  // List<Event> _getEventsForDays(Iterable<DateTime> days) {
  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }

  // List<Event> _getEventsForRange(DateTime start, DateTime end) {
  //   final days = daysInRange(start, end);
  //   return _getEventsForDays(days);
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      // if (_selectedDays.contains(selectedDay)) {
      //   _selectedDays.remove(selectedDay);
      // } else {
      //   _selectedDays.add(selectedDay);
      // }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
    //
    // _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      // _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // if (start != null && end != null) {
    //   _selectedEvents.value = _getEventsForRange(start, end);
    // } else if (start != null) {
    //   _selectedEvents.value = _getEventsForDay(start);
    // } else if (end != null) {
    //   _selectedEvents.value = _getEventsForDay(end);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Calender'),
      body: Column(
        children: [
          CalendarHeader(
            focusedDay: DateTime.now(),
            onLeftArrowTap: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            onRightArrowTap: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
          TableCalendar(
            firstDay: DateTime(DateTime.now().year, 1, 1),
            lastDay: DateTime(DateTime.now().year, 12, 31),
            focusedDay: _focusedDay.value,
            headerVisible: false,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            rowHeight: 50.h,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (day.day == 5 || day.day == 20) {
                  final text = DateFormat.E().format(day);
                  return Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                          color: AppColor.blueColor1, shape: BoxShape.circle),
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              outsideBuilder: (context, day, date) => const SizedBox(),
              dowBuilder: (context, day){
                final text = DateFormat.E().format(day);
                return Center(
                   child: Text(
                    text,
                    style: TextStyle(color: AppColor.calenderDayText.withOpacity(0.3)),
                  ),
                );
              },

            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    onTap: () => print('${index}'),
                    title: Text('${index}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
