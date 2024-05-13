// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      pwLength: (json['pw_length'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      school: json['school'] == null
          ? null
          : SchoolModel.fromJson(json['school'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      parentName: json['parent_name'] as String?,
      parentPhone: json['parent_phone'] as String?,
      parentEmail: json['parent_email'] as String?,
      parentImage: json['parent_image'] as String?,
      parentPassword: json['parent_password'] as String?,
      role: json['role'] as String?,
      schoolId: (json['school_id'] as num?)?.toInt(),
      details: (json['details'] as List<dynamic>?)?.map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pw_length': instance.pwLength,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'role': instance.role,
      'parent_name': instance.parentName,
      'parent_phone': instance.parentPhone,
      'parent_email': instance.parentEmail,
      'parent_image': instance.parentImage,
      'parent_password': instance.parentPassword,
      'school_id': instance.schoolId,
      'school': instance.school?.toJson(),
      'details': instance.details?.map((e) => e.toJson()).toList(),
    };
