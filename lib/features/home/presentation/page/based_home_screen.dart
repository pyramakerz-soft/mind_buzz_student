import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/home/presentation/page/pass_code.dart';
import 'package:mind_buzz_refactor/features/who_am_i/presentation/manager/who_am_i_state.dart';
import '../../../../core/talk_tts.dart';
import '../../../../core/vars.dart';
import '../../../botom_navigation_bar/bottom_navigation_bar.dart';
import '../widgets/switch_bar.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import 'home_parent_screen.dart';
import 'home_screen.dart';

class BasedHomeScreen extends StatelessWidget {
  const BasedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final currentPage = context.watch<WhoAmICubit>().state;
    return BlocConsumer<WhoAmICubit, WhoAmIState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: state.index == 1 ? switchBar(context: context) : null,
          body: state.index == 1 ? const HomeScreen() : const PassCode(),
        );
      },
      listener: (BuildContext context, WhoAmIState state) {},
    );
  }
}
