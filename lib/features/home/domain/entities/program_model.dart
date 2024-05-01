import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_model.dart';
import 'test_model.dart';
part 'program_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProgramModel  extends Equatable{
  int? id;
  String? name;
  String? image;
  int? schoolId;
  int? courseId;
  int? stageId;
  String? createdAt;
  String? updatedAt;
  CourseModel? course;
  List<TestModel>? tests;

  ProgramModel({this.id,
    this.name,
    this.schoolId,
    this.courseId,
    this.stageId,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.tests,
    this.course});
  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return _$ProgramModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name,schoolId, courseId,stageId ,updatedAt,image, tests ];
}