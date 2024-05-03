// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => UnitModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    )
      ..number = (json['number'] as num?)?.toInt()
      ..programId = (json['program_id'] as num?)?.toInt();

Map<String, dynamic> _$UnitModelToJson(UnitModel instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'program_id': instance.programId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
