import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/utils/appColors.dart';
import '../../../../../config/utils/appImages.dart';
import '../../../../homePage/domain/models/menuModel.dart';
import '../../../../request_callback/presentation/pages/requet_callback.dart';

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
          style: GoogleFonts.cairo(
            fontSize: fontSize, // أكبر شوي كونه هيدر رئيسي
            fontWeight: FontWeight.w800, // أثقل وزن للهيبة
            color: const Color(0xFF1E1E2C), // لون أغمق شوي لاحترافية أكثر
            letterSpacing: 1.0, // فراغ أكبر بين الحروف للشعار
            height: 1.3, // راحة في المسافة الرأسية
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
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
                    child: Text(
                      pages[index].pageName,

                    ),

                  ),
                ),_hoverIndex == index?
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalPadding,
                      vertical: widget.verticalPadding,
                    ),
                    child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Container(
                      width: 20 * value, // يتمدد تدريجياً
                      height: 3,
                      decoration: BoxDecoration(
                        color:
                        AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  },
                )):  SizedBox()

              ],
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
     });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>
                RequestCallback(),));
          },

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFdf0a0a),
          padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
          shadowColor: const Color(0xFFb30f0f),
        ),
        child: Text(
          'Request Callback',
          style: GoogleFonts.cairo(
            fontSize: width * 0.011,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.1,
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
      width: width*0.002,
      height: height*0.07,
      color:  Color(0xFF8d99af).withOpacity(0.4),
    );
  }
}


class BuildCallItem extends StatefulWidget {
  const BuildCallItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<BuildCallItem> createState() => _BuildCallItemState();
}

class _BuildCallItemState extends State<BuildCallItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchWhatsApp() async {
    const url =
        'https://wa.me/201022491465?text=Interested%20in%20our%20software%20solutions%3F%20Many%20clients%20have%20been%20inquiring%20about%20our%20top-tier%20services%20like%20mobile%20applications%20and%20website%20development.%20Let%E2%80%99s%20talk%21';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          onTap: _launchWhatsApp,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHovering ? const Color(0xFFe2511e) : const Color(0xFFE3652F),
                  ),
                  child: const Icon(
                    Icons.phone_callback_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Call Any Time',
                      style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1827),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+201022491465',
                      style: GoogleFonts.cairo(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _isHovering ? const Color(0xFFE3652F) : const Color(0xFF1A1827),
                        decoration: _isHovering ? TextDecoration.underline : null,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}