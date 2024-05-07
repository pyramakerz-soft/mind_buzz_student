import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/theme_text.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../domain/entities/tests_types_model.dart';

class CardOfDetailsOfAssignment extends StatelessWidget {
  final TestModel data;
  final TestsTypesModel dataOfTypesOfTest;
  const CardOfDetailsOfAssignment(
      {Key? key, required this.data, required this.dataOfTypesOfTest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(width: 6, color: data.getColorOfTest()),
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
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 70,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        data.testName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.44,
                                overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor()
                                .hexToColor(dataOfTypesOfTest.bgColor ?? '')),
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(horizontal: 12 ,vertical: 4),
                        child: Text(
                          dataOfTypesOfTest.name ?? '',
                          style: TextStyle(
                              color: AppColor().hexToColor(
                                  dataOfTypesOfTest.textColor ?? ''),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.getFontFamily4()),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              Text(
                'Lesson ${data.lessonNum}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              3.ph,
              SizedBox(
                // height: 30,
                width: MediaQuery.of(context).size.width - 70,
                child: Row(
                  children: [
                    Expanded(
                        child: (data.teacherName != null)
                            ? Row(
                                children: [
                                  Text(
                                    "By ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          // height: 0,
                                          // letterSpacing: 0.44,
                                        ),
                                  ),
                                  Text(
                                    data.teacherName ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54
                                            // height: 0,
                                            // letterSpacing: 0.44,
                                            ),
                                  ),
                                ],
                              )
                            : const SizedBox()),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if(data.status == TestTypes.finished)...{
                              Text(
                                "${data.status}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.resetText,
                                  fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                ),
                              ),
                            }else if(data.status == TestTypes.overdue)...{
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ParentImages.timers, height: 13,),
                                  5.pw,
                                  Text('Deadline  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),),
                                  Text(
                                    "${data.status}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.redColor,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            }else if (data.status == TestTypes.dueSoon &&
                                int.tryParse(data.formattedDueDate ?? '') != null &&
                                int.parse(data.formattedDueDate ?? '') <= 7)...{
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ParentImages.timers, height: 13,),
                                  5.pw,
                                  Text('Deadline  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),),
                                  Text(
                                    "${(int.tryParse(data.formattedDueDate??'0')??0)+1} day Left",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.redColor,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            }else...{
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ParentImages.timers, height: 13,),
                                  5.pw,
                                  Text('Deadline  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),),
                                  Text(
                                    "${data.daysLeft}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.lightGreyColor4,
                                        fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            }
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
