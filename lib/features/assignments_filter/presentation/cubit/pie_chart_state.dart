// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/assignments_percentages.dart';

import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/course.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/reports_percentages.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/test_model.dart';

enum PieChartStateStatus { initial, loading, changing, loaded, error }

extension PieChartStateX on PieChartState {
  bool get isInitial => status == PieChartStateStatus.initial;
  bool get isChanging => status == PieChartStateStatus.changing;
  bool get isLoading => status == PieChartStateStatus.loading;
  bool get isLoaded => status == PieChartStateStatus.loaded;
  bool get isError => status == PieChartStateStatus.error;
}

class PieChartState {
  final PieChartStateStatus status;
  final AssignmentsPercentages? assignmentsPercentages;
  final ReportsPercentages? reportsPercentages;
  final String? sectionName;
  final String? startDate;
  final String? endDate;
  final int? numberOfStars;
  final List<Course> courses;
  final List<TestModel> tests;
  final List<TestModel> progress;
  final int? selectedProgramId;
  final Course? selectedProgram;

  final String? message;
  PieChartState({
    this.status = PieChartStateStatus.initial,
    this.assignmentsPercentages,
    this.reportsPercentages,
    this.sectionName,
    this.numberOfStars,
    this.startDate,
    this.endDate,
    this.courses = const [],
    this.tests = const [],
    this.selectedProgramId,
    this.message,
    this.selectedProgram,
    this.progress = const [],
  });

  PieChartState copyWith({
    PieChartStateStatus? status,
    AssignmentsPercentages? assignmentsPercentages,
    ReportsPercentages? reportsPercentages,
    ValueGetter<String?>? startDate,
    ValueGetter<String?>? endDate,
    ValueGetter<String?>? sectionName,
    ValueGetter<int?>? numberOfStars,
    List<Course>? courses,
    List<TestModel>? tests,
    List<TestModel>? progress,
    int? selectedProgramId,
    Course? selectedProgram,
    String? message,
  }) {
    return PieChartState(
      status: status ?? this.status,
      assignmentsPercentages:
          assignmentsPercentages ?? this.assignmentsPercentages,
      reportsPercentages: reportsPercentages ?? this.reportsPercentages,
      sectionName: sectionName != null ? sectionName() : this.sectionName,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
      numberOfStars:
          numberOfStars != null ? numberOfStars() : this.numberOfStars,
      courses: courses ?? this.courses,
      tests: tests ?? this.tests,
      progress: progress ?? this.progress,
      selectedProgramId: selectedProgramId ?? this.selectedProgramId,
      selectedProgram: selectedProgram ?? this.selectedProgram,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(covariant PieChartState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.assignmentsPercentages == assignmentsPercentages &&
        other.sectionName == sectionName &&
        other.numberOfStars == numberOfStars &&
        listEquals(other.courses, courses) &&
        listEquals(other.tests, tests) &&
        other.selectedProgramId == selectedProgramId &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.reportsPercentages == reportsPercentages &&
        other.progress == progress &&
        other.selectedProgram == selectedProgram &&
        other.message == message;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        assignmentsPercentages.hashCode ^
        reportsPercentages.hashCode ^
        sectionName.hashCode ^
        numberOfStars.hashCode ^
        courses.hashCode ^
        tests.hashCode ^
        endDate.hashCode ^
        startDate.hashCode ^
        selectedProgramId.hashCode ^
        selectedProgram.hashCode ^
        progress.hashCode ^
        message.hashCode;
  }

  @override
  String toString() {
    return 'PieChartState(status: $status, numberOfStars : $numberOfStars , startDate : $startDate, endDate : $endDate , reportsPercentages: $reportsPercentages , percentages: $assignmentsPercentages, progress: $progress ,sectionName: $sectionName, courses: $courses, tests: $tests, selectedProgramId: $selectedProgramId, selectedProgram: $selectedProgram, message: $message)';
  }
}
