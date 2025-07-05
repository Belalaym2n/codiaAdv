import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../config/utils/appColors.dart';

class MissionVisionAnimatedSection extends StatefulWidget {
  final double w;

  const MissionVisionAnimatedSection({super.key, required this.w});

  @override
  State<MissionVisionAnimatedSection> createState() =>
      _MissionVisionAnimatedSectionState();
}

class _MissionVisionAnimatedSectionState
    extends State<MissionVisionAnimatedSection> {
  bool showMission = false;
  bool showVision = false;
  bool showValues = false;

  double get h => widget.w * 0.65; // تقدير تقريبي للارتفاع

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.w * 0.021, // 32 / 1525
        vertical: h * 0.085, // 64 / 745
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// --- MISSION ---
          VisibilityDetector(
            key: const Key('mission'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.6 && !showMission) {
                setState(() => showMission = true);
              }
            },
            child: AnimatedOpacity(
              opacity: showMission ? 1 : 0,
              duration: 800.ms,
              curve: Curves.easeInOut,
              child: AnimatedScale(
                scale: showMission ? 1 : 0.95,
                duration: 800.ms,
                curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader("Our Mission"),
                    SizedBox(height: h * 0.021), // 16 / 745
                    _buildValueCard(
                      icon: Icons.flag_rounded,
                      title:
                          '''At Codia Adv, we believe every idea has the potential to become a powerful digital experience that drives meaningful results.
Our mission is to empower businesses and entrepreneurs by crafting high-quality mobile applications and websites that combine bold design, seamless usability, and reliable performance.''',
                      color: const Color(0xFFf94c30),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: h * 0.064), // 48 / 745
          /// --- VISION ---
          VisibilityDetector(
            key: const Key('vision'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.6 && !showVision) {
                setState(() => showVision = true);
              }
            },
            child: AnimatedOpacity(
              opacity: showVision ? 1 : 0,
              duration: 800.ms,
              curve: Curves.easeInOut,
              child: AnimatedSlide(
                offset: showVision ? Offset.zero : const Offset(0.2, 0),
                duration: 800.ms,
                curve: Curves.easeInOutCubic,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader("Our Vision"),
                    SizedBox(height: h * 0.021),
                    _buildValueCard(
                      icon: Icons.visibility_rounded,
                      title:
                          '''At Codia Adv, our vision is to lead the way in human-centered digital innovation — where technology meets empathy, and every solution is crafted to truly serve its users. 
We aim to be a trusted partner for businesses seeking to transform, grow, and lead through purposeful digital experiences.''',
                      color: const Color(0xFF00456B),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: h * 0.064),

          /// --- VALUES ---
          VisibilityDetector(
            key: const Key('values'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.3 && !showValues) {
                setState(() => showValues = true);
              }
            },
            child: AnimatedOpacity(
              opacity: showValues ? 1 : 0,
              duration: 800.ms,
              child: AnimatedSlide(
                offset: showValues ? Offset.zero : const Offset(0, 0.2),
                duration: 800.ms,
                curve: Curves.easeInOutBack,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildSectionHeader("Our Values"),
                    ),
                    SizedBox(height: h * 0.021),
                    Wrap(
                      spacing: widget.w * 0.013, // 20 / 1525
                      runSpacing: widget.w * 0.013,
                      children: [
                        _buildValueCard(
                          icon: Icons.lightbulb_outline,
                          title:
                              "Innovation —   Creating bold ideas with clear  direction .",
                          color: Colors.orange.shade700,
                          width: widget.w * 0.17, // 260 / 1525
                        ),
                        _buildValueCard(
                          icon: Icons.groups,
                          title:
                              "Teamwork — Building trust through shared goals and effort.",
                          color: Colors.blueGrey,
                          width: widget.w * 0.17,
                        ),
                        _buildValueCard(
                          icon: Icons.shield_rounded,
                          title:
                              "Integrity —Acting with honesty,fairness,and responsibility.",
                          color: Colors.green,
                          width: widget.w * 0.17,
                        ),
                        _buildValueCard(
                          icon: Icons.star_rounded,
                          title:
                              "Excellence — Delivering quality with passion and precision.",
                          color: Colors.indigo,
                          width: widget.w * 0.17,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: widget.w * 0.021, // 32 / 1525
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required Color color,
    double width = double.infinity,
  }) {
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(widget.w * 0.015), // 24 / 1525
      shadowColor: Colors.black26,
      child: Container(
        width: width,
        padding: EdgeInsets.all(widget.w * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.w * 0.015),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(widget.w * 0.009), // 14 / 1525
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: widget.w * 0.017, // 26 / 1525
              ),
            ),
            SizedBox(width: widget.w * 0.013), // 20 / 1525
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: widget.w * 0.0105, // 16 / 1525
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
