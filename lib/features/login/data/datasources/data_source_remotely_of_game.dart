import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user_data_model.dart';

abstract class DataSourceRemotelyOfLogin {
  Future<UserData> getLoginDataRemotely(
      {required String email, required String password});
  Future<UserData> getAutoLogin();
  Future<UserData> updateUserData(
      {String? name, String? email, String? phone, File? filepath});
}

class DataSourceRemotelyOfLoginImpl implements DataSourceRemotelyOfLogin {
  final MainApiConnection dio;

  DataSourceRemotelyOfLoginImpl({required this.dio});

  @override
  Future<UserData> getLoginDataRemotely(
      {required String email, required String password}) async {
    final response = await dio
        .post(url: '${Connection.baseURL}${dio.postLoginEndPoint}', headers: {
      ...MainApiConnection.apiHeaders,
    }, data: {
      'email': email,
      'password': password
    });
    if (dio.validResponse(response) && response.data['result'] != false) {
      return UserData.fromJson(response.data['data']);
    } else {
      throw MessageException(message: response.data['message']);
    }
  }

  @override
  Future<UserData> getAutoLogin() async {
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getUserEndPoint}',
    );
    log("response.data['data']['user']:${response.data['data']}");
    if (dio.validResponse(response)) {
      return UserData.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<UserData> updateUserData(
      {String? name,
      String? email,
      String? phone,
       File? filepath}) async {
    final response = await dio.uploadImage(
        url: '${Connection.baseURL}${dio.updateUserEndPoint}',
        filePath: filepath,
        data: {'email': email ?? '', 'name': name ?? '', 'phone': phone ?? ''});
    var bodyData = json.decode(response.body);
    if (bodyData['result'] != false) {
      return UserData.fromJson({'user': bodyData['data']});
    } else {
      throw MessageException(message: bodyData['message']);
    }
  }

}
