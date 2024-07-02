// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pie_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PieChartModel _$PieChartModelFromJson(Map<String, dynamic> json) =>
    PieChartModel(
      testTypes: (json['test_types'] as List<dynamic>?)
          ?.map((e) => TestsTypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignmentsPercentages: json['assignments_percentages'] == null
          ? null
          : AssignmentsPercentages.fromJson(
              json['assignments_percentages'] as Map<String, dynamic>),
      reportsPercentages: json['reports_percentages'] == null
          ? null
          : ReportsPercentages.fromJson(
              json['reports_percentages'] as Map<String, dynamic>),
      progress: (json['progress'] as List<dynamic>?)
          ?.map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PieChartModelToJson(PieChartModel instance) =>
    <String, dynamic>{
      'tests': instance.tests?.map((e) => e.toJson()).toList(),
      'progress': instance.progress?.map((e) => e.toJson()).toList(),
      'test_types': instance.testTypes?.map((e) => e.toJson()).toList(),
      'courses': instance.courses?.map((e) => e.toJson()).toList(),
      'assignments_percentages': instance.assignmentsPercentages?.toJson(),
      'reports_percentages': instance.reportsPercentages?.toJson(),
    };
