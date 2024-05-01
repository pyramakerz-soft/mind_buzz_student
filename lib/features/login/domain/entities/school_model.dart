import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_data_model.dart';
part 'school_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SchoolModel  extends Equatable{
  int? id;

  String? createdAt;
  String? updatedAt;
  String? name;

  SchoolModel({this.id, this.createdAt, this.updatedAt, this.name});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return _$SchoolModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt, id, updatedAt, name];
}
