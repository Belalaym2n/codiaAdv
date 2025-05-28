import 'package:codia_adv/features/about_us/presentation/widgets/about_us_item.dart';
import 'package:codia_adv/features/homePage/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../contactUs/footor.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          Expanded(
            child: SingleChildScrollView(
               child: Column(
                children: [
                  AboutUsItem(),
                  SizedBox(
                    height: 100,
                  ),
                  FooterSection()
                ],
              )

            ),
          ),



        ],
      ),
    );
  }
}
