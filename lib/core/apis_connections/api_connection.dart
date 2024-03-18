import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/login/domain/entities/user_data_model.dart';

class MainApiConnection {
  //Singleton
  MainApiConnection() {
    // Attach Interceptors.
    if (kDebugMode) dio.interceptors.add(_logger);
  }

  // static final ApiProvider instance = ApiProvider._();

  // Http Client
  final Dio dio = Dio();

  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  // Performance Interceptor

  // Headers
  static const Map<String, dynamic> apiHeaders = <String, dynamic>{
    'Accept': 'application/json'
  };

  ////////////////////////////// END POINTS ///////////////////////////////////
  String getGameInfoDataEndPoint = "game/game_info";
  String postLoginEndPoint = "auth/login";
  String getStudentProgramsEndPoint = "student_programs";
  String getUnitsOfProgramsEndPoint = "units";

////////////////////////////////////////////////////////////////////////////

  // Validating Request.
  bool validResponse(Response response) {
    int? statusCode = response.statusCode;
    bool? result = response.data['result'];
    if (statusCode == null || result == false) {
      return false;
    } else {
      return (statusCode >= 200 && statusCode < 300);
    }
  }
////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////// UTILS /////////////////////////////////////

  static Future<String> _getAppLanguage() async {
    return 'ar';
  }

  Future<String?> _getUserToken() async => await UserData.getToken;

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    String language = await _getAppLanguage();
    String? token = await _getUserToken();

    Response response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: dioOptions(language, token),
    );

    if (validResponse(response)) {
      return response;
    } else {
      throw response;
    }
  }
  Future<Response<dynamic>> post(
       {required String url,
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, String?>? headers,
      }) async {
    String language = await _getAppLanguage();
    String? token = await _getUserToken();

    final response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      options: dioOptions(language, token),
    );
    if (validResponse(response)) {

      return response;
    } else {
      throw response;
    }
  }

  Options dioOptions(String language, String? token, [Map<String, String?>? headers]) {
    return Options(
      // contentType: 'application/json',
      headers: {
        ...headers ?? apiHeaders,
        'Authorization': 'Bearer $token',

      },
    );
  }
}
