import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_of_answer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailsOfAnswerModel extends Equatable{
  String? correctAnswer;
  String? userAnswer;
  String? timeOfAnswer;
  DateTime? dateTimeOfAnswer;

  DetailsOfAnswerModel({this.correctAnswer, this.timeOfAnswer, this.userAnswer, this.dateTimeOfAnswer});


  factory DetailsOfAnswerModel.fromJson(Map<String, dynamic> json) {
    return _$DetailsOfAnswerModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsOfAnswerModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [correctAnswer, userAnswer, timeOfAnswer, dateTimeOfAnswer];
}
