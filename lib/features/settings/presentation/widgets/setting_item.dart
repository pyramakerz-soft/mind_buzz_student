

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/parent_assets.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String svgPicture;
  final bool isLast;
  final bool isLogout;
  final VoidCallback? onTap;
  const SettingItem({Key? key, required this.title , required this.svgPicture , this.onTap,
    this.isLast = false, this.isLogout = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         InkWell(
           onTap: onTap,
           child: Container(
             height: 0.05.sh,
             width: 1.sw,
             child: Row(
               children: [
                 SvgPicture.asset(svgPicture,height: 0.024.sh,),
                 SizedBox(width: 10.h,),
                 Text(title,
                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
                         fontSize: 0.022.sh,
                         fontWeight: FontWeight.w500,
                         color: isLogout? Colors.red : Colors.black)),
                 Spacer(),

                 Visibility(
                     visible: !isLogout,
                     child: Icon(Icons.arrow_forward_ios_outlined,))
               ],
             ),
           ),
         ),

         Visibility(
           visible: !isLast,
           child: Padding(
             padding:  EdgeInsets.all(10.h),
             child: Divider(),
           ),
         ),
       ],
     );
  }
}
