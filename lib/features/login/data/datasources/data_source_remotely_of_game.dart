import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/user_data_model.dart';

abstract class DataSourceRemotelyOfLogin {
  Future<UserData> getLoginDataRemotely({required String email, required String password});
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
      return UserData.fromJson(response.data['user']);
    } else {
      throw response.data['msg'];
    }
  }
}
