import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/course.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/percentages.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/test_model.dart';
import 'package:mind_buzz_refactor/features/student_assignment/domain/entities/tests_types_model.dart';

part 'pie_chart_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PieChartModel extends Equatable {
  List<TestModel>? tests;
  List<TestsTypesModel>? testTypes;
  List<Course>? courses;
  Percentages? counts;
  Percentages? percentages;
  PieChartModel({
    this.testTypes,
    this.tests,
    this.courses,
    this.counts,
    this.percentages,
  });

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return _$PieChartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PieChartModelToJson(this);

  @override
  List<Object?> get props => [
        tests,
        testTypes,
        courses,
        counts,
        percentages,
      ];
}
