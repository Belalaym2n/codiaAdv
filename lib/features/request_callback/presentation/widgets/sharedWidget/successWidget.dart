import 'package:codia_adv/features/homePage/presentation/homePageItem.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:codia_adv/config/utils/appConstants.dart';

class SuccessWidgetDesktop extends StatelessWidget {
  SuccessWidgetDesktop({super.key,required this.h,required this.w});
double h;
double w;
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

          lottieWidget(h),
                 SizedBox(height: 0.04*h),
       requestSuccessText(w),
              // Title
                SizedBox(height: 0.02*h),

              // Description
              successDescription( w),

                SizedBox(height: 0.055*h),

              // Optional: Back to Home button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.adminPrimaryColor,
                  padding:   EdgeInsets.symmetric(horizontal: 0.026*w, vertical: 0.02*h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0078*w),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageItem()),
                  ); // Change to pushNamed if needed
                },
                child:   Text(
                  "Back to Home",
                  style: TextStyle

                    (
                      color: Colors.white,
                      fontSize: 0.010*w, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget requestSuccessText(double w){
  return Text(
    "Request Submitted Successfully",
    textAlign: TextAlign.center,
    style: TextStyle(
      color:Color(0xFF252c49),
      fontSize:  0.055*w,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.1,
    ),
  );
}

Widget successDescription(double w){
return  Text(
    "We’ve received your request and our team is already working on it. "
        "You’ll be contacted shortly by one of our representatives. "
        "Thank you for trusting our services. We’re here to support your needs with utmost care and efficiency.",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.lightBlack,
      fontSize:0.02*w,
      height: 1.8,
    ),
  );
}
Widget lottieWidget(double h){
return  SizedBox(
    height: 0.34*h,
    child: Lottie.asset(
      "assets/json_animation/done.json",
      fit: BoxFit.contain,
    ),
  );
}
