import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/pages/pie_chart_page.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/item_in_choose_parent.dart';
import 'package:mind_buzz_refactor/features/who_am_i/presentation/widgets/item_in_choose.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/utils.dart';
import '../../../../core/widgets/card_of_my_info.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program_parent.dart';
import '../widgets/switch_bar.dart';

class HomeParentScreen extends StatefulWidget {
  const HomeParentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeParentScreen();
  }
}

class _HomeParentScreen extends State<HomeParentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        switchBar(context: context),
        20.ph,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              ItemInChooseParent(
                onItemPressed: () {
                  Utils.navigateTo(
                      const PieChartPage(isAssignment: true), context);
                },
                text: 'Assignments',
                image: AppImages.assignmentsHomeImage,
                id: 0,
              ),
              24.ph,
              ItemInChooseParent(
                onItemPressed: () {
                  Utils.navigateTo(
                      const PieChartPage(isAssignment: false), context);
                },
                text: 'Reports',
                image: AppImages.reportsHomeImage,
                id: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
