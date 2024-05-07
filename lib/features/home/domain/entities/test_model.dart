import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'test_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TestModel extends Equatable {
  int? id;
  int? programId;
  int? mistakeCount;
  dynamic status;
  int? testId;
  String? name;
  String? testName;
  String? teacherName;
  String? type;
  String? formattedDueDate;
  String? daysLeft;
  String? duration;
  String? createdAt;
  String? updatedAt;

  TestModel(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.duration,
      this.mistakeCount,
      this.programId,
      this.status,
      this.testName,
      this.daysLeft,
      this.formattedDueDate,
      this.teacherName,
      this.testId,
      this.type});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        duration,
        mistakeCount,
        programId,
        status,
        testId,
        testName,
        teacherName,
        type,
        formattedDueDate,
        daysLeft
      ];
}
