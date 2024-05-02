import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/talk_tts.dart';
import '../../../../core/vars.dart';
import '../widgets/switch_bar.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import 'home_parent_screen.dart';
import 'home_screen.dart';

class BasedHomeScreen extends StatelessWidget {
  const BasedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<WhoAmICubit>().state;
    // return BlocConsumer<WhoAmICubit, int>(builder: (context, state) {
      return
        Scaffold(
      backgroundColor: Colors.white,
      appBar: switchBar( context: context, isStudent: currentPage??0),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: currentPage==1?const HomeScreen():const HomeParentScreen(),
      ),
    );
      // }, listener: (BuildContext context, int state) {  },);
  }}