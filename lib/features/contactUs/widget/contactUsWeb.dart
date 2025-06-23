import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import 'package:codia_adv/features/footor/presentation/pages/footor_web.dart';
import 'package:flutter/cupertino.dart';

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
    return Column(
      children: [
        WebHeader(
          height:widget. height,
          width: widget.width,
        ),
        Expanded(child:   SingleChildScrollView(child:  Column(
          children: [
            FootorWeb(
              h: widget.height,
              w: widget.width,

            ),
          ],
        )))
      ],
    );
  }
}
