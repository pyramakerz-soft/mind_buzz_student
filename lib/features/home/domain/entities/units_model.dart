import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/home/domain/entities/program_model.dart';
part 'units_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UnitsModel extends Equatable{
  int? id;
  String? name;
  int? number;
  int? programId;
  String? createdAt;
  String? updatedAt;

  UnitsModel(
      {this.id,
        this.name,
        this.number,
        this.programId,
        this.createdAt,
        this.updatedAt});

  factory UnitsModel.fromJson(Map<String, dynamic> json) {
    return _$UnitsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UnitsModelToJson(this);

  @override
  List<Object?> get props => [id, name, programId, number, createdAt, updatedAt];
}