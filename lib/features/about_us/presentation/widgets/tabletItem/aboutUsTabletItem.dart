import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../domain/entities/companyFeatureEntity.dart';
import '../aboutUsGeneralWidgets/aboutUsWidgets.dart';
import '../aboutUsGeneralWidgets/companyDifferanceWidget.dart';
import '../aboutUsGeneralWidgets/visionMissionValuesDesign.dart';
import '../webItem/about_us_item.dart';

class AboutUsTabletItem extends StatelessWidget {
  AboutUsTabletItem({super.key, required this.w, required this.h});

  final double h;
  final double w;
  final List<CompanyFeatureModel> features = CompanyFeatureModel.features;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 0.0524*w,
          vertical: 0.0536*h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedVisibilityItem(
              delay: 0.ms,
              child: buildHeader(w: w, h: h),
            ),
          ),
          SizedBox(height: h * 0.03),
          buildAboutCompany(w,h, isDesktop: false),
          SizedBox(height: h * 0.03),
          Align(
            alignment: Alignment.centerLeft,
            child: whatMakesUsDifferanceWidget(w,false),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(features.length, (index) {
              return  Align(
                  alignment: Alignment.centerLeft,
                  child:AnimatedVisibilityItem(
                delay: Duration(milliseconds: index * 250),
                child: buildCompanyFeature(
                  w: w,
                  isDesktop: false,
                  h: h,
                  featureName: features[index].featureName,
                  featureDescription: features[index].featureDescription,
                  bgColor: features[index].bgColor,
                  icon: features[index].icon,
                ),)
              );
            }),
          ),           MissionVisionAnimatedSection(w: w),

        ],
      ),
    );
  }
}
