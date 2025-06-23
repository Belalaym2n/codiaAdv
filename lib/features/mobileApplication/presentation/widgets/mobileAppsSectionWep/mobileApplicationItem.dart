import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/mobileAppsSectionWep/animationMobileApplicationWeb.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/sharedWidget/aboutApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../contactUs/footor.dart';

class WebMobileApplicationSectionItemWeb extends StatefulWidget {
  final double height;
  final double width;
  final List<ApplicationEntity> apps;
  final bool animateOnScrollDownOnly;

  WebMobileApplicationSectionItemWeb({
    super.key,
    required this.height,
    required this.width,
    required this.apps,
    this.animateOnScrollDownOnly = true, // default = true
  });

  @override
  State<WebMobileApplicationSectionItemWeb> createState() => _MobileApplicationItemState();
}


class _MobileApplicationItemState extends State<WebMobileApplicationSectionItemWeb> {
  Set<int> animatedIndexes = {};

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkInitialVisibility();
    });
  }

  void _checkInitialVisibility() {
    if (!animatedIndexes.contains(0)) {
      setState(() {
        animatedIndexes.add(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.apps.length + 1,
      itemBuilder: (_, index) {
        if (index == widget.apps.length) {
          return FooterSection().animate().fade().slideY(begin: 0.2, duration: 800.ms);
        } else {
          return  AnimationMobileAppsSection(height: widget.height, index: index, width: widget.width,
            apps: widget.apps,   animatedIndexes: animatedIndexes,
              );
        }
      },
    );
  }


}
