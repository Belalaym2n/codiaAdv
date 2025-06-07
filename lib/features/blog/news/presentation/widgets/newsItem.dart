import 'package:codia_adv/features/blog/news/presentation/widgets/socialMediaLinks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../contactUs/footor.dart';
import '../../domain/entities/blogEntity.dart';

class NewsItem extends StatefulWidget {
  NewsItem({super.key, required this.blogs,required this.height,
  required this.width
  });

  List<GetBlogEntity> blogs;
  double height;
  double width;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.blogs.length + 1,  // زيادة 1 عشان نعرض الفوتر كعنصر أخير
        itemBuilder: (_, index) {
          if (index == widget.blogs.length) {
             return FooterSection();
          } else{
          final blog = widget.blogs[index];
           return Container(
            padding:   EdgeInsets.all( widget.width*0.01),
            height: widget.height*0.75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: buildImage(blog.imageUrl.toString())),
                  SizedBox(width: widget.width*0.01),
                 Expanded(flex: 1, child: buildNewsDescription(blog: blog)),
              ],
            ),
          );
        }},
      ),
    );
  }

  buildImage(String path) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular( widget.width*0.009),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding:   EdgeInsets.all( widget.width*0.01),
      height: widget.height,
      child: Image.network(
        path, // هذا يجب أن يكون أول براميتر
        height: widget.height*0.75,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
           return Container(
            alignment: Alignment.center,
            child: Icon(Icons.error_outline, size:  widget.width*0.023, color: Colors.red),
          );
        },
      ),
    );
  }

  Widget buildNewsDescription({required GetBlogEntity blog}) {
    return Container(
      padding:   EdgeInsets.all( widget.width*0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          aboutBlog(),

            SizedBox(height:  widget.height*0.02),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    blog.headline.toString(),
                    style: TextStyle(
                       fontSize:  widget.width*0.01,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.6, // عشان يعطي راحة بين السطور
                    ),
                  ),
                    SizedBox(height: widget.height*0.01),

                  // Date under headline
                  Text(
                    blog.blogDate, // Function to format date as string
                    style: TextStyle(
                      fontSize:  widget.width*0.008,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                    SizedBox(height:  widget.height*0.016),

                  Text(
                    blog.description.toString(),
                    style: TextStyle(
                      fontSize:  widget.width*0.009,
                      color: Colors.grey.shade800,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          )

,
            SizedBox(height:  widget.height*0.03),

     socialMediaLinks(blog: blog)

        ],
      ),
    );
  }
// Example date formatter function


  Widget aboutBlog() {
    return Container(
      padding:   EdgeInsets.symmetric(vertical:   widget.height*0.015, horizontal:  widget.width*0.009),
      decoration: BoxDecoration(
        color: const Color(0xFFfbe1e1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height:   widget.height*0.027,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
   SizedBox(width:  widget.width*0.008),
          Text(
            'About this blog',
            style: TextStyle(
              fontSize:  widget.width*0.01,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF252c49),
            ),
          ),
        ],
      ),
    );
  }
}
