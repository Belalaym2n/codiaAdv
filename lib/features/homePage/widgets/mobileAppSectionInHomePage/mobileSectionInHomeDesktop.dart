import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:visibility_detector/visibility_detector.dart';

import '../../../../routing/appRoutes.dart';
import '../../../core/sharedWidget/buttons/seeAllDetailsButton.dart';

class ApplicationDevService extends StatefulWidget {
  ApplicationDevService({
    super.key,
    this.isDesktop = true,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  bool isDesktop;

  @override
  State<ApplicationDevService> createState() =>
      _ApplicationDevDesktopSectionState();
}

class _ApplicationDevDesktopSectionState extends State<ApplicationDevService>
    with TickerProviderStateMixin {
  late final List<AnimationController> _imageControllers;
  late final List<Animation<Offset>> _imageSlideAnimations;
  late final List<Animation<double>> _imageFadeAnimations;
  final List<bool> _isImageVisible = [false, false, false];

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

    _imageControllers = List.generate(
      3,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );

    _imageSlideAnimations =
        _imageControllers
            .map(
              (controller) => Tween<Offset>(
                begin: const Offset(0.0, 0.2),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeOut),
              ),
            )
            .toList();

    _imageFadeAnimations =
        _imageControllers
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

  void _triggerImageAnimation(int index) {
    if (!_isImageVisible[index]) {
      _isImageVisible[index] = true;
      Future.delayed(Duration(milliseconds: 200 * index), () {
        _imageControllers[index].forward();
      });
    }
  }

  void _triggerTextAnimation() {
    if (!_textAnimated) {
      _textAnimated = true;
      _textController.forward();
    }
  }

  @override
  void dispose() {
    for (final controller in _imageControllers) {
      controller.dispose();
    }
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('application_dev_section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _triggerTextAnimation();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.isDesktop ? widget.w * 0.039 : widget.w * 0.05,
          // 60 / 1525
          vertical: widget.h * 0.107, // 80 / 745
        ),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return widget.isDesktop
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(flex: 4, child: buildApplicationServiceDesc()),
                        Expanded(flex: 6, child: buildImages(constraints)),
                      ],
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildApplicationServiceDesc(),
                        SizedBox(height: widget.h * 0.04),
                        SizedBox(
                          width: widget.w * 0.63,
                          child: buildImages(constraints),
                        ),
                      ],
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildApplicationServiceDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildApplicationServiceHeadline(),
        SizedBox(height: widget.h * 0.027),
        buildApplicationServiceDescription(),

        SizedBox(height: widget.h * 0.048),
        buildSeeAllAppsButton(),
      ],
    );
  }

  Widget buildSeeAllAppsButton() {
    return SlideTransition(
      position: _buttonSlide,
      child: FadeTransition(
        opacity: _buttonFade,
        child: seeAllDetailsButton(
          navigate: () {
            Navigator.pushNamed(context, AppRoutes.mobileApp);
          },
          name: "See All Applications",
        ),
      ),
    );
  }

  Widget buildApplicationServiceDescription() {
    return SlideTransition(
      position: _descSlide,
      child: FadeTransition(
        opacity: _descFade,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:
                widget.isDesktop
                    ? widget.w * 0.29
                    : widget.w * 0.5, // 450 / 1525
          ),
          // أو أي عرض مناسب
          child: Text(
            "Discover a curated selection of our latest mobile and web applications, "
            "designed with cutting-edge technology and meticulous attention to detail. "
            "Each project reflects our commitment to quality, user-centric design, and seamless performance. "
            "Whether enhancing business processes or creating engaging user experiences .",
            style: TextStyle(
              fontSize:
                  widget.isDesktop
                      ? widget.w * 0.0118
                      : widget.w * 0.02, // 18 / 1525
              color: Colors.grey[700],
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildApplicationServiceHeadline() {
    return SlideTransition(
      position: _headlineSlide,
      child: FadeTransition(
        opacity: _headlineFade,
        child: Text(
          "Latest Application Projects",
          style: TextStyle(
            fontSize: widget.isDesktop ? widget.w * 0.025 : widget.w * 0.035,
            // 38 / 1525
            fontWeight: FontWeight.w900,
            color: Colors.grey[900],
            letterSpacing: 1.1,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /////
  Widget buildImages(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        final imagePaths = [
          'assets/images/1-1 - Copy.png',
          'assets/images/2-2 - Copy.png',
          'assets/images/3-3 - Copy.png',
        ];

        return VisibilityDetector(
          key: Key('project_image_$index'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.3) {
              _triggerImageAnimation(index);
            }
          },
          child: SlideTransition(
            position: _imageSlideAnimations[index],
            child: FadeTransition(
              opacity: _imageFadeAnimations[index],
              child: buildProjectImage(
                imagePaths[index],
                widget.isDesktop
                    ? constraints.maxWidth * 0.18
                    : constraints.maxWidth * 0.23,
                index,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildProjectImage(String path, double width, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Image.asset(
          path,
          width: width,
          height: width * 1.25,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
