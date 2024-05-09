import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/app_color.dart';
import '../../../../core/theme_text.dart';

class CardReport extends StatelessWidget{
  const CardReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(.2))
      ),
      // width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.all(10),
      child:

      SizedBox(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 70,
              width: 80,
              child: CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 7,
                animation: true,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.5,
                center: new Text("100%"),
                progressColor: Colors.green,
              ),
            ),
            5.pw,
            Container(
              width:MediaQuery.of(context).size.width-(80+60),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'test',
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Lesson 1',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text('Score  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                            ),),
                          Text(
                            "${21} day Left",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.redColor,
                                fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                      10.pw
                      //
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}