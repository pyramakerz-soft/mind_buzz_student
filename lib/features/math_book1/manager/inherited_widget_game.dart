import 'dart:developer';

import 'package:flutter/material.dart';

import '../entities/passed_data.dart';

class DataContainer extends InheritedWidget {
  final String data;
  final Function(String) updateData;

  const DataContainer({Key? key,
    required this.data,
    required this.updateData,
    required Widget child,
  }) : super(key: key, child: child);

  static DataContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataContainer>();
  }

  @override
  bool updateShouldNotify(DataContainer oldWidget) {
    return data != oldWidget.data;
  }
}
