import 'package:codia_adv/features/bottomNavAdmin/bottomNavAdmin.dart';
import 'package:codia_adv/features/contactUs/footor.dart';
import 'package:codia_adv/features/homePage/presentation/homePageItem.dart';
import 'package:codia_adv/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/about_us/presentation/pages/aboutUsScreen.dart';
 import '../features/blog/news/presentation/pages/newsScreen.dart';
import '../features/contactUs/page/contactUs.dart';
import '../features/mobileApplication/presentation/pages/mobileApplicationSection.dart';
import '../features/mobileApplication/presentation/widgets/mobileAppsSectionWep/mobileApplicationItem.dart';


class AppRoutes {
  static const String splash = "/";
   static const String signUp = "signUp/";
  static const String onBoard = "/sfsdf";
  static const String orders = "sfsffdf";
  static const String login = "sdf/";
  static const String autoLogin = "login/";
  static const String verifyScreen = "verify";
  static const String homeScreen = "/sdfsff";
   static const String aboutUs = "aboutUs/";
  static const String mobileApp = "5784/";
  static const String bottomNavAdmin = "sdfsdf/";
  static const String personDetailed = "err";
  static const String blog = "sdfsdf";
  static const String contactUs = "/sdf";
  static const String carsScreen = "carscreen";
  static const String carBooking = "carbookin";
  static const String activityBooking = "acrivity";
  static const String filterHotels = "hotels";
  static const String signInScreen = "signin";
  static const String forgetPassword = "forgetPassword";
}

class Routes {
  static onGenerate(RouteSettings setting) {
    switch (setting.name) {

      case AppRoutes.aboutUs:
        return MaterialPageRoute(
          builder: (context) => const AboutUsScreen(),
        );

      case AppRoutes.bottomNavAdmin:
        return MaterialPageRoute(
          builder: (context) => const BottomNavAdm(),
        );


      case AppRoutes.blog:
        return MaterialPageRoute(
          builder: (context) =>   NewsScreen(),
        );

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case AppRoutes.contactUs:
        return MaterialPageRoute(
          builder: (context) => const ContactUs(),
        );


      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomePageItem(),
        );
      case AppRoutes.mobileApp:
        return MaterialPageRoute(
          builder: (context) =>   MobileApplicationSection(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
