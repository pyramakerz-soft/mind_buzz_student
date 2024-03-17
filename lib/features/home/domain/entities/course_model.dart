import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CourseModel extends Equatable{
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CourseModel({this.id, this.name, this.createdAt, this.updatedAt});


  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt];
}