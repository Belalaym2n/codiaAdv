import 'package:codia_adv/features/homePage/presentation/BlogSectionI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contactUs/footor.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../../footor/presentation/pages/footor_web.dart';
import '../domain/models/designModels/serviceConfig.dart';
import '../widgets/blog/blog_news.dart';
import '../widgets/carsualImage/carsualImages.dart';
import '../widgets/clientSection/our_clientsWeb.dart';
import '../widgets/mobileAppSectionInHomePage/mobileSectionInHomeDesktop.dart';
import '../widgets/ourService/animationServiceWrapper.dart';
import '../widgets/ourService/our_servicies.dart';

class HomePageWeb extends StatelessWidget {
  HomePageWeb({super.key, required this.w, required this.h});

  double h;
  double w;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebHeader(height: h, width: w),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ImageCarousel(
                      imageHeight: h * 0.9,
                      navButtonSize: w * 0.03,
                      dotBottomPadding: h * 0.1,
                      dotSize: w * 0.006,
                      dotSpacing: w * 0.003,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: h * 0.65),
                          AnimatedServicesWrapper(height: h, width: w),
                                                  ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ClientsSectionWeb(height: h, width: w),
                SizedBox(height: 30),

                ApplicationDevDesktopSection(),
                BlogWebSectionHomeScreen(width: w, height: h),
                 FootorWeb(w: w, h: h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
