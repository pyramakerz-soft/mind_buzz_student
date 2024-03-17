import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserData  extends Equatable{
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? role;
  int? schoolId;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.schoolId});
  factory UserData.fromJson(Map<String, dynamic> json) {
    return _$UserDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, emailVerifiedAt, createdAt, updatedAt, role, schoolId];
}
