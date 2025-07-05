import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../homePage/domain/models/menuModel.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.6, // 611 / 1018
      height: widget.height,
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.0157, // 16 / 1018
        vertical: widget.height * 0.0335,  // 24 / 716
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: widget.width * 0.0118, // 12 / 1018
            offset: Offset(widget.width * 0.002, 0), // 2 / 1018
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.width * 0.0157), // 16 / 1018
          bottomRight: Radius.circular(widget.width * 0.0157),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.topRight, child: minusWidget()),
          SizedBox(height: widget.height * 0.0279), // 20 / 716
          Text(
            "Menu",
            style: TextStyle(
              fontSize: widget.width * 0.0196, // 20 / 1018
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: widget.height * 0.0223), // 16 / 716
          buildNavigationInTapAndMobile(),
        ],
      ),
    );
  }

  Widget buildNavigationInTapAndMobile() {
    final List<MenuModel> pages = MenuModel.getItems(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
         children: AnimationConfiguration.toStaggeredList(
    duration: const Duration(milliseconds:700),
    childAnimationBuilder: (widget) => SlideAnimation(
    horizontalOffset: 50.0,
    child: FadeInAnimation(
    child: widget,
    ),
    ),
    children: List.generate(pages.length, (index) {
        return GestureDetector(
          onTap: () => pages[index].navigate(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: widget.height * 0.0168,  // 12 / 716
              horizontal: widget.width * 0.0078, // 8 / 1018
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.width * 0.0078), // 8 / 1018
              color: Colors.grey.shade100,
            ),
            margin: EdgeInsets.symmetric(
              vertical: widget.height * 0.0083, // 6 / 716
            ),
            child: Row(
              children: [
                Icon(Icons.circle,
                    size: widget.width * 0.0078, // 8 / 1018
                    color: Colors.deepOrange),
                SizedBox(width: widget.width * 0.0078), // 8 / 1018
                Expanded(
                  child: Text(
                    pages[index].pageName,
                    style: TextStyle(
                      fontSize: widget.width * 0.017, // 16 / 1018
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ));
  }

  Widget minusWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: widget.width * 0.06,  // 61 / 1018 ≈ 0.06
        height: widget.width * 0.06,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: widget.width * 0.0059, // 6 / 1018
              offset: Offset(0, widget.height * 0.0028), // 2 / 716
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade300,
            width: widget.width * 0.001, // 1 / 1018
          ),
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.xmark,
            color: Colors.redAccent,
            size: widget.width * 0.0295, // 30 / 1018
          ),
        ),
      ),
    );
  }
}
