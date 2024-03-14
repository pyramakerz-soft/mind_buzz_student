import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_data_model.dart';
part 'based_login_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BasedLoginModel  extends Equatable{
  bool? status;
  UserData? user;
  String? token;

  BasedLoginModel({this.status, this.user, this.token});

  factory BasedLoginModel.fromJson(Map<String, dynamic> json) {
    return _$BasedLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasedLoginModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [status, user, token];
}
