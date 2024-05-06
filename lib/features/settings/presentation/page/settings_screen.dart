import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/page/profile_data_screen.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/widgets/user_header_loading.dart';
import '../../../../core/app_color.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/parent_assets.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/widgets/switch_bar.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/settings_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../widgets/setting_item.dart';
import '../widgets/user_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: switchBar( context: context,title: 'Setting'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: BlocProvider<SettingsBloc>(
              create: (_) =>
                  di.sl<SettingsBloc>()..add(GetUserData()),
              child: BlocConsumer<SettingsBloc, SettingsState>(
                listener: (context, state) {
                  if (state is GetSettingsErrorInitial) {
                    if (state.message == RELOGIN_FAILURE_MESSAGE) {
                      Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                    } else {
                      final snackBar = SnackBar(
                        content: Text(state.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding:  EdgeInsets.only(top: 12.h),
                    child: Column(
                      children: [
                        if(state is GetUserDataSuccessfully)
                        UserHeader(
                          name: state.userData.name ?? '',
                          school: state.userData.school?.name ?? '',
                          image: state.userData.parentImage,
                        ),
                        if(state is GetSettingsLoadingInitial)
                        const  UserHeaderLoading(),

                        30.ph,
                        SettingItem(
                          title: 'Personal Info',
                          svgPicture: ParentImages.personalInfo,
                          onTap: (){
                            if(state is GetUserDataSuccessfully)
                            Utils.navigateTo(ProfileDataScreen(userData: state.userData,), context);
                          },
                        ),

                        SettingItem(
                          title: 'About US',
                          svgPicture: ParentImages.aboutUS,
                        ),

                        SettingItem(
                          title: 'Privacy Policy',
                          svgPicture: ParentImages.aboutUS,
                        ),

                        SettingItem(
                          title: 'Logout',
                          svgPicture: ParentImages.logout,
                          isLogout: true,
                          isLast: true,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }
}
