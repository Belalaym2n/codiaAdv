import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'clientsWidget.dart';

class ClientsSection extends StatefulWidget {
  final double height;
  final double width;
  final bool isDesktop;

  const ClientsSection({
    super.key,
    this.isDesktop = true,
    required this.height,
    required this.width,
  });

  @override
  State<ClientsSection> createState() => _ClientsSectionWebState();
}

class _ClientsSectionWebState extends State<ClientsSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;
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
    if (!_startAnimation && mounted) {
      setState(() => _startAnimation = true);
    }

    if (!_startedCounting) {
      _startedCounting = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('clients-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _triggerAnimations();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.height * 0.067,
          horizontal: widget.width * 0.026,
        ),
        color: Colors.grey[50],
        child:
            !_startAnimation
                ? const SizedBox.shrink()
                : widget.isDesktop
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImage(widget.width * 0.393, widget.height * 0.737),
                    SizedBox(width: widget.width * 0.033),
                    Expanded(child: _buildClientContent()),
                  ],
                )
                : Column(
                  children: [
                    Center(
                      child: _buildImage(
                        widget.width * 0.8,
                        widget.height * 0.5,
                      ),
                    ),
                    SizedBox(height: widget.height * 0.033),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(widget.width * 0.0052),
                        child: _buildClientContent(),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildImage(double w, double h) {
    return RepaintBoundary(
      child: Animate(
        effects: [
          FadeEffect(duration: 800.ms),
          SlideEffect(begin: const Offset(-0.3, 0), duration: 800.ms),
        ],
        child: buildImage(isDesktop: widget.isDesktop, w: w, h: h),
      ),
    );
  }

  Widget _buildClientContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Animate(
          effects: [
            FadeEffect(duration: 800.ms, delay: 200.ms),
            SlideEffect(begin: const Offset(0, 0.2), duration: 800.ms),
          ],
          child: buildClientOverView(w: widget.width, h: widget.height),
        ),
        SizedBox(height: widget.height * 0.02),
        Animate(
          effects: [
            FadeEffect(duration: 800.ms, delay: 400.ms),
            SlideEffect(begin: const Offset(0.2, 0), duration: 800.ms),
          ],
          child: ourClientWidget(w: widget.width, h: widget.height),
        ),
        SizedBox(height: 0.027 * widget.height),
        Animate(
          effects: [
            FadeEffect(duration: 800.ms, delay: 600.ms),
            SlideEffect(begin: const Offset(0, 0.1), duration: 800.ms),
          ],
          child: SizedBox(
            width: widget.isDesktop ? widget.width * 0.4 : widget.width * 0.7,
            child: buildDescription(w: widget.width),
          ),
        ),
        SizedBox(height: widget.height * 0.05),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Animate(
              effects: [
                FadeEffect(duration: 800.ms, delay: 800.ms),
                ScaleEffect(begin: const Offset(0.9, 0.9), duration: 800.ms),
              ],
              child: buildHappyClients(
                h: widget.height,
                w: widget.width,
                animation: _animation,
              ),
            );
          },
        ),
      ],
    );
  }
}
