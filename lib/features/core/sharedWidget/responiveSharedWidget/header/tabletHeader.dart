import 'package:flutter/material.dart';
import '../../../../../config/utils/appConstants.dart';
import 'sharedWidget.dart'; // تأكد أن المسار صحيح

class TabletHeader extends StatelessWidget {
  TabletHeader({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: width * 0.04),
          buildLogo(width, height),
          const Spacer(),
          buildActions(
            context: context,
            width: width,
            height: height,
            isDesktop: false,
          ),
          SizedBox(width: width * 0.01),
          Flexible(
            flex: 1,
            child: settingWidgetInTabAndMobile(
              context: context,
              h: height,
              w: width,
            ),
          ),
          SizedBox(width: width * 0.07),
        ],
      ),
    );
  }
}
