import 'package:json_annotation/json_annotation.dart';

import '../../../settings/domain/entities/school_model.dart';
part 'user_details_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)

class UserDetails {
  int? id;
  int? userId;
  int? schoolId;
  int? stageId;
  String? createdAt;
  String? updatedAt;
  SchoolModel? stage;

  UserDetails(
    {this.id,
      this.userId,
      this.schoolId,
      this.stageId,
      this.createdAt,
      this.updatedAt,
      this.stage});


  factory UserDetails.fromJson(Map<String, dynamic> json) {
  
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}