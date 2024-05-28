import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/student_assignment_model.dart';

import 'user_data_model.dart';
part 'based_login_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BasedLoginModel  extends Equatable{
  bool? status;
  UserData? user;
  String? token;
  List<StudentAssignmentModel>? assignments;

  BasedLoginModel({this.status, this.user, this.token,this.assignments});

  factory BasedLoginModel.fromJson(Map<String, dynamic> json) {
    return _$BasedLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasedLoginModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [status, user, token,assignments];
}
