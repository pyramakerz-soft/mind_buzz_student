import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MonthModel extends Equatable {
  String? month;
  num? totalScore;
  MonthModel({this.month, this.totalScore});

  factory MonthModel.fromJson(Map<String, dynamic> json) {
    return _$MonthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MonthModelToJson(this);

  @override
  List<Object?> get props => [month, totalScore];
}
