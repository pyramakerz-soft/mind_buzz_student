// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: (json['id'] as num?)?.toInt(),
      gameTypeId: (json['game_type_id'] as num?)?.toInt(),
      audioFlag: (json['audio_flag'] as num?)?.toInt(),
      numOfLetters: (json['num_of_letters'] as num?)?.toInt(),
      numOfLetterRepeat: (json['num_of_letter_repeat'] as num?)?.toInt(),
      mainLetter: json['main_letter'] as String?,
      inst: json['inst'] as String?,
      numOfTrials: (json['num_of_trials'] as num?)?.toInt(),
      lesson: json['lesson'] == null
          ? null
          : LessonModel.fromJson(json['lesson'] as Map<String, dynamic>),
      gameTypes: json['game_types'] == null
          ? null
          : GameTypesModel.fromJson(json['game_types'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gameLetters: (json['game_letters'] as List<dynamic>?)
          ?.map((e) => GameLettersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: (json['stars'] as num?)?.toInt(),
      nextGameId: (json['next_game_id'] as num?)?.toInt(),
      correctAns: json['correct_ans'] as String?,
      previousGameId: (json['previous_game_id'] as num?)?.toInt(),
      isEdited: (json['is_edited'] as num?)?.toInt(),
      isHidden: json['is_hidden'] as bool? ?? false,
      gameImages: (json['game_images'] as List<dynamic>?)
          ?.map((e) => GameImagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..lessonId = (json['lesson_id'] as num?)?.toInt();

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'game_type_id': instance.gameTypeId,
      'audio_flag': instance.audioFlag,
      'num_of_letters': instance.numOfLetters,
      'num_of_letter_repeat': instance.numOfLetterRepeat,
      'num_of_trials': instance.numOfTrials,
      'created_at': instance.createdAt,
      'inst': instance.inst,
      'main_letter': instance.mainLetter,
      'updated_at': instance.updatedAt,
      'correct_ans': instance.correctAns,
      'lesson': instance.lesson?.toJson(),
      'game_types': instance.gameTypes?.toJson(),
      'game_letters': instance.gameLetters?.map((e) => e.toJson()).toList(),
      'game_images': instance.gameImages?.map((e) => e.toJson()).toList(),
      'lesson_id': instance.lessonId,
      'stars': instance.stars,
      'is_edited': instance.isEdited,
      'next_game_id': instance.nextGameId,
      'previous_game_id': instance.previousGameId,
      'is_hidden': instance.isHidden,
    };
