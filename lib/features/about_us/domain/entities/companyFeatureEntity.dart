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
      featureDescription: "High-quality service at the best possible price.",
      bgColor: Color(0xFFf94c30),
      icon: Icons.money,
    ),
    CompanyFeatureModel(
      featureName: "Professional Team",
      featureDescription: "Experienced team delivering modern digital solutions.",
      bgColor: Color(0xFF111111),
      icon: Icons.people_alt,
    ),
    CompanyFeatureModel(
      featureName: "Accurate Tracking",
      featureDescription: "Track tasks, attendance, and resources in real-time.",
      bgColor: Color(0xFFf94c30),
      icon: Icons.track_changes,
    ),
  ];

}
