import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';

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

import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/calender_bloc.dart';
import '../widgets/calender_header.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  // late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
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
    // _focusedDay.dispose();
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

      // _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
    //
    // _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      // _focusedDay.value = focusedDay;
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
              if (state is GetCalenderCompleteInitial)
                CalendarHeader(
                  focusedDay: state.currentDate,
                  onLeftArrowTap: () {
                    bloc.add(SwapCalenderEvent(direction: Direction.right));
                  },
                  onRightArrowTap: () {
                    bloc.add(SwapCalenderEvent(direction: Direction.left));
                  },
                ),
              if (state is GetCalenderCompleteInitial)
                TableCalendar(
                  firstDay: DateTime.now().month <= 7
                      ? DateTime(DateTime.now().year - 1, 9, 1)
                      : DateTime(DateTime.now().year, 9, 1),
                  lastDay:
                      DateTime.now().month <= 12 && DateTime.now().month > 8
                          ? DateTime(DateTime.now().year + 1, 8, 31)
                          : DateTime(DateTime.now().year + 1, 8, 31),
                  focusedDay: state.currentDate,
                  currentDay: state.currentDate,
                  headerVisible: false,
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
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      if (state.testsData.tests
                              ?.map((e) => Utils.parseStringToDate(e.createdAt!))
                              .toList()
                              .contains(Utils.formatDate(day)) ??
                          false) {
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
                              state.testsData.tests!
                                  .where((element) =>
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
                  ),
                ),
              const SizedBox(height: 8.0),
              if (state is GetCalenderCompleteInitial)
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10.h),
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(color: Colors.black, width: 5),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Math'),
                            Row(
                              children: [
                                Text('Name of chapter'),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: Colors.red.withOpacity(0.2),
                                  ),
                                  child: Text('Finished'),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Lesson 1,2,3'),
                                SvgPicture.asset(ParentImages.dueIcon),
                                Text('Deadline'),
                                Text('13/5'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
