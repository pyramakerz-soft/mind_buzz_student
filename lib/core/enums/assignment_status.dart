import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

enum AssignmentStatus { completed, pending, overdue }

extension TypeExtension on AssignmentStatus {
  String text() {
    switch (this) {
      case AssignmentStatus.completed:
        return 'Completed';
      case AssignmentStatus.pending:
        return 'Pending';
      case AssignmentStatus.overdue:
        return 'Overdue';
    }
  }

  Color color() {
    switch (this) {
      case AssignmentStatus.completed:
        return AppColor.resetText;
      case AssignmentStatus.pending:
        return AppColor.darkBlueColor;
      case AssignmentStatus.overdue:
        return AppColor.redColor4;
    }
  }
}
