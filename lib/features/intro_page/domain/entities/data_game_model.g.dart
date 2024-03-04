// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGameModel _$DataGameModelFromJson(Map<String, dynamic> json) =>
    DataGameModel(
      game: json['game'] == null
          ? null
          : GameModel.fromJson(json['game'] as Map<String, dynamic>),
      gameLetters: (json['game_letters'] as List<dynamic>?)
          ?.map((e) => GameLettersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataGameModelToJson(DataGameModel instance) =>
    <String, dynamic>{
      'game_letters': instance.gameLetters?.map((e) => e.toJson()).toList(),
      'game': instance.game?.toJson(),
    };
