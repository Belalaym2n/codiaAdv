import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../config/utils/appColors.dart';
import 'clientsWidget.dart';

class ClientsSectionWeb extends StatefulWidget {
  final double height;
  final double width;

  const ClientsSectionWeb({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<ClientsSectionWeb> createState() => _ClientsSectionWebState();
}

class _ClientsSectionWebState extends State<ClientsSectionWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  bool _startAnimation = false;
  bool _startedCounting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: 10).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerAnimations() {
    if (mounted && !_startAnimation) {
      setState(() {
        _startAnimation = true;
      });
    }

    if (!_startedCounting) {
      _startedCounting = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = widget.height;
    final w = widget.width;

    return VisibilityDetector(
      key: const Key('clients-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.4 && !_startAnimation && mounted) {
          _triggerAnimations();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: h * 0.067,
          horizontal: w * 0.026,
        ),
        color: Colors.grey[50],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ✅ الصورة مع الأنيميشن
            if (_startAnimation)
              RepaintBoundary(
                child: Animate(
                  effects: [
                    FadeEffect(duration: 1000.ms),
                    SlideEffect(begin: const Offset(-0.3, 0), duration: 1000.ms, curve: Curves.easeOutBack),
                  ],
                  child: buildImage(w: w * 0.393, h: h * 0.737),
                ),
              ),

            SizedBox(width: w * 0.033),

            /// ✅ النصوص داخل عمود
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_startAnimation)
                    RepaintBoundary(
                      child: Animate(
                        effects: [
                          FadeEffect(duration: 900.ms, delay: 300.ms),
                          SlideEffect(begin: const Offset(0, 0.2), duration: 900.ms, curve: Curves.easeOutCubic),
                        ],
                        child: buildClientOverView(w: w, h: h),
                      ),
                    ),

                  SizedBox(height: h * 0.02),

                  if (_startAnimation)
                    RepaintBoundary(
                      child: Animate(
                        effects: [
                          FadeEffect(duration: 900.ms, delay: 600.ms),
                          SlideEffect(begin: const Offset(0.2, 0), duration: 900.ms),
                        ],
                        child: ourClientWidget(w: w, h: h),
                      ),
                    ),

                  const SizedBox(height: 20),

                  if (_startAnimation)
                    RepaintBoundary(
                      child: Animate(
                        effects: [
                          FadeEffect(duration: 900.ms, delay: 900.ms),
                          SlideEffect(begin: const Offset(0, 0.1), duration: 900.ms),
                        ],
                        child: buildDescription(w: w),
                      ),
                    ),

                  SizedBox(height: h * 0.054),

                  if (_startAnimation)
                    RepaintBoundary(
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Animate(
                            effects: [
                              FadeEffect(duration: 1000.ms, delay: 1200.ms),
                              ScaleEffect(
                                begin: const Offset(0.9, 0.9),
                                duration: 1000.ms,
                                curve: Curves.easeOutBack,
                              ),
                            ],
                            child: buildHappyClients(
                              h: h,
                              w: w,
                              animation: _animation,
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
