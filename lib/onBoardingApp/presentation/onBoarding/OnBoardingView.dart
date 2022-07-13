import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/onBoardingViewModel.dart';

class OnBoardingView extends StatelessWidget {
  final OnBoardingData onBoardingData;
  final OnBoardingViewModel onBoardingViewModel;

   const OnBoardingView({required this.onBoardingData, required this.onBoardingViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(onBoardingData.imagePath,width: 150,height: 150,),
      Text(onBoardingData.title),
      Text(onBoardingData.subtitle),
      DotsIndicator(
        dotsCount: onBoardingViewModel.getOnBoardingList().length,
        position: onBoardingViewModel.starterOnBoardingIndex.value.toDouble(),
      )
    ]);
  }
}
