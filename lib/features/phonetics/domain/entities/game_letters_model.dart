import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_letters_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameLettersModel extends Equatable{
  int? id;
  String? name;
  int? number;
  int? warmupId;
  int? unitId;
  String? createdAt;
  String? updatedAt;
  int? stars;

  GameLettersModel(
      {this.id,
        this.name,
        this.number,
        this.warmupId,
        this.unitId,
        this.createdAt,
        this.updatedAt,
        this.stars});
  factory GameLettersModel.fromJson(Map<String, dynamic> json) {
    return _$GameLettersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameLettersModelToJson(this);

  @override
  List<Object?> get props => [id, name, number, warmupId, unitId, createdAt, updatedAt, stars];
}