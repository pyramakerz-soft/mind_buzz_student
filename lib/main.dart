import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme_text.dart';
import 'features/games/presentation/bloc/game1/game_one_bloc.dart';
import 'features/loading_intro/presentation/page/loading_screen.dart';
import 'core/injection/injection_container.dart' as di;

Future<void> setPreferredOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientation();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GameOneBloc>(create: (_) => di.sl<GameOneBloc>()),
        ],
        child: MaterialApp(
              title: 'Mind buzz2',
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightTheme,
              home: const LoadingScreen(),
            ));
  }
}
