
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/blogEntity.dart';

Widget socialMediaLinks({required GetBlogEntity blog}) {
  return Row(
    children: [
      if (blog.facebookLink.isNotEmpty)
        iconLink(
          icon: Icons.facebook,
          color: Color(0xFF1877F2),
          url: blog.facebookLink,
        ),
      if (blog.instagramLink.isNotEmpty)
        iconLink(
          icon: FontAwesomeIcons.instagram,
          color: Color(0xFFE1306C), // لون إنستغرام (زهري-برتقالي)
          url: blog.instagramLink,
        ),
      if (blog.linkedinLink.isNotEmpty)
        iconLink(
          icon: FontAwesomeIcons.linkedinIn,
          color: Color(0xFF0A66C2),
          url: blog.linkedinLink,
        ),
      if (blog.appStoreLink.isNotEmpty)
        iconLink(
          icon: FontAwesomeIcons.amazon,
          color: Colors.black,
          url: blog.appStoreLink,
        ),
      if (blog.googlePlayLink.isNotEmpty)
        iconLink(
          icon: FontAwesomeIcons.googlePlay,
          color: Color(0xFF3DDC84),
          url: blog.googlePlayLink,
        ),
      if (blog.appStoreLink.isNotEmpty)
        iconLink(
          icon: Icons.apple,
          color: Colors.black,
          url: blog.appStoreLink,
        ),
    ],
  );
}
Widget iconLink({
  required IconData icon,
  required Color color,
  required String url,
}) {
  return MouseRegion(
      cursor: SystemMouseCursors.click,  // تغير شكل المؤشر عند المرور
      child:GestureDetector(
    onTap: () async {
      print("belal");
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print("Could not launch $url");
      }
    },
    child: Padding(
      padding:   EdgeInsets.only(right: 16),
      child: Icon(icon, size: 28, color: color),
    ),
  ));
}