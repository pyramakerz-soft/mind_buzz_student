// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      stars: json['stars'] as String?,
      number: json['number'] as int?,
      unitId: json['unit_id'] as int?,
      warmupId: json['warmup_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      chapter: json['chapter'] == null
          ? null
          : SubChapterModel.fromJson(json['chapter'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'warmup_id': instance.warmupId,
      'stars': instance.stars,
      'type': instance.type,
      'unit_id': instance.unitId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'chapter': instance.chapter?.toJson(),
    };
