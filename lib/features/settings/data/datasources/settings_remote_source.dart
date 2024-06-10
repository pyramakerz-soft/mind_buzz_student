// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/core/apis_connections/api_connection.dart';
import 'package:mind_buzz_refactor/core/connection.dart';
import 'package:mind_buzz_refactor/core/error/exceptions.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';

abstract class SettingsRemoteDataSource {
  Future<void> updateUserData(UserData userData, {File? profilePicture});
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final MainApiConnection dio;
  SettingsRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<void> updateUserData(UserData userData, {File? profilePicture}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.updateUserEndPoint}',
        headers: {
          ...MainApiConnection.apiHeaders,
        },
        data: FormData.fromMap({
          'name': userData.name,
          'email': userData.email,
          'phone': userData.parentPhone,
          'country_code': userData.countryCode,
          'photo': profilePicture == null
              ? null
              : await MultipartFile.fromFile(profilePicture.path,
                  filename: 'profile_picture.jpg'),
        }));
    if (dio.validResponse(response) && response.data['result'] != false) {
      return;
    } else {
      throw MessageException(message: response.data['message']);
    }
  }
}
