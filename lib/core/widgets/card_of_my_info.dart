import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../features/home/presentation/bloc/get_programs_home_bloc.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/page/login_screen.dart';
import '../app_color.dart';
import '../assets_images.dart';
import '../assets_svg_images.dart';
import '../utils.dart';

class CardOfMyInfo extends StatelessWidget {
  final bool? showLogOut;
  final bool? showBackButton;
  const CardOfMyInfo({Key? key, this.showLogOut, this.showBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            15.pw,
            if( userData?.parentImage!= null)
              CircleAvatar(
                radius: 22.h,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  userData!.parentImage!,
                ),
              )
            else
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AppImages.imagePersonAvatar,
                width: 22.h,
              ),
            ),
            10.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width-100,
                  child: Text(
                    'Hi ${userData?.name ?? ''} !',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(userData?.school?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            )
          ],
        ),
        if (showLogOut == true) ...{
          GestureDetector(
              onTap: () {
                Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                di.sl<GetProgramsHomeBloc>().add(LogOutRequest());
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.darkBlueColor3),
                  child: SvgPicture.asset(
                    AppSvgImages.iconLogout,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  )))
        }
      ],
    );
  }
}
