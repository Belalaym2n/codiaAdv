import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:flutter/material.dart';
import '../../../../../config/utils/appColors.dart';
import '../../../../../config/utils/appImages.dart';
import '../../../../homePage/domain/models/menuModel.dart';

class BuildCodiaName extends StatelessWidget {
  BuildCodiaName({
    super.key,
    required this.fontSize,
    required this.width,
    this.height,
  });

  final double fontSize;
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.codia,
          height: height,
          width: width,
        ),
        Text(
          'CodiaAdv',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF252c49),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class BuildPages extends StatefulWidget {
  const BuildPages({
    super.key,
    required this.fontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  State<BuildPages> createState() => _BuildPagesState();
}

class _BuildPagesState extends State<BuildPages> {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<MenuModel> pages = MenuModel.getItems(context);

    return Wrap(
      children: List.generate(pages.length, (index) {
        return MouseRegion(
          onEnter: (_) => setState(() => _hoverIndex = index),
          onExit: (_) => setState(() => _hoverIndex = -1),
          child: InkWell(
            onTap: () => pages[index].navigate(),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
                color: _hoverIndex == index ? AppColors.primaryColor : const Color(0xFF252c49),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding,
                  vertical: widget.verticalPadding,
                ),
                child: Text(pages[index].pageName),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class BuildSettingsButton extends StatelessWidget {
  const BuildSettingsButton({
    super.key,
    required this.size,
    required this.iconSize,

  });

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(100),
      hoverColor: Colors.grey.withOpacity(0.1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Color(0xFF252c49), width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Center(
          child: Icon(Icons.settings, size: iconSize, color: Color(0xFF252c49)),
        ),
      ),
    );
  }
}

class BuildRequestButton extends StatelessWidget {
  const BuildRequestButton({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
      required this.borderRadius,
   });

  final double width;
  final double height;
  final double fontSize;
    final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFdf0a0a),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius )),
          elevation: 6,
          shadowColor: Color(0xFFb30f0f),
        ),
        child: Text(
          "Request Callback",
          style: TextStyle(
            fontSize: fontSize  ,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    super.key,
    required this.width,
    required this.height,
   });

  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color:  Color(0xFF8d99af).withOpacity(0.4),
    );
  }
}

class BuildCallItem extends StatelessWidget {
  const BuildCallItem({
    super.key,
    required this.iconSize,
    required this.padding,
 
    required this.titleFontSize,
    required this.titleFontWeight,
     required this.subtitleFontSize,
    required this.subtitleFontWeight,
     required this.spacing,
    required this.titleSpacing,
  });

  final double iconSize;
  final double padding;

  final double titleFontSize;
  final FontWeight titleFontWeight;

  final double subtitleFontSize;
  final FontWeight subtitleFontWeight;

  final double spacing;
  final double titleSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Icon(Icons.phone_callback_rounded, color: Colors.white, size: iconSize),
        ),
        SizedBox(width: spacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Call Any Time",
              style: TextStyle(
                fontSize: titleFontSize,
                color:  Color(0xFF1a1827),
                fontWeight: titleFontWeight,
              ),
            ),
            SizedBox(height: titleSpacing),
            Text(
              "+201022491465",
              style: TextStyle(
                fontSize: subtitleFontSize,
                color:  Color(0xFF1a1827),
                fontWeight: subtitleFontWeight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
