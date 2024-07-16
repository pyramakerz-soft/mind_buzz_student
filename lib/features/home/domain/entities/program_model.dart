import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_model.dart';
import 'test_model.dart';
part 'program_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProgramModel extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? schoolId;
  final int? courseId;
  final int? stageId;
  final int? isActive;
  final String? createdAt;
  final String? updatedAt;
  final CourseModel? course;
  final List<TestModel>? studentTests;

  const ProgramModel(
      {this.id,
      this.name,
      this.schoolId,
      this.courseId,
      this.stageId,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.studentTests,
      this.isActive,
      this.course});
  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return _$ProgramModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        schoolId,
        courseId,
        stageId,
        updatedAt,
        image,
        studentTests,
        isActive
      ];
}
