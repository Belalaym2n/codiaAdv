import 'package:codia_adv/features/about_us/presentation/pages/aboutUsTablet.dart';
import 'package:codia_adv/features/about_us/presentation/pages/aboutUsWeb.dart';
import 'package:codia_adv/features/about_us/presentation/widgets/webItem/about_us_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(double width) => width >= 1024;
    bool isTablet(double width) => width >= 600 && width < 1024;
    bool isMobile(double width) => width < 600;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          if (isDesktop(width)) {
            return AboutUsWeb(w: w, h: h);
          } else if (isTablet(width)) {
            print("tablet");
            return AboutUsTablet(w: w, h: h);
          }
          return Container();
        },
      ),
    );
  }
}
