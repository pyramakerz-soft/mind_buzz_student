// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTypesModel _$GameTypesModelFromJson(Map<String, dynamic> json) =>
    GameTypesModel(
      id: (json['id'] as num?)?.toInt(),
      gameId: (json['game_id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
          name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GameTypesModelToJson(GameTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'letter': instance.letter,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
