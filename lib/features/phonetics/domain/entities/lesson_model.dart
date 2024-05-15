import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'lesson_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonModel extends Equatable{
  int? id;
  String? name;
  int? number;
  int? warmupId;
  int? unitId;
  String? createdAt;
  String? updatedAt;
  int? stars;

  LessonModel(
      {this.id,
        this.name,
        this.number,
        this.warmupId,
        this.unitId,
        this.createdAt,
        this.updatedAt,
        this.stars});
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return _$LessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);

  @override
  List<Object?> get props => [id, name, number, warmupId, unitId, createdAt, updatedAt, stars];
}