import 'package:get_it/get_it.dart';

import '../../features/games/data/datasources/data_source_local_of_game.dart';
import '../../features/games/data/datasources/data_source_remotely_of_game.dart';
import '../../features/games/data/repositories/game_repository_impl.dart';
import '../../features/games/domain/repositories/repositories_game.dart';
import '../../features/games/domain/usecases/game_use_cases.dart';
import '../../features/games/presentation/bloc/game1/game_one_bloc.dart';
import '../apis_connections/api_connection.dart';
import '../network/network_info.dart';
part 'injection_import.dart';