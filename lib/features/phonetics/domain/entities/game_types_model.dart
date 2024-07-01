import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_types_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameTypesModel extends Equatable {
  final int? id;
  final int? gameId;
  final String? letter;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const GameTypesModel(
      {this.id,
      this.name,
      this.gameId,
      this.letter,
      this.createdAt,
      this.updatedAt});

  factory GameTypesModel.fromJson(Map<String, dynamic> json) {
    return _$GameTypesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameTypesModelToJson(this);

  @override
  List<Object?> get props => [id, name, gameId, letter, createdAt, updatedAt];
}
