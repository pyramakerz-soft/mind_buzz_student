import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/user_courses.dart';
import '../../../phonetics/domain/entities/game_model.dart';
import 'sub_chapter_model.dart';
part 'lesson_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonModel extends Equatable {
  final int? id;
  final int? number;
  final int? warmupId;
  final int? stars;
  final String? type;
  final int? unitId;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final SubChapterModel? chapter;
  final List<GameModel>? games;
  final UserCourseModel? unit;
  const LessonModel(
      {this.id,
      this.name,
      this.stars,
      this.number,
      this.unitId,
      this.warmupId,
      this.createdAt,
      this.updatedAt,
      this.chapter,
      this.type,
      this.games,
      this.unit});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return _$LessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);

  @override
  List<Object?> get props => [
        unit,
        id,
        name,
        createdAt,
        number,
        warmupId,
        unitId,
        createdAt,
        updatedAt,
        chapter,
        stars,
        type,
        games
      ];
}
