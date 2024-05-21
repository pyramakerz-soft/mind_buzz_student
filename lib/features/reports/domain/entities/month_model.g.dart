// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthModel _$MonthModelFromJson(Map<String, dynamic> json) => MonthModel(
      month: json['month'] as String?,
      totalScore: json['total_score'] as num?,
    );

Map<String, dynamic> _$MonthModelToJson(MonthModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'total_score': instance.totalScore,
    };
