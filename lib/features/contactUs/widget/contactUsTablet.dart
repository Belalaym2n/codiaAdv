import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import '../../footor/presentation/pages/footor_web.dart';

class ContactUsTablet extends StatelessWidget {
  ContactUsTablet({super.key, required this.height, required this.width});

  double width;

  double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerScreen(width: width, height: height)),
      body: Column(
        children: [
          TabletHeader(width: width, height: height),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeInUp(
                    duration: Duration(milliseconds: 500),
                    child: FootorWeb(isDesktop: false, h: height, w: width),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
