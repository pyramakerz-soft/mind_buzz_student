// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameImagesModel _$GameImagesModelFromJson(Map<String, dynamic> json) =>
    GameImagesModel(
      correct: (json['correct'] as num?)?.toInt(),
      word: json['word'] as String?,
      id: (json['id'] as num?)?.toInt(),
      gameId: (json['game_id'] as num?)?.toInt(),
      gameLetterId: (json['game_letter_id'] as num?)?.toInt(),
      index: (json['index'] as num?)?.toInt(),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GameImagesModelToJson(GameImagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'game_letter_id': instance.gameLetterId,
      'index': instance.index,
      'image': instance.image,
      'word': instance.word,
      'correct': instance.correct,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
