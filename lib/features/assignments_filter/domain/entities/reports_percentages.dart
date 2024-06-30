import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
part 'reports_percentages.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ReportsPercentages {
  num? oneStar;
  num? twoStar;
  num? threeStar;
  ReportsPercentages({
    this.oneStar,
    this.twoStar,
    this.threeStar,
  });
  factory ReportsPercentages.fromJson(Map<String, dynamic> json) {
    return _$ReportsPercentagesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportsPercentagesToJson(this);
}
