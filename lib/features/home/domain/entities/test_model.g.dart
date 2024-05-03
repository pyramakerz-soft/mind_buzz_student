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
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'mistake_count': instance.mistakeCount,
      'status': instance.status,
      'name': instance.name,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
