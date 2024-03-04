// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_letters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameLettersModel _$GameLettersModelFromJson(Map<String, dynamic> json) =>
    GameLettersModel(
      id: json['id'] as int?,
      gameId: json['game_id'] as int?,
      letter: json['letter'] as String?,
      image: json['image'] as String?,
      sound: json['sound'] as String?,
      word: json['word'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      hide: json['hide'] as bool? ?? false,
    );

Map<String, dynamic> _$GameLettersModelToJson(GameLettersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hide': instance.hide,
      'game_id': instance.gameId,
      'letter': instance.letter,
      'image': instance.image,
      'sound': instance.sound,
      'word': instance.word,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
