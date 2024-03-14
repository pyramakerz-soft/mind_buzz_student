import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/validation_text_field.dart';
import '../bloc/login_cubit.dart';
import '../widgets/button_start_game.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const double _shadowHeight = 4;

  double height = 64 - _shadowHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.lightBlueColor8
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
        child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.iconSkyLogin),
                Image.asset(AppImages.imageBeeLogin),
              ],
            )), 
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    SvgPicture.asset(AppImages.iconCoverOfLogin, width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 60, left: 25,right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Log in",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          28.ph,
                          TextFieldWidget(
                            controler: _emailController,
                            validatorTextField: (val) =>ValidationTextField.emailInput(val),
                            hintText: 'Email',
                          ),
                          16.ph,
                          TextFieldWidget(
                            controler: _passwordController,
                            validatorTextField: (val) =>ValidationTextField.passwordInput(val),
                            hintText: 'Password',
                          ),
                          16.ph,
                          GestureDetector(child: Text('Forgot password?', style: Theme.of(context).textTheme.titleSmall,),),
                          20.ph,
                      ButtonLogin(),
                      ]))
          ],
        ),
      ),
    ])));
  }

}