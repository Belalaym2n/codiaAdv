import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/sharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../homePage/domain/models/menuModel.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildLogo(width, height),
          const Spacer(),
          _buildNavigation(context),
          const Spacer(),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildLogo(double width, double height) {
    return Row(
      children: [
        Image.asset('assets/images/codia.png', width: width * 0.05, height: height * 0.08),
        const SizedBox(width: 3),
        Text(
          'CodiaAdv',
          style: GoogleFonts.cairo(
            fontSize: width * 0.02,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E2C),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigation(BuildContext context) {
    final List<MenuModel> pages = MenuModel.getItems(context);
    return Wrap(
      spacing: 24,
      children: List.generate(pages.length, (index) {
        return _AnimatedNavItem(
          title: pages[index].pageName,
          onTap: () {pages[index].navigate();},
        );
      }),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.settings, color: Color(0xFF252c49)),
          onPressed: () {},
        ),
          SizedBox(width: 16),
        BuildRequestButton(
          width: width,
          height: height,
        ),
        const SizedBox(width: 24),
        VerticalDividerWidget(width: width,height: height,),
        const SizedBox(width: 24),
        BuildCallItem(height: height,width: width,),
      ],
    );
  }


}

class _AnimatedNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _AnimatedNavItem({required this.title, required this.onTap});

  @override
  State<_AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _isHover ? const Color(0xFFE3652F) :Color(0xFF252c49),
              ),
              child: Text(widget.title),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 3,
              width: _isHover ? 20 : 0,
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE3652F),
                borderRadius: BorderRadius.circular(2),
              ),
            )
          ],
        ),
      ),
    );
  }
}