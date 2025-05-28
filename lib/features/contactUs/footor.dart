import 'dart:math';

import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection>
    with SingleTickerProviderStateMixin  {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      color: const Color(0xFF0f0d1d),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Animation
          Animate(
            effects: [
              FadeEffect(

                duration: Duration(seconds: 2),
                curve: Curves.easeInOutSine,
                 delay: Duration(milliseconds: 100),
              ),
            ],
            onPlay: (controller) => controller.repeat(),
            child: Text(
              "Let’s build something amazing together.",
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryColor,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 900,
            height: 3,
            decoration: BoxDecoration(
              color: Color(0xFF3c0c18),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),

          // Main Footer Content
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAbout(),
                  const SizedBox(height: 40),
                  _buildQuickLinks(),
                  const SizedBox(height: 40),
                  _buildSocialLinks(),
                ],
              )
              : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    Expanded(child: Center(child: _buildAbout())),
                    Expanded(child: Center(child: _buildQuickLinks())),
                    Expanded(child: Center(child: _buildSocialLinks())),
                  ],
                ),
              ),
          const SizedBox(height: 50),
          Divider(color: Colors.grey.shade800),
          const SizedBox(height: 20),
          Text(
            "© 2025 CodiaAdv. All rights reserved.",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CodiaAdv",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 6,
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFdf0a0a), // لون جذاب متناسق مع الزر
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "We believe creativity and innovation are crucial to\nachieving your marketing goals. Our mission is to \nconvert your ideas into impactful digital success.",
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.grey.shade300,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Icon(Icons.phone, color: Color(0xFFdf0a0a), size: 20),
            const SizedBox(width: 10),
            Text(
              "+201022491465",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Color(0xFFdf0a0a), size: 20),
            const SizedBox(width: 10),
            Text(
              "Sun - Thu | 10:00 AM - 6:00 PM",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "Friday: ",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
              ),
            ),
            Text(
              "Closed",
              style: TextStyle(
                color: Color(0xFFdf0a0a),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFdf0a0a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 6,
              shadowColor: Color(0xFFb30f0f),
            ),
            child: Text(
              "Request Callback",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    final links = [
      "Home",
      "About Us",
      "Services",
      "Vision",
      "Mission",
      "Mission",
      "Contact",
      "Contact",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 6,
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFdf0a0a),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: List.generate(
            (links.length / 2).ceil(), // عدد الصفوف المطلوبة
                (index) {
              final first = links[index * 2];
              final second = (index * 2 + 1 < links.length) ? links[index * 2 + 1] : null;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildLinkItem(first)),

                      Expanded(child: second != null ? _buildLinkItem(second) : Container()),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLinkItem(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.double_arrow,
          color: Color(0xFFdf0a0a),
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
  Widget _buildSocialLinks() {
    final icons = [
      FontAwesomeIcons.facebookF,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.linkedinIn,
    ];

    final labels = ["Facebook", "Instagram", "LinkedIn"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Follow Us",
          style: TextStyle(
            fontSize: 26,
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
        ),
        const SizedBox(height: 6),
        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFdf0a0a),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Stay connected with us through our social media channels for updates, news, and insights.",
          style: TextStyle(
            fontSize: 14.5,
            color: Colors.grey.shade400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: List.generate(icons.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: () {
                  // ضع رابط الفتح الفعلي هنا مثلاً launchUrlString("https://facebook.com");
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white10,
                      ),
                      child: Icon(
                        icons[i],
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      labels[i],
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
