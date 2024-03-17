import 'package:flutter/material.dart';
import '../../../../core/app_color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controler;
  final Widget? rightWidget;
  final Widget? leftWidget;
  final bool? obscureText;
  final String? oldData;

  final TextInputType? keyboardType;
  final FormFieldValidator? validatorTextField;

  const TextFieldWidget(
      {this.rightWidget,
        this.obscureText,
        this.oldData,
        this.leftWidget,
        this.keyboardType,
        required this.hintText,
        this.controler,
        this.validatorTextField});
  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
            controller: controler,
            keyboardType: keyboardType,
            initialValue: oldData,
            validator: (val) => validatorTextField!(val),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: AppColor.greyColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:  BorderSide(color: AppColor.greyColor),
                ),
                suffixIcon: rightWidget,
                filled: true,
                prefixIcon: leftWidget,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15)),
            obscureText: obscureText ?? false);
  }
}