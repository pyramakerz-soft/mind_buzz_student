import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_types_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameTypesModel extends Equatable{
  int? id;
  int? gameId;
  String? letter;
  String? createdAt;
  String? updatedAt;

  GameTypesModel({this.id, this.gameId, this.letter, this.createdAt, this.updatedAt});


  factory GameTypesModel.fromJson(Map<String, dynamic> json) {
    return _$GameTypesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameTypesModelToJson(this);

  @override
  List<Object?> get props => [id, gameId, letter, createdAt, updatedAt];
}