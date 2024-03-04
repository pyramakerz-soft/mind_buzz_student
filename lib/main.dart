import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme_text.dart';
import 'features/loading_intro/presentation/bloc/loading_cubit.dart';
import 'features/loading_intro/presentation/page/loading_screen.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoadingCubit(),
        child: MaterialApp(
          title: 'Mind buzz2',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          home: const LoadingScreen(),
        ));
  }
}
