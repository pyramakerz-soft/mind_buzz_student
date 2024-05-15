import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/user_courses.dart';
part 'lesson_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonModel extends Equatable {
  int? id;
  String? name;
  int? number;
  int? warmupId;
  int? unitId;
  String? createdAt;
  String? updatedAt;
  int? stars;
  UserCourseModel? unit;

  LessonModel(
      {this.id,
      this.name,
      this.number,
      this.warmupId,
      this.unitId,
      this.createdAt,
      this.unit,
      this.updatedAt,
      this.stars});
  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return _$LessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);

  @override
  List<Object?> get props =>
      [unit, id, name, number, warmupId, unitId, createdAt, updatedAt, stars];
}
