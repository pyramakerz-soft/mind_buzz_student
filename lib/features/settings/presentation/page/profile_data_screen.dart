import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/utils.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/bloc/settings_bloc.dart';

import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../widgets/personal_info_item.dart';
import 'edit_profile_screen.dart';

class ProfileDataScreen extends StatelessWidget {
  final UserData userData;
  const ProfileDataScreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginDataBloc, LoginDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginDataBloc bloc = context.read<LoginDataBloc>();
        return Scaffold(
          appBar: customAppBar(
              context: context,
              title: 'Personal Info',
              action: GestureDetector(
                onTap: () {
                  bloc.add(InitializeUpdateUserDataEvent());
                  Utils.navigateTo(
                      EditProfileScreen(
                        userData: bloc.userData!,
                      ),
                      context);
                },
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      color: AppColor.whiteRed,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: SvgPicture.asset(ParentImages.editProfile),
                ),
              )),
          body: Container(
            width: 1.sw,
            padding: EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.ph,
                bloc.userData!.parentImage != null
                    ? CircleAvatar(
                        radius: 40.r,
                        backgroundImage: NetworkImage(bloc.userData!.parentImage!),
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(ParentImages.defaultUserImage)),
                20.ph,
                PersonalInfoItem(
                  title: 'Full name',
                  value: bloc.userData!.name ?? '',
                  icon: ParentImages.personalInfo,
                ),
                PersonalInfoItem(
                  title: 'Email',
                  value: bloc.userData!.email ?? '',
                  icon: ParentImages.email,
                ),
                PersonalInfoItem(
                  title: 'Phone Number',
                  value: bloc.userData!.parentPhone ?? '',
                  icon: ParentImages.phone,
                ),
                Row(
                  children: [
                    PersonalInfoItem(
                      title: 'Password',
                      value: List.generate(
                          bloc.userData!.pwLength ?? 10,
                          (index) => '*').toList().join(),
                      icon: ParentImages.lock,
                      isPassword: true,
                    ),
                    Spacer(),
                    Text('Reset',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: AppColor.resetText)),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
