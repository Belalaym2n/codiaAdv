import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../domain/entities/blogEntity.dart';
 import '../blogGeneralWidget/blogGeneralWidgets.dart';
class AnimatedBlogCardWeb extends StatefulWidget {
  final GetBlogEntity blog;
  final double width;
  final double height;
  final int index;

  const AnimatedBlogCardWeb({
    Key? key,
    required this.blog,
    required this.width,
    required this.height,
    required this.index,
  }) : super(key: key);

  @override
  State<AnimatedBlogCardWeb> createState() => _AnimatedBlogCardState();
}

class _AnimatedBlogCardState extends State<AnimatedBlogCardWeb> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    // Show first item instantly
    if (widget.index == 0) {
      isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.blog.id.toString()),
      onVisibilityChanged: (info) {
        if (!isVisible && info.visibleFraction > 0.2) {
          setState(() => isVisible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: isVisible
            ? FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: 100 * widget.index),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: widget.height * 0.02),
            padding: EdgeInsets.all(widget.width * 0.015),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: buildBlogImage(
                    path: widget.blog.imageUrl.toString(),
                    w: widget.width * 0.4,
                    h: widget.height,
                  ),
                ),
                SizedBox(width: widget.width * 0.03),
                Expanded(
                  flex: 1,
                  child: buildNewsDescription(
                    blog: widget.blog,
                    w: widget.width,
                    h: widget.height,
                  ),
                ),
              ],
            ),
          ),
        )
            : SizedBox(height: widget.height * 0.7),
      ),
    );
  }
}
