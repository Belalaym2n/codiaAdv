import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:codia_adv/config/utils/appColors.dart';

class SuccessWidgetDesktop extends StatelessWidget {
  final double h;
  final double w;

  const SuccessWidgetDesktop({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.5,
      padding: EdgeInsets.symmetric(
        vertical: h * 0.05,
        horizontal: w * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _lottieWidget(h),
              SizedBox(height: h * 0.03),
              _requestSuccessText(w),
              SizedBox(height: h * 0.018),
              _successDescription(w),
              SizedBox(height: h * 0.045),
              _backButton(context),
            ],
          ),
        ),

      ),
    );
  }

  Widget _lottieWidget(double h) {
    return SizedBox(
      height: h * 0.22,
      child: Lottie.asset(
        "assets/json_animation/done.json",
        fit: BoxFit.contain,
      ),
    );
  }


  Widget _requestSuccessText(double w) {
    return Text(
      "Request Submitted Successfully",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF1D274E),
        fontSize: w * 0.025,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
      ),
    );
  }


  Widget _successDescription(double w) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "We've received your request and it's currently being processed\n by our team."
            "A representative will reach out to you shortly to ensure\n all details are handled with care."
            "Thank you for trusting us — your\n satisfaction is our priority.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: w * 0.012,
         ),
      ),
    );
  }


  Widget _backButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.adminPrimaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: w * 0.045, vertical: h * 0.014),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      onPressed: () {
        print("Navigating to Home...");

        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);

        },
      child: Text(
        "Back to Home",
        style: TextStyle(
          color: Colors.white,
          fontSize: w * 0.0125,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
