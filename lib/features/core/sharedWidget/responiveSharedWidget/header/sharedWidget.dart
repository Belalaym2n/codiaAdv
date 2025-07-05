import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/utils/appColors.dart';
import '../../../../../config/utils/appImages.dart';
import '../../../../homePage/domain/models/menuModel.dart';
import '../../../../request_callback/presentation/pages/requet_callback.dart';

Widget buildLogo(double width, double height) {
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


Widget buildActions(
{
  bool isDesktop=true
,
  required  BuildContext context,required double width,required double height}) {
  return Row(
    children: [
      if(isDesktop)
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

Widget settingWidgetInTabAndMobile({
  required double w,
  required double h,
  required BuildContext context
}) {
  final double iconSize = w * 0.03;

  return InkWell(

    onTap: () {

      Scaffold.of(context).openDrawer();

    },
    child: Container(
      width: w * 0.05,
      height: w * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.list_sharp,
          color: AppColors.primaryColor,
          size: iconSize,
        ),
      ),
    ),
  );
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