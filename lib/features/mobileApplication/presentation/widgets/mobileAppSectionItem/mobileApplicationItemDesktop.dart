import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/sharedWidget/aboutApp.dart';
import '../../../../footor/presentation/pages/footor_web.dart';
import '../buildImages/buildImages.dart';

class WebMobileApplicationSectionItem extends StatefulWidget {
  final double height;
  final double width;
  final List<ApplicationEntity> apps;
  final bool animateOnScrollDownOnly;
  bool isDesktop;

  WebMobileApplicationSectionItem({
    super.key,
    this.isDesktop = true,
    required this.height,
    required this.width,
    required this.apps,
    this.animateOnScrollDownOnly = true,
  });

  @override
  State<WebMobileApplicationSectionItem> createState() =>
      _MobileApplicationItemState();
}

class _MobileApplicationItemState
    extends State<WebMobileApplicationSectionItem> {
  late List<bool> _itemVisible;

  @override
  void initState() {
    super.initState();
    int itemCount =
        widget.apps.length + 1; // ✅ ضيف +1 للـ footer كمان لو بتتبع حالته
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
    return ListView.builder(
      itemCount: widget.apps.length + 1,
      itemBuilder: (_, index) {
        if (index == widget.apps.length) {
          return Column(
            children: [
              SizedBox(height: widget.width * 0.03),
              FootorWeb(
                isDesktop: widget.isDesktop,
                w: widget.width,
                h: widget.height,
              ).animate().fade().slideY(begin: 0.2, duration: 800.ms),
            ],
          );
        }

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
              padding: EdgeInsets.all(widget.width * 0.01),
              child:
                  widget.isDesktop
                      ? SizedBox(
                        height: widget.height * 0.75,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildApplicationImage(index),
                            SizedBox(width: widget.width * 0.015),
                            buildAboutApplication(index),
                          ],
                        ),
                      )
                      : Column(
                        children: [
                          buildApplicationImage(index),
                          SizedBox(height: widget.height * 0.015),
                          buildAboutApplication(index),
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAboutApplication(int index) {
    return AnimatedSlide(
      offset: _itemVisible[index] ? Offset.zero : const Offset(0.2, 0),
      duration: 600.ms,
      curve: Curves.easeOut,
      child: SizedBox(
        width: widget.isDesktop ? widget.width * 0.32 : widget.width * 0.84,
        child: appDetails(
          isDesktop: widget.isDesktop,
          h: widget.height,
          w: widget.width,
          index: index,
          apps: widget.apps,
        ),
      ),
    );
  }

  Widget buildApplicationImage(int index) {
    return AnimatedSlide(
      offset: _itemVisible[index] ? Offset.zero : const Offset(0, 0.2),
      duration: 600.ms,
      curve: Curves.easeOut,
      child: buildAppImages(
        isDesktop: widget.isDesktop,
        index,
        widget.width,
        widget.apps,
      ),
    );
  }
}
