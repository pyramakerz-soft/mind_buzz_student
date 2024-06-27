import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'assignments_percentages.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AssignmentsPercentages {
  num? completed;
  num? pending;
  num? overdue;
  AssignmentsPercentages({
    this.completed,
    this.pending,
    this.overdue,
  });
  factory AssignmentsPercentages.fromJson(Map<String, dynamic> json) {
    return _$AssignmentsPercentagesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssignmentsPercentagesToJson(this);
}
