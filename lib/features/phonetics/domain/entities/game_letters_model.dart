import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_letters_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameLettersModel extends Equatable {
  final int? id;
  final String? letter;
  final int? number;
  final int? warmupId;
  final int? unitId;
  final bool? hide;
  final int? gameId;
  final String? createdAt;
  final String? updatedAt;
  final int? stars;

  const GameLettersModel(
      {this.id,
      this.letter,
      this.number,
      this.gameId,
      this.hide = false,
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
  List<Object?> get props => [
        hide,
        gameId,
        id,
        letter,
        number,
        warmupId,
        unitId,
        createdAt,
        updatedAt,
        stars
      ];
}
