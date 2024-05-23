import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../phonetics/domain/entities/game_model.dart';
import 'sub_chapter_model.dart';
part 'lesson_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonModel extends Equatable{
  int? id;
  int? number;
  int? warmupId;
  int? stars;
  String? type;
  int? unitId;
  String? name;
  String? createdAt;
  String? updatedAt;
  SubChapterModel? chapter;
  List<GameModel>? games;

  LessonModel({this.id, this.name,this.stars, this.number, this.unitId, this.warmupId, this.createdAt, this.updatedAt, this.chapter, this.type,
  this.games});


  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return _$LessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt, number, warmupId, unitId, createdAt, updatedAt, chapter,stars, type,games];
}