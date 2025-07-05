import 'package:codia_adv/features/contactUs/widget/contactUsTablet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../widget/contactUsWeb.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(double width) => width >= 1024;
    bool isTablet(double width) => width >= 600 && width < 1024;
    bool isMobile(double width) => width < 600;
    return  LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final h = MediaQuery.of(context).size.height; // ✅ التعديل هنا
          final w = MediaQuery.of(context).size.width; // ✅ التعديل هنا

          if (isDesktop(width)) {
            return ContactUsWeb(width: w, height: h);
          } else if (isTablet(width)) {
            return ContactUsTablet(width: w, height: h);
          }
          return Container();
        },

    );
  }
}
