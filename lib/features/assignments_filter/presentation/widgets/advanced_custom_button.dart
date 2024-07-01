import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class AdvancedCustomButton extends StatelessWidget {
  Function? onPress;
  String labelText;
  bool isFilledColor;
  double fontSize;
  Color? color;
  Color? textColor;
  Color? borderColor;
  Widget? rightIcon;
  Widget? leftIcon;
  double? radiusValue;
  bool isBorderDotted;
  Color? dottedBorderColor;

  AdvancedCustomButton({
    Key? key,
    required this.onPress,
    required this.labelText,
    this.isFilledColor = true,
    this.isBorderDotted = false,
    this.fontSize = 16,
    this.color,
    this.textColor,
    this.borderColor,
    this.rightIcon,
    this.leftIcon,
    this.radiusValue,
    this.dottedBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // isBorderDotted == true
        //   ? DottedBorder(
        //       dashPattern: [8],
        //       color: dottedBorderColor ?? AppColor.primary,
        //       strokeWidth: 2,
        //       radius: Radius.circular(8),
        //       borderType: BorderType.RRect,
        //       child: button(),
        //     )
        //   :
        button();
  }

  Widget button() {
    return SizedBox(
      height: 45,
      child: MaterialButton(
        disabledColor: AppColor.lightGreyColor,
        onPressed: onPress as void Function()?,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusValue ??= 8),
          side: BorderSide(
            color: borderColor ??
                (isFilledColor || isBorderDotted
                    ? Colors.transparent
                    : AppColor.blackRedColor),
          ),
        ),
        color: isFilledColor ? color ?? (AppColor.darkBlueColor) : Colors.white,
        elevation: 0,
        //button size is between 50 to 65 according to the human ergonomics
        height: 45,

        child: Center(
          child: rightIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(labelText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor ??
                              (isFilledColor
                                  ? Colors.white
                                  : AppColor.darkBlueColor),
                          fontSize: fontSize,
                        )),
                    const SizedBox(width: 8),
                    rightIcon!,
                  ],
                )
              : leftIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        leftIcon!,
                        const SizedBox(width: 8),
                        Text(labelText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor ??
                                  (isFilledColor
                                      ? Colors.white
                                      : AppColor.darkBlueColor),
                              fontSize: fontSize,
                            )),
                      ],
                    )
                  : Text(labelText,
                      textAlign: TextAlign.center,
                      style: isBorderDotted
                          ? TextStyle(
                              color: textColor ??
                                  (isFilledColor
                                      ? Colors.white
                                      : isBorderDotted
                                          ? AppColor.darkBlueColor
                                          : AppColor.blackRedColor),
                              fontSize: fontSize,
                            )
                          : TextStyle(
                              color: textColor ??
                                  (isFilledColor
                                      ? Colors.white
                                      : isBorderDotted
                                          ? AppColor.darkBlueColor
                                          : AppColor.blackRedColor),
                              fontSize: fontSize,
                            )),
        ),
      ),
    );
  }
}
