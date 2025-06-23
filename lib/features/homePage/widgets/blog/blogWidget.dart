import 'dart:ui';

import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlogCard extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final String date;
  final String title;
  final String description;

  const BlogCard({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.date,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = 16.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 6,
        shadowColor: Colors.black26,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            // TODO: Handle blog card tap
          },
          child: Container(
            width: width * 0.28,
            height: height * 0.62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(height, width, image, borderRadius),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDate(date, height),
                      SizedBox(height: height * 0.008),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: height * 0.026,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF252C49),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      Text(
                        description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: height * 0.018,
                          color: const Color(0xFF4A4A4A),
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: height * 0.018),
                      Text(
                        "Read More",
                        style: TextStyle(
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDate(String date, double height) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.calendar,
          color: AppColors.primaryColor,
          size: height * 0.02,
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: TextStyle(
            fontSize: height * 0.017,
            color: Colors.redAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(double height, double width, String image, double borderRadius) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      child: Image.network(
        image,
        height: height * 0.35,
        width: width * 0.28,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: height * 0.35,
            width: width * 0.28,
            color: Colors.grey.shade200,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) => Container(
          height: height * 0.35,
          width: width * 0.28,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}

Widget headlineBlog({required double w}) {
  return Text(
    "Get Update Blog & News",
    style: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w900,
      color: Colors.grey[900],
      letterSpacing: 1.1,
      shadows: const [
        Shadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  );
}

Widget subHeadlineBlog({required double w}) {
  return Text(
    "Stay updated with the latest design trends and industry news. "
        "Get expert tips and insights to help you innovate and succeed in your projects. "
        "Join our community to explore new ideas and turn your creative vision into reality.",
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 18,
      color: Colors.grey[700],
      height: 1.6,
      fontWeight: FontWeight.w400,
    ),
  );
}
