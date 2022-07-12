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
            Obx(() => Expanded(
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildPage(
                              onBoardingViewModel.getSelectedOnBoardingItem()),
                          DotsIndicator(
                              dotsCount: onBoardingViewModel
                                  .getOnBoardingList()
                                  .length,
                              position: onBoardingViewModel
                                  .starterOnBoardingIndex.value
                                  .toDouble())
                        ],
                      );
                    },
                    itemCount: onBoardingViewModel
                        .getOnBoardingList()
                        .length, // Can be null
                  ),
                )),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.redColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: const Center(child: Text("SKIP")),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnBoardingData selectedItem) {
    return Column(children: [
      Image.asset(selectedItem.imagePath),
      Text(selectedItem.title),
      Text(selectedItem.subtitle),
    ]);
  }
}
