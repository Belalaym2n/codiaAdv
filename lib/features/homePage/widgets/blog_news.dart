import 'package:flutter/material.dart';

import '../domain/models/designModels/blogConfig.dart';

class BlogAndNewsWebSection extends StatelessWidget {
  final BlogAndNewsConfig config;

  BlogAndNewsWebSection({Key? key, required this.config}) : super(key: key);

  final List<Map<String, String>> blogItems = [
    {
      'image': 'assets/images/1.jpg',
      'date': 'Feb / 2023',
      'title': 'Boost Your Digital Presence',
      'description': 'Learn the latest strategies to enhance your online how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI  how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI  presence and engage your audience effectively Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI.',
    },
    {
      'image': 'assets/images/1.jpg',
      'date': 'Mar / 2023',
      'title': 'Creative Design Trends',
      'description': 'Explore 2023’s most creative UI/UX design approaches that boost user satisfaction.Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI  how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI  how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI  ',
    },
    {
      'image': 'assets/images/1.jpg',
      'date': 'Apr / 2023',
      'title': 'Marketing Automation Tips',
      'description': 'Discover how automation can simplify your campaigns and maximize ROI. Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI Discover how automation can simplify your campaigns and maximize ROI',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget buildHeadLine() {
      return Text(
        "Get Update Blog & News",
        style: TextStyle(
          fontSize: config.headlineFontSize,
          fontWeight: config.headlineFontWeight,
          color: config.headlineColor,
          letterSpacing: config.headlineLetterSpacing,
        ),
      );
    }

    Widget stayOnTouchWidget() {
      return Text(
        "Stay in touch with the latest updates, design tips, and industry news.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: config.subTitleFontSize,
          color: config.subTitleColor,
          height: config.subTitleLineHeight,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: config.containerPaddingVertical,
        horizontal: config.containerPaddingHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildHeadLine(),
          SizedBox(height: 8),
          stayOnTouchWidget(),
          SizedBox(height: 36),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: blogItems.map((item) {
              return BlogCard(
                config: config,
                image: item['image']!,
                date: item['date']!,
                title: item['title']!,
                description: item['description']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
class BlogCard extends StatelessWidget {
  final BlogAndNewsConfig config;
  final String image;
  final String date;
  final String title;
  final String description;

  const BlogCard({
    Key? key,
    required this.config,
    required this.image,
    required this.date,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: config.blogCardWidth,
        height: config.blogCardHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(config.blogCardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: config.blogCardShadowBlurRadius,
              offset: Offset(0, config.blogCardShadowOffsetY),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(config.blogCardBorderRadius - 4),
                topRight: Radius.circular(config.blogCardBorderRadius - 4),
              ),
              child: Image.asset(
                image,
                height: config.blogImageHeight,
                width: config.blogCardWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: config.dateFontSize,
                      color: config.dateColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: config.titleFontSize,
                      fontWeight: config.titleFontWeight,
                      color: config.titleColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: config.descriptionFontSize,
                      color: config.descriptionColor,
                      height: config.descriptionLineHeight,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: config.readMoreFontSize,
                      fontWeight: config.readMoreFontWeight,
                      color: config.readMoreColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
