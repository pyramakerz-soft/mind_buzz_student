// part of 'curr_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/animation.dart';

class LoginStateInitial extends Equatable {
  int? position = 4;
  bool? showPassword;
  bool? disableButton;

  LoginStateInitial(
      {
        this.showPassword,
        this.disableButton,
        this.position,});
  LoginStateInitial copyWith({
    int? position,
    bool? showPassword,
    bool? disableButton
  }) {
    print('-${disableButton ?? this.disableButton}');
    return LoginStateInitial(
        position: position ?? this.position,
        disableButton: disableButton ?? this.disableButton,
        showPassword: showPassword ?? this.showPassword);
  }


  @override
  List<Object?> get props => [
    position,
    disableButton,
    showPassword
  ];
}
