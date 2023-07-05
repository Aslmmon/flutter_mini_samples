import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_app/app_resources/routes_manager.dart';
import 'package:onboarding_app/app_resources/theme_manager.dart';
import 'package:onboarding_app/presentation/onBoarding/onBoardingScreensApp.dart';

import 'app_resources/strings_manager.dart';
import 'presentation/di/dependency_injection.dart';
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /**
     * change Route for Splash or OnBoarding
     * Splash  ->> : Routes.splashRoute
     * onBoarding  ->> : Routes.onBoarding
     */
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

