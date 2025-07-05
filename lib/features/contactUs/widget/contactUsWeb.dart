import 'package:animate_do/animate_do.dart';
import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import 'package:codia_adv/features/footor/presentation/pages/footor_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsWeb extends StatefulWidget {
    ContactUsWeb({super.key, required this.width, required this.height});

    double height;
    double width;

    @override
  State<ContactUsWeb> createState() => _ContactUsWebState();
}

class _ContactUsWebState extends State<ContactUsWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WebHeader(
            height:widget. height,
            width: widget.width,
          ),
          Expanded(child:   SingleChildScrollView(child:  Column(
            children: [
              FadeInUp(
                 duration: Duration(
                  milliseconds: 500
                ),
                child: FootorWeb(
                  h: widget.height,
                  w: widget.width,

                ),
              ),
            ],
          )))
        ],
      ),
    );
  }
}
