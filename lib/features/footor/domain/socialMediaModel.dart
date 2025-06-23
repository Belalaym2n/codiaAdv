import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaModel {
  final IconData icon;
  final String label;
  final String url;

  SocialMediaModel({
    required this.icon,
    required this.label,
    required this.url,
  });

  // القائمة الرئيسية
 static final List<SocialMediaModel> socialMediaItems = [
    SocialMediaModel(
      icon: FontAwesomeIcons.facebookF,
      label: "Facebook",
      url: "https://www.facebook.com/profile.php?id=61561455533127",
    ),
    SocialMediaModel(
      icon: FontAwesomeIcons.instagram,
      label: "Instagram",
      url: "https://www.instagram.com/codia.adv/",
    ),
    SocialMediaModel(
      icon: FontAwesomeIcons.linkedinIn,
      label: "LinkedIn",
      url:
          "https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fcodiaadv%2F%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExVTUxN0JVd2FEekl1WnY3cwEeSuOWQs49QerVqiE0SZVMyEIt872IWudXUzTQQXfAZWIG3hjwHx0hf_Y83nY_aem_3FA1F3RhoGabIb5fVBSjUw&h=AT0cLb0bMkCoSM08qQG6TlqCCp1jrA8CnlxP2M6JYffiDk4wjLdvUIVLiLD7qVg22l7kdXfqt6l4mKvTvjDDPI52bu16MJXshBQpJojtqhk768eJnZmZRDB-wLFKRe9F8w248Q",
    ),
  ];
}
