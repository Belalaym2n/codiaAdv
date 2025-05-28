import 'package:codia_adv/config/utils/appImages.dart';
import 'package:flutter/cupertino.dart';

class NavigationLogoView extends StatelessWidget {
  const NavigationLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Image.asset(AppImages.codia),
    );
  }
}
