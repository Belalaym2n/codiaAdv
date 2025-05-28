import 'package:flutter/material.dart';
import '../../../../../config/utils/appConstants.dart';
import 'sharedWidget.dart'; // تأكد أن المسار صحيح

class TabletHeader extends StatelessWidget {
  const TabletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);

    return Text("data");
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    //   color: Colors.white,
    //   child: Row(
    //     children: [
    //       BuildCodiaName(
    //         width: AppConstants.screenWidth * (50 / 1528),
    //         height: AppConstants.screenHeight * (50 / 746),
    //         fontSize: AppConstants.screenWidth * (35 / 1528), // تقريباً 0.023 * 1528 = 35
    //       ),
    //       const SizedBox(width: 40), // مسافة مناسبة بين الشعار والقائمة
    //
    //       // قائمة الصفحات مع تمرير أفقي
    //       Expanded(
    //         flex: 3,
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               BuildPages(
    //
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //
    //       const SizedBox(width: 40), // مسافة بين الصفحات وباقي الأزرار
    //
    //       // زر الإعدادات وزر الطلب
    //       Row(
    //         children: [
    //             BuildSettingsButton(),
    //           const SizedBox(width: 16),
    //           BuildRequestButton(),
    //         ],
    //       ),
    //
    //       const SizedBox(width: 24),
    //
    //       // الفاصل العمودي
    //       const VerticalDividerWidget(),
    //
    //       const SizedBox(width: 24),
    //
    //       // معلومات الاتصال
    // //         BuildCallItem(),
    //     ],
    //   ),
    // );
  }
}
