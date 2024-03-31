import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'unit_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UnitModel extends Equatable{
  int? id;
  int? number;
  int? programId;
  String? name;
  String? createdAt;
  String? updatedAt;

  UnitModel({this.id, this.name, this.createdAt, this.updatedAt});


  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return _$UnitModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt];
}