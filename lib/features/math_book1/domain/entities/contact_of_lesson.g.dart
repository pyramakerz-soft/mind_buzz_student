// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_of_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactOfLessonModel _$ContactOfLessonModelFromJson(
        Map<String, dynamic> json) =>
    ContactOfLessonModel(
      id: (json['id'] as num?)?.toInt(),
      numbersOfAnswers: (json['numbers_of_answers'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      firstNumber: (json['first_number'] as num?)?.toInt(),
      secondNumber: (json['second_number'] as num?)?.toInt(),
      correctAnswer: (json['correct_answer'] as num?)?.toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ContactOfLessonModelToJson(
        ContactOfLessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numbers_of_answers': instance.numbersOfAnswers,
      'first_number': instance.firstNumber,
      'second_number': instance.secondNumber,
      'correct_answer': instance.correctAnswer,
      'message': instance.message,
    };
