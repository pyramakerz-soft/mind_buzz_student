import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/user_data_model.dart';

abstract class DataSourceRemotelyOfLogin {
  Future<UserData> getLoginDataRemotely({required String email, required String password});
  Future<UserData> getAutoLogin();
}


class DataSourceRemotelyOfLoginImpl implements DataSourceRemotelyOfLogin {
  final MainApiConnection dio;

  DataSourceRemotelyOfLoginImpl({required this.dio});

  @override
  Future<UserData> getLoginDataRemotely({required String email, required String password}) async {

    final response = await dio.post(
        url: '${Connection.baseURL}${dio.postLoginEndPoint}',
        headers: {
          ...MainApiConnection.apiHeaders,
        },
        data: {
          'email':email,
          'password':password
        }
    );
    if (dio.validResponse(response)) {
      return UserData.fromJson(response.data);
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<UserData> getAutoLogin() async {
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getUserEndPoint}',
    );
    log("response.data['data']['user']:${response.data['data']['user']}");
    if (dio.validResponse(response)) {
      return UserData.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }
}
