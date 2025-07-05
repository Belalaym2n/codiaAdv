import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/sharedWidget/socialMediaLinks/socialMediaLinks.dart';

Widget appDetails({
  required int index,
  required double w,
  required double h,
  bool isDesktop=true,
  required List<ApplicationEntity> apps,
}) {
  return Container(
    padding: EdgeInsets.all(w * 0.013),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(w * 0.01),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboutApp(w, h,isDesktop),

        SizedBox(height: h * 0.021),

        buildHeadline(apps, w, index),

        SizedBox(height: h * 0.016),

        buildDescription(apps, w, index, h),

        SizedBox(height: h * 0.032),

        socialMediaLinks( w: w,app: apps[index],isBlog: false),
      ],
    ),
  );
}


Widget buildDescription(
  List<ApplicationEntity> apps,
  double w,
  int index,
  double h,
) {
  return SizedBox(
    height: h * 0.37,
    child: SingleChildScrollView(
      child: Text(
        apps[index].description,
        style: TextStyle(
          fontSize: w * 0.01,
          color: Colors.grey.shade700,
          height: 1.6,
        ),
      ),
    ),
  );
}

Widget buildHeadline(List<ApplicationEntity> apps, double w, int index) {
  return Text(
    apps[index].headline,
    style: TextStyle(
      fontSize: w * 0.011,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
  );
}

Widget aboutApp(double w, double h,bool isDesktop) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: h * 0.016, horizontal: w * 0.01),
    decoration: BoxDecoration(
      color: const Color(0xFFfbe1e1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Container(
          width: w * 0.003,
          height: h * 0.02,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: w * 0.005),
        Text(
          'About this application',
          style: TextStyle(
            fontSize:isDesktop? w * 0.013:w*0.016,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF252c49),
          ),
        ),
      ],
    ),
  );
}
