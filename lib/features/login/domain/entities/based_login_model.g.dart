// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'based_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasedLoginModel _$BasedLoginModelFromJson(Map<String, dynamic> json) =>
    BasedLoginModel(
      status: json['status'] as bool?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$BasedLoginModelToJson(BasedLoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user?.toJson(),
      'token': instance.token,
    };
