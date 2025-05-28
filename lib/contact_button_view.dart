import 'package:flutter/material.dart';

class ContactButtonView extends StatelessWidget {
  const ContactButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(
          "Contact",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
