import 'package:flutter/material.dart';

class ResponsiveHelper {
  final BuildContext context;
  final double screenWidth;
  final double screenHeight;

  ResponsiveHelper(this.context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

  double width(double size) {
    return (size / 375) * screenWidth;
  }

  double height(double size) {
    return (size / 812) * screenHeight;
  }

  double fontSize(double size) {
    return width(size);
  }
}
