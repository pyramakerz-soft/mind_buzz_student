// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['id'] as int?,
      countWrongAnswer: json['countWrongAnswer'] as int?,
      countCorrectAnswer: json['countCorrectAnswer'] as int?,
      detailsOfAnswers: (json['detailsOfAnswers'] as List<dynamic>?)
          ?.map((e) => DetailsOfAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeToAnswer: json['timeToAnswer'] as String?,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countCorrectAnswer': instance.countCorrectAnswer,
      'timeToAnswer': instance.timeToAnswer,
      'countWrongAnswer': instance.countWrongAnswer,
      'detailsOfAnswers':
          instance.detailsOfAnswers?.map((e) => e.toJson()).toList(),
    };
