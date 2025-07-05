import 'package:codia_adv/features/about_us/presentation/widgets/tabletItem/aboutUsTabletItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../../../core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import '../../../footor/presentation/pages/footor_web.dart';

class AboutUsTablet extends StatefulWidget {
  AboutUsTablet({super.key, required this.w, required this.h});

  double h;
  double w;

  @override
  State<AboutUsTablet> createState() => _AboutUsTabletState();
}

class _AboutUsTabletState extends State<AboutUsTablet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer:  Drawer(
          child: DrawerScreen(
            width: widget.w,
            height: widget.h,
          ),
        ),
        body:  Column(
        children: [
          TabletHeader(height: widget.h, width: widget.w),
          Expanded(
              child: SingleChildScrollView(
              child: Column(
              children: [
          AboutUsTabletItem(w: widget.w, h: widget.h,),
          FootorWeb(isDesktop: false, w: widget.w, h: widget.h),
        ],)))
        ]

    ));
  }
}
