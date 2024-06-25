import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'percentages.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Percentages {
  num? completed;
  num? pending;
  num? overdue;
  Percentages({
    this.completed,
    this.pending,
    this.overdue,
  });
  factory Percentages.fromJson(Map<String, dynamic> json) {
    return _$PercentagesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PercentagesToJson(this);
}
