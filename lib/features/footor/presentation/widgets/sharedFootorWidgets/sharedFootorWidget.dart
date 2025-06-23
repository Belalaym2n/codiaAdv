import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../config/utils/appColors.dart';

Widget buildFooterHeader({
 required double w
}) {
  return Animate(
    effects: [
      FadeEffect(
        duration: Duration(seconds: 2),
        curve: Curves.easeInOutSine,
        delay: Duration(milliseconds: 100),
      ),
    ],
    onPlay: (controller) => controller.repeat(),
    child: Text(
      "Let’s build something amazing together.",
      style: TextStyle(
        fontSize: 46,
        fontWeight: FontWeight.w900,
        color: AppColors.primaryColor,
        letterSpacing: 1.2,
      ),
      textAlign: TextAlign.center,
    ),
  );
}


Widget buildLineFooter({
  required double w
}) {
  return Container(
    width: 900,
    height: 3,
    decoration: BoxDecoration(
      color: Color(0xFF3c0c18),
      borderRadius: BorderRadius.circular(2),
    ),
  );
}

Widget buildCompanyNameForFootor({
  required double w
}) {
  return Text(
    "© 2025 CodiaAdv. All rights reserved.",
    style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
  );
}