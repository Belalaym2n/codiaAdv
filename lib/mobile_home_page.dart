import 'package:flutter/material.dart';

import 'body_text_view.dart';
import 'contact_button_view.dart';
import 'navigation_logo_view.dart';
import 'navigation_menu_options_view.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Builder(builder: (context) {
        return Drawer(
          child: Column(
            children: [
              _navigationItemView("Our Work", context),
              _navigationItemView("Services", context),
              _navigationItemView("Solutions", context),
              _navigationItemView("Industries", context),
              _navigationItemView("Insights", context),
              _navigationItemView("About Us", context),
            ],
          ),
        );
      }),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 20,
                      color: Colors.blue,
                    ),
                  );
                }),
                const NavigationLogoView(),
                const ContactButtonView(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const BodyTextView(),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  color: Colors.amberAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _navigationItemView(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GestureDetector(
          onTap: () {
            Scaffold.of(context).closeDrawer();
          },
          child: NavigationMenuOptionView(menuItemText: title)),
    );
  }
}
