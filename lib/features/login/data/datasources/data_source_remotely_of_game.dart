import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/based_login_model.dart';

abstract class DataSourceRemotelyOfLogin {
  Future<BasedLoginModel> getLoginDataRemotely({required String email, required String password});
}


class DataSourceRemotelyOfGameImpl implements DataSourceRemotelyOfLogin {
  final MainApiConnection dio;

  DataSourceRemotelyOfGameImpl({required this.dio});

  @override
  Future<BasedLoginModel> getLoginDataRemotely({required String email, required String password}) async {

    final response = await dio.post(
      url: '${Connection.baseURL}${dio.postLoginEndPoint}',
      queryParameters: {
        ...MainApiConnection.apiHeaders,
      },
      data: {
        'email':email,
        'password':password
      }
    );
    if (dio.validResponse(response.statusCode!)) {
      return BasedLoginModel.fromJson(response.data);
    } else {
      throw response.data['msg'];
    }
  }
}
