// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCourseModel _$UserCourseModelFromJson(Map<String, dynamic> json) =>
    UserCourseModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      programId: json['program_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      program: json['program'] == null
          ? null
          : ProgramModel.fromJson(json['program'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCourseModelToJson(UserCourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'program_id': instance.programId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'program': instance.program?.toJson(),
    };
