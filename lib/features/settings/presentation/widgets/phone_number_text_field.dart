import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField(
      {Key? key,
      this.width = 0.9,
      this.label,
      this.maxLines,
      this.requiredField = false,
      this.enabled = true,
      this.disabledColor,
      required this.controller,
      this.validator,
      this.onChanged,
      this.onCountryChanged,
      this.height,
      this.phoneCode,
      this.suffixIcon})
      : super(key: key);

  final String? label;
  final double width;
  final bool enabled;
  final Color? disabledColor;
  final bool requiredField;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(PhoneNumber?)? validator;
  final Function(PhoneNumber?)? onChanged;
  final Function(Country)? onCountryChanged;
  final double? height;
  final String? phoneCode;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  void initState() {
    // TODO: implement initState
    //widget.password=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: widget.height?? 0.11.sh,

      width: widget.width.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(widget.label ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black)),
            ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: IntlPhoneField(
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              initialCountryCode: widget.phoneCode
                  ?? WidgetsBinding.instance.window.locale.countryCode,
              cursorColor: AppColor.darkBlueColor,
              enabled: widget.enabled,
              disableLengthCheck: true,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: !widget.enabled ? Colors.grey : null),
              keyboardType: TextInputType.number,
              onChanged: widget.onChanged,
              onCountryChanged: widget.onCountryChanged,
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: Colors.white
              ),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  fillColor: AppColor.textFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  // prefixIcon: widget.suffixIcon,
                  suffixIcon: widget.suffixIcon),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
