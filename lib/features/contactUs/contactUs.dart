import 'package:codia_adv/features/contactUs/footor.dart';
import 'package:codia_adv/features/homePage/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          Expanded(
            child: SingleChildScrollView(

            child:
            FooterSection(),
            ),
          )],
      ),
    );
  }
}
