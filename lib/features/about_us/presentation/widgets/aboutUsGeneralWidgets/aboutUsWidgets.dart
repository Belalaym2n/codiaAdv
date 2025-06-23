import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../config/utils/appColors.dart';

// header
Widget buildHeader({required double h, required double w}) {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(16),
    shadowColor: Colors.black26,
    child: Container(
      width: 185,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dot(h: h, w: w),
          const SizedBox(width: 10),
          const Text(
            "About Us",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1D274E),
              letterSpacing: 1.3,
            ),
          ),
          const SizedBox(width: 10),
          dot(h: h, w: w),
        ],
      ),
    ),
  );
}

Widget buildIntroduction({required double w}) {
  return Text(
    "Introduction ",
    style: _sectionTitleStyle(w: w, const Color(0xFFF94C30)),
    textAlign: TextAlign.start,
  );
}
Widget dot({required double h, required double w}) => Container(
  width: 10,
  height: 10,
  decoration: BoxDecoration(
    color: AppColors.primaryColor,
    shape: BoxShape.circle,
  ),
);

// for company
Widget buildCompanyName({required double w}) {
  return Text(
    "To The Best",
    style: _sectionTitleStyle(w: w, const Color(0xFF1D274E)),
    textAlign: TextAlign.start,
  );
}

Widget buildCompanyType({required double w}) {
  return Text(
    "Software Company!",
    style: _sectionTitleStyle(w: w, const Color(0xFF1D274E)),
    textAlign: TextAlign.start,
  );
}

Widget descriptionOne({
  required double w
}) {
  return Text(
    "CodiaAdv is a software company that believes\n"
    "creativity and innovation are essential to achieving\n"
    "your marketing goals. We turn your ideas into\n"
    "a powerful network of digital achievements.",
    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black54),
    textAlign: TextAlign.start,
  );
}

Widget descriptionTwo({
  required double w
}) {
  return Text(
    "At CodiaAdv, we craft software solutions with purpose.\n"
    "Innovation fuels our mission to empower your vision.\n"
    "We believe every idea deserves to grow into success.\n"
    "Let’s build your achievement network — together.",
    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black54),
    textAlign: TextAlign.start,
  );
}

TextStyle _sectionTitleStyle(Color color, {required double w}) {
  return TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 40,
    height: 1.2,
    color: color,
  );
}

// company features
Widget buildCompanyFeature({
  required String featureName,
  required String featureDescription,
  required Color bgColor,
  required IconData icon,
  required double h, required double w
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.black38,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: 350,
        height: 110,
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: bgColor,

                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 50),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featureName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1d274e),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    featureDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
