
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:codia_adv/features/footor/domain/socialMediaModel.dart';
import 'package:codia_adv/features/footor/presentation/widgets/sharedFootorWidgets/aboutCodiaAdvWidget.dart';
import 'package:codia_adv/features/footor/presentation/widgets/sharedFootorWidgets/followUsWidget.dart';
import 'package:codia_adv/features/footor/presentation/widgets/sharedFootorWidgets/sharedFootorWidget.dart';
import 'package:codia_adv/features/request_callback/presentation/pages/requet_callback.dart';
import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../about_us/presentation/widgets/aboutUsGeneralWidgets/aboutUsWidgets.dart';
import '../../../homePage/domain/models/menuModel.dart';

class FootorWeb extends StatefulWidget {
  FootorWeb({super.key,
    required this.w, required this.h});

  double h;
  double w;


  @override
  State<FootorWeb> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FootorWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      padding:   EdgeInsets.symmetric(horizontal: 30, vertical: 0.08*widget.h),
      color: const Color(0xFF0f0d1d),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Animation
          buildFooterHeader(


              w: widget.w,
           ),
          SizedBox(height: 0.0165*widget.h),
          buildLineFooter(w: widget.w,
              ),
            SizedBox(height: 0.068*widget.h),
          buildContent(),

          SizedBox(height: 0.068*widget.h),
          Divider(color: Colors.grey.shade800),
          SizedBox(height: 0.02*widget.h),
          buildCompanyNameForFootor(w: widget.w

          ),
        ],
      ),
    );
  }




  Widget buildContent() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(child: Center(child: buildAboutCodiaAdv(
              context
          ))),
          Expanded(child: Center(child: _buildQuickLinks(widget.w))),
          Expanded(child: Center(child: _buildSocialLinks(widget.w))),
        ],
      ),
    );
  }




  Widget _buildQuickLinks(double w) {
    List<MenuModel>menu = MenuModel.getItems(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            fontSize: 0.017*w,
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
        SizedBox(height: 0.008*widget.h),
        Container(
          height: 3,
          width: 0.039*w,
          decoration: BoxDecoration(
            color: Color(0xFFdf0a0a),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 0.027*widget.h),
        Column(
          children: List.generate(
            (menu.length / 2).ceil(), // عدد الصفوف المطلوبة
                (index) {
              final first = menu[index * 2];
              final second =
              (index * 2 + 1 < menu.length) ? menu[index * 2 + 1] : null;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: 0.262*w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(child: _buildLinkItem(first,w)),

                      Expanded(
                        child:
                        second != null
                            ? _buildLinkItem(second,w)
                            : Container(),
                      ),
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

  Widget _buildLinkItem(MenuModel model,double w) {
    return InkWell(
      onTap: () {
        model.navigate();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // تغير شكل المؤشر عند المرور

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.double_arrow, color: Color(0xFFdf0a0a), size: w*0.011),
            SizedBox(width: 0.0039*w),
            Text(
              model.pageName,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.grey.shade300,
                fontSize: 0.0098*w,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(double w) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        followText(
            w:widget.w
        ),
        SizedBox(width: 0.0039*w),
        Container(
          height: 3,
          width: 0.039*w,
          decoration: BoxDecoration(
            color: Color(0xFFdf0a0a),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 0.0165*widget.h),
        descriptionForSocial(w: widget.w),
        SizedBox(height: 0.027*widget.h),
        socialPlatforms(
            w: widget.w
        ),
      ],
    );
  }


}