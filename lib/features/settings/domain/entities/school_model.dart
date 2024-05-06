import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'school_model.g.dart';
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)

class SchoolModel extends Equatable {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  SchoolModel({this.id, this.name, this.createdAt, this.updatedAt});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return _$SchoolModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name];
}