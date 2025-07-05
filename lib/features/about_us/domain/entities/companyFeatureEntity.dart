import 'package:flutter/material.dart';

class CompanyFeatureModel {
  final String featureName;
  final String featureDescription;
  final Color bgColor;
  final IconData icon;

  CompanyFeatureModel({
    required this.featureName,
    required this.featureDescription,
    required this.bgColor,
    required this.icon,
  });

  static final List<CompanyFeatureModel> features = [
    CompanyFeatureModel(
      featureName: "Best Price Guaranteed",
      featureDescription:
      "We provide premium digital services at the best \nvalue in the market. Our pricing model ensures you get maximum\n return on investment without sacrificing quality or performance.",
      bgColor: Color(0xFFf94c30),
      icon: Icons.money,
    ),
    CompanyFeatureModel(
      featureName: "Professional Team",
      featureDescription:
      "Our expert team combines creativity, technical \nexcellence, and a results-driven mindset to deliver tailored \ndigital solutions that exceed expectations.",
      bgColor: Color(0xFF111111),
      icon: Icons.people_alt,
    ),
    CompanyFeatureModel(
      featureName: "Accurate Tracking",
      featureDescription:
      "Stay in control with real-time tracking tools. \nMonitor task progress, employee attendance, and resource usage \nseamlessly—all from a single platform.",
      bgColor: Color(0xFFf94c30),
      icon: Icons.track_changes,
    ),
  ];
}
