import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sub_chapter_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SubChapterModel extends Equatable{
  int? id;
  int? number;
  int? warmupId;
  int? programId;
  int? unitId;
  String? name;
  String? createdAt;
  String? updatedAt;

  SubChapterModel({this.id, this.name, this.number, this.unitId, this.warmupId, this.createdAt, this.updatedAt, this.programId});


  factory SubChapterModel.fromJson(Map<String, dynamic> json) {
    return _$SubChapterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubChapterModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt, number, warmupId, unitId, createdAt, updatedAt, programId];
}