// aboutUsWidgets.dart
import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../config/utils/appColors.dart';

Widget buildHeader({required double h, required double w,bool isDesktop=true}) {
  return RepaintBoundary(
    child: Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      shadowColor: Colors.black26,
      child: SizedBox(
        width: 0.121 * w,
        height: 0.067 * h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _Dot(),
            SizedBox(width: 0.006 * w),
            Text(
              "About Us",
              style: TextStyle(
                fontSize: isDesktop?0.013 * w:0.16*w,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1D274E),
                letterSpacing: 1.3,
              ),
            ),
            SizedBox(width: 0.006 * w),
            const _Dot(),
          ],
        ),
      ),
    ),
  );
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.006 * AppConstants.screenWidth,
      height: 0.013 * AppConstants.screenHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

Widget buildAboutCompany(double w, double h, {bool isDesktop = true}) {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start  ,
    mainAxisAlignment:
 MainAxisAlignment.start ,
    children: [
      Row(
        crossAxisAlignment:
      CrossAxisAlignment.start ,
        mainAxisAlignment:
            MainAxisAlignment.start ,

        children: [
          buildIntroduction(
            isDesktop: isDesktop,
            w: w,
          ).animate().fade(duration: 400.ms).slideX(begin: -0.3),
          SizedBox(width: 0.004 * w),
          buildCompanyName(
            isDesktop: isDesktop,
            w: w,
          ).animate().fade(duration: 400.ms).slideX(begin: 0.3),
        ],
      ),
      SizedBox(height: 0.013 * h),
      buildCompanyType(
        isDesktop: isDesktop,
        w: w,
      ).animate().fade(duration: 400.ms).slideY(begin: 0.2),
      SizedBox(height: 0.021 * h),
      buildCompanyDescription(
        w,
        h,
        isDesktop: isDesktop,
      ).animate().fade(duration: 500.ms).slideY(begin: 0.3),
    ],
  );
}

Widget buildCompanyDescription(double w, double h, {bool isDesktop = true}) {
  return   Row(
        children: [
          descriptionOne(w: w, isDesktop: isDesktop),
          SizedBox(width: 0.0196 * w),
          descriptionTwo(w: w, isDesktop: isDesktop),
        ],
      );

}

Widget buildIntroduction({required double w, required bool isDesktop}) {
  return Text(
    "Introduction ",
    style: _sectionTitleStyle(
      isDesktop: isDesktop,
      color: const Color(0xFFF94C30),
      w: w,
    ),
    textAlign: TextAlign.start,
  );
}

Widget buildCompanyName({required double w, required bool isDesktop}) {
  return Text(
    "To The Best",
    style: _sectionTitleStyle(
      isDesktop: isDesktop,
      color: const Color(0xFF1D274E),
      w: w,
    ),
    textAlign: TextAlign.start,
  );
}

Widget buildCompanyType({required double w, required bool isDesktop}) {
  return Text(
    "Software Company!",
    style: _sectionTitleStyle(
      isDesktop: isDesktop,
      color: const Color(0xFF1D274E),
      w: w,
    ),
    textAlign: TextAlign.start,
  );
}

Widget descriptionOne({required double w, required bool isDesktop}) {
  return Text(
    "CodiaAdv is a software company that believes\n"
    "creativity and innovation are essential to achieving\n"
    "your marketing goals. We turn your ideas into\n"
    "a powerful network of digital achievements.",
    style: TextStyle(
      fontSize: isDesktop ? 0.009 * w : 0.017 * w,
      height: 1.5,
      color: Colors.black54,
    ),
    textAlign: TextAlign.start,
  );
}

Widget descriptionTwo({required double w, required bool isDesktop}) {
  return Text(
    "At CodiaAdv, we craft software solutions with purpose.\n"
    "Innovation fuels our mission to empower your vision.\n"
    "We believe every idea deserves to grow into success.\n"
    "Let’s build your achievement network — together.",
    style: TextStyle(
      fontSize: isDesktop ? 0.009 * w : 0.017 * w,
      height: 1.5,
      color: Colors.black54,
    ),
    textAlign: TextAlign.start,
  );
}

TextStyle _sectionTitleStyle({
  required Color color,
  required double w,
  required bool isDesktop,
}) {
  return TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: isDesktop ? 0.026 * w : 0.042 * w,
    height: 1.2,
    color: color,
  );
}

Widget buildCompanyFeature({
  required String featureName,
  required String featureDescription,
  required Color bgColor,
  required IconData icon,
  bool isDesktop = true,
  required double h,
  required double w,
}) {
  return RepaintBoundary(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0.01 * w),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(0.0157 * w),
        shadowColor: Colors.black38,
        child: SizedBox(
          height: h * 0.15,
          child: Padding(
            padding: EdgeInsets.all(0.01 * w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: bgColor,
                    child: Icon(icon, color: Colors.white, size: 0.025 * w),
                  ),
                ),
                SizedBox(width: 0.0078 * w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        featureName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:isDesktop? 0.01 * w:0.014*w,
                          color: Color(0xFF1D274E),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        featureDescription,
                        style: TextStyle(
                          fontSize:  isDesktop?0.007 * w:0.011*w,
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
      ),
    ),
  );
}

Widget whatMakesUsDifferanceWidget(double w,bool isDesktop) {
  return Text(
    "What Makes Us Different",
    style: TextStyle(
      fontSize: isDesktop?0.017 * w  :0.027* w,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
  ).animate().fade().slideY(begin: 0.1);
}
