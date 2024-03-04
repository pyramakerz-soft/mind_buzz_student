import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'game_letters_model.dart';
import 'game_model.dart';

part 'data_game_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataGameModel  extends Equatable{
  List<GameLettersModel>? gameLetters;
  GameModel? game;
  DataGameModel({this.game, this.gameLetters});

  factory DataGameModel.fromJson(Map<String, dynamic> json) {
    return _$DataGameModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataGameModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [game, gameLetters];
}
