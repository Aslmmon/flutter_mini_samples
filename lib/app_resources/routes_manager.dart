
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app_resources/strings_manager.dart';
import 'package:untitled/onBoardingApp/presentation/onBoardingScreensApp.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreenApp());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          ));
}
