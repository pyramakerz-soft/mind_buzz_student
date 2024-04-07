import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'control_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ControlModel extends Equatable{
  String? hint;
  String? action;
  String? answer;
  String? control;
  String? operator;
  bool? showNum;

  ControlModel(
      {this.hint,
        this.action,
        this.answer,
        this.control,
        this.operator,
        this.showNum});
  factory ControlModel.fromJson(Map<String, dynamic> json) {
    return _$ControlModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ControlModelToJson(this);

  @override
  List<Object?> get props => [hint, action, answer, control, operator, showNum];
}