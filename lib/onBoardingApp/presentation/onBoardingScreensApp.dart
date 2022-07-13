import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:untitled/app_resources/color_manager.dart';
import 'package:untitled/onBoardingApp/presentation/onBoardingViewModel.dart';

class OnBoardingScreenApp extends StatefulWidget {
  const OnBoardingScreenApp({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenApp> createState() => _OnBoardingScreenAppState();
}

class _OnBoardingScreenAppState extends State<OnBoardingScreenApp> {
  final onBoardingViewModel = Get.find<OnBoardingViewModel>();

  int pageIndex = 0;
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
            Obx(() =>
                Flexible(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: onBoardingViewModel.onBoardingList
                        .map((element) => _buildPage(element))
                        .toList(),
                    onPageChanged: (index) =>
                        onBoardingViewModel.setIndicatorPoint(index);
                    , // Can be null
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnBoardingData selectedItem) {
    return Column(children: [
      // Image.asset(selectedItem.imagePath),
      Text(selectedItem.title),
      Text(selectedItem.subtitle),
      DotsIndicator(
        dotsCount: onBoardingViewModel
            .getOnBoardingList()
            .length,
        position: onBoardingViewModel.starterOnBoardingIndex.value.toDouble(),
      )
    ]);
  }
}

/**
 * This for Making PageView scrollable in Desktop
 */

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
