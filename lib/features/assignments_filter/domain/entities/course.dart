// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'course.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Course {
  num? programId;
  String? courseName;
  Course({
    this.programId,
    this.courseName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return _$CourseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object?> get props => [
        programId,
        courseName,
      ];
}
