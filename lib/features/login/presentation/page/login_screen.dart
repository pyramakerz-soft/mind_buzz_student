import 'dart:developer';

import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/assets_animation.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../../core/validation_text_field.dart';
import '../../../../core/widgets/button_start_game.dart';
import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../bloc/login_data_bloc.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: kDebugMode ? 'sherif@test.com' : '');
  final TextEditingController _passwordController =
      TextEditingController(text: kDebugMode ? '123456' : '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final showPassword =
        context.select((LoginCubit value) => value.state.showPassword) ?? true;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColor.lightBlueColor8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            40.ph,
            const Flexible(flex: 1, child: LoginAnimatedVectors()),
            Flexible(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Welcome',
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .titleMedium
                            //       ?.copyWith(
                            //         color: AppColor.darkBlueColor,
                            //         fontSize: 40,
                            //         fontWeight: FontWeight.w700,
                            //         fontFamily: AppTheme.getFontFamily5(),
                            //       ),
                            // ),
                            // StrokedText(
                            //   text: 'Log In',
                            //   isDisabled: false,
                            //   fontSize: 42,
                            //   strokeWidth: 2.5,
                            //   hasShadows: true,
                            // ),
                            28.ph,
                            TextFieldWidget(
                                controler: _emailController,
                                validatorTextField: (val) =>
                                    ValidationTextField.emailInput(val),
                                hintText: 'Email',
                                borderSideColor: AppColor.borderGreyColor,
                                onChanged: (val) {
                                  if (_emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty) {
                                    context
                                        .read<LoginCubit>()
                                        .updateDisableButton(supState: true);
                                  } else {
                                    context
                                        .read<LoginCubit>()
                                        .updateDisableButton(supState: false);
                                  }
                                }),
                            16.ph,
                            TextFieldWidget(
                                controler: _passwordController,
                                validatorTextField: (val) =>
                                    ValidationTextField.passwordInput(val),
                                hintText: 'Password',
                                borderSideColor: AppColor.borderGreyColor,
                                obscureText: showPassword,
                                rightWidget: IconButton(
                                  onPressed: () {
                                    context
                                        .read<LoginCubit>()
                                        .updateTheShowPassword();
                                  },
                                  icon: Icon(
                                    showPassword == true
                                        ? CupertinoIcons.eye_slash_fill
                                        : CupertinoIcons.eye_fill,
                                    color: Colors.grey,
                                  ),
                                ),
                                onChanged: (val) {
                                  if (_emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty) {
                                    context
                                        .read<LoginCubit>()
                                        .updateDisableButton(supState: true);
                                  } else {
                                    context
                                        .read<LoginCubit>()
                                        .updateDisableButton(supState: false);
                                  }
                                }),
                            16.ph,
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: Text(
                                  'Forgot password?',
                                  style: Theme.of(context).textTheme.titleSmall,
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
                              } else if (state is CompleteLogin) {
                                context
                                    .read<LoginCubit>()
                                    .saveUserData(userData: state.userData);
                                Utils.navigateAndRemoveUntilTo(
                                    const WhoAmIScreen(), context);
                              }
                            }, builder: (context, state) {
                              log('--state:$state');
                              if (state is LoadingLoginState) {
                                return Container(
                                  height: 60,
                                  child: Center(
                                      child: CupertinoActivityIndicator()),
                                );
                              } else {
                                return BlocConsumer<LoginCubit,
                                        LoginStateInitial>(
                                    listener: (context, supLoginState) {},
                                    builder: (context, supLoginState) {
                                      return ButtonLogin(
                                        applyFontFamily5: true,
                                        fontSize: 35,
                                        playButton:
                                            supLoginState.disableButton == null
                                                ? (_emailController
                                                            .text.isEmpty ||
                                                        _passwordController
                                                            .text.isEmpty)
                                                    ? false
                                                    : true
                                                : (supLoginState.disableButton),
                                        disableAnimation: false,
                                        dataFunction: () {
                                          if (!_formKey.currentState!
                                              .validate()) {
                                            return;
                                          }
                                          _formKey.currentState!.save();
                                          if ((supLoginState.disableButton ==
                                                      null
                                                  ? true
                                                  : (supLoginState
                                                      .disableButton)) !=
                                              true) {
                                            return;
                                          }
                                          context.read<LoginDataBloc>().add(
                                              LoginRequest(
                                                  email: _emailController.text,
                                                  password: _passwordController
                                                      .text));
                                        },
                                        title: "Log in",
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                      );
                                    });
                              }
                            }),
                            120.ph,
                          ]),
                    ),
                  )),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Stack(
            //     children: [
            //       SvgPicture.asset(
            //         AppSvgImages.iconCoverOfLogin,
            //         width: MediaQuery.of(context).size.width,
            //         fit: BoxFit.fill,
            //       ),
            //       Container(
            //           width: MediaQuery.of(context).size.width,
            //           padding:
            //               const EdgeInsets.only(top: 60, left: 25, right: 25),
            //           child: SingleChildScrollView(
            //             child: Form(
            //               key: _formKey,
            //               autovalidateMode:
            //                   AutovalidateMode.onUserInteraction,
            //               child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       "Log in",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .headlineLarge
            //                           ?.copyWith(
            //                               fontSize: 24,
            //                               fontWeight: FontWeight.w600),
            //                     ),
            //                     28.ph,
            //                     TextFieldWidget(
            //                         controler: _emailController,
            //                         validatorTextField: (val) =>
            //                             ValidationTextField.emailInput(val),
            //                         hintText: 'Email',
            //                         onChanged: (val) {
            //                           if (_emailController.text.isNotEmpty &&
            //                               _passwordController
            //                                   .text.isNotEmpty) {
            //                             context
            //                                 .read<LoginCubit>()
            //                                 .updateDisableButton(
            //                                     supState: true);
            //                           } else {
            //                             context
            //                                 .read<LoginCubit>()
            //                                 .updateDisableButton(
            //                                     supState: false);
            //                           }
            //                         }),
            //                     16.ph,
            //                     TextFieldWidget(
            //                         controler: _passwordController,
            //                         validatorTextField: (val) =>
            //                             ValidationTextField.passwordInput(
            //                                 val),
            //                         hintText: 'Password',
            //                         obscureText: showPassword,
            //                         rightWidget: IconButton(
            //                           onPressed: () {
            //                             context
            //                                 .read<LoginCubit>()
            //                                 .updateTheShowPassword();
            //                           },
            //                           icon: Icon(showPassword == true
            //                               ? CupertinoIcons.eye_fill
            //                               : CupertinoIcons.eye_slash_fill, color: Colors.grey,),
            //                         ),
            //                         onChanged: (val) {
            //                           if (_emailController.text.isNotEmpty &&
            //                               _passwordController
            //                                   .text.isNotEmpty) {
            //                             context
            //                                 .read<LoginCubit>()
            //                                 .updateDisableButton(
            //                                 supState: true);
            //                           } else {
            //                             context
            //                                 .read<LoginCubit>()
            //                                 .updateDisableButton(
            //                                 supState: false);
            //                           }
            //                         }),
            //                     16.ph,
            //                     Align(
            //                       alignment: Alignment.centerRight,
            //                       child: GestureDetector(
            //                         child: Text(
            //                           'Forgot password?',
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .titleSmall,
            //                         ),
            //                       ),
            //                     ),
            //                     40.ph,
            //                     BlocConsumer<LoginDataBloc, LoginDataState>(
            //                         listener: (context, state) {
            //                       log('##state:$state');
            //                       if (state is ErrorLogin) {
            //                         final snackBar = SnackBar(
            //                           content: Text(state.message),
            //                         );
            //                         ScaffoldMessenger.of(context)
            //                             .showSnackBar(snackBar);
            //                       } else if (state is CompleteLogin) {
            //                         context.read<LoginCubit>().saveUserData(
            //                             userData: state.userData);
            //                         Utils.navigateAndRemoveUntilTo(
            //                             const WhoAmIScreen(), context);
            //                       }
            //                     }, builder: (context, state) {
            //                       log('--state:$state');
            //                       if (state is LoadingLoginState) {
            //                         return const CupertinoActivityIndicator();
            //                       } else {
            //                         return BlocConsumer<LoginCubit,
            //                                 LoginStateInitial>(
            //                             listener: (context, supLoginState) {},
            //                             builder: (context, supLoginState) {
            //                               return ButtonLogin(
            //                                 playButton:
            //                                     supLoginState.disableButton==null?true:(supLoginState.disableButton),
            //                                 disableAnimation: false,
            //                                 dataFunction: () {
            //                                   if (!_formKey.currentState!
            //                                       .validate()) {
            //                                     return;
            //                                   }
            //                                   _formKey.currentState!.save();
            //                                   if((supLoginState.disableButton==null?true:(supLoginState.disableButton))!=true){
            //                                     return;
            //                                   }
            //                                   context
            //                                       .read<LoginDataBloc>()
            //                                       .add(LoginRequest(
            //                                           email: _emailController
            //                                               .text,
            //                                           password:
            //                                               _passwordController
            //                                                   .text));
            //                                 },
            //                                 title: "Log In",
            //                                 width: MediaQuery.of(context)
            //                                         .size
            //                                         .width -
            //                                     50,
            //                               );
            //                             });
            //                       }
            //                     })
            //                   ]),
            //             ),
            //           ))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class LoginAnimatedVectors extends StatelessWidget {
  const LoginAnimatedVectors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // SvgPicture.asset(AppSvgImages.iconSkyLogin),
          // Image.asset(AppImages.imageBeeLogin),
          const Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: 120,
              width: 120,
              child: RiveAnimation.asset(
                AppAnimation.cloudRive,
              ),
            ),
          ),
          const Positioned(
            right: 10,
            top: 0,
            child: SizedBox(
              height: 90,
              width: 90,
              child: Opacity(
                opacity: 0.4,
                child: RiveAnimation.asset(
                  AppAnimation.cloudRive,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 50,
            top: 100,
            child: SizedBox(
              height: 100,
              width: 200,
              child: RiveAnimation.asset(
                AppAnimation.cloudRive,
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Column(
              children: [
                Image.asset(AppImages.mindBuzzLogo),
                const SizedBox(
                  height: 200,
                  width: 220,
                  child: RiveAnimation.asset(
                    AppAnimation.beeRive,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
