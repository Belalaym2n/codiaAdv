import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final IconData icon;
  final String description;
  final VoidCallback onTap; // ✅ وظيفة للتنقل

  ServiceModel({
    required this.title,
    required this.icon,
    required this.description,
    required this.onTap,
  });

  static List<ServiceModel> getServices(BuildContext context) => [
    ServiceModel(
      title: "Mobile Application",
      icon: Icons.phone_android,
      description:
      "Develop high-quality mobile apps tailored to your needs.",
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.mobileApp
        );
      },
    ),
    ServiceModel(
      title: "Website Development",
      icon: Icons.web,
      description: "Build responsive and modern websites for all platforms.",
      onTap: () {

      },
    ),
    ServiceModel(
      title: "Brand Identity",
      icon: Icons.design_services,
      description: "Create unique and memorable brand identities.",
      onTap: () {

      },
    ),
  ];
}
