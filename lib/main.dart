import 'package:flutter/material.dart';
import 'package:untitled/app_resources/routes_manager.dart';
import 'package:untitled/app_resources/strings_manager.dart';
import 'package:untitled/app_resources/theme_manager.dart';
import 'package:untitled/onBoardingApp/presentation/onBoardingScreensApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.AppNameOnBoarding,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.onBoardingRoute,
      home: const OnBoardingScreenApp(),
    );
  }
}
