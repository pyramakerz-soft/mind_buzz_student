// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      schoolId: (json['school_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      stageId: (json['stage_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      image: json['image'] as String?,
      studentTests: (json['student_tests'] as List<dynamic>?)
          ?.map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: (json['is_active'] as num?)?.toInt(),
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
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'course': instance.course?.toJson(),
      'student_tests': instance.studentTests?.map((e) => e.toJson()).toList(),
    };
