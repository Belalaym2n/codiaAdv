import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../domain/models/designModels/clientSectionConfig.dart';

class ClientsSection extends StatefulWidget {
  final ClientsSectionConfig config;

  const ClientsSection({super.key, required this.config});

  @override
  State<ClientsSection> createState() => _ClientsSectionState();
}

class _ClientsSectionState extends State<ClientsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: 10).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startCounting() {
    if (!_started) {
      _started = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cfg = widget.config;
    Widget buildDescription() {
      return Text(
        'We pride ourselves on the satisfaction of our clients. With over a decade of experience and more than ten successful projects, our clients’ happiness is our top priority. We ensure every engagement delivers excellent results, with attentive communication, timely delivery, and exceptional quality. Join our community of happy clients and see the difference for yourself!',
        style: TextStyle(
          fontSize: cfg.descriptionFontSize,
          color: const Color(0xFF8d99af),
          height: cfg.descriptionLineHeight,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    Widget buildHappyClients() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: cfg.buttonPaddingHorizontal,
          vertical: cfg.buttonPaddingVertical,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: cfg.buttonBorderWidth,
            color: const Color(0xFF8d99af),
          ),
          borderRadius: BorderRadius.circular(cfg.buttonBorderRadius),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_alt_rounded,
              color: Colors.redAccent,
              size: cfg.iconSize,
            ),
            SizedBox(width: 24),

            Container(
              width: cfg.separatorWidth,
              height: cfg.separatorHeight,
              color: const Color(0xFF8d99af).withOpacity(0.4),
            ),

            SizedBox(width: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _animation.value.toString(),
                  style: TextStyle(
                    fontSize: cfg.counterFontSize,
                    fontWeight:FontWeight.w800,
                    color: const Color(0xFF161424),
                    letterSpacing: cfg.counterLetterSpacing,
                  ),
                ),
                SizedBox(height: cfg.counterTextSpace),
                Text(
                  "Happy Clients",
                  style: TextStyle(
                    fontSize: cfg.counterLabelFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent.shade700,
                    letterSpacing: cfg.counterLabelLetterSpacing,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildImage() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/overview01.png',
          width: cfg.imageWidth,
          height: cfg.imageHeight,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget buildClientOverView() {
      return Container(
        width: cfg.titleContainerWidth,
        height: cfg.titleContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.redAccent.withOpacity(0.15),
        ),
        child: Center(
          child: Text(
            "Clients overview",
            style: TextStyle(
              fontSize: cfg.titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      );
    }

    return VisibilityDetector(
      key: const Key('clients-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _startCounting();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: cfg.containerPaddingVertical,
          horizontal: cfg.containerPaddingHorizontal,
        ),
        color: Colors.grey[50],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(),

            SizedBox(width: cfg.spaceBetweenImageAndText),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildClientOverView(),
                  Text(
                    'Our Happy Clients',
                    style: TextStyle(
                      fontSize: cfg.headerFontSize,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF161424),
                      letterSpacing: cfg.headerLetterSpacing,
                      shadows: [
                        Shadow(
                          color: Colors.black12,
                          blurRadius: cfg.headerShadowBlurRadius,
                          offset: Offset(0, cfg.headerShadowOffsetY),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  buildDescription(),
                  SizedBox(height: cfg.spaceAfterDescription),
                  buildHappyClients(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
