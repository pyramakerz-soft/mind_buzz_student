import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/intro_page/domain/entities/based_game_model.dart';
import '../connection.dart';
import '../games_types/game_types.dart';

abstract class MainApiConnection {
  //Singleton
  MainApiConnection() {
    // Attach Interceptors.
    if (kDebugMode) dio.interceptors.add(_logger);
  }

  // static final ApiProvider instance = ApiProvider._();

  // Http Client
  static final Dio dio = Dio();

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
  static const String getGameInfoDataEndPoint = "game/game_info";

////////////////////////////////////////////////////////////////////////////

  // Validating Request.
  static bool validResponse(int statusCode) => statusCode >= 200 && statusCode < 300;

////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////// UTILS /////////////////////////////////////

  static Future<String> _getAppLanguage() async {
    return 'ar';
  }
}

// class GameDataApis extends MainApiConnection {
//   Future<BasedGameModel> getGameData(GamesTypes gameIndex) async {
//     final response = await _dio.get(
//       '${Connection.baseURL}${MainApiConnection._getGameInfoDataEndPoint}/${gameIndex.index}',
//       options: Options(
//         headers: {
//           ..._apiHeaders,
//         },
//       ),
//     );
//     if (_validResponse(response.statusCode!)) {
//       return BasedGameModel.fromJson(response.data);
//     } else {
//       throw response.data['msg'];
//     }
//   }
// }
