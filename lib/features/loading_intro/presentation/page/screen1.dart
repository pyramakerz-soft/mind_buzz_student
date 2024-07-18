import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Future<void> _checkForUpdates() async {
    // Check whether a patch is available to install.
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();

    print('isUpdateAvailable:$isUpdateAvailable');
    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      await shorebirdCodePush.downloadUpdateIfAvailable();
    }
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
    context.read<LoginDataBloc>().add(AutoLoginRequest());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.imageScreen1))),
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
            child: AnimatedBuilder(
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
          );
        }),
      ),
    );
  }
}
