// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_assignment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAssignmentModel _$StudentAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    StudentAssignmentModel(
      id: (json['id'] as num?)?.toInt(),
      testId: (json['test_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      diffLvl: json['diff_lvl'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$StudentAssignmentModelToJson(
        StudentAssignmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'test_id': instance.testId,
      'name': instance.name,
      'image': instance.image,
      'diff_lvl': instance.diffLvl,
      'created_at': instance.createdAt,
    };
