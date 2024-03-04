import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// import '../core/connection.dart';

part 'game_letters_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameLettersModel  extends Equatable{
  int? id;
  bool hide = false;
  int? gameId;
  String? letter;
  String? image;
  String? sound;
  String? word;
  String? createdAt;
  String? updatedAt;

  GameLettersModel(
      {this.id,
      this.gameId,
      this.letter,
      this.image,
      this.sound,
      this.word,
      this.createdAt,
      this.updatedAt,
      this.hide = false});

  factory GameLettersModel.fromJson(Map<String, dynamic> json) {
    return _$GameLettersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameLettersModelToJson(this);

  // getImageBasedOnLetter() {
  //   return GetCurrent.superGetImageBasedOnLetter(superLetter: letter ?? '');
  // }

  // getSoundBasedOnLetter() {
  //   return GetCurrent.superGetSoundBasedOnLetter(superLetter: letter ?? '');
  // }

  @override
  String toString(){
    return "$hide";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, gameId, letter, image, sound, word, createdAt, updatedAt, hide];
}
