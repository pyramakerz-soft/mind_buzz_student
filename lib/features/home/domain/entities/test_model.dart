import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/app_color.dart';
import '../../../../core/vars.dart';
part 'test_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TestModel extends Equatable {
  int? id;
  int? programId;
  int? mistakeCount;
  dynamic status;
  int? testId;
  int? lessonNum;
  String? name;
  String? testName;
  String? programName;
  String? chapterName;
  String? teacherName;
  dynamic type;
  String? formattedDueDate;
  String? daysLeft;
  String? duration;
  String? createdAt;
  num? score;
  num? totalScore;

  String? updatedAt;

  TestModel(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.duration,
      this.mistakeCount,
      this.programId,
      this.programName,
      this.chapterName,
      this.status,
      this.testName,
      this.daysLeft,
      this.lessonNum,
      this.score,
      this.totalScore,
      this.formattedDueDate,
      this.teacherName,
      this.testId,
      this.type});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        duration,
        mistakeCount,
        programId,
        status,
        testId,
    totalScore,
    score,
        testName,
        teacherName,
        type,
        formattedDueDate,
        daysLeft
      ];

  getColorOfTest() {
    return status == TestTypes.finished
        ? AppColor.resetText
        : status == TestTypes.overdue
            ? Colors.black
            : status == TestTypes.dueSoon &&
                    int.tryParse(formattedDueDate ?? '') != null &&
                    int.parse(formattedDueDate ?? '') <= 7
                ? Colors.red
                : const Color(0xFFCCCCCC);
  }
}
