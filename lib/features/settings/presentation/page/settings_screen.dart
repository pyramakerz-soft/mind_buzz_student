import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/page/profile_data_screen.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/widgets/user_header_loading.dart';

import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/parent_assets.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/bloc/get_programs_home_bloc.dart';
import '../../../home/presentation/widgets/switch_bar.dart';
import '../../../loading_intro/presentation/bloc/loading_cubit.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/setting_item.dart';
import '../widgets/user_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: customAppBar( context: context,title: 'Settings'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: BlocConsumer<LoginDataBloc, LoginDataState>(
              listener: (context, state) {},
              builder: (context, state) {
                LoginDataBloc bloc = context.read<LoginDataBloc>();
                return Padding(
                  padding:  EdgeInsets.only(top: 12.h),
                  child: Column(
                    children: [
                      UserHeader(
                        name: bloc.userData?.name ?? '',
                        school: bloc.userData?.school?.name ?? '',
                        image: bloc.userData?.parentImage,
                      ),
                      if(state is LoadingLoginState)
                      const  UserHeaderLoading(),

                      30.ph,

                      SettingItem(
                        title: 'Personal Info',
                        svgPicture: ParentImages.personalInfo,
                        onTap: (){
                          Utils.navigateTo(ProfileDataScreen(userData: bloc.userData!,), context);
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

                      BlocProvider<GetProgramsHomeBloc>(
                        create: (_) => di.sl<GetProgramsHomeBloc>(),
                        child: SettingItem(
                          title: 'Logout',
                          svgPicture: ParentImages.logout,
                          isLogout: true,
                          isLast: true,
                          onTap: (){
                            di.sl<GetProgramsHomeBloc>()
                              ..add(LogOutRequest());

                            Utils.navigateAndRemoveUntilTo(
                                BlocProvider(
                                    create: (_) => LoadingCubit(),
                                    child: LoginScreen()),
                                context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
