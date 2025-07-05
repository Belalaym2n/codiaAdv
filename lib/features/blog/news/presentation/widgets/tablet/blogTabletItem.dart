import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import 'package:codia_adv/features/footor/presentation/pages/footor_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/sharedWidget/commonWidgetInBlog/blogCard.dart';
import '../../../domain/entities/blogEntity.dart';

class BlogTablet extends StatefulWidget {
  final double height;
  final double width;
  final List<GetBlogEntity> blogItems;

  const BlogTablet({
    super.key,
    required this.height,
    required this.width,
    required this.blogItems,
  });

  @override
  State<BlogTablet> createState() => _BlogTabletState();
}

class _BlogTabletState extends State<BlogTablet> {
  double get w => widget.width;

  double get h => widget.height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.blogItems.length + 1,
      itemBuilder: (_, index) {
        if (index == widget.blogItems.length) {
          return Column(
            children: [
              SizedBox(height: h * 0.053), // 40 / 745
              FootorWeb(
                isDesktop: false,
                w: w,
                h: h,
              ).animate().fade().slideY(begin: 0.2, duration: 1400.ms),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                buildNews(widget.blogItems[index]),
                Padding(
                  padding: EdgeInsets.all(w * 0.0052), // 8 / 1525
                  child: Center(
                    child: Divider(
                      indent: w * 0.0105,
                      // 16 / 1525
                      endIndent: w * 0.0105,
                      thickness: 1.0,
                      height: h * 0.032,
                      // 24 / 745
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildNews(GetBlogEntity item) {
    return Padding(
      padding: EdgeInsets.only(right: w * 0.0157), // 24 / 1525
      child: BlogCard(
        isDesktop: false,
        height: h,
        width: w,
        image: item.imageUrl,
        date: item.blogDate,
        title: item.headline,
        description: item.description,
      ),
    );
  }
}
