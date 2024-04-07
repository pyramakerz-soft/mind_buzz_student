import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'control_model.dart';
part 'lesson_questions.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonQuestionsModel extends Equatable {
  int? id;
  int? number;
  String? question;
  String? answer;
  int? time;
  int? difficulty;
  int? testId;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? bankId;
  String? qtype;
  String? secType;
  bool? showNum;
  ControlModel? control;
  List<String>? choices;
  int? lessonId;
  String? sectionInBook;

  LessonQuestionsModel(
      {this.id,
      this.number,
      this.question,
      this.answer,
      this.time,
      this.difficulty,
      this.testId,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.bankId,
      this.qtype,
      this.secType,
      this.showNum,
      this.control,
      this.choices,
      this.lessonId,
      this.sectionInBook});
  factory LessonQuestionsModel.fromJson(Map<String, dynamic> json) {
    return _$LessonQuestionsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonQuestionsModelToJson(this);

  @override
  List<Object?> get props => [
        sectionInBook,
        lessonId,
        choices,
        control,
        showNum,
        secType,
        qtype,
        bankId,
        updatedAt,
        id,
        number,
        question,
        answer,
        time,
        difficulty,
        testId,
        type,
        createdAt
      ];
}
