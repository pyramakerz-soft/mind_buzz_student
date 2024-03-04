// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'based_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasedGameModel _$BasedGameModelFromJson(Map<String, dynamic> json) =>
    BasedGameModel(
      result: json['result'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : DataGameModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasedGameModelToJson(BasedGameModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
    };
