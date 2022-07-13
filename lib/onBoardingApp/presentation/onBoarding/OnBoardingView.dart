import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/app_resources/color_manager.dart';
import 'package:untitled/app_resources/values_manager.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/onBoardingViewModel.dart';

class OnBoardingView extends StatelessWidget {
  final OnBoardingData onBoardingData;
  final OnBoardingViewModel onBoardingViewModel;

  const OnBoardingView(
      {required this.onBoardingData, required this.onBoardingViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: AppPaddings.p20),
      SvgPicture.asset(
        onBoardingData.imagePath,
        width: AppSizes.s150,
        height: AppSizes.s170,
      ),
      const SizedBox(height: AppPaddings.p12),
      Text(
        onBoardingData.title,
        style: const TextStyle(fontSize: AppSizes.s24),
      ),
      const SizedBox(height: AppPaddings.p12),
      Text(onBoardingData.subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: AppSizes.s12)),
      const SizedBox(height: AppPaddings.p16),
      DotsIndicator(
          dotsCount: onBoardingViewModel.getOnBoardingList().length,
          position: onBoardingViewModel.starterOnBoardingIndex.value.toDouble(),
          decorator: DotsDecorator(
            color: ColorManager.whitecolor,
            size:const Size.square(AppSizes.s8),
            activeSize: const Size.square(AppSizes.s8),
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: ColorManager.primary)
            ),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: ColorManager.primary,
          ))
    ]);
  }
}
