import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../addApplication/domain/entities/applicationEntity.dart';
import '../sharedWidget/aboutApp.dart';

class AnimationMobileAppsSection extends StatefulWidget {
  final double height;
  final double width;
  final int index;
  final List<ApplicationEntity> apps;
  final bool animateOnScrollDownOnly;
  final Set<int> animatedIndexes;

  const AnimationMobileAppsSection({
    Key? key,
    required this.height,
    required this.index,
    required this.width,
    required this.apps,
    required this.animatedIndexes,
    this.animateOnScrollDownOnly = true,
  }) : super(key: key);

  @override
  State<AnimationMobileAppsSection> createState() => _AnimationMobileAppsSectionState();
}

class _AnimationMobileAppsSectionState extends State<AnimationMobileAppsSection> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.index == 0 || widget.animatedIndexes.contains(widget.index)) {
      isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('app-${widget.index}'),
      onVisibilityChanged: (info) {
        if (!isVisible && info.visibleFraction > 0.05) {
          setState(() {
            isVisible = true;
            widget.animatedIndexes.add(widget.index);
          });
        }
      },
      child: Animate(
        effects: !isVisible
            ? [FadeEffect(duration: 700.ms), SlideEffect(begin: Offset(0.2, 0), duration: 700.ms)]
            : [],
        child: Container(
          padding: EdgeInsets.all(widget.width * 0.01),
          height: widget.height * 0.75,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppImages(),
              SizedBox(width: widget.width * 0.015),
              SizedBox(
                width: widget.width * 0.32,
                child: appDetails(
                  addAnimation: true,
                  h: widget.height,
                  w: widget.width,
                  index: widget.index,
                  apps: widget.apps,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppImages() {
    return Container(
      height: widget.height * 0.737,
      padding: EdgeInsets.all(widget.width * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.width * 0.01),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _animatedImage(widget.apps[widget.index].image1, delay: 0),
            _animatedImage(widget.apps[widget.index].image2, delay: 300),
            _animatedImage(widget.apps[widget.index].image3, delay: 600),
            _animatedImage(widget.apps[widget.index].image4, delay: 900),
          ],
        ),
      ),
    );
  }

  Widget _animatedImage(String path, {int delay = 0}) {
    final image = _buildImageCard(path);
    return Padding(
      padding: EdgeInsets.only(right: widget.width * 0.01),
      child: widget.animateOnScrollDownOnly && !isVisible
          ? image
          .animate(delay: Duration(milliseconds: delay))
          .fade(duration: 700.ms)
          .slideX(begin: -0.2)
          : image,
    );
  }

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.width * 0.01),
      child: Container(
        width: widget.width * 0.13,
        height: widget.height * 0.67,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(widget.width * 0.01),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Image.network(imagePath, fit: BoxFit.fill),
      ),
    );
  }
}