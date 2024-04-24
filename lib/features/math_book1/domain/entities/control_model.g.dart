// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlModel _$ControlModelFromJson(Map<String, dynamic> json) => ControlModel(
      hint: json['hint'] as String?,
      action: json['action'] as String?,
      answer: json['answer'] as String?,
      control: json['control'] as String?,
      operator: json['operator'] as String?,
      showNum: json['show_num'] as bool?,
    );

Map<String, dynamic> _$ControlModelToJson(ControlModel instance) =>
    <String, dynamic>{
      'hint': instance.hint,
      'action': instance.action,
      'answer': instance.answer,
      'control': instance.control,
      'operator': instance.operator,
      'show_num': instance.showNum,
    };
