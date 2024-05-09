import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/parent_assets.dart';
import '../../../../core/theme_text.dart';
import '../manager/cubit/filter_reports_cubit.dart';
import '../widgets/card_report.dart';
import '../../../student_assignment/presentation/widgets/item_selected.dart';
import '../widgets/main_data.dart';

class GetReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<FilterReportsCubit>().state.selectedType;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.ph,
          Text(
            'Total Progress',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  // height: 0,
                  // letterSpacing: 0.44,
                  fontSize: 18,
                ),
          ),
          SizedBox(
            // aspectRatio: 1.70,
            height: 250,
            width: MediaQuery.of(context).size.width - 30,
            child: LineChart(
              mainData(context),
            ),
          ),
          5.ph,
          Divider(
            height: 1,
            color: AppColor.lightGreyColor5.withOpacity(.3),
          ),
          10.ph,
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  TestTypes.listOfTestTypes.length,
                  (index) => Row(
                        children: [
                          ItemSelected(
                            itemId: TestTypes.listOfTestTypes[index],
                            title: TestTypes.listOfTestTypes[index],
                            currentItemSelected:
                                TestTypes.listOfTestTypes[index] == selectedType
                                    ? true
                                    : false,
                            onTap: () {
                              context.read<FilterReportsCubit>().submitNewType(
                                  newType: TestTypes.listOfTestTypes[index]);
                            },
                          ),
                          5.pw,
                        ],
                      )),
            ),
          ),
          10.ph,
          SingleChildScrollView(child: CardReport())
        ],
      ),
    );
  }
}
