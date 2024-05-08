import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  _SwitchButton createState() => _SwitchButton();
}

class _SwitchButton extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
          Container(
            height: 50,

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorPadding:const EdgeInsets.all(5),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.white,
              ),
              splashBorderRadius: BorderRadius.circular(
                25.0,
              ),
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              enableFeedback:true,
              indicatorSize:TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              unselectedLabelColor: AppColor.lightGreyColor3,
              labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, fontFamily: AppTheme.getFontFamily4()
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ParentImages.imageAssignment, height: 15,),
                      5.pw,
                      const Text('Assignment')
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ParentImages.imageReports, height: 15,),
                      5.pw,
                      const Text('Reports')
                    ],
                  ),

                ),
              ],
            ),
          ),
    );
  }
}