import 'package:codia_adv/features/core/sharedWidget/socialMediaLinks/socialMediaLinks.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/blogEntity.dart';

Widget buildBlogImage({
  required String path,
  required double w,
  required double h,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(w * 0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          path,
          fit: BoxFit.cover,
          height: h * 0.7,
          width: w * 0.45,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(Icons.broken_image, color: Colors.redAccent, size: 0.023*w),
          ),
        ),
      ),
    ),
  );
}

Widget buildNewsDescription({
  required GetBlogEntity blog,
  required double w,
  required double h,
}) {
  return Container(
    height: h * 0.7,
    padding: EdgeInsets.all(w * 0.015),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         aboutBlog(h: h, w: w),
        SizedBox(height: h * 0.025),

         Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🟢 headline
                Text(
                  blog.headline.toString(),
                  style: TextStyle(
                    fontSize: w * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: h * 0.01),

                 Text(
                   blog.blogDate,
                   style: TextStyle(
                     fontSize: w * 0.009,
                     color: Colors.grey.shade600,
                     fontStyle: FontStyle.italic,
                   ),
                 ),

                SizedBox(height: h * 0.018),

                 Text(
                   blog.description.toString(),
                   style: TextStyle(
                     fontSize: w * 0.01,
                     color: Colors.grey.shade800,
                     height: 1.55,
                   ),
                 ),
              ],
            ),
          ),
        ),

        SizedBox(height: h * 0.025),

         socialMediaLinks( w: w,blog: blog),
      ],
    ),
  );
}


Widget aboutBlog({required double w, required double h}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.01),
    decoration: BoxDecoration(
      color: Color(0xFFFDF2F2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          width: 6,
          height: h * 0.03,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        SizedBox(width: w * 0.01),
        Text(
          'About this blog',
          style: TextStyle(
            fontSize: w * 0.011,
            fontWeight: FontWeight.w800,
            color: Color(0xFF222B45),
          ),
        ),
      ],
    ),
  );
}
