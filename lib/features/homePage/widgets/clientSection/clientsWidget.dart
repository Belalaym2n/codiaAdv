import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/utils/appColors.dart';

Widget buildImage({
  required double w,
  required double h
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset(
      'assets/images/overview01.png',
      width: w ,
      height: h  ,
      fit: BoxFit.cover,
    ),
  );
}
Widget buildDescription({
  required double w,

}) {
  return Text(
    'We pride ourselves on the satisfaction of our clients. With over a decade of experience and more than ten successful projects, our clients’ happiness is our top priority. We ensure every engagement delivers excellent results, with attentive communication, timely delivery, and exceptional quality. Join our community of happy clients and see the difference for yourself!',
    style: TextStyle(
      fontSize: w * 0.012,
      color: const Color(0xFF8d99af),
      height: 1.6,
      fontWeight: FontWeight.w500,
    ),
  );
}


Widget ourClientWidget({
  required double w,
  required double h
}){
  return Text(
    'Our Happy Clients',
    style: TextStyle(
      fontSize: w * 0.028,
      fontWeight: FontWeight.w900,
      color: const Color(0xFF161424),
      letterSpacing: 1.2,
      shadows: [
        Shadow(
          color: Colors.black12,
          blurRadius: h * 0.011,
          offset: Offset(0, h * 0.0054),
        ),
      ],
    ),
  );
}



Widget buildClientOverView({
  required double w,
  required double h
}) {
  return Container(
    width: w * 0.144,
    height: h * 0.054,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: Colors.redAccent.withOpacity(0.15),
    ),
    child: Center(
      child: Text(
        "Clients overview",
        style: TextStyle(
          fontSize: w * 0.014,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}
Widget buildHappyClients({
  required double w,
  required double h,
  required Animation<int> animation
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: w * 0.02,
      vertical: h * 0.027,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.5,
        color: const Color(0xFF8d99af),
      ),
      borderRadius: BorderRadius.circular(w * 0.01),
      color: Colors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.people_alt_rounded,
          color: Colors.redAccent,
          size: w * 0.042,
        ),
        const SizedBox(width: 24),
        Container(
          width: 1,
          height: h * 0.08,
          color: const Color(0xFF8d99af).withOpacity(0.4),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              animation.value.toString(),
              style: TextStyle(
                fontSize: w * 0.026,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF161424),
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: w * 0.0026),
            Text(
              "Happy Clients",
              style: TextStyle(
                fontSize: w * 0.012,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent.shade700,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}