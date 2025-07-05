import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/sharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      actions: [Text("Dsf"), SizedBox(width: 8)],
    );
  }
}
