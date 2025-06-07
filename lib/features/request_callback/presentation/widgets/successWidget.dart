import 'package:codia_adv/features/homePage/widgets/homePageItem.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:codia_adv/config/utils/appConstants.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWide = screenSize.width > 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: isWide ? 700 : screenSize.width * 0.9,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animation
              SizedBox(
                height: 250,
                child: Lottie.asset(
                  "assets/json_animation/done.json",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),

              // Title
              Text(
                "Request Submitted Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Color(0xFF252c49),
                  fontSize: isWide ? 42 : 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                "We’ve received your request and our team is already working on it. "
                    "You’ll be contacted shortly by one of our representatives. "
                    "Thank you for trusting our services. We’re here to support your needs with utmost care and efficiency.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: isWide ? 14 : 12,
                  height: 1.8,
                ),
              ),

              const SizedBox(height: 40),

              // Optional: Back to Home button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.adminPrimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageItem()),
                  ); // Change to pushNamed if needed
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle

                    (
                      color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
