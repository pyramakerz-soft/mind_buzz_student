import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact_of_lesson.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ContactOfLessonModel extends Equatable{
  int? id;
  List<int>? numbersOfAnswers;
  int? firstNumber;
  int? secondNumber;
  int? correctAnswer;
  String message;

  ContactOfLessonModel({this.id, this.numbersOfAnswers, this.firstNumber, this.secondNumber, this.correctAnswer, required this.message});


  factory ContactOfLessonModel.fromJson(Map<String, dynamic> json) {
    return _$ContactOfLessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactOfLessonModelToJson(this);

  @override
  List<Object?> get props => [id, numbersOfAnswers, firstNumber, secondNumber, correctAnswer, message];
}