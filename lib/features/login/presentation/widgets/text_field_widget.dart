import 'package:flutter/material.dart';
import '../../../../core/app_color.dart';
import '../../../../core/border_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controler;
  final Widget? rightWidget;
  final Widget? leftWidget;
  final bool? obscureText;
  final bool? readOnly;
  final String? oldData;
  final double? fontSize;
  final double? borderRadius;
  final Color? borderSideColor;
  final Color? fillColor;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator? validatorTextField;
  final void Function(String)? onChanged;

  const TextFieldWidget(
      {this.rightWidget,
        this.obscureText,
        this.oldData,
        this.leftWidget,
        this.fillColor,
        this.readOnly,
        this.onTap,
        this.keyboardType,
        this.fontSize,
        this.borderSideColor,
        this.onChanged,
        this.borderRadius,
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
            readOnly: readOnly??false,
            validator: (val) => validatorTextField!(val),
            onChanged: (val)=> onChanged!(val),
            decoration: InputDecoration(
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(borderRadius??5.0),
                //   borderSide: BorderSide(color: borderSideColor??AppColor.greyColor),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(borderRadius??5.0),
                //   borderSide:  BorderSide(color: borderSideColor??AppColor.greyColor),
                // ),
              enabledBorder: getRegularBorderStyle(),
              focusedBorder: getFocusedBorderStyle(),
                errorBorder:getErroredBorderStyle(),
                focusedErrorBorder:getErroredBorderStyle(),
                suffixIcon: rightWidget,
                isDense: true,
                filled: true,
                prefixIcon: leftWidget,
                fillColor: fillColor??Colors.white,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey, fontSize:fontSize?? 15)),
            onTap: onTap,
            obscureText: obscureText ?? false);
  }
}