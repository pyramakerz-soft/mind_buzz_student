import 'package:equatable/equatable.dart';
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
