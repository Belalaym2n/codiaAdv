
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../blog/news/domain/entities/blogEntity.dart';

Widget socialMediaLinks({
    GetBlogEntity?  blog,
    ApplicationEntity?  app,
  bool isBlog=true,
  required double w}) {
  List<Widget> links = [];

  void addLink(IconData icon, Color color, String? url) {
    if (url != null &&url.trim().isNotEmpty) {
      links.add(iconLink(
          w:w ,
          icon: icon, color: color, url: url));
    }
  }
   if(isBlog) {
    addLink(Icons.facebook, Color(0xFF1877F2),  blog?.facebookLink ??"");
    addLink(FontAwesomeIcons.linkedinIn, Color(0xFF0A66C2), blog?.linkedinLink??"");
    addLink(FontAwesomeIcons.instagram, Color(0xFFE1306C), blog?.instagramLink??"");
  }
  addLink(FontAwesomeIcons.googlePlay, Color(0xFF3DDC84), isBlog?blog?.googlePlayLink??"":app?.google_plauurl??"");
  addLink(Icons.apple, Colors.black, isBlog?blog?.appStoreLink??"":app?.app_store_url??"");
  addLink(FontAwesomeIcons.amazon, Colors.black, isBlog?blog?.amazonLink??"":app?.amazone_url??"");

  return Row(children: links);
}

Widget iconLink({
  required IconData icon,
  required Color color,
  required double w,
  required String url,
}) {
  return Padding(
    padding:   EdgeInsets.only(right: 0.007*w),
    child: InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(icon, color: color, size: w*0.02),
      ),
    ),
  );
}
