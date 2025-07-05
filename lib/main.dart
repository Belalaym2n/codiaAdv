import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:codia_adv/features/homePage/presentation/homePageItem.dart';
import 'package:codia_adv/routing/appRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تأكد من استدعاء الإعدادات المناسبة للويب
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({super.key});
   @override
  Widget build(BuildContext context) {
    AppConstants.initSize(context);

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
     );
  }
}
