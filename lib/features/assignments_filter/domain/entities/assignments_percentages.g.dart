// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignments_percentages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentsPercentages _$AssignmentsPercentagesFromJson(
        Map<String, dynamic> json) =>
    AssignmentsPercentages(
      completed: json['completed'] as num?,
      pending: json['pending'] as num?,
      overdue: json['overdue'] as num?,
    );

Map<String, dynamic> _$AssignmentsPercentagesToJson(
        AssignmentsPercentages instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'pending': instance.pending,
      'overdue': instance.overdue,
    };
