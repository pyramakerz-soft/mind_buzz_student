// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestsTypesModel _$TestsTypesModelFromJson(Map<String, dynamic> json) =>
    TestsTypesModel(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      enum0: json['enum0'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TestsTypesModelToJson(TestsTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enum0': instance.enum0,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
