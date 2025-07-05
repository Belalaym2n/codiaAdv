import 'package:codia_adv/features/addBlog/domain/entities/blogEntity.dart';
import 'package:codia_adv/features/blog/news/domain/entities/blogEntity.dart';
import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/sharedWidget/buttons/seeAllDetailsButton.dart';
import '../../../core/sharedWidget/commonWidgetInBlog/blogCard.dart';

class BlogsWebSectionItem extends StatefulWidget {
  final double height;
  final double width;
  bool isDesktop;
  final List<GetBlogEntity> blogItems;

  BlogsWebSectionItem({
    super.key,
    this.isDesktop = true,
    required this.height,
    required this.width,
    required this.blogItems,
  });

  @override
  State<BlogsWebSectionItem> createState() => _BlogsWebSectionState();
}

class _BlogsWebSectionState extends State<BlogsWebSectionItem>
    with TickerProviderStateMixin {
  late final List<AnimationController> _itemControllers;
  late final List<Animation<Offset>> _itemSlideAnimations;
  late final List<Animation<double>> _itemFadeAnimations;

  late final AnimationController _textController;
  late final Animation<Offset> _headlineSlide;
  late final Animation<double> _headlineFade;
  late final Animation<Offset> _descSlide;
  late final Animation<double> _descFade;
  late final Animation<Offset> _buttonSlide;
  late final Animation<double> _buttonFade;

  bool _textAnimated = false;

  @override
  void initState() {
    super.initState();

    final itemsCount = widget.blogItems.length;
    print(widget.width);
    print(widget.height);
    _itemControllers = List.generate(
      itemsCount,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );

    _itemSlideAnimations =
        _itemControllers
            .map(
              (controller) => Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeOut),
              ),
            )
            .toList();

    _itemFadeAnimations =
        _itemControllers
            .map(
              (controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeOut),
              ),
            )
            .toList();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _headlineSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _headlineFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _descSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _descFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _buttonFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _triggerItemAnimation(int index) {
    _itemControllers[index].forward();
  }

  void _triggerTextAnimation() {
    if (!_textAnimated) {
      _textAnimated = true;
      _textController.forward();
      for (int i = 0; i < _itemControllers.length; i++) {
        Future.delayed(Duration(milliseconds: 200 * i), () {
          _triggerItemAnimation(i);
        });
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _itemControllers) {
      controller.dispose();
    }
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('blog_section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _triggerTextAnimation();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.039 * widget.height,
          vertical: 0.11 * widget.height,
        ),
        child:
            widget.isDesktop
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 3, child: buildAboutBlog()),

                    /// Right Blog Cards Section
                    Expanded(flex: 4, child: buildNews()),
                  ],
                )
                : Column(
                  children: [
                    buildAboutBlog(),
                    SizedBox(height: widget.height * 0.04),

                    buildNews(),
                  ],
                ),
      ),
    );
  }

  Widget buildNews() {
    return SingleChildScrollView(
      // لو عدد البطاقات كبير
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            widget.blogItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Padding(
                padding: EdgeInsets.only(right: 0.0157 * widget.width),
                // مسافة بين البطاقات
                child: SlideTransition(
                  position: _itemSlideAnimations[index],
                  child: FadeTransition(
                    opacity: _itemFadeAnimations[index],
                    child: BlogCard(
                      height: widget.height,
                      width: widget.width,
                      // خلي العرض مناسب عشان يبقى جنب بعض
                      image: item.imageUrl,
                      date: item.blogDate,
                      title: item.headline,
                      description: item.description,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget buildAboutBlog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: _headlineSlide,
          child: FadeTransition(
            opacity: _headlineFade,
            child: headlineBlog(w: widget.height, isDesktop: widget.isDesktop),
          ),
        ),
        SizedBox(height: 0.0268 * widget.height),
        SlideTransition(
          position: _descSlide,
          child: FadeTransition(
            opacity: _descFade,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    widget.isDesktop ? widget.width * 0.29 : widget.width * 0.5,
              ), // أو أي عرض مناسب
              child: subHeadlineBlog(
                w: widget.height,
                isDesktop: widget.isDesktop,
              ),
            ),
          ),
        ),
        SizedBox(height: 0.049 * widget.height),
        SlideTransition(
          position: _buttonSlide,
          child: FadeTransition(
            opacity: _buttonFade,
            child: seeAllDetailsButton(
              navigate: () {
                Navigator.pushNamed(context, AppRoutes.blog);
              },
              name: "See All Blogs",
            ),
          ),
        ),
        SizedBox(height: 0.137 * widget.height),
      ],
    );
  }
}
