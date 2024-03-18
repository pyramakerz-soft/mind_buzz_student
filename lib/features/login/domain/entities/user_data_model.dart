import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_data_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserData extends Equatable {
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
    String? token = json['token'];
    if(token!=null) {
      saveToken(token: token);
    }
    return _$UserDataFromJson(json['user']);
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, email, emailVerifiedAt, createdAt, updatedAt, role, schoolId];

  static Future<void> saveToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

  static Future<String?> get getToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }
}
