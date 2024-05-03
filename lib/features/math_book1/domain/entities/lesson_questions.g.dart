// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonQuestionsModel _$LessonQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    LessonQuestionsModel(
      id: (json['id'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      time: (json['time'] as num?)?.toInt(),
      difficulty: (json['difficulty'] as num?)?.toInt(),
      testId: (json['test_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      bankId: (json['bank_id'] as num?)?.toInt(),
      qtype: json['qtype'] as String?,
      secType: json['sec_type'] as String?,
      showNum: json['show_num'] as bool?,
      control: json['control'] == null
          ? null
          : ControlModel.fromJson(json['control'] as Map<String, dynamic>),
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lessonId: (json['lesson_id'] as num?)?.toInt(),
      sectionInBook: json['section_in_book'] as String?,
    );

Map<String, dynamic> _$LessonQuestionsModelToJson(
        LessonQuestionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'question': instance.question,
      'answer': instance.answer,
      'time': instance.time,
      'difficulty': instance.difficulty,
      'test_id': instance.testId,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'bank_id': instance.bankId,
      'qtype': instance.qtype,
      'sec_type': instance.secType,
      'show_num': instance.showNum,
      'control': instance.control?.toJson(),
      'choices': instance.choices,
      'lesson_id': instance.lessonId,
      'section_in_book': instance.sectionInBook,
    };
