import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
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
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0);
    waitTheDataLoading();
    super.initState();
  }

  waitTheDataLoading() async {
    log('waitTheDataLoading');
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      log('value:$value');
      Utils.navigateTo(LoginScreen(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.imageScreen1,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(
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
          )
        ],
      ),
    );
  }
}
