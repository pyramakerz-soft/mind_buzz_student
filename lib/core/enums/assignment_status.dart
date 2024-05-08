import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

enum AssignmentStatus{finished, notStarted , overdue, dueSoon}

extension TypeExtension on AssignmentStatus {
  String text() {
    switch (this) {
      case AssignmentStatus.finished:
        return 'Finished';
      case AssignmentStatus.notStarted:
        return 'Not Started';
      case AssignmentStatus.overdue:
        return 'Overdue';
      case AssignmentStatus.dueSoon:
        return 'Due Soon';
    }
  }

  Color color() {
    switch (this) {
      case AssignmentStatus.finished:
        return AppColor.resetText;
      case AssignmentStatus.notStarted:
        return AppColor.lightGreyColor3;
      case AssignmentStatus.overdue:
        return Colors.black;
      case AssignmentStatus.dueSoon:
        return AppColor.redColor4;
    }
  }
}