import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/OnBoardingView.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/onBoardingViewModel.dart';

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
          children: [
            Obx(() => Flexible(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: onBoardingViewModel.onBoardingList
                        .map((element) => OnBoardingView(
                            onBoardingData: element,
                            onBoardingViewModel: onBoardingViewModel))
                        .toList(),
                    onPageChanged: (index) => onBoardingViewModel
                        .setIndicatorPoint(index), // Can be null
                  ),
                )),
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
