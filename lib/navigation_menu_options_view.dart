import 'package:flutter/material.dart';

class NavigationMenuOptionView extends StatelessWidget {
  final String menuItemText;

  const NavigationMenuOptionView({super.key, required this.menuItemText});

  @override
  Widget build(BuildContext context) {
    return Text(
      menuItemText,
      style: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
    );
  }
}
