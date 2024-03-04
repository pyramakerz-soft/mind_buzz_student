import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_game_model.dart';
part 'based_game_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BasedGameModel  extends Equatable{
  bool? result;
  String? msg;
  DataGameModel? data;

  BasedGameModel({this.result, this.msg, this.data});

  factory BasedGameModel.fromJson(Map<String, dynamic> json) {
    return _$BasedGameModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasedGameModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [result, msg, data];
}
