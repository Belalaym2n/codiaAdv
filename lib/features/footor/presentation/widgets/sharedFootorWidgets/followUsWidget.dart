import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/socialMediaModel.dart';

Widget socialPlatforms({
  required double w,
}) {
  List<SocialMediaModel> social = SocialMediaModel.socialMediaItems;

  return Column(
    children: List.generate(social.length, (i) {
      return Padding(
        padding: EdgeInsets.only(bottom: w * 0.0078), // 12 / 1525
        child: InkWell(
          onTap: () async {
            navigateToUrl(social[i].url);
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(w * 0.0052), // 8 / 1525
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white10,
                ),
                child: Icon(
                  social[i].icon,
                  color: Colors.white,
                  size: w * 0.0105, // 16 / 1525
                ),
              ),
              SizedBox(width: w * 0.0078), // 12 / 1525
              Text(
                social[i].label,
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: w * 0.0102, // 15.5 / 1525
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

navigateToUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print("Could not launch $url");
  }
}

Widget descriptionForSocial({
  required double w,
}) {
  return Text(
    "Stay connected with us through our social media\n channels for updates, news, and insights.",
    style: TextStyle(
      fontSize: w * 0.0095, // 14.5 / 1525
      color: Colors.grey.shade400,
      height: 1.5,
    ),
  );
}

Widget followText({
  required double w,
}) {
  return Text(
    "Follow Us",
    style: TextStyle(
      fontSize: w * 0.0170, // 26 / 1525
      fontWeight: FontWeight.w900,
      color: Colors.white,
      letterSpacing: 1.1,
      shadows: [
        Shadow(
          blurRadius: 6,
          color: Colors.black26,
          offset: Offset(0, 2),
        ),
      ],
    ),
  );
}
