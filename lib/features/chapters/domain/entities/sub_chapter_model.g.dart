// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubChapterModel _$SubChapterModelFromJson(Map<String, dynamic> json) =>
    SubChapterModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: (json['number'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      warmupId: (json['warmup_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      programId: (json['program_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubChapterModelToJson(SubChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'warmup_id': instance.warmupId,
      'program_id': instance.programId,
      'unit_id': instance.unitId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
