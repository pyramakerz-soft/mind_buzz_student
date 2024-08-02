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
      assignmentName: json['assignment_name'] as String?,
      mistakeCount: (json['mistake_count'] as num?)?.toInt(),
      programId: (json['program_id'] as num?)?.toInt(),
      programName: json['program_name'] as String?,
      chapterName: json['chapter_name'] as String?,
      status: json['status'],
      testName: json['test_name'] as String?,
      daysLeft: json['days_left'] as String?,
      lessonNum: (json['lesson_num'] as num?)?.toInt(),
      score: json['score'] as num?,
      totalScore: json['total_score'] as num?,
      formattedDueDate: json['formatted_due_date'] as String?,
      teacherName: json['teacher_name'] as String?,
      testId: (json['test_id'] as num?)?.toInt(),
      type: json['type'],
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'mistake_count': instance.mistakeCount,
      'status': instance.status,
      'test_id': instance.testId,
      'lesson_num': instance.lessonNum,
      'name': instance.name,
      'test_name': instance.testName,
      'program_name': instance.programName,
      'chapter_name': instance.chapterName,
      'teacher_name': instance.teacherName,
      'assignment_name': instance.assignmentName,
      'type': instance.type,
      'formatted_due_date': instance.formattedDueDate,
      'days_left': instance.daysLeft,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'score': instance.score,
      'total_score': instance.totalScore,
      'updated_at': instance.updatedAt,
    };
