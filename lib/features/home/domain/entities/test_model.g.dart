// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      duration: json['duration'] as String?,
      mistakeCount: (json['mistake_count'] as num?)?.toInt(),
      programId: (json['program_id'] as num?)?.toInt(),
      status: json['status'],
      testName: json['test_name'] as String?,
      daysLeft: json['days_left'] as String?,
      formattedDueDate: json['formatted_due_date'] as String?,
      teacherName: json['teacher_name'] as String?,
      testId: (json['test_id'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'mistake_count': instance.mistakeCount,
      'status': instance.status,
      'test_id': instance.testId,
      'name': instance.name,
      'test_name': instance.testName,
      'teacher_name': instance.teacherName,
      'type': instance.type,
      'formatted_due_date': instance.formattedDueDate,
      'days_left': instance.daysLeft,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
