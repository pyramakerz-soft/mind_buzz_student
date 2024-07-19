import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rive/rive.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../bloc/loading_cubit.dart';

class Screens1 extends StatefulWidget {
  const Screens1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Screens1();
  }
}

class _Screens1 extends State<Screens1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final shorebirdCodePush = ShorebirdCodePush();
  bool? superIsUpdateAvailable;

  Future<void> _checkForUpdates() async {
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();
    setState(() {
      superIsUpdateAvailable = isUpdateAvailable;
    });
    if (isUpdateAvailable) {
      await shorebirdCodePush.downloadUpdateIfAvailable().whenComplete(() {
        _restartApp();
      });
    } else {
      context.read<LoginDataBloc>().add(AutoLoginRequest());
    }
  }

  void _restartApp() {
    Phoenix.rebirth(context);
    _checkForUpdates();
  }

  @override
  void initState() {
    _checkForUpdates();
    shorebirdCodePush
        .currentPatchNumber()
        .then((value) => print('current patch number is $value'));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.imageScreen1), fit: BoxFit.fill)),
        child: BlocConsumer<LoginDataBloc, LoginDataState>(
            listener: (context, state) {
          log('##state:$state');
          if (state is ErrorLogin) {
            Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
          } else if (state is CompleteLogin) {
            context.read<LoginCubit>().saveUserData(userData: state.userData);
            Utils.navigateAndRemoveUntilTo(WhoAmIScreen(), context);
          }
        }, builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                SizedBox(),
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-(200 * (1 - _animation.value)), 0),
                        child: Opacity(
                            opacity: _animation.value,
                            child: BlocBuilder<LoadingCubit, Artboard?>(
                                builder: (context, state) {
                              return state == null
                                  ? Image.asset(AppImages.introBee)
                                  : Rive(
                                      artboard: state,
                                      // fit: BoxFit.fitHeight,
                                      useArtboardSize: true,
                                    );
                            })),
                      );
                    }),
                if (superIsUpdateAvailable == true) ...{
                  CircularProgressIndicator(),
                  SizedBox(),
                } else ...{
                  SizedBox(),
                  SizedBox(),
                }
              ],
            ),
          );
        }),
      ),
    );
  }
}
