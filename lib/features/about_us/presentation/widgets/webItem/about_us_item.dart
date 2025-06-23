import 'package:codia_adv/config/utils/appImages.dart';
import 'package:codia_adv/features/about_us/domain/entities/companyFeatureEntity.dart';
import 'package:codia_adv/features/about_us/presentation/widgets/aboutUsGeneralWidgets/visionMissionValuesDesign.dart';
import 'package:flutter/material.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../aboutUsGeneralWidgets/aboutUsWidgets.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        buildIntroduction(w: w).animate().fade(duration: 400.ms).slideX(begin: -0.3),
                        const SizedBox(width: 8),
                        buildCompanyName(w: w).animate().fade(duration: 400.ms).slideX(begin: 0.3),
                      ],
                    ),
                    const SizedBox(height: 10),
                    buildCompanyType(w: w).animate().fade(duration: 400.ms).slideY(begin: 0.2),
                    const SizedBox(height: 16),
                    buildCompanyDescription().animate().fade(duration: 500.ms).slideY(begin: 0.3),
                  ],
                ),
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
          Text(
            "What Makes Us Different",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ).animate().fade().slideY(begin: 0.1),
          const SizedBox(height: 24),
          Wrap(
            spacing: 36,
            runSpacing: 36,
            alignment: WrapAlignment.center,
            children: features.asMap().entries.map((entry) {
              final i = entry.key;
              final feature = entry.value;

              return AnimatedVisibilityItem(
                delay: Duration(milliseconds: i * 250),
                child: buildCompanyFeature(
                  w: w,
                  h: h,
                  featureName: feature.featureName,
                  featureDescription: feature.featureDescription,
                  bgColor: feature.bgColor,
                  icon: feature.icon,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 60),
          MissionVisionAnimatedSection(w: w),
        ],
      ),
    );
  }

  Widget buildCompanyDescription() {
    return Row(
      children: [
        descriptionOne(w: w),
        const SizedBox(width: 30),
        descriptionTwo(w: w),
      ],
    );
  }
}

class AnimatedVisibilityItem extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const AnimatedVisibilityItem({
    Key? key,
    required this.child,
    this.delay = Duration.zero,
  }) : super(key: key);

  @override
  State<AnimatedVisibilityItem> createState() => _AnimatedVisibilityItemState();
}

class _AnimatedVisibilityItemState extends State<AnimatedVisibilityItem> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (!_visible && info.visibleFraction > 0.5) {
          setState(() {
            _visible = true;
          });
        }
      },
      child: _visible
          ? widget.child
          .animate()
          .fade(duration: 600.ms)
          .slideY(begin: 0.2)
          .then(delay: widget.delay)
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}