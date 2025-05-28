import 'dart:ui';

import 'package:flutter/material.dart';

class BlogAndNewsConfig {
  BlogAndNewsConfig({
    this.containerPaddingVertical = 50,
    this.containerPaddingHorizontal = 20,
    this.headlineFontSize = 42,
    this.headlineFontWeight = FontWeight.w900,
    this.headlineLetterSpacing = 1.2,
    this.headlineColor = const Color(0xFF161424),
    this.subTitleFontSize = 16,
    this.subTitleColor = const Color(0xFF757575),
    this.subTitleLineHeight = 1.6,
    this.blogCardWidth = 460,
    this.blogCardHeight = 460,
    this.blogImageHeight = 200,
    this.blogCardBorderRadius = 16,
    this.blogCardShadowBlurRadius = 12,
    this.blogCardShadowOffsetY = 6,
    this.dateFontSize = 13,
    this.dateColor = Colors.redAccent,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w700,
    this.titleColor = const Color(0xFF252c49),
    this.descriptionFontSize = 14,
    this.descriptionColor = const Color(0xFF4a4a4a),
    this.descriptionLineHeight = 1.5,
    this.readMoreFontSize = 14,
    this.readMoreFontWeight = FontWeight.bold,
    this.readMoreColor = const Color(0xFFdf0a0a),
  });

  final double containerPaddingVertical;
  final double containerPaddingHorizontal;

  final double headlineFontSize;
  final FontWeight headlineFontWeight;
  final double headlineLetterSpacing;
  final Color headlineColor;

  final double subTitleFontSize;
  final Color subTitleColor;
  final double subTitleLineHeight;

  final double blogCardWidth;
  final double blogCardHeight;

  final double blogImageHeight;
  final double blogCardBorderRadius;
  final double blogCardShadowBlurRadius;
  final double blogCardShadowOffsetY;

  final double dateFontSize;
  final Color dateColor;

  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color titleColor;

  final double descriptionFontSize;
  final Color descriptionColor;
  final double descriptionLineHeight;

  final double readMoreFontSize;
  final FontWeight readMoreFontWeight;
  final Color readMoreColor;
}
