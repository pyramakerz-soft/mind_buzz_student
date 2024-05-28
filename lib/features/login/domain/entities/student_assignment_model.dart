import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'based_login_model.dart';

part 'student_assignment_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class StudentAssignmentModel extends Equatable {
  int? id;
  int? testId;
  String? name;
  String? image;
  String? diffLvl;
  String? createdAt;

  StudentAssignmentModel({this.id, this.testId, this.name, this.image, this.diffLvl, this.createdAt});

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) {
    return _$StudentAssignmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentAssignmentModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, testId, name, image, diffLvl, createdAt];
}
