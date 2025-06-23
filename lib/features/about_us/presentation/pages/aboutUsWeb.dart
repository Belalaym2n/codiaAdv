import 'package:codia_adv/features/footor/presentation/pages/footor_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../contactUs/footor.dart';
import '../../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
 import '../widgets/webItem/about_us_item.dart';

class AboutUsWeb extends StatefulWidget {
    AboutUsWeb({super.key , required this.w, required this.h});

  double h;
  double w;

  @override
  State<AboutUsWeb> createState() => _AboutUsWebState();
}

class _AboutUsWebState extends State<AboutUsWeb> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          WebHeader(
            width:widget. w,
            height:widget. h,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    AboutUsWebItem(
                      h:widget. h,
                      w:widget. w,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    FootorWeb( w:widget. w,
                      h:widget. h,)
                  ],
                )

            ),
          ),



        ],

    );
  }
}
