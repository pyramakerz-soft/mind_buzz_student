// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:games_models/games_models.dart';

import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/course.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/percentages.dart';

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
  final Percentages? counts;
  final Percentages? percentages;
  final String? sectionName;
  final List<Course> courses;
  final List<TestModel> tests;
  final Course? selectedProgram;

  final String? message;
  PieChartState({
    this.status = PieChartStateStatus.initial,
    this.counts,
    this.percentages,
    this.sectionName,
    this.courses = const [],
    this.tests = const [],
    this.selectedProgram,
    this.message,
  });

  PieChartState copyWith({
    PieChartStateStatus? status,
    Percentages? counts,
    Percentages? percentages,
    ValueGetter<String?>? sectionName,
    List<Course>? courses,
    List<TestModel>? tests,
    Course? selectedProgram,
    String? message,
  }) {
    return PieChartState(
      status: status ?? this.status,
      counts: counts ?? this.counts,
      percentages: percentages ?? this.percentages,
      sectionName: sectionName != null ? sectionName() : this.sectionName,
      courses: courses ?? this.courses,
      tests: tests ?? this.tests,
      selectedProgram: selectedProgram ?? this.selectedProgram,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(covariant PieChartState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.counts == counts &&
        other.percentages == percentages &&
        other.sectionName == sectionName &&
        listEquals(other.courses, courses) &&
        listEquals(other.tests, tests) &&
        other.selectedProgram == selectedProgram &&
        other.message == message;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        counts.hashCode ^
        percentages.hashCode ^
        sectionName.hashCode ^
        courses.hashCode ^
        tests.hashCode ^
        selectedProgram.hashCode ^
        message.hashCode;
  }

  @override
  String toString() {
    return 'PieChartState(status: $status, counts: $counts, percentages: $percentages, sectionName: $sectionName, courses: $courses, tests: $tests, selectedProgram: $selectedProgram, message: $message)';
  }
}
