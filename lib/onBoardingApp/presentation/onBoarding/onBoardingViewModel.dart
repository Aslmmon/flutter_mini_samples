import 'package:get/get.dart';
import 'package:untitled/app_resources/assets_manager.dart';
import 'package:untitled/app_resources/strings_manager.dart';
import 'package:untitled/onBoardingApp/domain/model/OnBoardingData.dart';

class OnBoardingViewModel extends GetxController {
  final onBoardingList = <OnBoardingData>[].obs;
  final starterOnBoardingIndex = 0.obs;

  setIndicatorPoint(int trackerDot) =>
      starterOnBoardingIndex.value = trackerDot;

  providerOnBoardingList() {
    onBoardingList.addAll([
      OnBoardingData(
          title: AppStrings.onBoardingTitle1,
          imagePath: ImageAssets.onBoardingOne,
          subtitle: AppStrings.onBoardingSubtitle1),
      OnBoardingData(
          title: AppStrings.onBoardingTitle2,
          imagePath: ImageAssets.onBoardingTwo,
          subtitle: AppStrings.onBoardingSubtitle2),
      OnBoardingData(
          title: AppStrings.onBoardingTitle3,
          imagePath: ImageAssets.onBoardingThree,
          subtitle: AppStrings.onBoardingSubtitle3)
    ]);
  }

  OnBoardingData getSelectedOnBoardingItem() =>
      onBoardingList[starterOnBoardingIndex.value];

  List<OnBoardingData> getOnBoardingList() => onBoardingList.value;
}

class OnBoardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  OnBoardingData(
      {required this.title, required this.subtitle, required this.imagePath});
}
