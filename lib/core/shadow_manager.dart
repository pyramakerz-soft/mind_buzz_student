import 'package:flutter/material.dart';

import 'app_color.dart';

List<BoxShadow> getAppBarShadow() {
  return [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.03),
      offset: Offset(0, 9),
      blurRadius: 13,
    ),
  ];
}

List<BoxShadow> getContainerShadow() {
  return [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 1),
      blurRadius: 8,
    ),
  ];
}
