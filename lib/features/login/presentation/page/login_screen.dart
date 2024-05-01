import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../../core/validation_text_field.dart';
import '../../../home/presentation/page/home_screen.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../bloc/login_data_bloc.dart';
import '../cubit/login_cubit.dart';
import '../widgets/button_start_game.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: kDebugMode ? 'sherif@test.com' : '');
  final TextEditingController _passwordController =
      TextEditingController(text: kDebugMode ? '123456' : '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: AppColor.lightBlueColor8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Expanded(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(AppSvgImages.iconSkyLogin),
                  Image.asset(AppImages.imageBeeLogin),
                ],
              )),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AppSvgImages.iconCoverOfLogin,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(top: 60, left: 25, right: 25),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Log in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                ),
                                28.ph,
                                TextFieldWidget(
                                  controler: _emailController,
                                  validatorTextField: (val) =>
                                      ValidationTextField.emailInput(val),
                                  hintText: 'Email',
                                ),
                                16.ph,
                                TextFieldWidget(
                                  controler: _passwordController,
                                  validatorTextField: (val) =>
                                      ValidationTextField.passwordInput(val),
                                  hintText: 'Password',
                                ),
                                16.ph,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    child: Text(
                                      'Forgot password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                40.ph,
                                BlocConsumer<LoginDataBloc, LoginDataState>(
                                    listener: (context, state) {
                                  log('##state:$state');
                                  if (state is ErrorLogin) {
                                    final snackBar = SnackBar(
                                      content: Text(state.message),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  else if (state is CompleteLogin) {
                                    context
                                        .read<LoginCubit>()
                                        .saveUserData(userData: state.userData);
                                    Utils.navigateAndRemoveUntilTo(
                                        BlocProvider(
                                            create: (_) => WhoAmICubit(),
                                            child: WhoAmIScreen()),
                                        context);
                                  }
                                }, builder: (context, state) {
                                  log('--state:$state');
                                  if (state is LoadingLoginState) {
                                    return const CupertinoActivityIndicator();
                                  }
                                  else {
                                    return BlocProvider(
                                        create: (_) => LoginCubit(),
                                        child: ButtonLogin(
                                          disableAnimation: true,
                                          dataFunction: () {
                                            context.read<LoginDataBloc>().add(
                                                LoginRequest(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text));
                                          },
                                          title: "Log In",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                        ));
                                  }
                                })
                              ]),
                        ))
                  ],
                ),
              ),
            ])));
  }
}
