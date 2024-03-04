// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_of_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsOfAnswerModel _$DetailsOfAnswerModelFromJson(
        Map<String, dynamic> json) =>
    DetailsOfAnswerModel(
      correctAnswer: json['correctAnswer'] as String?,
      timeOfAnswer: json['timeOfAnswer'] as String?,
      userAnswer: json['userAnswer'] as String?,
      dateTimeOfAnswer: json['dateTimeOfAnswer'] == null
          ? null
          : DateTime.parse(json['dateTimeOfAnswer'] as String),
    );

Map<String, dynamic> _$DetailsOfAnswerModelToJson(
        DetailsOfAnswerModel instance) =>
    <String, dynamic>{
      'correctAnswer': instance.correctAnswer,
      'userAnswer': instance.userAnswer,
      'timeOfAnswer': instance.timeOfAnswer,
      'dateTimeOfAnswer': instance.dateTimeOfAnswer?.toIso8601String(),
    };
