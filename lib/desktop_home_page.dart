import 'package:flutter/material.dart';

import 'body_text_view.dart';
import 'contact_button_view.dart';
import 'navigation_logo_view.dart';
import 'navigation_menu_options_view.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NavigationLogoView(),
                Row(
                  children: [
                    Row(
                      children: [
                        _navigationItemView("Our Work"),
                        _navigationItemView("Services"),
                        _navigationItemView("Solutions"),
                        _navigationItemView("Industries"),
                        _navigationItemView("Insights"),
                        _navigationItemView("About Us"),
                      ],
                    ),
                    const ContactButtonView(),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              const BodyTextView(),
              const SizedBox(height: 20),
              Container(
                height: 200,
                color: Colors.cyan,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _navigationItemView(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: NavigationMenuOptionView(menuItemText: title),
    );
  }
}
