// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_letters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameLettersModel _$GameLettersModelFromJson(Map<String, dynamic> json) =>
    GameLettersModel(
      id: (json['id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
      number: (json['number'] as num?)?.toInt(),
      gameId: (json['game_id'] as num?)?.toInt(),
      warmupId: (json['warmup_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameLettersModelToJson(GameLettersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'number': instance.number,
      'warmup_id': instance.warmupId,
      'unit_id': instance.unitId,
      'game_id': instance.gameId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stars': instance.stars,
    };
