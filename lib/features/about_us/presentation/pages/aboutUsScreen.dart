import 'package:codia_adv/features/about_us/presentation/pages/aboutUsWeb.dart';
import 'package:codia_adv/features/about_us/presentation/widgets/webItem/about_us_item.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../contactUs/footor.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(double width) => width >= 1280;
    bool isTablet(double width) => width >= 600 && width < 1280;
    bool isMobile(double width) => width < 600;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final h = MediaQuery
              .of(context)
              .size
              .height; // ✅ التعديل هنا
          final w = MediaQuery
              .of(context)
              .size
              .width; // ✅ التعديل هنا

          if (isDesktop(width)) {
            return AboutUsWeb(
              w: w,
              h: h,

            );
          } else if (isTablet(width)) {
            Container();
          }
          return Container();
        },
      ),
    );
  }
}

