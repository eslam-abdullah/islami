import 'package:flutter/material.dart';

import 'ui/home/hadeth/hadeth_details.dart';
import 'ui/home/home_screen.dart';
import 'ui/home/quraan/chapter_details.dart';
import 'ui/splash/splash_screen.dart';
import 'ui/theme/MyTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetails.routeName: (_) => ChapterDetails(),
        HadethDetails.routeName: (_) => const HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
    );
  }
}