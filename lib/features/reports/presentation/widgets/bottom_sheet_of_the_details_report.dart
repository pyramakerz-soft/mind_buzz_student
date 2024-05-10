import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/theme_text.dart';

class BottomSheetOfTheDetailsReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
              blurRadius: 5,
              offset: Offset(0, 9),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Report Details",
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
      10.ph,
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lesson 1 make 5',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    // width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0x1985207B)),
                    alignment: Alignment.center,
                    // padding: EdgeInsets.symmetric(horizontal: 12 ,vertical: 4),
                    child: Text(
                      'Checkpoint',
                      style: TextStyle(
                          color: Color(0xff85207B),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppTheme.getFontFamily4()),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'August 6,2024',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          const SizedBox(width: 104),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '80%',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      // color: Color(0xFF707070),
                      fontSize: 22,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0,
                      // letterSpacing: 0.44,
                    ),
              ),
              Text(
                'Pass',
                style: TextStyle(
                  color: AppColor.resetText,
                  fontSize: 18,
                  fontFamily: AppTheme.getFontFamily4(),
                  fontWeight: FontWeight.w600,
                  // height: 0.06,
                ),
              ),
            ],
          ),
        ],
      ),
      10.ph,
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(width: 6, color: AppColor.resetText),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text(
                    'Question',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColor.lightGreyColor7,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('Time',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('Stars',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('Attempts',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: AppColor.lightGreyColor7.withOpacity(.3),
            ),
            Row(
              children: [
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('1',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('3 Min',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('3 Stars',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('1',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: AppColor.lightGreyColor7.withOpacity(.1),
            ),
            Row(
              children: [
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('1',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('3 Min',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('3 Stars',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width / 4) - 12,
                  child: Text('1',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColor.lightGreyColor7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ],
        ),
      ),
      50.ph
    ]);
  }
}
