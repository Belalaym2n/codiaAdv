import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/cupertino.dart';

class MenuModel {
  String pageName;
  final VoidCallback navigate;
  MenuModel({required this.navigate, required this.pageName});

  static List<MenuModel> getItems(BuildContext context) {
    return [
      MenuModel(
        navigate: () {
          print("Navigating to Home...");

          Navigator.pushNamed(context, AppRoutes.homeScreen);
        },
        pageName: "Home",
      ),

      MenuModel(
        navigate: () {
          Navigator.pushNamed(context, AppRoutes.aboutUs);
        },
        pageName: "About Us",
      ),

      MenuModel(
        navigate: () {
          Navigator.pushNamed(context, AppRoutes.mobileApp);
        },
        pageName: "Mobile Application",
      ),



      MenuModel(
        navigate: () {
          Navigator.pushNamed(context, AppRoutes.blog);
        },
        pageName: "Blog",
      ),

      MenuModel(
        navigate: () {
          Navigator.pushNamed(context, AppRoutes.contactUs);
        },
        pageName: "Contact",
      ),
    ];
  }
}
