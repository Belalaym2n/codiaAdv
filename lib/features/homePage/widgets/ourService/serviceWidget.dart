
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/models/designModels/serviceConfig.dart';
import '../../domain/models/designModels/serviceModel.dart';


class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key, required this.index, required this.width, required this.height});
  final int index;
  final double width;
  final double height;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final services = ServiceModel.getServices(context);
    final service = services[widget.index];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: service.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.02, vertical: widget.height * 0.015),
          width: widget.width * 0.23,
          height: widget.height * 0.52,
          decoration: BoxDecoration(
            color: _isHovering ? const Color(0xFFfc012a) : Colors.white,
            borderRadius: BorderRadius.circular(widget.width * 0.02),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: widget.height * 0.07),
                    child: Icon(
                      service.icon,
                      size: widget.width * 0.045,
                      color: _isHovering ? Colors.white : const Color(0xFFfc012a),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.009 * widget.width,
                      vertical: 0.008 * widget.height,
                    ),
                    decoration: BoxDecoration(
                      color: _isHovering
                          ? Colors.white.withOpacity(0.85)
                          : const Color(0xFFfc012a).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(widget.width * 0.014),
                    ),
                    child: Text(
                      '${widget.index + 1}',
                      style: TextStyle(
                        fontSize: widget.width * 0.018,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFfc012a),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: widget.height * 0.027),
              Text(
                service.title,
                style: TextStyle(
                  fontSize: widget.width * 0.017,
                  fontWeight: FontWeight.w700,
                  color: _isHovering ? Colors.white : AppColors.adminPrimaryColor,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(top: 6),
                height: _isHovering ? 2 : 0.4,
                width: _isHovering ? widget.width * 0.06 : widget.width * 0.15,
                decoration: BoxDecoration(
                  color: _isHovering ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: widget.width * 0.036),
              if (!_isHovering)
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: widget.width * 0.009,
                    height: 1.6,
                    color: Colors.grey.shade800,
                  ),
                )
              else
                HoverArrowWidget(height: widget.height, width: widget.width, onTap: service.onTap),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverArrowWidget extends StatelessWidget {
  const HoverArrowWidget({super.key, required this.onTap, required this.width, required this.height});
  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width * 0.03,
          height: 0.069 * height,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.white),
          ),
          child: Icon(
            Icons.arrow_forward,
            key: const ValueKey(true),
            color: Colors.black,
            size: width * 0.013,
          ),
        ),
      ),
    );
  }
}
