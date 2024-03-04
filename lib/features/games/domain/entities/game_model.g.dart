// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: json['id'] as int?,
      lessonId: json['lesson_id'] as int?,
      gameTypeId: json['game_type_id'] as int?,
      audioFlag: json['audio_flag'] as int?,
      message: json['message'] as String?,
      numOfLetters: json['num_of_letters'] as int?,
      gameImages: (json['game_images'] as List<dynamic>?)
          ?.map((e) => GameLettersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numOfLetterRepeat: json['num_of_letter_repeat'] as int?,
      numOfTrials: json['num_of_trials'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gameLetters: (json['game_letters'] as List<dynamic>?)
          ?.map((e) => GameLettersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'lesson_id': instance.lessonId,
      'game_type_id': instance.gameTypeId,
      'audio_flag': instance.audioFlag,
      'num_of_letters': instance.numOfLetters,
      'num_of_letter_repeat': instance.numOfLetterRepeat,
      'num_of_trials': instance.numOfTrials,
      'created_at': instance.createdAt,
      'message': instance.message,
      'updated_at': instance.updatedAt,
      'game_letters': instance.gameLetters?.map((e) => e.toJson()).toList(),
      'game_images': instance.gameImages?.map((e) => e.toJson()).toList(),
    };
