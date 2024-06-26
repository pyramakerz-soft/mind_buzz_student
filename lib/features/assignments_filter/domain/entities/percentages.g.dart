// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percentages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Percentages _$PercentagesFromJson(Map<String, dynamic> json) => Percentages(
      completed: json['completed'] as num?,
      pending: json['pending'] as num?,
      overdue: json['overdue'] as num?,
    );

Map<String, dynamic> _$PercentagesToJson(Percentages instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'pending': instance.pending,
      'overdue': instance.overdue,
    };
