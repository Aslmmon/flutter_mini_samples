import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app_resources/routes_manager.dart';
import 'package:untitled/app_resources/strings_manager.dart';
import 'package:untitled/app_resources/theme_manager.dart';
import 'package:untitled/onBoardingApp/presentation/di/dependency_injection.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/onBoardingScreensApp.dart';
import 'onBoardingApp/presentation/di/dependency_injection.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: AppStrings.AppNameOnBoarding,
      theme: getApplicationTheme(),
      initialBinding: AppBindings(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
