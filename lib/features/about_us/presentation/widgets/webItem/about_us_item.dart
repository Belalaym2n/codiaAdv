import 'package:codia_adv/config/utils/appImages.dart';
import 'package:codia_adv/features/about_us/domain/entities/companyFeatureEntity.dart';
import 'package:codia_adv/features/about_us/presentation/widgets/aboutUsGeneralWidgets/visionMissionValuesDesign.dart';
import 'package:flutter/material.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../aboutUsGeneralWidgets/aboutUsWidgets.dart';
import '../aboutUsGeneralWidgets/companyDifferanceWidget.dart';

class AboutUsWebItem extends StatelessWidget {
  AboutUsWebItem({Key? key, required this.w, required this.h}) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    final List<CompanyFeatureModel> features = CompanyFeatureModel.features;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40),
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
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child:buildAboutCompany(
                  w,h
                )
              ),
              const SizedBox(width: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    height: h*0.3,
                    AppImages.teamImage,
                    width: w * 0.3,
                    fit: BoxFit.cover,
                  ).animate().fade(duration: 600.ms).slideX(begin: 0.4),
                ),
              ),

            ],
          ),
          const SizedBox(height: 48),
          whatMakesUsDifferanceWidget(w,false),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 36,
            alignment: WrapAlignment.center,
            children: features.asMap().entries.map((entry) {
              final i = entry.key;
              final feature = entry.value;

              return AnimatedVisibilityItem(
                delay: Duration(milliseconds: i * 250),
                child: SizedBox( width: w * 0.35
              ,child:
              buildCompanyFeature(
                  w: w,
                  h: h,
                  isDesktop: true,
                  featureName: feature.featureName,
                  featureDescription: feature.featureDescription,
                  bgColor: feature.bgColor,
                  icon: feature.icon,
                ),
              ));
            }).toList(),
          ),
           MissionVisionAnimatedSection(w: w),
        ],
      ),
    );
  }


}
