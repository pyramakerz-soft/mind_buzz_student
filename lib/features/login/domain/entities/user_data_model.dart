import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/core/singleton.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/student_assignment_model.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'school_model.dart';
part 'user_data_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserData extends Equatable {
  int? id;
  int? pwLength;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? parentName;
  String? parentPhone;
  String? parentEmail;
  String? parentImage;
  String? parentPassword;
  String? parentPin;
  int? schoolId;
  SchoolModel? school;
  List<UserDetails>? details;

  UserData(
      {this.id,
      this.pwLength,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.school,
      this.createdAt,
      this.updatedAt,
        this.parentName,
        this.parentPhone,
        this.parentEmail,
        this.parentImage,
        this.parentPin,
        this.parentPassword,
      this.role,
      this.schoolId,
        this.details
      });
  factory UserData.fromJson(Map<String, dynamic> json) {
    String? token = json['token'];
    if(token!=null) {
      saveToken(token: token);
    }
    //save student assignments
    List <StudentAssignmentModel> studentAssignments = (json['assignments'] as List<dynamic>?)?.map((e) => StudentAssignmentModel.fromJson(e as Map<String, dynamic>)).toList()??[];
    Singleton().studentAssignments = studentAssignments;
    return _$UserDataFromJson(json['user']);
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props =>
      [id, name, email, emailVerifiedAt, createdAt, updatedAt, role, schoolId, school,parentPhone,parentImage, parentPin];

  static Future<void> saveToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

  static Future<String?> get getToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }
}
