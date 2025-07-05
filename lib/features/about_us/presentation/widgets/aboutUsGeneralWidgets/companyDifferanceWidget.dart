import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
      child:
          _visible
              ? widget.child
                  .animate()
                  .fade(duration: 600.ms)
                  .slideY(begin: 0.2)
                  .then(delay: widget.delay)
              : Opacity(opacity: 0, child: widget.child),
    );
  }
}
