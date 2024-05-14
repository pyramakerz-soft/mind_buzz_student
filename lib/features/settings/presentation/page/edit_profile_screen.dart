import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';

import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../../core/validation_text_field.dart';
import '../../../../core/widgets/button_start_game.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/personal_info_item.dart';


class EditProfileScreen extends StatefulWidget {
  final UserData userData;


  const EditProfileScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: 'Personal Info', backIcon: Icons.close),
      body: BlocConsumer<LoginDataBloc, LoginDataState>(
          listener: (context, state) {
            if (state is CompleteUpdatingData) {
              final snackBar = SnackBar(
                content: Text(state.message??''),
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            LoginDataBloc bloc = context.watch<LoginDataBloc>();
            if (state is LoadingLoginState) {
              return const CupertinoActivityIndicator();
            } else {
              return Container(
                width: 1.sw,
                padding: EdgeInsets.all(10.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.ph,
                        GestureDetector(
                          onTap: (){
                            bloc.add(PickImageEvent());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              if(state is UpdatingDataInitial && state.userImage!=null)
                                 CircleAvatar(
                                   radius: 40.r,
                                   backgroundImage: FileImage(state.userImage!),
                                 )
                              else
                              widget.userData.parentImage != null
                                  ? CircleAvatar(
                                      radius: 40.r,
                                      backgroundImage:
                                          NetworkImage(widget.userData.parentImage!),
                                    )
                                  : CircleAvatar(
                                      radius: 40.r,
                                      backgroundImage:
                                          AssetImage(ParentImages.defaultUserImage)),
                              10.pw,
                              SvgPicture.asset(ParentImages.editImageIcon),
                              10.pw,
                              Text('Add New Image',style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black),)
                            ],
                          ),
                        ),
                        20.ph,
                          CustomTextField(
                            label: 'Full name',
                            controller: bloc.fullNameController,
                            onChanged: (value){
                              bloc.add(ChangeInUpdateUserDataEvent());
                            },
                            validator: (value){
                              return ValidationTextField.textOnlyInput(value);
                            },



                          ),
                        20.ph,
                        CustomTextField(
                          label: 'Email',
                          enabled: false,
                          // controller: bloc.emailController,
                          // onChanged: (value){
                          //   bloc.add(ChangeInUpdateUserDataEvent());
                          // },
                          // validator: (value){
                          //  return ValidationTextField.emailInput(value);
                          // },
                        ),
                        20.ph,
                        CustomTextField(
                          label: 'Phone Number',
                          controller: bloc.phoneController,
                          number: true,
                          onChanged: (value){
                            bloc.add(ChangeInUpdateUserDataEvent());
                          },
                          validator: (value){
                            return ValidationTextField.textInput(value,length: 5);
                          },
                        ),
                        50.ph,
                        if(state is UpdatingDataLoading)
                          Center(child: CupertinoActivityIndicator())
                        else
                        ButtonLogin(
                          width: 0.9.sw,
                          title: 'Save Changes',
                          disableAnimation: true,
                          playButton: state is UpdatingDataChanged,
                          dataFunction: (){
                            if(state is UpdatingDataChanged) {
                            if (state is UpdatingDataError) {
                              // final snackBar = SnackBar(
                              //   content: Text(state.message),
                              // );
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                            }
                            if (_formKey.currentState!.validate())
                              bloc.add(UpdateUserDataEvent());
                          }
                        },
                        )

                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
