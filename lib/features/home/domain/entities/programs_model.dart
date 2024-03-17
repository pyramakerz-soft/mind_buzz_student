import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
part 'programs_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProgramsModel extends Equatable{
  bool? result;
  String? errNum;
  String? message;
  UserData? data;

  ProgramsModel({this.result, this.errNum, this.message, this.data});

  @override
  List<Object?> get props => [result, errNum, message, data];
  factory ProgramsModel.fromJson(Map<String, dynamic> json) {
    return _$ProgramsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgramsModelToJson(this);

}