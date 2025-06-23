import 'package:animate_do/animate_do.dart';
import 'package:codia_adv/features/blog/news/presentation/widgets/web/animationBlogWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../contactUs/footor.dart';
import '../../../../../footor/presentation/pages/footor_web.dart';
import '../../../../../homePage/widgets/clientSection/clientsWidget.dart';
import '../../../domain/entities/blogEntity.dart';
import '../blogGeneralWidget/blogGeneralWidgets.dart';
import '../blogGeneralWidget/socialMediaLinks.dart';

class NewsItemWeb extends StatefulWidget {
  NewsItemWeb({
    super.key,
    required this.blogs,
    required this.height,
    required this.width,
  });

  List<GetBlogEntity> blogs;
  double height;
  double width;

  @override
  State<NewsItemWeb> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItemWeb> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: widget.blogs.length + 1,
        itemBuilder: (_, index) {
          if (index == widget.blogs.length) {
            return FootorWeb(
              w: widget.width,
              h: widget.height,
            ).animate().fade().slideY(begin: 0.2, duration: 1400.ms);
          } else {
            final blog = widget.blogs[index];
            return AnimatedBlogCardWeb(
              index: index,
              blog: blog,
              width: widget.width,
              height: widget.height,
            );
          }
        },
      ),
    );

  }
}
