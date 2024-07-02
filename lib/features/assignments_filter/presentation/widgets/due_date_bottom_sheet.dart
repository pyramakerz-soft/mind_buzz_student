import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/widgets/advanced_custom_button.dart';
import 'package:mind_buzz_refactor/features/choose_assignment_reports/presentation/widgets/bottom_sheet_select_day.dart';
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';

class DueDateBottomSheet extends StatefulWidget {
  const DueDateBottomSheet(
      {super.key,
      this.onSave,
      this.onReset,
      this.isFromNow = true,
      this.title});
  final String? title;
  final bool isFromNow;
  final Function(DateTime startDate, DateTime endDate)? onSave;
  final Function()? onReset;
  @override
  State<DueDateBottomSheet> createState() => _DueDateBottomSheetState();
}

class _DueDateBottomSheetState extends State<DueDateBottomSheet> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColor.blackRed,
                    blurRadius: 10,
                    offset: Offset(0, 9),
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title ?? "Assignment Date",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColor.whiteRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.42),
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "From Date",
                    style: TextStyle(
                        color: AppColor.blackRedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context0) {
                            return BottomSheetSelectDay(
                                checkStartDate:
                                    widget.isFromNow ? DateTime.now() : null,
                                currentDate: _startDate == null
                                    ? DateTime.now()
                                    : _startDate!,
                                isReport: (x) {
                                  setState(() {
                                    _startDate =
                                        DateTime.tryParse(x!) ?? DateTime.now();
                                    if (_startDate != null &&
                                        _endDate != null &&
                                        _startDate!.isAfter(_endDate!)) {
                                      _endDate = null;
                                    }
                                  });
                                });
                          });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColor.lightGreyColor2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              _startDate != null
                                  ? "${_startDate!.day}/${_startDate!.month}/${_startDate!.year}"
                                  : "DD/MM/YY",
                              style: _startDate != null
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.blackRedColor)
                                  : TextStyle(
                                      fontSize: 12,
                                      color: AppColor.lightGreyColor4),
                            ),
                          ),
                          SvgPicture.asset(AppSvgImages.calendar),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "To Date",
                    style: TextStyle(
                        color: AppColor.blackRedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context0) {
                            return BottomSheetSelectDay(
                                checkStartDate: _startDate,
                                currentDate: _endDate == null
                                    ? DateTime.now()
                                    : _endDate!,
                                isReport: (x) {
                                  setState(() {
                                    _endDate =
                                        DateTime.tryParse(x!) ?? DateTime.now();
                                  });
                                });
                          });
                      // DatePicker.showDatePicker(context, showTitleActions: true, theme: picker_theme.DatePickerTheme(doneStyle: TextStyle(color: AppColor.resetText, fontSize: 16)), onConfirm: (date) {
                      //   setState(() {
                      //     _endDate = date;
                      //   });
                      // }, currentTime: _endDate, locale: LocaleType.en);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColor.lightGreyColor2,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              _endDate != null
                                  ? "${_endDate!.day}/${_endDate!.month}/${_endDate!.year}"
                                  : "DD/MM/YY",
                              style: _endDate != null
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.blackRedColor)
                                  : TextStyle(
                                      fontSize: 12,
                                      color: AppColor.lightGreyColor4),
                            ),
                          ),
                          SvgPicture.asset(AppSvgImages.calendar),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Flexible(
                    child: AdvancedCustomButton(
                      borderColor: AppColor.darkBlueColor,
                      textColor: AppColor.darkBlueColor,
                      color: Colors.white,
                      onPress: () {
                        widget.onReset?.call();
                        setState(() {
                          _startDate = null;
                          _endDate = null;
                        });
                      },
                      labelText: 'Clear',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: AdvancedCustomButton(
                      onPress: _startDate != null && _endDate != null
                          ? () {
                              widget.onSave?.call(_startDate!, _endDate!);
                              Navigator.pop(context, {
                                'startDate': _startDate,
                                'endDate': _endDate,
                              });
                            }
                          : null,
                      labelText: 'Save',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ]),
    );
  }
}
