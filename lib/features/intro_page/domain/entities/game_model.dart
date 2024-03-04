import 'package:json_annotation/json_annotation.dart';

import 'game_letters_model.dart';
import 'package:equatable/equatable.dart';

part 'game_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameModel extends Equatable{
  int? id;
  int? lessonId;
  int? gameTypeId;
  int? audioFlag;
  int? numOfLetters;
  int? numOfLetterRepeat;
  int? numOfTrials;
  String? createdAt;
  String? message;
  String? updatedAt;
  List<GameLettersModel>? gameLetters;
  List<GameLettersModel>? gameImages;

  GameModel(
      {this.id,
      this.lessonId,
      this.gameTypeId,
      this.audioFlag,
      this.message,
      this.numOfLetters,
      this.gameImages,
      this.numOfLetterRepeat,
      this.numOfTrials,
      this.createdAt,
      this.updatedAt,
      this.gameLetters});

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [gameLetters, updatedAt, createdAt, numOfTrials, numOfLetterRepeat, id, lessonId, gameTypeId, audioFlag, message, numOfLetters,gameImages];
}
