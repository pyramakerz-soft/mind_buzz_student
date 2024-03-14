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

////////////////////////////////////////////////////////////////////////////

  // Validating Request.
  bool validResponse(int? statusCode) {
    if (statusCode == null) {
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

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    String language = await _getAppLanguage();

    Response response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: dioOptions(language),
    );

    if (validResponse(response.statusCode)) {
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

    final response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      options: dioOptions(language),
    );
    if (validResponse(response.statusCode)) {

      return response;
    } else {
      throw response;
    }
  }

  Options dioOptions(String language, [Map<String, String?>? headers]) {
    return Options(
      // contentType: 'application/json',
      headers: {
        ...headers ?? apiHeaders,
      },
    );
  }
}
