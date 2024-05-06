
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../login/domain/entities/school_model.dart';
part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)


class UserData extends Equatable{
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? role;
  int? schoolId;
  int? isStudent;
  String? parentName;
  String? parentPhone;
  String? parentEmail;
  String? parentImage;
  String? parentPassword;
  int? isActive;
  SchoolModel? school;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.schoolId,
        this.isStudent,
        this.parentName,
        this.parentPhone,
        this.parentEmail,
        this.parentImage,
        this.parentPassword,
        this.isActive,
        this.school});


  factory UserData.fromJson(Map<String, dynamic> json) {
    return _$UserDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props => [id, name, parentName, parentPhone, parentImage, updatedAt];
}


