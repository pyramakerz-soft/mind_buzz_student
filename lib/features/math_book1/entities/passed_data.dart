import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'passed_data.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PassedDataModel extends Equatable {
  String? message;
  bool? activeButton;

  PassedDataModel({this.message, this.activeButton});

  factory PassedDataModel.fromJson(Map<String, dynamic> json) {
    return _$PassedDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PassedDataModelToJson(this);

  @override
  List<Object?> get props => [message, activeButton];
}
