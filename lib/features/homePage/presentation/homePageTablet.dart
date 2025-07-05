import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/drawer.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import '../../footor/presentation/pages/footor_web.dart';
import '../widgets/carsualImage/carsualImages.dart';
import '../widgets/clientSection/our_clientsWeb.dart';
import '../widgets/mobileAppSectionInHomePage/mobileSectionInHomeDesktop.dart';
import '../widgets/ourService/animationServiceWrapper.dart';
import 'BlogSectionI.dart';

class HomePageTablet extends StatefulWidget {
  HomePageTablet({super.key, required this.w, required this.h});

  double h;
  double w;

  @override
  State<HomePageTablet> createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> {
  bool showServices = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(child: DrawerScreen(width: widget.w, height: widget.h)),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              TabletHeader(height: widget.h, width: widget.w),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
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
                                      isDesktop: false,
                                      height: widget.h,
                                      width: widget.w,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 0.04 * widget.h),
                        ClientsSection(
                          isDesktop: false,
                          height: widget.h,
                          width: widget.w,
                        ),

                        ApplicationDevService(
                          h: widget.h,
                          w: widget.w,
                          isDesktop: false,
                        ),

                        BlogSectionHomeScreen(
                          isDesktop: false,
                          width: widget.w,
                          height: widget.h,
                        ),
                        SizedBox(height: 0.04 * widget.h),

                        FootorWeb(isDesktop: false, w: widget.w, h: widget.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
