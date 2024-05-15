import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_images_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameImagesModel extends Equatable{
  int? id;
  int? gameId;
  int? gameLetterId;
  int? index;
  String? image;
  String? word;
  int? correct;
  String? createdAt;
  String? updatedAt;

  GameImagesModel({this.correct, this.word, this.id, this.gameId, this.gameLetterId, this.index, this.image, this.createdAt, this.updatedAt});


  factory GameImagesModel.fromJson(Map<String, dynamic> json) {
    return _$GameImagesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameImagesModelToJson(this);

  @override
  List<Object?> get props => [id, gameId, correct, word, createdAt, updatedAt,gameLetterId, index,image];
}