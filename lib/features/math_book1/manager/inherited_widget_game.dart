import 'package:flutter/material.dart';

class DataContainer extends InheritedWidget {
  final String data;
  final Function(String) updateData;

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
