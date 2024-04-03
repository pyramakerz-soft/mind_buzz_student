import 'package:flutter/material.dart';

import '../entities/passed_data.dart';

class DataContainer extends InheritedWidget {
  final PassedDataModel data;
  final Function(PassedDataModel) updateData;

  DataContainer({
    required this.data,
    required this.updateData,
    required Widget child,
  }) : super(child: child);

  static DataContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataContainer>();
  }

  @override
  bool updateShouldNotify(DataContainer oldWidget) {
    return data != oldWidget.data;
  }
}
