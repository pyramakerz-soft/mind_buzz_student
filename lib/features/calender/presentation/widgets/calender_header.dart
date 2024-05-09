
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          15.pw,

          // Spacer(),
          Text(
            headerText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),

          Spacer(),
          IconButton(
            icon: Icon(Icons.chevron_left,size: 30,),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right,size: 30,),
            onPressed: onRightArrowTap,
          ),
          15.pw
        ],
      ),
    );
  }
}