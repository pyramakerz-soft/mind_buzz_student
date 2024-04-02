import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/login/presentation/cubit/login_cubit.dart';
import 'core/theme_text.dart';
import 'features/chapters/presentation/pages/chapters_screens.dart';
import 'features/games/presentation/bloc/game1/game_one_bloc.dart';
import 'features/loading_intro/presentation/bloc/loading_cubit.dart';
import 'core/injection/injection_container.dart' as di;
import 'features/login/presentation/bloc/login_data_bloc.dart';
import 'features/login/presentation/page/login_screen.dart';
import 'features/math_book1/manager/current_index_cubit.dart';
import 'features/math_book1/my_home_page_book1.dart';
import 'features/math_book1/mathematical_transactions/presentation/pages/mathematical_transactions_screen.dart';
import 'features/who_am_i/presentation/manager/who_am_i_cubit.dart';
import 'features/who_am_i/presentation/pages/who_am_i_screen.dart';

Future<void> setPreferredOrientationLandscape() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> setPreferredOrientationPortrait() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setPreferredOrientationPortrait();
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
          BlocProvider<LoginDataBloc>(create: (_) => di.sl<LoginDataBloc>()),
          BlocProvider(
            create: (_) => LoginCubit(),
          ),
        ],
        child: BlocProvider(
            create: (_) => LoadingCubit(),
            child: MaterialApp(
              title: 'Mind buzz2',
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightTheme,
              home: BlocProvider(
                  create: (_) => CurrentIndexCubit(),
                  child: const MyHomePageBook1(
                    question: MathematicalTransactionsScreen(),
                  )),
            )));
  }
}
