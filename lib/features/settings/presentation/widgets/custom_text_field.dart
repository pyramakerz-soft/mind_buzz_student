import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
        this.width = 0.9,
        this.label,
        this.number,
        this.maxLines,
        this.description = false,
        this.requiredField = false,
        this.dropDown = false,
        this.enabled = true,
        this.disabledColor,
        this.controller,
        this.validator,
        this.height,
        this.email = false, this.suffixIcon})
      : super(key: key);

  final String? label;
  final double width;
  final bool? number;
  final bool? email;
  final bool? description;
  final bool enabled;
  final Color? disabledColor;
  final bool dropDown;
  final bool requiredField;
  final int? maxLines;
  final Widget ? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? height ;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
          if(widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                widget.label ?? '',
                style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black)
              ),
            ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              cursorColor: AppColor.darkBlueColor,
              enabled: widget.enabled,
              style: Theme.of(context).textTheme.bodyLarge,
              keyboardType: widget.number != null
                  ? TextInputType.number
                  : widget.email == true
                  ? TextInputType.emailAddress
                  : TextInputType.text,
              maxLines: widget.description == true ? 6: 1,
              onChanged: (val) {},
              decoration: InputDecoration(
                //    contentPadding: EdgeInsets.zero,
                //contentPadding: EdgeInsets.only(bottom: widget.height??0.075.sh / 3, left: 4.w,right: 4.w),

                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 2.w),
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
                  suffixIcon: widget.dropDown
                      ? Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColorLight,
                  )
                      : widget.suffixIcon),
              validator: widget.validator,

            ),
          ),
        ],
      ),
    );
  }
}