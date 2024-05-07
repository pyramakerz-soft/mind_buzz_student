import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/test_model.dart';
import 'tests_types_model.dart';
part 'tests_types_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TestsTypesModel extends Equatable {
  int? id;
  String? enum0;
  String? name;
  String? createdAt;
  String? textColor;
  String? bgColor;
  String? updatedAt;
  TestsTypesModel(
      {this.name, this.id, this.createdAt, this.enum0, this.updatedAt, this.bgColor, this.textColor});

  factory TestsTypesModel.fromJson(Map<String, dynamic> json) {
    return TestsTypesModel(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      enum0: json['enum'] as String?,
      textColor: json['textColor'] as String?,
      bgColor: json['bgColor'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  List<Object?> get props => [id, enum0, name, createdAt,bgColor, textColor];
}
