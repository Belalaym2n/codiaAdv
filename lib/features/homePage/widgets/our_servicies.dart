import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../domain/models/designModels/serviceConfig.dart';

class OurServicesSectionWeb extends StatefulWidget {
    OurServicesSectionWeb({super.key
    ,required this.serviceWidgetConfig
    });
    ServiceWidgetConfig serviceWidgetConfig;
  @override
  State<OurServicesSectionWeb> createState() => _OurServicesSectionWebState();
}

class _OurServicesSectionWebState extends State<OurServicesSectionWeb> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 60),
        AnimationLimiter(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children: List.generate(
         3,
                  (index) {
                 return  ServiceWidget(
                  index: index,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }


}
class ServiceWidget extends StatefulWidget {
  ServiceWidget({
    super.key,
    required this.index,
    ServiceWidgetConfig? config,
  }) : config = config ?? ServiceWidgetConfig();

  final int index;
  final ServiceWidgetConfig config;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  List<bool> _isHovering = [false, false, false];

  final List<Map<String, dynamic>> services = [
    {
      "title": "Mobile Application",
      "icon": Icons.phone_android,
      "description": "Develop high-quality mobile apps tailored to your needs."
    },
    {
      "title": "Website Development",
      "icon": Icons.web,
      "description": "Build responsive and modern websites for all platforms."
    },
    {
      "title": "Brand Identity",
      "icon": Icons.design_services,
      "description": "Create unique and memorable brand identities."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cfg = widget.config;

    return AnimationConfiguration.staggeredList(
      position: widget.index,
      delay: Duration(milliseconds: cfg.animationDelayMs),
      child: SlideAnimation(
        verticalOffset: cfg.slideAnimationOffset,
        duration: Duration(milliseconds: cfg.animationDurationMs),
        child: FadeInAnimation(
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovering[widget.index] = true),
            onExit: (_) => setState(() => _isHovering[widget.index] = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: cfg.animatedContainerDurationMs),
              transform: _isHovering[widget.index]
                  ? (Matrix4.identity()..scale(1.05))
                  : Matrix4.identity(),
              curve: Curves.easeOut,
              padding: EdgeInsets.all(cfg.padding),
              width: cfg.width,
              height: cfg.height,
              decoration: BoxDecoration(
                color: !_isHovering[widget.index] ? Colors.white : Color(0xFFfc012a),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: cfg.boxShadowBlurRadius,
                    offset: Offset(0, cfg.boxShadowOffsetY),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: cfg.positionedHorizontalPadding,
                        vertical: cfg.positionedVerticalPadding,
                      ),
                      decoration: BoxDecoration(
                        color: _isHovering[widget.index]
                            ? Colors.white.withOpacity(0.8)
                            : Color(0xFFfc012a).withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(cfg.positionedBorderRadiusTopRight),
                          bottomLeft: Radius.circular(cfg.positionedBorderRadiusBottomLeft),
                        ),
                      ),
                      child: Text(
                        '${widget.index + 1}',
                        style: TextStyle(
                          fontSize: cfg.positionedTextFontSize,
                          fontWeight: FontWeight.bold,
                          color: _isHovering[widget.index] ? Color(0xFFfc012a) : Color(0xFFfc012a),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        services[widget.index]["icon"],
                        size: cfg.iconSize,
                        color: !_isHovering[widget.index] ? Color(0xFFfc012a) : Colors.white,
                      ),
                      SizedBox(height: cfg.sizedBoxHeight1),
                      Text(
                        services[widget.index]["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: cfg.titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: !_isHovering[widget.index] ? Color(0xFFfc012a) : Colors.white,
                        ),
                      ),
                      SizedBox(height: cfg.sizedBoxHeight2),
                      Text(
                        services[widget.index]["description"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: cfg.descriptionFontSize,
                          height: cfg.textHeight,
                          color: !_isHovering[widget.index] ? Colors.black87 : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

