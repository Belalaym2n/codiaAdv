import 'package:animate_do/animate_do.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
  import 'package:visibility_detector/visibility_detector.dart';

 import '../../../../../footor/presentation/pages/footor_web.dart';
 import '../../../domain/entities/blogEntity.dart';
import '../blogGeneralWidget/blogGeneralWidgets.dart';

class NewsItemWeb extends StatefulWidget {
  NewsItemWeb({
    super.key,
    required this.blogs,
    required this.height,
    required this.width,
  });

  List<GetBlogEntity> blogs;
  double height;
  double width;

  @override
  State<NewsItemWeb> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItemWeb> {
  late List<bool> _itemVisible;

  @override
  void initState() {
    super.initState();
    int itemCount =
        widget.blogs.length + 1; // ✅ ضيف +1 للـ footer كمان لو بتتبع حالته
    _itemVisible = List.generate(itemCount, (_) => false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_itemVisible[0]) {
        setState(() {
          _itemVisible[0] = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.blogs.length + 1,
        itemBuilder: (_, index) {
          if (index == widget.blogs.length) {
            return FootorWeb(
              w: widget.width,
              h: widget.height,
            ).animate().fade().slideY(begin: 0.2, duration: 1400.ms);
          } else {
            final blog = widget.blogs[index];
            return VisibilityDetector(
              key: Key('item_$index'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.4) {
                  setState(() {
                    _itemVisible[index] = true;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: _itemVisible[index] ? 1 : 0,
                duration: 600.ms,
                curve: Curves.easeOut,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: widget.height * 0.02),
                  padding: EdgeInsets.all(widget.width * 0.015),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AnimatedSlide(
                          offset: _itemVisible[index] ? Offset.zero : const Offset(0, 0.2),
                          duration: 600.ms,
                          curve: Curves.easeOut,
                          child: buildBlogImage(
                            path: blog.imageUrl.toString(),
                            w: widget.width * 0.4,
                            h: widget.height,
                          ),
                        ),
                      ),
                      SizedBox(width: widget.width * 0.03),
                      Expanded(
                        child: AnimatedSlide(
                          offset: _itemVisible[index] ? Offset.zero : const Offset(0.2, 0),
                          duration: 600.ms,
                          curve: Curves.easeOut,
                          child: buildNewsDescription(
                            blog: blog,
                            w: widget.width,
                            h: widget.height,
                          ),
                        ),
                      ),
                    ],
                  )

                ),
              ),
            );
          }
        },
      ),
    );
  }
}
