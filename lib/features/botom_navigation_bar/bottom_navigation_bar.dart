import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../core/app_color.dart';
import '../../core/parent_assets.dart';
import '../calender/presentation/page/calender_screen.dart';
import '../home/presentation/page/home_parent_screen.dart';
import '../login/presentation/bloc/login_data_bloc.dart';
import '../notification/presentation/page/notification_screen.dart';
import '../settings/presentation/page/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int? currentTab = 0;

  switchScreens(int index) {
    List<Widget> screens = [
      HomeParentScreen(),
      CalenderScreen(),
      NotificationsScreen(),
      SettingsScreen(),
    ];
    return screens[index];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          switchScreens(currentTab!),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleNavBar(
              activeIndex: currentTab!,
              color: Colors.white,
              shadowColor: Colors.grey[300]!,
              circleWidth: 55,
              circleColor: AppColor.darkBlueColor,
              elevation: 5,
              circleShadowColor: Colors.grey[300]!,
              cornerRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              height: 65,
              activeIcons: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    ParentImages.homeIcon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    ParentImages.calender,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.string(
                    ParentImages.notificationOutlineIcon('3'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    ParentImages.settings,
                  ),
                ),
              ],
              inactiveIcons: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ParentImages.homeOutline),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: size.height * 0.013),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ParentImages.calenderOutline),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Calender",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: size.height * 0.013),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(
                      ParentImages.notificationIcon(
                          "${context.read<LoginDataBloc>().userData?.count ?? 0}"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Notifications",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: size.height * 0.013),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ParentImages.settingsOutline),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Settings",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: size.height * 0.013),
                    )
                  ],
                ),
              ],
              onTap: (index) {
                setState(() {
                  currentTab = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
