import 'package:flutter/material.dart';

extension ScreenDimen on BuildContext {
  double screenHeight() => MediaQuery.of(this).size.height;

  double screenWidth() => MediaQuery.of(this).size.width;
}
