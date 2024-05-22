import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_letters_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameLettersModel extends Equatable{
  int? id;
  String? letter;
  int? number;
  int? warmupId;
  int? unitId;
  bool? hide = false;
  int? gameId;
  String? createdAt;
  String? updatedAt;
  int? stars;

  GameLettersModel(
      {this.id,
        this.letter,
        this.number,
        this.gameId,
        this.hide,
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
  List<Object?> get props => [hide, gameId, id, letter, number, warmupId, unitId, createdAt, updatedAt, stars];
}