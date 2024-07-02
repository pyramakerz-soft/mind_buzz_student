import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'program_model.dart';
part 'user_courses.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserCourseModel extends Equatable {
  final int? id;
  final int? userId;
  final int? programId;
  final String? createdAt;
  final String? updatedAt;
  final ProgramModel? program;
  final String? name;

  const UserCourseModel(
      {this.id,
      this.userId,
      this.programId,
      this.createdAt,
      this.name,
      this.updatedAt,
      this.program});

  factory UserCourseModel.fromJson(Map<String, dynamic> json) {
    return _$UserCourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserCourseModelToJson(this);

  @override
  List<Object?> get props =>
      [id, userId, programId, program, createdAt, updatedAt, name];
}
