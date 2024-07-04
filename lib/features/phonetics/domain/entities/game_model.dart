import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../chapters/domain/entities/lesson_model.dart';
import 'game_images_model.dart';
import 'game_letters_model.dart';
import 'game_types_model.dart';
part 'game_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameModel extends Equatable {
  final int? id;
  final int? gameTypeId;
  final int? audioFlag;
  final int? numOfLetters;
  final int? numOfLetterRepeat;
  final int? numOfTrials;
  final String? createdAt;
  final String? inst;
  final String? name;
  final String? mainLetter;
  final String? updatedAt;
  final String? correctAns;
  final LessonModel? lesson;
  final String? video;
  final GameTypesModel? gameTypes;
  final List<GameLettersModel>? gameLetters;
  final List<GameImagesModel>? gameImages;
  final int? lessonId;
  final dynamic stars;
  final int? isEdited;
  final int? nextGameId;
  final int? previousGameId;
  final bool isHidden;
  // String? sectionInBook;

  const GameModel(
      {this.id,
      this.lessonId,
      this.gameTypeId,
      this.audioFlag,
      this.numOfLetters,
      this.numOfLetterRepeat,
      this.video,
      this.mainLetter,
      this.inst,
      this.name,
      this.numOfTrials,
      this.lesson,
      this.gameTypes,
      this.createdAt,
      this.updatedAt,
      this.gameLetters,
      this.stars,
      this.nextGameId,
      this.correctAns,
      this.previousGameId,
      this.isEdited,
      this.isHidden = false,
      this.gameImages});
  factory GameModel.fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        lessonId,
        gameTypeId,
        mainLetter,
        audioFlag,
        video,
        numOfLetters,
        name,
        numOfLetterRepeat,
        inst,
        numOfTrials,
        lesson,
        gameTypes,
        createdAt,
        updatedAt,
        gameLetters,
        stars,
        gameImages,
        nextGameId,
        correctAns,
        isEdited,
        previousGameId
      ];
}
