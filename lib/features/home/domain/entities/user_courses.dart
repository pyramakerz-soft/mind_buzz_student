import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/home/domain/entities/program_model.dart';
import 'package:mind_buzz_refactor/features/home/domain/entities/programs_model.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
part 'user_courses.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserCourcesModel extends Equatable{
  int? id;
  int? userId;
  int? programId;
  String? createdAt;
  String? updatedAt;
  ProgramsModel? program;

  UserCourcesModel(
      {this.id,
        this.userId,
        this.programId,
        this.createdAt,
        this.updatedAt,
        this.program});

  factory UserCourcesModel.fromJson(Map<String, dynamic> json) {
    return _$UserCourcesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserCourcesModelToJson(this);

  @override
  List<Object?> get props => [id, userId, programId, program, createdAt, updatedAt];
}