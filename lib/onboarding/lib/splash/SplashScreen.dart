import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding_app/app_resources/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Lottie.asset(AnimationAssets.splashAnimation,
            width: double.infinity, fit: BoxFit.fill),
      )),
    );
  }
}
