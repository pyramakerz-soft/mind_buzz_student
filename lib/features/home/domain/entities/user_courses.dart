import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/home/domain/entities/program_model.dart';
part 'user_courses.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserCourseModel extends Equatable{
  int? id;
  int? userId;
  int? programId;
  String? createdAt;
  String? name;
  String? updatedAt;
  ProgramModel? program;

  UserCourseModel(
      {this.id,
        this.userId,
        this.programId,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.program});

  factory UserCourseModel.fromJson(Map<String, dynamic> json) {
    return _$UserCourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserCourseModelToJson(this);

  @override
  List<Object?> get props => [name, id, userId, programId, program, createdAt, updatedAt];
}