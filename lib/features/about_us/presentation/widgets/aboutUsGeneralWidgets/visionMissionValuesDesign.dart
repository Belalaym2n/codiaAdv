import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../config/utils/appColors.dart';

class MissionVisionAnimatedSection extends StatefulWidget {
  final double w;
  const MissionVisionAnimatedSection({super.key, required this.w});

  @override
  State<MissionVisionAnimatedSection> createState() => _MissionVisionAnimatedSectionState();
}

class _MissionVisionAnimatedSectionState extends State<MissionVisionAnimatedSection> {
  bool showMission = false;
  bool showVision = false;
  bool showValues = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // MISSION
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
                    const SizedBox(height: 16),
                    _buildValueCard(
                      icon: Icons.flag_rounded,
                      title: "Empowering businesses with bold, intuitive digital products.",
                      color: const Color(0xFFf94c30),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 48),

          // VISION
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
                    const SizedBox(height: 16),
                    _buildValueCard(
                      icon: Icons.visibility_rounded,
                      title: "Leading the way in human-centered digital innovation.",
                      color: const Color(0xFF00456B),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 48),

          // VALUES
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
                        child: _buildSectionHeader("Our Values")),
                    const SizedBox(height: 16),
                    Wrap(

                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildValueCard(
                          icon: Icons.lightbulb_outline,
                          title: "Innovation —   Creating bold ideas with clear  direction .",
                          color: Colors.orange.shade700,
                          width: 260,
                        ),
                        _buildValueCard(
                          icon: Icons.groups,
                          title: "Teamwork — Building trust through shared goals and effort.",
                          color: Colors.blueGrey,
                          width: 260,
                        ),
                        _buildValueCard(
                          icon: Icons.shield_rounded,
                          title: "Integrity —Acting with honesty,fairness,and responsibility.",
                          color: Colors.green,
                          width: 260,
                        ),
                        _buildValueCard(
                          icon: Icons.star_rounded,
                          title: "Excellence — Delivering quality with passion and precision.",
                          color: Colors.indigo,
                          width: 260,
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
      style: const TextStyle(
        fontSize: 32,
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
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.black26,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
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
              padding: const EdgeInsets.all(14),
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
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
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
