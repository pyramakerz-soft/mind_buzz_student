// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      schoolId: json['school_id'] as int?,
      courseId: json['course_id'] as int?,
      stageId: json['stage_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      image: json['image'] as String?,
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'school_id': instance.schoolId,
      'course_id': instance.courseId,
      'stage_id': instance.stageId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'course': instance.course?.toJson(),
      'tests': instance.tests?.map((e) => e.toJson()).toList(),
    };
