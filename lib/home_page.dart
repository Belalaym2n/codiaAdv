import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_home_page.dart';
import 'mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return   LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const DesktopHomePage();
        } else if (constraints.maxWidth >= 600) {
          return const MobileHomePage();  // أضفنا التابلت هنا
        } else {
          return const MobileHomePage();
        }
      },
    );
  }
}
