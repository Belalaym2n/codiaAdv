import 'package:codia_adv/features/homePage/presentation/BlogSectionI.dart';
import 'package:codia_adv/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

 import '../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../../footor/presentation/pages/footor_web.dart';
import '../domain/models/designModels/serviceConfig.dart';
import '../widgets/blog/blog_news.dart';
import '../widgets/carsualImage/carsualImages.dart';
import '../widgets/clientSection/our_clientsWeb.dart';
import '../widgets/mobileAppSectionInHomePage/mobileSectionInHomeDesktop.dart';
import '../widgets/ourService/animationServiceWrapper.dart';
import '../widgets/ourService/our_servicies.dart';

class HomePageWeb extends StatefulWidget {
  HomePageWeb({super.key, required this.w, required this.h});

  double h;
  double w;

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  bool showServices = false;

  @override
  void initState() {
    super.initState();
    print(widget.w);
    print(widget.h);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 700), () {
        if (mounted) {
          setState(() {
            showServices = true;
          });
        }
      });
    });
  }

  bool _showAppDevSection = false;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            WebHeader(height: widget.h, width: widget.w),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ImageCarousel(
                            imageHeight: widget.h * 0.9,
                            navButtonSize: widget.w * 0.03,
                            dotBottomPadding: widget.h * 0.1,
                            dotSize: widget.w * 0.006,
                            dotSpacing: widget.w * 0.003,
                          ),
                          if (showServices)
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(height: widget.h * 0.65),
                                  AnimatedServicesWrapper(
                                    height: widget.h,
                                    width: widget.w,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 0.04*widget.h),
                      VisibilityDetector(
                        key: const Key('clients-section-outer'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction < 0.25 && !_showAppDevSection) {
                            setState(() {
                              _showAppDevSection = true;
                            });
                          }
                        },
                        child: ClientsSection(
                          isDesktop: true,
                          height: widget.h,
                          width: widget.w,
                        ),
                      ),
                      SizedBox(height: 0.04*widget.h),
                      _showAppDevSection
                          ? ApplicationDevService(
                        h: widget.h,
                        w: widget.w,
                      )
                          : SizedBox(height: 300),
                      BlogSectionHomeScreen(width: widget.w, height: widget.h),
                      FootorWeb(w: widget.w, h: widget.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
