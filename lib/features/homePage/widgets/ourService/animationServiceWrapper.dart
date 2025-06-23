import 'package:flutter/cupertino.dart';

import 'our_servicies.dart';

class AnimatedServicesWrapper extends StatefulWidget {
  const AnimatedServicesWrapper({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  State<AnimatedServicesWrapper> createState() => _AnimatedServicesWrapperState();
}

class _AnimatedServicesWrapperState extends State<AnimatedServicesWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  ));

  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  ));

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: OurServicesSectionWeb(height: widget.height, width: widget.width),
      ),
    );
  }
}