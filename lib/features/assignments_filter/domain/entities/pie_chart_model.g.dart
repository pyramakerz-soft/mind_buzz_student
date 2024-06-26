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
      counts: json['counts'] == null
          ? null
          : Percentages.fromJson(json['counts'] as Map<String, dynamic>),
      percentages: json['percentages'] == null
          ? null
          : Percentages.fromJson(json['percentages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PieChartModelToJson(PieChartModel instance) =>
    <String, dynamic>{
      'tests': instance.tests?.map((e) => e.toJson()).toList(),
      'test_types': instance.testTypes?.map((e) => e.toJson()).toList(),
      'courses': instance.courses?.map((e) => e.toJson()).toList(),
      'counts': instance.counts?.toJson(),
      'percentages': instance.percentages?.toJson(),
    };
