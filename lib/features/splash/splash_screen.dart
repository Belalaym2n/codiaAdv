import 'package:codia_adv/routing/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:codia_adv/config/utils/appColors.dart'; // حسب ملفك الخاص للألوان

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _circleColorController;
  late Animation<Color?> _circleColorAnimation;

  late AnimationController _textColorController;
  late Animation<Color?> _textColorAnimation;

  @override
  void initState() {
    super.initState();

    // دائرة التقدم: لونها يتغير بين الأحمر والأسود بشكل متتابع متكرر
    _circleColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _circleColorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.black, end: AppColors.primaryColor)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: AppColors.primaryColor, end: Colors.black)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 50,
        ),
      ],
    ).animate(_circleColorController);

    _circleColorController.repeat(reverse: true);

    // نص: يتحول تدريجياً من أسود إلى الأحمر (نفس لون primaryColor)
    _textColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _textColorAnimation = ColorTween(
      begin: Colors.black,
      end: AppColors.primaryColor,
    ).animate(
      CurvedAnimation(parent: _textColorController, curve: Curves.easeIn),
    );

    _textColorController.forward();

    // بعد انتهاء الأنيميشن ينتقل للصفحة الرئيسية
    _textColorController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }
    });
  }

  @override
  void dispose() {
    _circleColorController.dispose();
    _textColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLoading(),
            const SizedBox(height: 30),
            buildTextLoading(),
          ],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return AnimatedBuilder(
      animation: _circleColorAnimation,
      builder: (context, child) {
        return SizedBox(
          width: 110,
          height: 110,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color?>(_circleColorAnimation.value),
            strokeWidth: 3,
          ),
        );
      },
    );
  }

  Widget buildTextLoading() {
    return AnimatedBuilder(
      animation: _textColorAnimation,
      builder: (context, child) {
        return Column(
          children: [
            Text(
              'CodiaAdv',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: _textColorAnimation.value,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: _textColorAnimation.value!.withOpacity(0.5),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'L O A D I N G',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _textColorAnimation.value,
                letterSpacing: 1.5,

              ),
            ),
          ],
        );
      },
    );
  }
}
