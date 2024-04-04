import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';

class LoadingCubit extends Cubit<Artboard?> {
  Artboard? riveArtboard;
  LoadingCubit() : super(null);

}
