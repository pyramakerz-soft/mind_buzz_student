import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mind_buzz_refactor/core/injection/injection_container.dart'
    as di;
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/button_start_game.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
import 'package:mind_buzz_refactor/features/login/presentation/bloc/login_data_bloc.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/bloc/edit_profile_cubit/edit_profile_state.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/widgets/custom_text_field.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/widgets/phone_number_text_field.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/widgets/profile_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key, required this.userData}) : super(key: key);
  final UserData userData;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _picker = ImagePicker();
  @override
  void initState() {
    _fullNameController.text = widget.userData.name ?? '';
    _emailController.text = widget.userData.email ?? '';
    _phoneNumberController.text = widget.userData.parentPhone ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(BuildContext context) async {
    final editProfileCubit = context.read<EditProfileCubit>();

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      editProfileCubit.setImage(pickedFile);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    // Email validation pattern
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (_) => di.sl<EditProfileCubit>()..setUserData(widget.userData),
      child: Scaffold(
        appBar: customAppBar(
            context: context, title: 'Personal info', backIcon: Icons.close),
        body: BlocConsumer<EditProfileCubit, EditProfileState>(
          listenWhen: (current, previous) =>
              current.isLoaded != previous.isLoaded ||
              current.isError != previous.isError,
          listener: (context, state) {
            if (state.isError) {
              final snackBar = SnackBar(
                content: Text(state.message!),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state.isLoaded) {
              context.read<LoginDataBloc>().add(AutoLoginRequest());
              const snackBar = SnackBar(
                content: Text('Updated successfully'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            final cubit = context.read<EditProfileCubit>();

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
                        onTap: () => _pickImage(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileImage(
                              image: state.selectedImage == null
                                  ? widget.userData.parentImage
                                  : state.selectedImage!.path,
                            ),
                            10.pw,
                            SvgPicture.asset('assets/svg/edit_profile.svg'),
                            10.pw,
                            Text(
                              'Add new image',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      20.ph,
                      CustomTextField(
                        label: 'Full name',
                        controller: _fullNameController,
                        onChanged: cubit.onNameChange,
                        formatter: FilteringTextInputFormatter.allow(
                            RegExp(r'[\p{L}\s]', unicode: true)),
                        maxCharacter: 20,
                        validator: _validateFullName,
                      ),
                      5.ph,
                      CustomTextField(
                        label: 'Email',
                        controller: _emailController,
                        onChanged: (value) {},
                        enabled: false,
                      ),
                      20.ph,
                      PhoneTextField(
                        label: 'Phone number',
                        controller: _phoneNumberController,
                        phoneCode: widget.userData.countryCode,
                        onChanged: (phoneNumber) =>
                            cubit.onPhoneChange(phoneNumber?.number),
                        onCountryChanged: (country) =>
                            cubit.onCountryCodeChange(country.code),
                        validator: (PhoneNumber? phoneNumber) {
                          phoneNumber?.isValidNumber();
                        },
                      ),
                      50.ph,
                      state.isLoading
                          ? const CupertinoActivityIndicator()
                          : ButtonLogin(
                              width: 0.9.sw,
                              title: 'Save changes',
                              disableAnimation: true,
                              playButton: state.isChanging,
                              dataFunction: () async {
                                if (_formKey.currentState?.validate() == true &&
                                    state.isChanging) {
                                  await cubit.updateUserData();
                                }
                              },
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
