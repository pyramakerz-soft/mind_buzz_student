// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_button.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text_field.dart';
import 'package:mind_buzz_refactor/features/choose_assignment_reports/presentation/widgets/bottom_sheet_select_day.dart';

class SelectDateWidget extends StatefulWidget {
  final Function(String, String)? onTapDone;
  final void Function(String? date, bool isFrom)? isReport;
  const SelectDateWidget({
    Key? key,
    this.onTapDone,
    this.isReport,
  }) : super(key: key);

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFieldWidget(
              controller: from,
              width: 0.08.sw,
              hint: 'DD/MM/YY',
              label: 'From Date',
              boldLabel: true,
              enabled: false,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Start Date Required';
                }
                return null;
              },
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (BuildContext context0) {
                      return BottomSheetSelectDay(
                        isFrom: true,
                        currentDate: from.text.isEmpty
                            ? DateTime.now()
                            : DateTime.parse(from.text),
                        checkEndDate:
                            to.text.isNotEmpty ? DateTime.parse(to.text) : null,
                        checkStartDate: from.text.isNotEmpty
                            ? DateTime.parse(from.text)
                            : null,
                      );
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      from.text = value.toString().substring(0, 10);
                    });
                  }
                });
              },
            ),
            20.ph,
            CustomTextFieldWidget(
              controller: to,
              width: 0.08.sw,
              hint: 'DD/MM/YY',
              label: 'To Date',
              boldLabel: true,
              enabled: false,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'End Date Required';
                }
                return null;
              },
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (BuildContext context0) {
                      return BottomSheetSelectDay(
                        isFrom: false,
                        currentDate: to.text.isEmpty
                            ? DateTime.now()
                            : DateTime.parse(to.text),
                        checkEndDate:
                            to.text.isNotEmpty ? DateTime.parse(to.text) : null,
                        checkStartDate: from.text.isNotEmpty
                            ? DateTime.parse(from.text)
                            : null,
                      );
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      to.text = value.toString().substring(0, 10);
                    });
                  }
                });
              },
            ),
            20.ph,
            if (isLoading)
              SizedBox(
                  height: 0.06.sh,
                  width: 0.8.sw,
                  child: const Center(child: CupertinoActivityIndicator()))
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    title: 'Reset',
                    width: 0.35.sw,
                    fill: false,
                    onTap: () {
                      setState(() {
                        from.clear();
                        to.clear();
                      });
                    },
                  ),
                  CustomButton(
                    title: 'Save',
                    width: 0.35.sw,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        widget.onTapDone?.call(
                            from.text.isEmpty
                                ? DateTime.now().toString().substring(0, 10)
                                : from.text,
                            to.text.isEmpty
                                ? DateTime.now().toString().substring(0, 10)
                                : to.text);
                      }
                    },
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
