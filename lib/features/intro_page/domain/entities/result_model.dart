import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'details_of_answer_model.dart';

part 'result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultModel  extends Equatable{
  int? id;
  int? countCorrectAnswer;
  String? timeToAnswer;
  int? countWrongAnswer;
  List<DetailsOfAnswerModel>? detailsOfAnswers;
  ResultModel({
    this.id,
    this.countWrongAnswer,
    this.countCorrectAnswer,
    this.detailsOfAnswers,
    this.timeToAnswer,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return _$ResultModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
  double getScore() {
    return double.parse("${(500 /
        (int.parse("${countWrongAnswer ?? 0}") +
            int.parse("$countCorrectAnswer"))) *
        int.parse("$countCorrectAnswer").roundToDouble()}");
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, countCorrectAnswer, countWrongAnswer, detailsOfAnswers, timeToAnswer];
}
