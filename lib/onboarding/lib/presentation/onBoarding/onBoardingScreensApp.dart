import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:onboarding_app/app_resources/color_manager.dart';
import 'package:onboarding_app/app_resources/strings_manager.dart';
import 'package:onboarding_app/app_resources/values_manager.dart';
import 'package:onboarding_app/presentation/onBoarding/OnBoardingView.dart';

import 'onBoardingViewModel.dart';
class OnBoardingScreenApp extends StatefulWidget {
  const OnBoardingScreenApp({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenApp> createState() => _OnBoardingScreenAppState();
}

class _OnBoardingScreenAppState extends State<OnBoardingScreenApp> {
  final onBoardingViewModel = Get.find<OnBoardingViewModel>();
  final pageController = PageController();

  @override
  void initState() {
    onBoardingViewModel.providerOnBoardingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Flexible(
              flex: 2,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: onBoardingViewModel.onBoardingList
                        .map((element) =>
                            OnBoardingView(onBoardingData: element))
                        .toList(),
                    onPageChanged: (index) => onBoardingViewModel
                        .setIndicatorPoint(index), // Can be null
                  ),
                )),
            Container(
                width: double.infinity,
                height: AppSizes.s50,
                decoration: BoxDecoration(
                  color: ColorManager.fadedGrey.withOpacity(0.3),
                ),
                child: Center(
                    child: Obx(() => Text(onBoardingViewModel.isLastItemOnBoarding.value
                        ? AppStrings.startTitle
                        : AppStrings.skipTitle))))
          ],
        ),
      ),
    );
  }
}

/**
 * This for Making PageView scrollable in Desktop
 */

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
