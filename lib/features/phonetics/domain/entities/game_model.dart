import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/user_courses.dart';
import '../../../phonetics/domain/entities/game_images_model.dart';
import 'game_letters_model.dart';
import 'lesson_model.dart';
import 'game_types_model.dart';
part 'game_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameModel extends Equatable {
  int? id;
  int? gameTypeId;
  int? audioFlag;
  int? numOfLetters;
  int? numOfLetterRepeat;
  int? numOfTrials;
  String? createdAt;
  String? inst;
  String? mainLetter;
  String? updatedAt;
  String? correctAns;
  LessonModel? lesson;
  GameTypesModel? gameTypes;
  List<GameLettersModel>? gameLetters;
  List<GameImagesModel>? gameImages;
  int? lessonId;
  dynamic stars;
  int? isEdited;
  int? nextGameId;
  int? previousGameId;
  bool isHidden = false;
  // String? sectionInBook;

  GameModel(
      {this.id,
      this.gameTypeId,
      this.audioFlag,
      this.numOfLetters,
      this.numOfLetterRepeat,
      // this.unit,
      this.mainLetter,
      this.inst,
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
        numOfLetters,
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
