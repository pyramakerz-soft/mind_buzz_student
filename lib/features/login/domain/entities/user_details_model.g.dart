// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      schoolId: (json['school_id'] as num?)?.toInt(),
      stageId: (json['stage_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      stage: json['stage'] == null
          ? null
          : SchoolModel.fromJson(json['stage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'school_id': instance.schoolId,
      'stage_id': instance.stageId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'stage': instance.stage?.toJson(),
    };
