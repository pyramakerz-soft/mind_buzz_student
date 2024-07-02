import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CourseModel extends Equatable {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const CourseModel({this.id, this.name, this.createdAt, this.updatedAt});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt];
}
