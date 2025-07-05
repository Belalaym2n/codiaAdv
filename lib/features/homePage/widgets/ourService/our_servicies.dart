import 'package:codia_adv/config/utils/appColors.dart';
import 'package:codia_adv/features/homePage/widgets/ourService/serviceWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/models/designModels/serviceConfig.dart';
import '../../domain/models/designModels/serviceModel.dart';
class OurServicesSectionWeb extends StatelessWidget {
  final double height;
  final double width;
    bool  isDesktop;

    OurServicesSectionWeb({
    this.isDesktop=true,
    super.key, required this.height, required this.width});

  @override
       Widget build(BuildContext context) {
      return Column(
        children: [
          SizedBox(height: height * 0.083),
          RepaintBoundary( // ← يحسّن الأداء بقوة
            child: AnimationLimiter(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 0.014 * width,
                runSpacing: 0.03 * height,
                children: List.generate(3, (index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 3,
                    child: SlideAnimation(
                      verticalOffset: 100.0,
                      curve: Curves.easeOutQuart,
                      child: FadeInAnimation(
                        curve: Curves.easeOut,
                        child: SizedBox(
                          height: isDesktop?height*0.48:height*0.38,
                          child: ServiceWidget(
                            height: height,
                            width: width,
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 0.054 * height),
        ],
      );
    }

}
